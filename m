Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1244121F145
	for <lists+linux-sh@lfdr.de>; Tue, 14 Jul 2020 14:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgGNMcL (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 14 Jul 2020 08:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgGNMcK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 14 Jul 2020 08:32:10 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A840BC061755;
        Tue, 14 Jul 2020 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=OyZ2gK5FcIExI1V3T5j7nMnhL8zUoo41svBXtzu2/oY=; b=sGNKR3jpcBArGgMT6zGENCzXGs
        nagY8RxgQNVF+mlKXANL8Hw5UtNASYKTTt1XiJG5swyQpHPBDL5U1JvDqZayOWfsUjuw1qiVQxJu7
        KxfeajcTF+wRNbsD32/k9aut+8tzX5352HITFRovPmiOFzVF5Lr5IPHQhvBEMBsqt3ApEEloO+Fs/
        0BJaH+xTzx6rYWAPNejQw41bifRm8vF39ySOn3Ahl83m7yhA1foUfNXPQeLvIfL932du4a2RHUaJ8
        LhbdFF0vj4/o2raW0l7al/enXD74lFUZ/jwWwLKiVnlD4/OzEgOpxHdLEPMdpk6jAHlPRW49b4Uh1
        44B64S5A==;
Received: from 089144201169.atnat0010.highway.a1.net ([89.144.201.169] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvK6Q-000260-G5; Tue, 14 Jul 2020 12:32:06 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] sh: move the ioremap implementation out of line
Date:   Tue, 14 Jul 2020 14:18:51 +0200
Message-Id: <20200714121856.955680-6-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714121856.955680-1-hch@lst.de>
References: <20200714121856.955680-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Move the internal implementation details of ioremap out of line, no need
to expose any of this to drivers for a slow path API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/include/asm/io.h | 101 ++++++---------------------------------
 arch/sh/mm/ioremap.c     |  53 ++++++++++++++++++++
 2 files changed, 68 insertions(+), 86 deletions(-)

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 357a7e0c86d682..da08a61a2f7dae 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -242,109 +242,38 @@ unsigned long long poke_real_address_q(unsigned long long addr,
 #define phys_to_virt(address)	(__va(address))
 #endif
 
-/*
- * On 32-bit SH, we traditionally have the whole physical address space
- * mapped at all times (as MIPS does), so "ioremap()" and "iounmap()" do
- * not need to do anything but place the address in the proper segment.
- * This is true for P1 and P2 addresses, as well as some P3 ones.
- * However, most of the P3 addresses and newer cores using extended
- * addressing need to map through page tables, so the ioremap()
- * implementation becomes a bit more complicated.
- *
- * See arch/sh/mm/ioremap.c for additional notes on this.
- *
- * We cheat a bit and always return uncachable areas until we've fixed
- * the drivers to handle caching properly.
- *
- * On the SH-5 the concept of segmentation in the 1:1 PXSEG sense simply
- * doesn't exist, so everything must go through page tables.
- */
 #ifdef CONFIG_MMU
+void iounmap(void __iomem *addr);
 void __iomem *__ioremap_caller(phys_addr_t offset, unsigned long size,
 			       pgprot_t prot, void *caller);
-void iounmap(void __iomem *addr);
-
-static inline void __iomem *
-__ioremap(phys_addr_t offset, unsigned long size, pgprot_t prot)
-{
-	return __ioremap_caller(offset, size, prot, __builtin_return_address(0));
-}
-
-static inline void __iomem *
-__ioremap_29bit(phys_addr_t offset, unsigned long size, pgprot_t prot)
-{
-#ifdef CONFIG_29BIT
-	phys_addr_t last_addr = offset + size - 1;
-
-	/*
-	 * For P1 and P2 space this is trivial, as everything is already
-	 * mapped. Uncached access for P1 addresses are done through P2.
-	 * In the P3 case or for addresses outside of the 29-bit space,
-	 * mapping must be done by the PMB or by using page tables.
-	 */
-	if (likely(PXSEG(offset) < P3SEG && PXSEG(last_addr) < P3SEG)) {
-		u64 flags = pgprot_val(prot);
-
-		/*
-		 * Anything using the legacy PTEA space attributes needs
-		 * to be kicked down to page table mappings.
-		 */
-		if (unlikely(flags & _PAGE_PCC_MASK))
-			return NULL;
-		if (unlikely(flags & _PAGE_CACHABLE))
-			return (void __iomem *)P1SEGADDR(offset);
-
-		return (void __iomem *)P2SEGADDR(offset);
-	}
-
-	/* P4 above the store queues are always mapped. */
-	if (unlikely(offset >= P3_ADDR_MAX))
-		return (void __iomem *)P4SEGADDR(offset);
-#endif
-
-	return NULL;
-}
-
-static inline void __iomem *
-__ioremap_mode(phys_addr_t offset, unsigned long size, pgprot_t prot)
-{
-	void __iomem *ret;
-
-	ret = __ioremap_trapped(offset, size);
-	if (ret)
-		return ret;
-
-	ret = __ioremap_29bit(offset, size, prot);
-	if (ret)
-		return ret;
-
-	return __ioremap(offset, size, prot);
-}
-#else
-#define __ioremap(offset, size, prot)		((void __iomem *)(offset))
-#define __ioremap_mode(offset, size, prot)	((void __iomem *)(offset))
-static inline void iounmap(void __iomem *addr) {}
-#endif /* CONFIG_MMU */
 
 static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)
 {
-	return __ioremap_mode(offset, size, PAGE_KERNEL_NOCACHE);
+	return __ioremap_caller(offset, size, PAGE_KERNEL_NOCACHE,
+			__builtin_return_address(0));
 }
 
 static inline void __iomem *
 ioremap_cache(phys_addr_t offset, unsigned long size)
 {
-	return __ioremap_mode(offset, size, PAGE_KERNEL);
+	return __ioremap_caller(offset, size, PAGE_KERNEL,
+			__builtin_return_address(0));
 }
 #define ioremap_cache ioremap_cache
 
 #ifdef CONFIG_HAVE_IOREMAP_PROT
-static inline void __iomem *
-ioremap_prot(phys_addr_t offset, unsigned long size, unsigned long flags)
+static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
+		unsigned long flags)
 {
-	return __ioremap_mode(offset, size, __pgprot(flags));
+	return __ioremap_caller(offset, size, __pgprot(flags),
+			__builtin_return_address(0));
 }
