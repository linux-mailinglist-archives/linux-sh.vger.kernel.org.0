Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F39A1F1999
	for <lists+linux-sh@lfdr.de>; Mon,  8 Jun 2020 15:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbgFHNEN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 8 Jun 2020 09:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgFHNEN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 8 Jun 2020 09:04:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7745C08C5C2
        for <linux-sh@vger.kernel.org>; Mon,  8 Jun 2020 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=aCCan8wkpGJu5TwSR306ZQjwN8XTI0pcOOcrAbNf6T8=; b=fLu+hsItXTIk6M6udVtFxYf75t
        SFptvLJdKRheJuGbcVl/2u0kUjMCE2KD/9gv8SNFL6cnbjeoGuhJeL7OBSs1KWceL1dhqFrxJrdeh
        58/4KK6ZWcIADqsJoXfPCccg6FJmmCHfeuIW/Vzv1R77Luvu9XyTbLVPhXGwMB736mr1OTu1Hbppr
        /JsKxDmso9QzZgZWAH/BmaFD45fQ3PjC+TNudO9IxzW6vDGDysMC5q0Zw1tL9NCcVv5xR6c7FnPi1
        Xlh7F2sRpjouJ7XERZh2uGFd5ST0h1DIhfoNgN65nZWhOtx0Xkbq0JZLro87ZxFiDsGBp+A7owGth
        +9S0h9yA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jiHRi-000621-Lm; Mon, 08 Jun 2020 13:04:10 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] sh: Fix page table allocation
Date:   Mon,  8 Jun 2020 06:04:08 -0700
Message-Id: <20200608130408.20951-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The pgd kmem_cache allocation both specified __GFP_ZERO and had a
constructor which makes no sense.  Remove __GFP_ZERO and zero the user
parts of the pgd explicitly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 arch/sh/mm/pgtable.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/sh/mm/pgtable.c b/arch/sh/mm/pgtable.c
index 5c8f9247c3c2..cf7ce4b57359 100644
--- a/arch/sh/mm/pgtable.c
+++ b/arch/sh/mm/pgtable.c
@@ -2,8 +2,6 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 
-#define PGALLOC_GFP GFP_KERNEL | __GFP_ZERO
-
 static struct kmem_cache *pgd_cachep;
 #if PAGETABLE_LEVELS > 2
 static struct kmem_cache *pmd_cachep;
@@ -13,6 +11,7 @@ void pgd_ctor(void *x)
 {
 	pgd_t *pgd = x;
 
+	memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
 	memcpy(pgd + USER_PTRS_PER_PGD,
 	       swapper_pg_dir + USER_PTRS_PER_PGD,
 	       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
@@ -32,7 +31,7 @@ void pgtable_cache_init(void)
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	return kmem_cache_alloc(pgd_cachep, PGALLOC_GFP);
+	return kmem_cache_alloc(pgd_cachep, GFP_KERNEL);
 }
 
 void pgd_free(struct mm_struct *mm, pgd_t *pgd)
@@ -48,7 +47,7 @@ void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 
 pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	return kmem_cache_alloc(pmd_cachep, PGALLOC_GFP);
+	return kmem_cache_alloc(pmd_cachep, GFP_KERNEL | __GFP_ZERO);
 }
 
 void pmd_free(struct mm_struct *mm, pmd_t *pmd)
-- 
2.26.2

