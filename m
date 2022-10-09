Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B154D5F8AAA
	for <lists+linux-sh@lfdr.de>; Sun,  9 Oct 2022 12:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiJIKdu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 9 Oct 2022 06:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiJIKdB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 9 Oct 2022 06:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231EA2E6A0
        for <linux-sh@vger.kernel.org>; Sun,  9 Oct 2022 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665311579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YuJ+1Xe1BzAEJqVi/zbdjMFVaN6W30y1eIWszmfiEjg=;
        b=MCXsyHYX1XgnHwE5DpW/eU4CeaQ0GyXQuHhTkIbz+6o2S6zqmAg9PvYkHetP5Asiyhe5EQ
        JvS/SAZfDP15Cc7f3JZj2CTI7VeRtGIhKnKxCbTzSjtuvSPN4XGypbB7LrVH4Cm7fi6VEf
        okZa6/J4u5DZEk3cn1X2SBpUMWokXXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-0M_-V7gkMQ2bbubuyOOQ_Q-1; Sun, 09 Oct 2022 06:32:55 -0400
X-MC-Unique: 0M_-V7gkMQ2bbubuyOOQ_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 710E495D681;
        Sun,  9 Oct 2022 10:32:54 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-36.pek2.redhat.com [10.72.12.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0D7440D298B;
        Sun,  9 Oct 2022 10:32:47 +0000 (UTC)
From:   Baoquan He <bhe@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org, hch@infradead.org,
        agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
        christophe.leroy@csgroup.eu, schnelle@linux.ibm.com,
        David.Laight@ACULAB.COM, shorne@gmail.com, bhe@redhat.com,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v3 10/11] sh: mm: Convert to GENERIC_IOREMAP
Date:   Sun,  9 Oct 2022 18:31:13 +0800
Message-Id: <20221009103114.149036-11-bhe@redhat.com>
In-Reply-To: <20221009103114.149036-1-bhe@redhat.com>
References: <20221009103114.149036-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

By taking GENERIC_IOREMAP method, the generic ioremap_prot() and
iounmap() are visible and available to arch. Arch only needs to
provide implementation of arch_ioremap() or arch_iounmap() if there's
arch specific handling needed in its ioremap() or iounmap(). This
change will simplify implementation by removing duplicated codes with
generic ioremap() and iounmap(), and has the equivalent functioality
as before.

For SuperH, add hook arch_ioremap() and arch_iounmap for sh's special
operation when ioremap() and iounmap(), then ioremap_cache() is converted
to use ioremap_prot() from GENERIC_IOREMAP.

Meanwhile, add macro definitions for port|mm io functions since SuperH
has its own implementation in arch/sh/kernel/iomap.c and
arch/sh/include/asm/io_noioport.h. These will conflict with the port|mm io
function definitions in include/asm-generic/io.h to cause compiling
errors like below:

====
  CC      arch/sh/kernel/asm-offsets.s
In file included from ./arch/sh/include/asm/io.h:294,
                 from ./include/linux/io.h:13,
                 ......
                 from arch/sh/kernel/asm-offsets.c:16:
./include/asm-generic/io.h:792:17: error: conflicting types for ‘ioread8’
  792 | #define ioread8 ioread8
      |                 ^~~~~~~
./include/asm-generic/io.h:793:18: note: in expansion of macro ‘ioread8’
  793 | static inline u8 ioread8(const volatile void __iomem *addr)
      |                  ^~~~~~~
In file included from ./arch/sh/include/asm/io.h:22,
                 from ./include/linux/io.h:13,
                 ......
                 from arch/sh/kernel/asm-offsets.c:16:
./include/asm-generic/iomap.h:29:21: note: previous declaration of ‘ioread8’ was here
   29 | extern unsigned int ioread8(const void __iomem *);
====

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
---
v2->v3:
- Add macro definitions for mem io operations to avoid the repeated
  definitions of them in include/asm-generic/io.h.

 arch/sh/Kconfig                   |  1 +
 arch/sh/include/asm/io.h          | 67 +++++++++++++++++--------------
 arch/sh/include/asm/io_noioport.h |  7 ++++
 arch/sh/mm/ioremap.c              | 63 ++++++-----------------------
 4 files changed, 56 insertions(+), 82 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5f220e903e5a..b63ad4698cf8 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -25,6 +25,7 @@ config SUPERH
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GUP_GET_PTE_LOW_HIGH if X2TLB
+	select GENERIC_IOREMAP if MMU
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_SECCOMP_FILTER
diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index fba90e670ed4..f3edd92a8869 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -119,6 +119,26 @@ void __raw_readsl(const void __iomem *addr, void *data, int longlen);
 
 __BUILD_MEMORY_STRING(__raw_, q, u64)
 
