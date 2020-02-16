Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871521602A8
	for <lists+linux-sh@lfdr.de>; Sun, 16 Feb 2020 09:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBPIUD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Feb 2020 03:20:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:57164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgBPIUC (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Sun, 16 Feb 2020 03:20:02 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 176DC22522;
        Sun, 16 Feb 2020 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581841200;
        bh=JKLJ1tKZ3fztALgqup/wk4buejQqYQyIwWENLCivm5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHawBwOaLPv7OEoszLtrM8YJM+6uYJO58rZulQFWhzEhJP2ZJ5qcXjbaV+wmYtYlW
         AGDhO7mt9uSOxVKPZU3beBo7QQURYVhDl+4ZLFSpR1uvY9YQsAnGCBSHULR/LxOUwY
         XHCCwIlICz7XaiX5bWgQJ0C1TN7BxlvPEn8W5i5E=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brian Cain <bcain@codeaurora.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Guan Xuetao <gxt@pku.edu.cn>,
        James Morse <james.morse@arm.com>,
        Jonas Bonn <jonas@southpole.se>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Marc Zyngier <maz@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tony Luck <tony.luck@intel.com>, Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        kvmarm@lists.cs.columbia.edu, kvm-ppc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, nios2-dev@lists.rocketboards.org,
        openrisc@lists.librecores.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v2 07/13] powerpc: add support for folded p4d page tables
Date:   Sun, 16 Feb 2020 10:18:37 +0200
Message-Id: <20200216081843.28670-8-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Implement primitives necessary for the 4th level folding, add walks of p4d
level where appropriate and replace 5level-fixup.h with pgtable-nop4d.h.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Tested-by: Christophe Leroy <christophe.leroy@c-s.fr> # 8xx and 83xx
---
 arch/powerpc/include/asm/book3s/32/pgtable.h  |  1 -
 arch/powerpc/include/asm/book3s/64/hash.h     |  4 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h  |  4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 58 ++++++++++--------
 arch/powerpc/include/asm/book3s/64/radix.h    |  6 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  1 -
 arch/powerpc/include/asm/nohash/64/pgalloc.h  |  2 +-
 .../include/asm/nohash/64/pgtable-4k.h        | 32 +++++-----
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  6 +-
 arch/powerpc/include/asm/pgtable.h            |  8 +++
 arch/powerpc/kvm/book3s_64_mmu_radix.c        | 59 ++++++++++++++++---
 arch/powerpc/lib/code-patching.c              |  7 ++-
 arch/powerpc/mm/book3s32/mmu.c                |  2 +-
 arch/powerpc/mm/book3s32/tlb.c                |  4 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 19 ++++--
 arch/powerpc/mm/book3s64/subpage_prot.c       |  6 +-
 arch/powerpc/mm/hugetlbpage.c                 | 28 +++++----
 arch/powerpc/mm/kasan/kasan_init_32.c         |  8 +--
 arch/powerpc/mm/mem.c                         |  4 +-
 arch/powerpc/mm/nohash/40x.c                  |  4 +-
 arch/powerpc/mm/nohash/book3e_pgtable.c       | 15 +++--
 arch/powerpc/mm/pgtable.c                     | 25 +++++++-
 arch/powerpc/mm/pgtable_32.c                  | 28 +++++----
 arch/powerpc/mm/pgtable_64.c                  | 10 ++--
 arch/powerpc/mm/ptdump/hashpagetable.c        | 20 ++++++-
 arch/powerpc/mm/ptdump/ptdump.c               | 22 ++++++-
 arch/powerpc/xmon/xmon.c                      | 17 +++++-
 28 files changed, 284 insertions(+), 120 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 5b39c11e884a..39ec11371be0 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_PGTABLE_H
 #define _ASM_POWERPC_BOOK3S_32_PGTABLE_H
 
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 
 #include <asm/book3s/32/hash.h>
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 2781ebf6add4..876d1528c2cf 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -134,9 +134,9 @@ static inline int get_region_id(unsigned long ea)
 
 #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
 #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)
-static inline int hash__pgd_bad(pgd_t pgd)
+static inline int hash__p4d_bad(p4d_t p4d)
 {
-	return (pgd_val(pgd) == 0);
+	return (p4d_val(p4d) == 0);
 }
 #ifdef CONFIG_STRICT_KERNEL_RWX
 extern void hash__mark_rodata_ro(void);
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index a41e91bd0580..69c5b051734f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -85,9 +85,9 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 	kmem_cache_free(PGT_CACHE(PGD_INDEX_SIZE), pgd);
 }
 
