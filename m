Return-Path: <linux-sh+bounces-2219-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3276A0540F
	for <lists+linux-sh@lfdr.de>; Wed,  8 Jan 2025 08:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BC116639F
	for <lists+linux-sh@lfdr.de>; Wed,  8 Jan 2025 07:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3891B0420;
	Wed,  8 Jan 2025 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BlMHKzg5"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C31B042D
	for <linux-sh@vger.kernel.org>; Wed,  8 Jan 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319776; cv=none; b=VgtkfKwi8O1UooG+7KsDiyrb8pcE0W6Wo4GLt4qW4DuN69jMueBhOUlO5WzN4TEb+qNnVz5c/O04FPoZFKQvmlC5JG8uzx5DRh683LCpoxYtLXE1kjLu2fVbBvQ6x11PqL+Dl6gEn15szWdu3E6g7jcVfii1BjCo9j/Csh/3Enk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319776; c=relaxed/simple;
	bh=3fHJSkC+ZRrYKXKXXlSAUW/WqaHC6KrKlc6jXb0Ndak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ERmht5EK4exqP64CE41SxZIDjRiENaIWNhZiakCsfUOvSKIphW7c9+6oNWessYvE1q3pj1jWQf/HjH7SpKDvQyg3jaGyj452I8pnfiCSvn/Pm8Zt4/rLXxOLVUhtSqe0nUPsBl5f0ABOieV/bfaueEBdgHhGwZSNQoryoVisVo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BlMHKzg5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so210955045ad.2
        for <linux-sh@vger.kernel.org>; Tue, 07 Jan 2025 23:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319773; x=1736924573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKWQZ+PEOlL8JpVZj7ISn1dZhyFPgkd436O3CmTW6X0=;
        b=BlMHKzg5JG/eiSIOT/UAoSoU8noIALWj9CszGIHOn92KggCPQDapKxVndZxErkYgGF
         2VE3zEedsamZbv7Lf13KU1VoHm4Oa+9Pc6EFBQstArbuaYJBUafcx7kzDGwx3ckcvV6L
         2IeDZMpzdaz0LJve8BH7m+CLJ2oKizbjDG1SXOhIETIOwcvqeYWp4K7pJ0AZMFbN12xL
         6RUkTyd4AOrMJCujayK21H1SKvIwXaA7oauzCiHwzqTVuo+DuCNM4GnwSa5OHXUMWYOz
         kTyVxw2SKHo8/uVf5K37pCuixxQgXwYhIqfvLkEmLnx1o7hCRugF/9SnY9i+DVF6Np/u
         0LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319773; x=1736924573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKWQZ+PEOlL8JpVZj7ISn1dZhyFPgkd436O3CmTW6X0=;
        b=nedkz5FvIThCtJxvVQmov5bo3nCstR/WpX1KwREiMWMF+cYZkOibRQJgGr2wuDexyI
         SiWlrwcfaPyEzpjTh5+gLkY+qMI59mjleRNs5NSCx3tf1KEzud3hsNQ4FUhDjRc5CwmF
         3P8XgYi4xay5r3uPLhWVVZL5OHO9hLR2lFlPj0nhFJzY0VPB280vf3SPnWvA6p395mQx
         YcbnBBoBSq1qUxp4A98Yhc/0D7GDA8yq8Dn+SWeJdT+Znw4Z/TLvmZTR54CCqnNEjT2h
         Ay0/oaQBs09f/FD2y08l5sErit47PP9pOXCjsSgJfs5ygE5//FBxuGLWHYoEBPDAc2S7
         /hPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKnBr3VjOB7COrAbZl96/9VVYyyebkDTagQuVi+PtuRgjbusktdy64aZD1uDkztqy5PaT2E7x+yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytAZZ2Rc0j5dAPsE8r6uC3Q8gDnzT2MDug1uL1//HNQI35oXB9
	6VBXefWt+4SJSr5L4YxjW8qYXe1l8VOngiK0VcVEMpQPTDkshpt/MTnnkBJkN1g=
X-Gm-Gg: ASbGncsv20ExeFaipoNfGKuEOlg+BuX68e/g+wkEBTfXDglg9OLGb4g1yDJNVTP14vH
	RhdkUlT63fg2kvROFHU2pvYD3Gtxun8p3fVpHB49pMDPd2CSlLzjUs7fz70Rt4cs7cHTLydycuR
	dfBkMtlXpPuPtX6zlppQeAqQiUGYygSXR76vk29hDsjpP1084opcEijEzVSo2fH42oWG+KRyBtb
	FddSOiWpiLyOZ+rZHr9eaH3ooaE6Gd6Eo8SfxdhynKJCUSZWH8TltbJgcG/CkzeFjesGFpL2zdn
	0FGHMnt8H9APyiUKEaogTAbOvz0=
X-Google-Smtp-Source: AGHT+IHGzG078/xZKjf5ni4u4VqQSEqesUDiW4uhWhxryubYr9zfzyAKAXvb8eE6PvXFj9EqVM5aSQ==
X-Received: by 2002:a17:903:244a:b0:211:fcad:d6ea with SMTP id d9443c01a7336-21a83fcf7a9mr28371525ad.45.1736319773330;
        Tue, 07 Jan 2025 23:02:53 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:52 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 14/17] mm: pgtable: introduce generic __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:30 +0800