+#define ioread8 ioread8
+#define ioread16 ioread16
+#define ioread16be ioread16be
+#define ioread32 ioread32
+#define ioread32be ioread32be
+
+#define iowrite8 iowrite8
+#define iowrite16 iowrite16
+#define iowrite16be iowrite16be
+#define iowrite32 iowrite32
+#define iowrite32be iowrite32be
+
+#define ioread8_rep ioread8_rep
+#define ioread16_rep ioread16_rep
+#define ioread32_rep ioread32_rep
+
+#define iowrite8_rep iowrite8_rep
+#define iowrite16_rep iowrite16_rep
+#define iowrite32_rep iowrite32_rep
+
 #ifdef CONFIG_HAS_IOPORT_MAP
 
 /*
@@ -225,6 +245,9 @@ __BUILD_IOPORT_STRING(q, u64)
 #define IO_SPACE_LIMIT 0xffffffff
 
 /* We really want to try and get these to memcpy etc */
+#define memset_io memset_io
+#define memcpy_fromio memcpy_fromio
+#define memcpy_toio memcpy_toio
 void memcpy_fromio(void *, const volatile void __iomem *, unsigned long);
 void memcpy_toio(volatile void __iomem *, const void *, unsigned long);
 void memset_io(volatile void __iomem *, int, unsigned long);
@@ -243,40 +266,20 @@ unsigned long long poke_real_address_q(unsigned long long addr,
 #endif
 
 #ifdef CONFIG_MMU
-void iounmap(void __iomem *addr);
-void __iomem *__ioremap_caller(phys_addr_t offset, unsigned long size,
-			       pgprot_t prot, void *caller);
-
-static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)
-{
-	return __ioremap_caller(offset, size, PAGE_KERNEL_NOCACHE,
-			__builtin_return_address(0));
-}
-
-static inline void __iomem *
-ioremap_cache(phys_addr_t offset, unsigned long size)
-{
-	return __ioremap_caller(offset, size, PAGE_KERNEL,
-			__builtin_return_address(0));
-}
-#define ioremap_cache ioremap_cache
+/*
+ * I/O memory mapping functions.
+ */
+void __iomem *
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val);
+#define arch_ioremap arch_ioremap
 
-#ifdef CONFIG_HAVE_IOREMAP_PROT
-static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
-		unsigned long flags)
-{
-	return __ioremap_caller(offset, size, __pgprot(flags),
-			__builtin_return_address(0));
-}
-#endif /* CONFIG_HAVE_IOREMAP_PROT */
+bool arch_iounmap(void __iomem *addr);
+#define arch_iounmap arch_iounmap
 
-#else /* CONFIG_MMU */
-static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
-{
-	return (void __iomem *)(unsigned long)offset;
-}
+#define _PAGE_IOREMAP pgprot_val(PAGE_KERNEL_NOCACHE)
 
-static inline void iounmap(volatile void __iomem *addr) { }
+#define ioremap_cache(addr, size)  \
+	ioremap_prot((addr), (size), pgprot_val(PAGE_KERNEL))
 #endif /* CONFIG_MMU */
 
 #define ioremap_uc	ioremap
@@ -287,6 +290,8 @@ static inline void iounmap(volatile void __iomem *addr) { }
  */
 #define xlate_dev_mem_ptr(p)	__va(p)
 
+#include <asm-generic/io.h>
+
 #define ARCH_HAS_VALID_PHYS_ADDR_RANGE
 int valid_phys_addr_range(phys_addr_t addr, size_t size);
 int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
diff --git a/arch/sh/include/asm/io_noioport.h b/arch/sh/include/asm/io_noioport.h
index f7938fe0f911..5ba4116b4265 100644
--- a/arch/sh/include/asm/io_noioport.h
+++ b/arch/sh/include/asm/io_noioport.h
@@ -53,6 +53,13 @@ static inline void ioport_unmap(void __iomem *addr)
 #define outw_p(x, addr)	outw((x), (addr))
 #define outl_p(x, addr)	outl((x), (addr))
 