-static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pud_t *pud)
+static inline void p4d_populate(struct mm_struct *mm, p4d_t *pgd, pud_t *pud)
 {
-	*pgd =  __pgd(__pgtable_ptr_val(pud) | PGD_VAL_BITS);
+	*pgd =  __p4d(__pgtable_ptr_val(pud) | PGD_VAL_BITS);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..ddddbafff0ab 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
 #define _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
 
-#include <asm-generic/5level-fixup.h>
+#include <asm-generic/pgtable-nop4d.h>
 
 #ifndef __ASSEMBLY__
 #include <linux/mmdebug.h>
@@ -251,7 +251,7 @@ extern unsigned long __pmd_frag_size_shift;
 /* Bits to mask out from a PUD to get to the PMD page */
 #define PUD_MASKED_BITS		0xc0000000000000ffUL
 /* Bits to mask out from a PGD to get to the PUD page */
-#define PGD_MASKED_BITS		0xc0000000000000ffUL
+#define P4D_MASKED_BITS		0xc0000000000000ffUL
 
 /*
  * Used as an indicator for rcu callback functions
@@ -949,54 +949,60 @@ static inline bool pud_access_permitted(pud_t pud, bool write)
 	return pte_access_permitted(pud_pte(pud), write);
 }
 
-#define pgd_write(pgd)		pte_write(pgd_pte(pgd))
+#define __p4d_raw(x)	((p4d_t) { __pgd_raw(x) })
+static inline __be64 p4d_raw(p4d_t x)
+{
+	return pgd_raw(x.pgd);
+}
+
+#define p4d_write(p4d)		pte_write(p4d_pte(p4d))
 
-static inline void pgd_clear(pgd_t *pgdp)
+static inline void p4d_clear(p4d_t *p4dp)
 {
-	*pgdp = __pgd(0);
+	*p4dp = __p4d(0);
 }
 
-static inline int pgd_none(pgd_t pgd)
+static inline int p4d_none(p4d_t p4d)
 {
-	return !pgd_raw(pgd);
+	return !p4d_raw(p4d);
 }
 
-static inline int pgd_present(pgd_t pgd)
+static inline int p4d_present(p4d_t p4d)
 {
-	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PRESENT));
+	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PRESENT));
 }
 
-static inline pte_t pgd_pte(pgd_t pgd)
+static inline pte_t p4d_pte(p4d_t p4d)
 {
-	return __pte_raw(pgd_raw(pgd));
+	return __pte_raw(p4d_raw(p4d));
 }
 
-static inline pgd_t pte_pgd(pte_t pte)
+static inline p4d_t pte_p4d(pte_t pte)
 {
-	return __pgd_raw(pte_raw(pte));
+	return __p4d_raw(pte_raw(pte));
 }
 
-static inline int pgd_bad(pgd_t pgd)
+static inline int p4d_bad(p4d_t p4d)
 {
 	if (radix_enabled())
-		return radix__pgd_bad(pgd);
-	return hash__pgd_bad(pgd);
+		return radix__p4d_bad(p4d);
+	return hash__p4d_bad(p4d);
 }
 
-#define pgd_access_permitted pgd_access_permitted
-static inline bool pgd_access_permitted(pgd_t pgd, bool write)
+#define p4d_access_permitted p4d_access_permitted
+static inline bool p4d_access_permitted(p4d_t p4d, bool write)
 {
-	return pte_access_permitted(pgd_pte(pgd), write);
+	return pte_access_permitted(p4d_pte(p4d), write);
 }
 
-extern struct page *pgd_page(pgd_t pgd);
+extern struct page *p4d_page(p4d_t p4d);
 
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
 
 #define pmd_page_vaddr(pmd)	__va(pmd_val(pmd) & ~PMD_MASKED_BITS)
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
-#define pgd_page_vaddr(pgd)	__va(pgd_val(pgd) & ~PGD_MASKED_BITS)
+#define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
 #define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
 #define pud_index(address) (((address) >> (PUD_SHIFT)) & (PTRS_PER_PUD - 1))
@@ -1010,8 +1016,8 @@ extern struct page *pgd_page(pgd_t pgd);
 
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
 
-#define pud_offset(pgdp, addr)	\
-	(((pud_t *) pgd_page_vaddr(*(pgdp))) + pud_index(addr))
+#define pud_offset(p4dp, addr)	\
+	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
 #define pmd_offset(pudp,addr) \
 	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
 #define pte_offset_kernel(dir,addr) \
@@ -1368,6 +1374,12 @@ static inline bool pud_is_leaf(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
 
+#define p4d_is_leaf p4d_is_leaf
+static inline bool p4d_is_leaf(p4d_t p4d)
+{
+	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PTE));
+}
+
 #define pgd_is_leaf pgd_is_leaf
 #define pgd_leaf pgd_is_leaf
 static inline bool pgd_is_leaf(pgd_t pgd)
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index d97db3ad9aae..9bca2ac64220 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -30,7 +30,7 @@
 /* Don't have anything in the reserved bits and leaf bits */
 #define RADIX_PMD_BAD_BITS		0x60000000000000e0UL
 #define RADIX_PUD_BAD_BITS		0x60000000000000e0UL
-#define RADIX_PGD_BAD_BITS		0x60000000000000e0UL
+#define RADIX_P4D_BAD_BITS		0x60000000000000e0UL
 
 #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
 #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
@@ -227,9 +227,9 @@ static inline int radix__pud_bad(pud_t pud)
 }
 
 
