Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049872195EC
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jul 2020 04:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgGICHG (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 8 Jul 2020 22:07:06 -0400
Received: from foss.arm.com ([217.140.110.172]:52470 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgGICHG (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 8 Jul 2020 22:07:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 361E31063;
        Wed,  8 Jul 2020 19:07:06 -0700 (PDT)
Received: from localhost.localdomain (entos-thunderx2-02.shanghai.arm.com [10.169.212.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC36D3F887;
        Wed,  8 Jul 2020 19:06:56 -0700 (PDT)
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
Subject: [PATCH v3 2/6] arm64/mm: use default dummy memory_add_physaddr_to_nid()
Date:   Thu,  9 Jul 2020 10:06:25 +0800
Message-Id: <20200709020629.91671-3-justin.he@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709020629.91671-1-justin.he@arm.com>
References: <20200709020629.91671-1-justin.he@arm.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

After making default memory_add_physaddr_to_nid() in mm/memory_hotplug,
it is no use defining a similar one in arch specific directory.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/mm/numa.c | 10 ----------
 1 file changed, 10 deletions(-)

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
-- 
2.17.1

