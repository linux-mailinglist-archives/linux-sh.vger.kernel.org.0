Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4E021AD5B
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jul 2020 05:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgGJDQs (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jul 2020 23:16:48 -0400
Received: from foss.arm.com ([217.140.110.172]:44142 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgGJDQs (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 9 Jul 2020 23:16:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E54D6E;
        Thu,  9 Jul 2020 20:16:47 -0700 (PDT)
Received: from localhost.localdomain (entos-thunderx2-02.shanghai.arm.com [10.169.212.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73EF73F9AB;
        Thu,  9 Jul 2020 20:16:38 -0700 (PDT)
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
Subject: [PATCH 1/2] mm/memory_hotplug: introduce default dummy memory_add_physaddr_to_nid()
Date:   Fri, 10 Jul 2020 11:16:18 +0800
Message-Id: <20200710031619.18762-2-justin.he@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710031619.18762-1-justin.he@arm.com>
References: <20200710031619.18762-1-justin.he@arm.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This is to introduce a general dummy helper. memory_add_physaddr_to_nid()
is a fallback option to get the nid in case NUMA_NO_NID is detected.

After this patch, arm64/sh/s390 can simply use the general dummy version.
PowerPC/x86/ia64 will still use their specific version.

This is the preparation to set a fallback value for dev_dax->target_node.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/mm/numa.c | 10 ----------
 arch/ia64/mm/numa.c  |  2 --
 arch/sh/mm/init.c    |  9 ---------
 arch/x86/mm/numa.c   |  1 -
 mm/memory_hotplug.c  | 10 ++++++++++
 5 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index aafcee3e3f7e..73f8b49d485c 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -461,13 +461,3 @@ void __init arm64_numa_init(void)
 
 	numa_init(dummy_numa_init);
 }
-
-/*
- * We hope that we will be hotplugging memory on nodes we already know about,
- * such that acpi_get_node() succeeds and we never fall back to this...
- */
-int memory_add_physaddr_to_nid(u64 addr)
-{
-	pr_warn("Unknown node for memory at 0x%llx, assuming node 0\n", addr);
-	return 0;
-}
diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
index 5e1015eb6d0d..f34964271101 100644
--- a/arch/ia64/mm/numa.c
+++ b/arch/ia64/mm/numa.c
@@ -106,7 +106,5 @@ int memory_add_physaddr_to_nid(u64 addr)
 		return 0;
 	return nid;
 }
-
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 #endif
 #endif
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index a70ba0fdd0b3..f75932ba87a6 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -430,15 +430,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return ret;
 }
 
-#ifdef CONFIG_NUMA
-int memory_add_physaddr_to_nid(u64 addr)
-{
-	/* Node 0 for now.. */
-	return 0;
-}
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
-#endif
-
 void arch_remove_memory(int nid, u64 start, u64 size,
 			struct vmem_altmap *altmap)
 {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 8ee952038c80..2a6e62af4636 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -929,5 +929,4 @@ int memory_add_physaddr_to_nid(u64 start)
 		nid = numa_meminfo.blk[0].nid;
 	return nid;
 }
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 #endif
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index da374cd3d45b..b49ab743d914 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -350,6 +350,16 @@ int __ref __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 	return err;
 }
 
+#ifdef CONFIG_NUMA
+int __weak memory_add_physaddr_to_nid(u64 start)
+{
+	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
+			start);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+#endif
+
 /* find the smallest valid pfn in the range [start_pfn, end_pfn) */
 static unsigned long find_smallest_section_pfn(int nid, struct zone *zone,
 				     unsigned long start_pfn,
-- 
2.17.1