-static inline int radix__pgd_bad(pgd_t pgd)
+static inline int radix__p4d_bad(p4d_t p4d)
 {
-	return !!(pgd_val(pgd) & RADIX_PGD_BAD_BITS);
+	return !!(p4d_val(p4d) & RADIX_P4D_BAD_BITS);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 60c4d829152e..d4c2c4259fa3 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_POWERPC_NOHASH_32_PGTABLE_H
 #define _ASM_POWERPC_NOHASH_32_PGTABLE_H
 
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/include/asm/nohash/64/pgalloc.h b/arch/powerpc/include/asm/nohash/64/pgalloc.h
index b9534a793293..668aee6017e7 100644
--- a/arch/powerpc/include/asm/nohash/64/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/64/pgalloc.h
@@ -15,7 +15,7 @@ struct vmemmap_backing {
 };
 extern struct vmemmap_backing *vmemmap_list;
 
-#define pgd_populate(MM, PGD, PUD)	pgd_set(PGD, (unsigned long)PUD)
+#define p4d_populate(MM, P4D, PUD)	p4d_set(P4D, (unsigned long)PUD)
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h b/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
index c40ec32b8194..81b1c54e3cf1 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_NOHASH_64_PGTABLE_4K_H
 #define _ASM_POWERPC_NOHASH_64_PGTABLE_4K_H
 
-#include <asm-generic/5level-fixup.h>
+#include <asm-generic/pgtable-nop4d.h>
 
 /*
  * Entries per page directory level.  The PTE level must use a 64b record
@@ -45,41 +45,41 @@
 #define PMD_MASKED_BITS		0
 /* Bits to mask out from a PUD to get to the PMD page */
 #define PUD_MASKED_BITS		0
-/* Bits to mask out from a PGD to get to the PUD page */
-#define PGD_MASKED_BITS		0
+/* Bits to mask out from a P4D to get to the PUD page */
+#define P4D_MASKED_BITS		0
 
 
 /*
  * 4-level page tables related bits
  */
 
-#define pgd_none(pgd)		(!pgd_val(pgd))
-#define pgd_bad(pgd)		(pgd_val(pgd) == 0)
-#define pgd_present(pgd)	(pgd_val(pgd) != 0)
-#define pgd_page_vaddr(pgd)	(pgd_val(pgd) & ~PGD_MASKED_BITS)
+#define p4d_none(p4d)		(!p4d_val(p4d))
+#define p4d_bad(p4d)		(p4d_val(p4d) == 0)
+#define p4d_present(p4d)	(p4d_val(p4d) != 0)
+#define p4d_page_vaddr(p4d)	(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
 #ifndef __ASSEMBLY__
 
-static inline void pgd_clear(pgd_t *pgdp)
+static inline void p4d_clear(p4d_t *p4dp)
 {
-	*pgdp = __pgd(0);
+	*p4dp = __p4d(0);
 }
 
-static inline pte_t pgd_pte(pgd_t pgd)
+static inline pte_t p4d_pte(p4d_t p4d)
 {
-	return __pte(pgd_val(pgd));
+	return __pte(p4d_val(p4d));
 }
 
-static inline pgd_t pte_pgd(pte_t pte)
+static inline p4d_t pte_p4d(pte_t pte)
 {
-	return __pgd(pte_val(pte));
+	return __p4d(pte_val(pte));
 }
-extern struct page *pgd_page(pgd_t pgd);
+extern struct page *p4d_page(p4d_t p4d);
 
 #endif /* !__ASSEMBLY__ */
 
-#define pud_offset(pgdp, addr)	\
-  (((pud_t *) pgd_page_vaddr(*(pgdp))) + \
+#define pud_offset(p4dp, addr)	\
+  (((pud_t *) p4d_page_vaddr(*(p4dp))) + \
     (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1)))
 
 #define pud_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 9a33b8bd842d..b360f262b9c6 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -175,11 +175,11 @@ static inline pud_t pte_pud(pte_t pte)
 	return __pud(pte_val(pte));
 }
 #define pud_write(pud)		pte_write(pud_pte(pud))
-#define pgd_write(pgd)		pte_write(pgd_pte(pgd))
+#define p4d_write(pgd)		pte_write(p4d_pte(p4d))
 
