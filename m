Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2FF2195F9
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jul 2020 04:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgGICHh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 8 Jul 2020 22:07:37 -0400
Received: from foss.arm.com ([217.140.110.172]:52636 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgGICHh (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 8 Jul 2020 22:07:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3574311FB;
        Wed,  8 Jul 2020 19:07:36 -0700 (PDT)
Received: from localhost.localdomain (entos-thunderx2-02.shanghai.arm.com [10.169.212.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67D5A3F887;
        Wed,  8 Jul 2020 19:07:26 -0700 (PDT)
From:   Jia He <justin.he@arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        David Hildenbrand <david@redhat.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Kaly Xin <Kaly.Xin@arm.com>, Jia He <justin.he@arm.com>
Subject: [PATCH v3 5/6] device-dax: use fallback nid when numa_node is invalid
Date:   Thu,  9 Jul 2020 10:06:28 +0800
Message-Id: <20200709020629.91671-6-justin.he@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709020629.91671-1-justin.he@arm.com>
References: <20200709020629.91671-1-justin.he@arm.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

numa_off is set unconditionally at the end of dummy_numa_init(),
even with a fake numa node. ACPI detects node id as NUMA_NO_NODE(-1) in
acpi_map_pxm_to_node() because it regards numa_off as turning off the numa
node. Hence dev_dax->target_node is NUMA_NO_NODE on arm64 with fake numa.

Without this patch, pmem can't be probed as a RAM device on arm64 if SRAT table
isn't present:
$ndctl create-namespace -fe namespace0.0 --mode=devdax --map=dev -s 1g -a 64K
kmem dax0.0: rejecting DAX region [mem 0x240400000-0x2bfffffff] with invalid node: -1
kmem: probe of dax0.0 failed with error -22

This fixes it by using fallback memory_add_physaddr_to_nid() as nid.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Jia He <justin.he@arm.com>
---
 drivers/dax/kmem.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 275aa5f87399..218f66057994 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -31,22 +31,23 @@ int dev_dax_kmem_probe(struct device *dev)
 	int numa_node;
 	int rc;
 
+	/* Hotplug starting at the beginning of the next block: */
+	kmem_start = ALIGN(res->start, memory_block_size_bytes());
+
 	/*
 	 * Ensure good NUMA information for the persistent memory.
 	 * Without this check, there is a risk that slow memory
 	 * could be mixed in a node with faster memory, causing
-	 * unavoidable performance issues.
+	 * unavoidable performance issues. Furthermore, fallback node
+	 * id can be used when numa_node is invalid.
 	 */
 	numa_node = dev_dax->target_node;
 	if (numa_node < 0) {
-		dev_warn(dev, "rejecting DAX region %pR with invalid node: %d\n",
-			 res, numa_node);
-		return -EINVAL;
+		numa_node = memory_add_physaddr_to_nid(kmem_start);
+		dev_info(dev, "using nid %d for DAX region with undefined nid %pR\n",
+			numa_node, res);
 	}
 
-	/* Hotplug starting at the beginning of the next block: */
-	kmem_start = ALIGN(res->start, memory_block_size_bytes());
-
 	kmem_size = resource_size(res);
 	/* Adjust the size down to compensate for moving up kmem_start: */
 	kmem_size -= kmem_start - res->start;
@@ -100,15 +101,19 @@ static int dev_dax_kmem_remove(struct device *dev)
 	resource_size_t kmem_start = res->start;
 	resource_size_t kmem_size = resource_size(res);
 	const char *res_name = res->name;
+	int numa_node = dev_dax->target_node;
 	int rc;
 
+	if (numa_node < 0)
+		numa_node = memory_add_physaddr_to_nid(kmem_start);
+
 	/*
 	 * We have one shot for removing memory, if some memory blocks were not
 	 * offline prior to calling this function remove_memory() will fail, and
 	 * there is no way to hotremove this memory until reboot because device
 	 * unbind will succeed even if we return failure.
 	 */
-	rc = remove_memory(dev_dax->target_node, kmem_start, kmem_size);
+	rc = remove_memory(numa_node, kmem_start, kmem_size);
 	if (rc) {
 		any_hotremove_failed = true;
 		dev_err(dev,
-- 
2.17.1

