Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E82423016D
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jul 2020 07:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgG1FNx (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Jul 2020 01:13:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726873AbgG1FNx (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 28 Jul 2020 01:13:53 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CFBB22B47;
        Tue, 28 Jul 2020 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595913232;
        bh=s4TGTb+OM6aK8pYTyThZeMLhanWPb/uc+gXtOdjiGYU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yyfhBe3Z1JOta7OKxVWMIjsqyELV3KSSG1sXhvTcAKiT2I+Tz0B/4ePu+iHQ0G/YT
         +Gk2OSGadKLdM9EQX8uTc6+YvhZVTdsuYDsaZckXNsXzKQPx24T8YMJ6VUpwVCnnqn
         6ux6E67Q5PAxPVGr1U4/qfs1AON/1+OS5GECpvHk=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: [PATCH 10/15] memblock: make memblock_debug and related functionality private
Date:   Tue, 28 Jul 2020 08:11:48 +0300
Message-Id: <20200728051153.1590-11-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The only user of memblock_dbg() outside memblock was s390 setup code and it
is converted to use pr_debug() instead.
This allows to stop exposing memblock_debug and memblock_dbg() to the rest
of the kernel.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/s390/kernel/setup.c |  4 ++--
 include/linux/memblock.h | 12 +-----------
 mm/memblock.c            | 13 +++++++++++--
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 07aa15ba43b3..8b284cf6e199 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -776,8 +776,8 @@ static void __init memblock_add_mem_detect_info(void)
 	unsigned long start, end;
 	int i;
 
-	memblock_dbg("physmem info source: %s (%hhd)\n",
-		     get_mem_info_source(), mem_detect.info_source);
+	pr_debug("physmem info source: %s (%hhd)\n",
+		 get_mem_info_source(), mem_detect.info_source);
 	/* keep memblock lists close to the kernel */
 	memblock_set_bottom_up(true);
 	for_each_mem_detect_block(i, &start, &end) {
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 220b5f0dad42..e6a23b3db696 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -90,7 +90,6 @@ struct memblock {
 };
 
 extern struct memblock memblock;
-extern int memblock_debug;
 
 #ifndef CONFIG_ARCH_KEEP_MEMBLOCK
 #define __init_memblock __meminit
@@ -102,9 +101,6 @@ void memblock_discard(void);
 static inline void memblock_discard(void) {}
 #endif
 
-#define memblock_dbg(fmt, ...) \
-	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
-
 phys_addr_t memblock_find_in_range(phys_addr_t start, phys_addr_t end,
 				   phys_addr_t size, phys_addr_t align);
 void memblock_allow_resize(void);
@@ -456,13 +452,7 @@ bool memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
 bool memblock_is_reserved(phys_addr_t addr);
 bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
 
-extern void __memblock_dump_all(void);
-
-static inline void memblock_dump_all(void)
-{
-	if (memblock_debug)
-		__memblock_dump_all();
-}
+void memblock_dump_all(void);
 
 /**
  * memblock_set_current_limit - Set the current allocation limit to allow
diff --git a/mm/memblock.c b/mm/memblock.c
index a5b9b3df81fc..824938849f6d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -134,7 +134,10 @@ struct memblock memblock __initdata_memblock = {
 	     i < memblock_type->cnt;					\
 	     i++, rgn = &memblock_type->regions[i])
 
-int memblock_debug __initdata_memblock;
+#define memblock_dbg(fmt, ...) \
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
+
+static int memblock_debug __initdata_memblock;
 static bool system_has_some_mirror __initdata_memblock = false;
 static int memblock_can_resize __initdata_memblock;
 static int memblock_memory_in_slab __initdata_memblock = 0;
@@ -1919,7 +1922,7 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
 	}
 }
 
-void __init_memblock __memblock_dump_all(void)
+static void __init_memblock __memblock_dump_all(void)
 {
 	pr_info("MEMBLOCK configuration:\n");
 	pr_info(" memory size = %pa reserved size = %pa\n",
@@ -1933,6 +1936,12 @@ void __init_memblock __memblock_dump_all(void)
 #endif
 }
 
+void __init_memblock memblock_dump_all(void)
+{
+	if (memblock_debug)
+		__memblock_dump_all();
+}
+
 void __init memblock_allow_resize(void)
 {
 	memblock_can_resize = 1;
-- 
2.26.2