+#define insb insb
+#define insw insw
+#define insl insl
+#define outsb outsb
+#define outsw outsw
+#define outsl outsl
+
 static inline void insb(unsigned long port, void *dst, unsigned long count)
 {
 	BUG();
diff --git a/arch/sh/mm/ioremap.c b/arch/sh/mm/ioremap.c
index 21342581144d..4b20f00a3ca3 100644
--- a/arch/sh/mm/ioremap.c
+++ b/arch/sh/mm/ioremap.c
@@ -72,22 +72,12 @@ __ioremap_29bit(phys_addr_t offset, unsigned long size, pgprot_t prot)
 #define __ioremap_29bit(offset, size, prot)		NULL
 #endif /* CONFIG_29BIT */
 
-/*
- * Remap an arbitrary physical address space into the kernel virtual
- * address space. Needed when the kernel wants to access high addresses
- * directly.
- *
- * NOTE! We need to allow non-page-aligned mappings too: we will obviously
- * have to convert them into an offset in a page-aligned mapping, but the
- * caller shouldn't need to know that small detail.
- */
 void __iomem * __ref
-__ioremap_caller(phys_addr_t phys_addr, unsigned long size,
-		 pgprot_t pgprot, void *caller)
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val)
 {
-	struct vm_struct *area;
-	unsigned long offset, last_addr, addr, orig_addr;
+	unsigned long last_addr, phys_addr = *paddr;
 	void __iomem *mapped;
+	pgprot_t pgprot = __pgprot(*prot_val);
 
 	mapped = __ioremap_trapped(phys_addr, size);
 	if (mapped)
@@ -100,7 +90,7 @@ __ioremap_caller(phys_addr_t phys_addr, unsigned long size,
 	/* Don't allow wraparound or zero size */
 	last_addr = phys_addr + size - 1;
 	if (!size || last_addr < phys_addr)
-		return NULL;
+		return IOMEM_ERR_PTR(-EINVAL);
 
 	/*
 	 * If we can't yet use the regular approach, go the fixmap route.
@@ -112,34 +102,13 @@ __ioremap_caller(phys_addr_t phys_addr, unsigned long size,
 	 * First try to remap through the PMB.
 	 * PMB entries are all pre-faulted.
 	 */
-	mapped = pmb_remap_caller(phys_addr, size, pgprot, caller);
+	mapped = pmb_remap_caller(phys_addr, size, pgprot,
+			__builtin_return_address(0));
 	if (mapped && !IS_ERR(mapped))
 		return mapped;
 
-	/*
-	 * Mappings have to be page-aligned
-	 */
-	offset = phys_addr & ~PAGE_MASK;
-	phys_addr &= PAGE_MASK;
-	size = PAGE_ALIGN(last_addr+1) - phys_addr;
-
-	/*
-	 * Ok, go for it..
-	 */
-	area = get_vm_area_caller(size, VM_IOREMAP, caller);
-	if (!area)
-		return NULL;
-	area->phys_addr = phys_addr;
-	orig_addr = addr = (unsigned long)area->addr;
-
-	if (ioremap_page_range(addr, addr + size, phys_addr, pgprot)) {
-		vunmap((void *)orig_addr);
-		return NULL;
-	}
-
-	return (void __iomem *)(offset + (char *)orig_addr);
+	return NULL;
 }
-EXPORT_SYMBOL(__ioremap_caller);
 
 /*
  * Simple checks for non-translatable mappings.
@@ -158,35 +127,27 @@ static inline int iomapping_nontranslatable(unsigned long offset)
 	return 0;
 }
 
-void iounmap(void __iomem *addr)
+bool arch_iounmap(void __iomem *addr)
 {
 	unsigned long vaddr = (unsigned long __force)addr;
-	struct vm_struct *p;
 
 	/*
 	 * Nothing to do if there is no translatable mapping.
 	 */
 	if (iomapping_nontranslatable(vaddr))
-		return;
+		return false;
 
 	/*
 	 * There's no VMA if it's from an early fixed mapping.
 	 */
 	if (iounmap_fixed(addr) == 0)
-		return;
+		return false;
 
 	/*
 	 * If the PMB handled it, there's nothing else to do.
 	 */
 	if (pmb_unmap(addr) == 0)
-		return;
-
-	p = remove_vm_area((void *)(vaddr & PAGE_MASK));
-	if (!p) {
-		printk(KERN_ERR "%s: bad address %p\n", __func__, addr);
-		return;
-	}
+		return false;
 
-	kfree(p);
+	return true;
 }
-EXPORT_SYMBOL(iounmap);
-- 
2.34.1