-static inline void pgd_set(pgd_t *pgdp, unsigned long val)
+static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 {
-	*pgdp = __pgd(val);
+	*p4dp = __p4d(val);
 }
 
 /*
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 8cc543ed114c..0a05fddd7881 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -139,6 +139,14 @@ static inline bool pud_is_leaf(pud_t pud)
 }
 #endif
 
+#ifndef p4d_is_leaf
+#define p4d_is_leaf p4d_is_leaf
+static inline bool p4d_is_leaf(p4d_t p4d)
+{
+	return false;
+}
+#endif
+
 #ifndef pgd_is_leaf
 #define pgd_is_leaf pgd_is_leaf
 static inline bool pgd_is_leaf(pgd_t pgd)
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 803940d79b73..5aacfa0b27ef 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -494,17 +494,39 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	pud_free(kvm->mm, pud);
 }
 
+static void kvmppc_unmap_free_p4d(struct kvm *kvm, p4d_t *p4d,
+				  unsigned int lpid)
+{
+	unsigned long iu;
+	p4d_t *p = p4d;
+
+	for (iu = 0; iu < PTRS_PER_P4D; ++iu, ++p) {
+		if (!p4d_present(*p))
+			continue;
+		if (p4d_is_leaf(*p)) {
+			p4d_clear(p);
+		} else {
+			pud_t *pud;
+
+			pud = pud_offset(p, 0);
+			kvmppc_unmap_free_pud(kvm, pud, lpid);
+			p4d_clear(p);
+		}
+	}
+	p4d_free(kvm->mm, p4d);
+}
+
 void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd, unsigned int lpid)
 {
 	unsigned long ig;
 
 	for (ig = 0; ig < PTRS_PER_PGD; ++ig, ++pgd) {
-		pud_t *pud;
+		p4d_t *p4d;
 
 		if (!pgd_present(*pgd))
 			continue;
-		pud = pud_offset(pgd, 0);
-		kvmppc_unmap_free_pud(kvm, pud, lpid);
+		p4d = p4d_offset(pgd, 0);
+		kvmppc_unmap_free_p4d(kvm, p4d, lpid);
 		pgd_clear(pgd);
 	}
 }
@@ -566,6 +588,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		      unsigned long *rmapp, struct rmap_nested **n_rmap)
 {
 	pgd_t *pgd;
+	p4d_t *p4d, *new_p4d = NULL;
 	pud_t *pud, *new_pud = NULL;
 	pmd_t *pmd, *new_pmd = NULL;
 	pte_t *ptep, *new_ptep = NULL;
@@ -573,9 +596,15 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 
 	/* Traverse the guest's 2nd-level tree, allocate new levels needed */
 	pgd = pgtable + pgd_index(gpa);
-	pud = NULL;
+	p4d = NULL;
 	if (pgd_present(*pgd))
-		pud = pud_offset(pgd, gpa);
+		p4d = p4d_offset(pgd, gpa);
+	else
+		new_p4d = p4d_alloc_one(kvm->mm, gpa);
+
+	pud = NULL;
+	if (p4d_present(*p4d))
+		pud = pud_offset(p4d, gpa);
 	else
 		new_pud = pud_alloc_one(kvm->mm, gpa);
 
@@ -597,12 +626,18 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 	/* Now traverse again under the lock and change the tree */
 	ret = -ENOMEM;
 	if (pgd_none(*pgd)) {
+		if (!new_p4d)
+			goto out_unlock;
+		pgd_populate(kvm->mm, pgd, new_p4d);
+		new_p4d = NULL;
+	}
+	if (p4d_none(*p4d)) {
 		if (!new_pud)
 			goto out_unlock;
-		pgd_populate(kvm->mm, pgd, new_pud);
+		p4d_populate(kvm->mm, p4d, new_pud);
 		new_pud = NULL;
 	}
-	pud = pud_offset(pgd, gpa);
+	pud = pud_offset(p4d, gpa);
 	if (pud_is_leaf(*pud)) {
 		unsigned long hgpa = gpa & PUD_MASK;
 
@@ -1220,6 +1255,7 @@ static ssize_t debugfs_radix_read(struct file *file, char __user *buf,
 	pgd_t *pgt;
 	struct kvm_nested_guest *nested;
 	pgd_t pgd, *pgdp;
+	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
 	pte_t *ptep;
@@ -1298,7 +1334,14 @@ static ssize_t debugfs_radix_read(struct file *file, char __user *buf,
 			continue;
 		}
 
-		pudp = pud_offset(&pgd, gpa);
+		p4dp = p4d_offset(&pgd, gpa);
+		p4d = READ_ONCE(*p4dp);
+		if (!(p4d_val(p4d) & _PAGE_PRESENT)) {
+			gpa = (gpa & P4D_MASK) + P4D_SIZE;
+			continue;
+		}
+
+		pudp = pud_offset(&p4d, gpa);
 		pud = READ_ONCE(*pudp);
 		if (!(pud_val(pud) & _PAGE_PRESENT)) {
 			gpa = (gpa & PUD_MASK) + PUD_SIZE;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3345f039a876..7a59f6863cec 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -107,13 +107,18 @@ static inline int unmap_patch_area(unsigned long addr)
 	pte_t *ptep;
 	pmd_t *pmdp;
 	pud_t *pudp;
+	p4d_t *p4dp;
 	pgd_t *pgdp;
 
 	pgdp = pgd_offset_k(addr);
 	if (unlikely(!pgdp))
 		return -EINVAL;
 
-	pudp = pud_offset(pgdp, addr);
+	p4dp = p4d_offset(pgdp, addr);
+	if (unlikely(!p4dp))
+		return -EINVAL;
+
+	pudp = pud_offset(p4dp, addr);
 	if (unlikely(!pudp))
 		return -EINVAL;
 
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 0a1c65a2c565..b2fc3e71165c 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -312,7 +312,7 @@ void hash_preload(struct mm_struct *mm, unsigned long ea)
 
 	if (!Hash)
 		return;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, ea), ea), ea);