-#endif
+#endif /* CONFIG_HAVE_IOREMAP_PROT */
+
+#else /* CONFIG_MMU */
+#define iounmap(addr)		do { } while (0)
+#define ioremap(offset, size)	((void __iomem *)(unsigned long)(offset))
+#endif /* CONFIG_MMU */
 
 #define ioremap_uc	ioremap
 
diff --git a/arch/sh/mm/ioremap.c b/arch/sh/mm/ioremap.c
index d9ec85b6bb2130..69e55939e48a6f 100644
--- a/arch/sh/mm/ioremap.c
+++ b/arch/sh/mm/ioremap.c
@@ -26,6 +26,51 @@
 #include <asm/mmu.h>
 #include "ioremap.h"
 
+/*
+ * On 32-bit SH, we traditionally have the whole physical address space mapped
+ * at all times (as MIPS does), so "ioremap()" and "iounmap()" do not need to do
+ * anything but place the address in the proper segment.  This is true for P1
+ * and P2 addresses, as well as some P3 ones.  However, most of the P3 addresses
+ * and newer cores using extended addressing need to map through page tables, so
+ * the ioremap() implementation becomes a bit more complicated.
+ */
+#ifdef CONFIG_29BIT
+static void __iomem *
+__ioremap_29bit(phys_addr_t offset, unsigned long size, pgprot_t prot)
+{
+	phys_addr_t last_addr = offset + size - 1;
+
+	/*
+	 * For P1 and P2 space this is trivial, as everything is already
+	 * mapped. Uncached access for P1 addresses are done through P2.
+	 * In the P3 case or for addresses outside of the 29-bit space,
+	 * mapping must be done by the PMB or by using page tables.
+	 */
+	if (likely(PXSEG(offset) < P3SEG && PXSEG(last_addr) < P3SEG)) {
+		u64 flags = pgprot_val(prot);
+
+		/*
+		 * Anything using the legacy PTEA space attributes needs
+		 * to be kicked down to page table mappings.
+		 */
+		if (unlikely(flags & _PAGE_PCC_MASK))
+			return NULL;
+		if (unlikely(flags & _PAGE_CACHABLE))
+			return (void __iomem *)P1SEGADDR(offset);
+
+		return (void __iomem *)P2SEGADDR(offset);
+	}
+
+	/* P4 above the store queues are always mapped. */
+	if (unlikely(offset >= P3_ADDR_MAX))
+		return (void __iomem *)P4SEGADDR(offset);
+
+	return NULL;
+}
+#else
+#define __ioremap_29bit(offset, size, prot)		NULL
+#endif /* CONFIG_29BIT */
+
 /*
  * Remap an arbitrary physical address space into the kernel virtual
  * address space. Needed when the kernel wants to access high addresses
@@ -43,6 +88,14 @@ __ioremap_caller(phys_addr_t phys_addr, unsigned long size,
 	unsigned long offset, last_addr, addr, orig_addr;
 	void __iomem *mapped;
 
+	mapped = __ioremap_trapped(phys_addr, size);
+	if (mapped)
+		return mapped;
+
+	mapped = __ioremap_29bit(phys_addr, size, pgprot);
+	if (mapped)
+		return mapped;
+
 	/* Don't allow wraparound or zero size */
 	last_addr = phys_addr + size - 1;
 	if (!size || last_addr < phys_addr)
-- 
2.26.2