Message-Id: <ea372633d94f4d3f9f56a7ec5994bf050bf77e39.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several architectures (arm, arm64, riscv and x86) define exactly the
same __tlb_remove_table(), just introduce generic __tlb_remove_table() to
eliminate these duplications.

The s390 __tlb_remove_table() is nearly the same, so also make s390
__tlb_remove_table() version generic.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
 arch/arm/include/asm/tlb.h      |  9 ---------
 arch/arm64/include/asm/tlb.h    |  7 -------
 arch/powerpc/include/asm/tlb.h  |  1 +
 arch/riscv/include/asm/tlb.h    | 12 ------------
 arch/s390/include/asm/tlb.h     |  9 ++++-----
 arch/s390/mm/pgalloc.c          |  7 -------
 arch/sparc/include/asm/tlb_64.h |  1 +
 arch/x86/include/asm/tlb.h      | 17 -----------------
 include/asm-generic/tlb.h       | 15 +++++++++++++--
 9 files changed, 19 insertions(+), 59 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index 59854c6b97bc5..b8eebdb598631 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -27,15 +27,6 @@
 #else /* !CONFIG_MMU */
 
 #include <asm/tlbflush.h>
-
-static inline void __tlb_remove_table(void *_table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)_table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 #include <asm-generic/tlb.h>
 
 static inline void
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 93591a80b5bfb..8d762607285cc 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -10,13 +10,6 @@
 
 #include <linux/pagemap.h>
 
-static inline void __tlb_remove_table(void *_table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)_table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
 
 #define tlb_flush tlb_flush
 static void tlb_flush(struct mmu_gather *tlb);
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 1ca7d4c4b90db..2058e8d3e0138 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -37,6 +37,7 @@ extern void tlb_flush(struct mmu_gather *tlb);
  */
 #define tlb_needs_table_invalidate()	radix_enabled()
 
+#define __HAVE_ARCH_TLB_REMOVE_TABLE
 /* Get the generic bits... */
 #include <asm-generic/tlb.h>
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index ded8724b3c4f7..50b63b5c15bd8 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -10,18 +10,6 @@ struct mmu_gather;
 
 static void tlb_flush(struct mmu_gather *tlb);
 
-#ifdef CONFIG_MMU
-
-static inline void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
-#endif /* CONFIG_MMU */
-
 #define tlb_flush tlb_flush
 #include <asm-generic/tlb.h>
 
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index d5b27a2445c96..f39f8c4723f15 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -22,7 +22,6 @@
  * Pages used for the page tables is a different story. FIXME: more
  */
 
-void __tlb_remove_table(void *_table);
 static inline void tlb_flush(struct mmu_gather *tlb);
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
 		struct page *page, bool delay_rmap, int page_size);
@@ -87,7 +86,7 @@ static inline void pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	tlb->cleared_pmds = 1;
 	if (mm_alloc_pgste(tlb->mm))
 		gmap_unlink(tlb->mm, (unsigned long *)pte, address);
-	tlb_remove_ptdesc(tlb, pte);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pte));
 }
 
 /*
@@ -106,7 +105,7 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_puds = 1;
-	tlb_remove_ptdesc(tlb, pmd);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 /*
@@ -124,7 +123,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
-	tlb_remove_ptdesc(tlb, p4d);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 
 /*
@@ -142,7 +141,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-	tlb_remove_ptdesc(tlb, pud);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index c73b89811a264..3e002dea6278f 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -193,13 +193,6 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 	pagetable_dtor_free(ptdesc);
 }
 
-void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-
-	pagetable_dtor_free(ptdesc);
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pte_free_now(struct rcu_head *head)
 {
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index 3037187482db7..1a6e694418e39 100644
--- a/arch/sparc/include/asm/tlb_64.h
+++ b/arch/sparc/include/asm/tlb_64.h
@@ -33,6 +33,7 @@ void flush_tlb_pending(void);
 #define tlb_needs_table_invalidate()	(false)
 #endif
 
+#define __HAVE_ARCH_TLB_REMOVE_TABLE
 #include <asm-generic/tlb.h>
 
 #endif /* _SPARC64_TLB_H */
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index f64730be5ad67..3858dbf75880e 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,23 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-/*
- * While x86 architecture in general requires an IPI to perform TLB
- * shootdown, enablement code for several hypervisors overrides
- * .flush_tlb_others hook in pv_mmu_ops and implements it by issuing
- * a hypercall. To keep software pagetable walkers safe in this case we
- * switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the comment
- * below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
-static inline void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 709830274b756..69de47c7ef3c5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -153,8 +153,9 @@
  *
  *  Useful if your architecture has non-page page directories.
  *
- *  When used, an architecture is expected to provide __tlb_remove_table()
- *  which does the actual freeing of these pages.
+ *  When used, an architecture is expected to provide __tlb_remove_table() or
+ *  use the generic __tlb_remove_table(), which does the actual freeing of these
+ *  pages.
  *
  *  MMU_GATHER_RCU_TABLE_FREE
  *
@@ -207,6 +208,16 @@ struct mmu_table_batch {
 #define MAX_TABLE_BATCH		\
 	((PAGE_SIZE - sizeof(struct mmu_table_batch)) / sizeof(void *))
 
+#ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
+static inline void __tlb_remove_table(void *table)
+{
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+#endif
+
 extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 
 #else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
-- 
2.20.1