+	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, ea), ea), ea), ea);
 	if (!pmd_none(*pmd))
 		add_hash_page(mm->context.id, ea, pmd_val(*pmd));
 }
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 2fcd321040ff..175bc33b41b7 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -87,7 +87,7 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
 	if (start >= end)
 		return;
 	end = (end - 1) | ~PAGE_MASK;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, start), start), start);
+	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, start), start), start), start);
 	for (;;) {
 		pmd_end = ((start + PGDIR_SIZE) & PGDIR_MASK) - 1;
 		if (pmd_end > end)
@@ -145,7 +145,7 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		return;
 	}
 	mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, vmaddr), vmaddr), vmaddr);
+	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, vmaddr), vmaddr), vmaddr), vmaddr);
 	if (!pmd_none(*pmd))
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 64733b9cb20a..9cd15937e88a 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -148,6 +148,7 @@ void hash__vmemmap_remove_mapping(unsigned long start,
 int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 {
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -155,7 +156,8 @@ int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 	BUILD_BUG_ON(TASK_SIZE_USER64 > H_PGTABLE_RANGE);
 	if (slab_is_available()) {
 		pgdp = pgd_offset_k(ea);
-		pudp = pud_alloc(&init_mm, pgdp, ea);
+		p4dp = p4d_offset(pgdp, ea);
+		pudp = pud_alloc(&init_mm, p4dp, ea);
 		if (!pudp)
 			return -ENOMEM;
 		pmdp = pmd_alloc(&init_mm, pudp, ea);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index dd1bea45325c..11762556fe4d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -64,17 +64,24 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 {
 	unsigned long pfn = pa >> PAGE_SHIFT;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
 
 	pgdp = pgd_offset_k(ea);
 	if (pgd_none(*pgdp)) {
+		p4dp = early_alloc_pgtable(PGD_TABLE_SIZE, nid,
+						region_start, region_end);
+		pgd_populate(&init_mm, pgdp, p4dp);
+	}
+	p4dp = p4d_offset(pgdp, ea);
+	if (p4d_none(*p4dp)) {
 		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
 						region_start, region_end);
-		pgd_populate(&init_mm, pgdp, pudp);
+		p4d_populate(&init_mm, p4dp, pudp);
 	}
-	pudp = pud_offset(pgdp, ea);
+	pudp = pud_offset(p4dp, ea);
 	if (map_page_size == PUD_SIZE) {
 		ptep = (pte_t *)pudp;
 		goto set_the_pte;
@@ -114,6 +121,7 @@ static int __map_kernel_page(unsigned long ea, unsigned long pa,
 {
 	unsigned long pfn = pa >> PAGE_SHIFT;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -136,7 +144,8 @@ static int __map_kernel_page(unsigned long ea, unsigned long pa,
 	 * boot.
 	 */
 	pgdp = pgd_offset_k(ea);
-	pudp = pud_alloc(&init_mm, pgdp, ea);
+	p4dp = p4d_offset(pgdp, ea);
+	pudp = pud_alloc(&init_mm, p4dp, ea);
 	if (!pudp)
 		return -ENOMEM;
 	if (map_page_size == PUD_SIZE) {
@@ -173,6 +182,7 @@ void radix__change_memory_range(unsigned long start, unsigned long end,
 {
 	unsigned long idx;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -185,7 +195,8 @@ void radix__change_memory_range(unsigned long start, unsigned long end,
 
 	for (idx = start; idx < end; idx += PAGE_SIZE) {
 		pgdp = pgd_offset_k(idx);
-		pudp = pud_alloc(&init_mm, pgdp, idx);
+		p4dp = p4d_offset(pgdp, idx);
+		pudp = pud_alloc(&init_mm, p4dp, idx);
 		if (!pudp)
 			continue;
 		if (pud_is_leaf(*pudp)) {
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index 2ef24a53f4c9..27daeed1a141 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -54,6 +54,7 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 			     int npages)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -62,7 +63,10 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	pgd = pgd_offset(mm, addr);
 	if (pgd_none(*pgd))
 		return;
-	pud = pud_offset(pgd, addr);
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d))
+		return;
+	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud))
 		return;
 	pmd = pmd_offset(pud, addr);
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 73d4873fc7f8..43d463f20fc3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -112,6 +112,7 @@ static int __hugepte_alloc(struct mm_struct *mm, hugepd_t *hpdp,
 pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz)
 {
 	pgd_t *pg;
+	p4d_t *p4;
 	pud_t *pu;
 	pmd_t *pm;
 	hugepd_t *hpdp = NULL;
@@ -121,20 +122,21 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 
 	addr &= ~(sz-1);
 	pg = pgd_offset(mm, addr);
+	p4 = p4d_offset(pg, addr);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (pshift == PGDIR_SHIFT)
 		/* 16GB huge page */
-		return (pte_t *) pg;
+		return (pte_t *) p4;
 	else if (pshift > PUD_SHIFT) {
 		/*
 		 * We need to use hugepd table
 		 */
 		ptl = &mm->page_table_lock;
-		hpdp = (hugepd_t *)pg;
+		hpdp = (hugepd_t *)p4;
 	} else {
 		pdshift = PUD_SHIFT;
-		pu = pud_alloc(mm, pg, addr);
+		pu = pud_alloc(mm, p4, addr);
 		if (!pu)
 			return NULL;
 		if (pshift == PUD_SHIFT)
@@ -159,10 +161,10 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 #else
 	if (pshift >= PGDIR_SHIFT) {
 		ptl = &mm->page_table_lock;
-		hpdp = (hugepd_t *)pg;
+		hpdp = (hugepd_t *)p4;
 	} else {
 		pdshift = PUD_SHIFT;
-		pu = pud_alloc(mm, pg, addr);
+		pu = pud_alloc(mm, p4, addr);
 		if (!pu)
 			return NULL;
 		if (pshift >= PUD_SHIFT) {
@@ -384,7 +386,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 	mm_dec_nr_pmds(tlb->mm);
 }
 
-static void hugetlb_free_pud_range(struct mmu_gather *tlb, pgd_t *pgd,
+static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
 				   unsigned long addr, unsigned long end,
 				   unsigned long floor, unsigned long ceiling)
 {
@@ -394,7 +396,7 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, pgd_t *pgd,
 
 	start = addr;
 	do {
-		pud = pud_offset(pgd, addr);
+		pud = pud_offset(p4d, addr);
 		next = pud_addr_end(addr, end);
 		if (!is_hugepd(__hugepd(pud_val(*pud)))) {
 			if (pud_none_or_clear_bad(pud))
@@ -429,8 +431,8 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, pgd_t *pgd,
 	if (end - 1 > ceiling - 1)
 		return;
 
-	pud = pud_offset(pgd, start);
-	pgd_clear(pgd);
+	pud = pud_offset(p4d, start);
+	p4d_clear(p4d);
 	pud_free_tlb(tlb, pud, start);
 	mm_dec_nr_puds(tlb->mm);
 }
@@ -443,6 +445,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			    unsigned long floor, unsigned long ceiling)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	unsigned long next;
 
 	/*
@@ -465,10 +468,11 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 	do {
 		next = pgd_addr_end(addr, end);
 		pgd = pgd_offset(tlb->mm, addr);
+		p4d = p4d_offset(pgd, addr);
 		if (!is_hugepd(__hugepd(pgd_val(*pgd)))) {
-			if (pgd_none_or_clear_bad(pgd))
+			if (p4d_none_or_clear_bad(p4d))
 				continue;
-			hugetlb_free_pud_range(tlb, pgd, addr, next, floor, ceiling);
+			hugetlb_free_pud_range(tlb, p4d, addr, next, floor, ceiling);
 		} else {
 			unsigned long more;
 			/*
@@ -481,7 +485,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			if (more > next)
 				next = more;
 
-			free_hugepd_range(tlb, (hugepd_t *)pgd, PGDIR_SHIFT,
+			free_hugepd_range(tlb, (hugepd_t *)p4d, PGDIR_SHIFT,
 					  addr, next, floor, ceiling);
 		}
 	} while (addr = next, addr != end);
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 16dd95bd0749..eed3f1ae3b90 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -36,7 +36,7 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 	unsigned long k_cur, k_next;
 	pte_t *new = NULL;
 
-	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
+	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(k_start), k_start), k_start), k_start);
 
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
 		k_next = pgd_addr_end(k_cur, k_end);
@@ -78,7 +78,7 @@ static int __init kasan_init_region(void *start, size_t size)
 	block = memblock_alloc(k_end - k_start, PAGE_SIZE);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(k_cur), k_cur), k_cur), k_cur);
 		void *va = block + k_cur - k_start;
 		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
 
@@ -102,7 +102,7 @@ static void __init kasan_remap_early_shadow_ro(void)
 	kasan_populate_pte(kasan_early_shadow_pte, prot);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(k_cur), k_cur), k_cur), k_cur);
 		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
 
 		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
@@ -202,7 +202,7 @@ void __init kasan_early_init(void)
 	unsigned long addr = KASAN_SHADOW_START;
 	unsigned long end = KASAN_SHADOW_END;
 	unsigned long next;
-	pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(addr), addr), addr);
+	pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(addr), addr), addr), addr);
 
 	BUILD_BUG_ON(KASAN_SHADOW_START & ~PGDIR_MASK);
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ef7b1119b2e2..8262b384dcf3 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -69,8 +69,8 @@ EXPORT_SYMBOL(kmap_prot);
 
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
 {
-	return pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr),
-			vaddr), vaddr), vaddr);
+	return pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr),
+			vaddr), vaddr), vaddr), vaddr);
 }
 #endif
 
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index f348104eb461..7aaf7155e350 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -104,7 +104,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_offset(pud_offset(pgd_offset_k(v), v), v);
+		pmdp = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(v), v), v), v);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
@@ -119,7 +119,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_offset(pud_offset(pgd_offset_k(v), v), v);
+		pmdp = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(v), v), v), v);
 		*pmdp = __pmd(val);
 
 		v += LARGE_PAGE_SIZE_4M;
diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c b/arch/powerpc/mm/nohash/book3e_pgtable.c
index 4637fdd469cf..a62d59a928be 100644
--- a/arch/powerpc/mm/nohash/book3e_pgtable.c
+++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
@@ -73,6 +73,7 @@ static void __init *early_alloc_pgtable(unsigned long size)
 int __ref map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 {
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -80,7 +81,10 @@ int __ref map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 	BUILD_BUG_ON(TASK_SIZE_USER64 > PGTABLE_RANGE);
 	if (slab_is_available()) {
 		pgdp = pgd_offset_k(ea);
-		pudp = pud_alloc(&init_mm, pgdp, ea);
+		p4dp = p4d_alloc(&init_mm, pgdp, ea);
+		if (!p4dp)
+			return -ENOMEM;
+		pudp = pud_alloc(&init_mm, p4dp, ea);
 		if (!pudp)
 			return -ENOMEM;
 		pmdp = pmd_alloc(&init_mm, pudp, ea);
@@ -91,13 +95,16 @@ int __ref map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 			return -ENOMEM;
 	} else {
 		pgdp = pgd_offset_k(ea);
-#ifndef __PAGETABLE_PUD_FOLDED
 		if (pgd_none(*pgdp)) {
 			pudp = early_alloc_pgtable(PUD_TABLE_SIZE);
 			pgd_populate(&init_mm, pgdp, pudp);
 		}
-#endif /* !__PAGETABLE_PUD_FOLDED */
-		pudp = pud_offset(pgdp, ea);
+		p4dp = p4d_offset(pgdp, ea);
+		if (p4d_none(*p4dp)) {
+			pmdp = early_alloc_pgtable(PMD_TABLE_SIZE);
+			p4d_populate(&init_mm, p4dp, pmdp);
+		}
+		pudp = pud_offset(p4dp, ea);
 		if (pud_none(*pudp)) {
 			pmdp = early_alloc_pgtable(PMD_TABLE_SIZE);
 			pud_populate(&init_mm, pudp, pmdp);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index e3759b69f81b..dca6a72da26a 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -265,6 +265,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 
@@ -272,7 +273,9 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 		return;
 	pgd = mm->pgd + pgd_index(addr);
 	BUG_ON(pgd_none(*pgd));
-	pud = pud_offset(pgd, addr);
+	p4d = p4d_offset(pgd, addr);
+	BUG_ON(p4d_none(*p4d));
+	pud = pud_offset(p4d, addr);
 	BUG_ON(pud_none(*pud));
 	pmd = pmd_offset(pud, addr);
 	/*
@@ -313,6 +316,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 			bool *is_thp, unsigned *hpage_shift)
 {
 	pgd_t pgd, *pgdp;
+	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
 	pte_t *ret_pte;
@@ -346,13 +350,30 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out_huge;
 	}
 
+	pdshift = P4D_SHIFT;
+	p4dp = p4d_offset(&pgd, ea);
+	p4d  = READ_ONCE(*p4dp);
+
+	if (p4d_none(p4d))
+		return NULL;
+
+	if (p4d_is_leaf(p4d)) {
+		ret_pte = (pte_t *)p4dp;
+		goto out;
+	}
+
+	if (is_hugepd(__hugepd(p4d_val(p4d)))) {
+		hpdp = (hugepd_t *)&p4d;
+		goto out_huge;
+	}
+
 	/*
 	 * Even if we end up with an unmap, the pgtable will not
 	 * be freed, because we do an rcu free and here we are
 	 * irq disabled
 	 */
 	pdshift = PUD_SHIFT;
-	pudp = pud_offset(&pgd, ea);
+	pudp = pud_offset(&p4d, ea);
 	pud  = READ_ONCE(*pudp);
 
 	if (pud_none(pud))
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5fb90edd865e..ad217e5e039f 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -63,7 +63,7 @@ int __ref map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot)
 	int err = -ENOMEM;
 
 	/* Use upper 10 bits of VA to index the first level map */
-	pd = pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+	pd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
 	/* Use middle 10 bits of VA to index the second-level map */
 	if (likely(slab_is_available()))
 		pg = pte_alloc_kernel(pd, va);
@@ -130,6 +130,7 @@ static int
 get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep, pmd_t **pmdp)
 {
         pgd_t	*pgd;
+	p4d_t	*p4d;
 	pud_t	*pud;
         pmd_t	*pmd;
         pte_t	*pte;
@@ -137,17 +138,20 @@ get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep, pmd_t **pmdp)
 
         pgd = pgd_offset(mm, addr & PAGE_MASK);
         if (pgd) {
-		pud = pud_offset(pgd, addr & PAGE_MASK);
-		if (pud && pud_present(*pud)) {
-			pmd = pmd_offset(pud, addr & PAGE_MASK);
-			if (pmd_present(*pmd)) {
-				pte = pte_offset_map(pmd, addr & PAGE_MASK);
-				if (pte) {
-					retval = 1;
-					*ptep = pte;
-					if (pmdp)
-						*pmdp = pmd;
-					/* XXX caller needs to do pte_unmap, yuck */
+		p4d = p4d_offset(pgd, addr & PAGE_MASK);
+		if (p4d && p4d_present(*p4d)) {
+			pud = pud_offset(p4d, addr & PAGE_MASK);
+			if (pud && pud_present(*pud)) {
+				pmd = pmd_offset(pud, addr & PAGE_MASK);
+				if (pmd_present(*pmd)) {
+					pte = pte_offset_map(pmd, addr & PAGE_MASK);
+					if (pte) {
+						retval = 1;
+						*ptep = pte;
+						if (pmdp)
+							*pmdp = pmd;
+						/* XXX caller needs to do pte_unmap, yuck */
+					}
 				}
 			}
 		}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index e78832dce7bb..1f86a88fd4bb 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -101,13 +101,13 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
 
 #ifndef __PAGETABLE_PUD_FOLDED
 /* 4 level page table */
-struct page *pgd_page(pgd_t pgd)
+struct page *p4d_page(p4d_t p4d)
 {
-	if (pgd_is_leaf(pgd)) {
-		VM_WARN_ON(!pgd_huge(pgd));
-		return pte_page(pgd_pte(pgd));
+	if (p4d_is_leaf(p4d)) {
+		VM_WARN_ON(!p4d_huge(p4d));
+		return pte_page(p4d_pte(p4d));
 	}
-	return virt_to_page(pgd_page_vaddr(pgd));
+	return virt_to_page(p4d_page_vaddr(p4d));
 }
 #endif
 
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index a07278027c6f..ac360ad865a8 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -417,9 +417,9 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 	}
 }
 
-static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
+static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
 {
-	pud_t *pud = pud_offset(pgd, 0);
+	pud_t *pud = pud_offset(p4d, 0);
 	unsigned long addr;
 	unsigned int i;
 
@@ -431,6 +431,20 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
 	}
 }
 
+static void walk_p4d(struct pg_state *st, pgd_t *pgd, unsigned long start)
+{
+	p4d_t *p4d = p4d_offset(pgd, 0);
+	unsigned long addr;
+	unsigned int i;
+
+	for (i = 0; i < PTRS_PER_P4D; i++, p4d++) {
+		addr = start + i * P4D_SIZE;
+		if (!p4d_none(*p4d))
+			/* p4d exists */
+			walk_pud(st, p4d, addr);
+	}
+}
+
 static void walk_pagetables(struct pg_state *st)
 {
 	pgd_t *pgd = pgd_offset_k(0UL);
@@ -445,7 +459,7 @@ static void walk_pagetables(struct pg_state *st)
 		addr = KERN_VIRT_START + i * PGDIR_SIZE;
 		if (!pgd_none(*pgd))
 			/* pgd exists */
-			walk_pud(st, pgd, addr);
+			walk_p4d(st, pgd, addr);
 	}
 }
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 206156255247..7bd4b81d5b5d 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -277,9 +277,9 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 	}
 }
 
-static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
+static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
 {
-	pud_t *pud = pud_offset(pgd, 0);
+	pud_t *pud = pud_offset(p4d, 0);
 	unsigned long addr;
 	unsigned int i;
 
@@ -293,6 +293,22 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
 	}
 }
 
+static void walk_p4d(struct pg_state *st, pgd_t *pgd, unsigned long start)
+{
+	p4d_t *p4d = p4d_offset(pgd, 0);
+	unsigned long addr;
+	unsigned int i;
+
+	for (i = 0; i < PTRS_PER_P4D; i++, p4d++) {
+		addr = start + i * P4D_SIZE;
+		if (!p4d_none(*p4d) && !p4d_is_leaf(*p4d))
+			/* p4d exists */
+			walk_pud(st, p4d, addr);
+		else
+			note_page(st, addr, 2, p4d_val(*p4d));
+	}
+}
+
 static void walk_pagetables(struct pg_state *st)
 {
 	unsigned int i;
@@ -306,7 +322,7 @@ static void walk_pagetables(struct pg_state *st)
 	for (i = pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {
 		if (!pgd_none(*pgd) && !pgd_is_leaf(*pgd))
 			/* pgd exists */
-			walk_pud(st, pgd, addr);
+			walk_p4d(st, pgd, addr);
 		else
 			note_page(st, addr, 1, pgd_val(*pgd));
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e8c84d265602..c7bd1145b268 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3130,6 +3130,7 @@ static void show_pte(unsigned long addr)
 	struct task_struct *tsk = NULL;
 	struct mm_struct *mm;
 	pgd_t *pgdp, *pgdir;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -3174,7 +3175,21 @@ static void show_pte(unsigned long addr)
 	}
 	printf("pgdp @ 0x%px = 0x%016lx\n", pgdp, pgd_val(*pgdp));
 
-	pudp = pud_offset(pgdp, addr);
+	p4dp = p4d_offset(pgdp, addr);
+
+	if (p4d_none(*p4dp)) {
+		printf("No valid P4D\n");
+		return;
+	}
+
+	if (p4d_is_leaf(*p4dp)) {
+		format_pte(p4dp, p4d_val(*p4dp));
+		return;
+	}
+
+	printf("p4dp @ 0x%px = 0x%016lx\n", p4dp, p4d_val(*p4dp));
+
+	pudp = pud_offset(p4dp, addr);
 
 	if (pud_none(*pudp)) {
 		printf("No valid PUD\n");
-- 
2.24.0

