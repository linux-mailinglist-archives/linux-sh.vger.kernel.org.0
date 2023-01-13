Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F035266A026
	for <lists+linux-sh@lfdr.de>; Fri, 13 Jan 2023 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjAMRVH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 13 Jan 2023 12:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjAMRUc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 13 Jan 2023 12:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC9B9422F
        for <linux-sh@vger.kernel.org>; Fri, 13 Jan 2023 09:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673630015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UAWcST9nT133bZRxHkPhgB7f9R452T7ovMnNe/O4IaQ=;
        b=HJ5C/rCKThSE2lmoEg20hwpqD1edKevS8fRTYFP+gn4JsVYg7adSw//eavlikVKb0zGy/1
        hYOLrx3TCEumNLntxo0QC8LR/yyHBYBqdi6f04EYlLB8aJ5OdoGGCGQPaXBcDqcU8ksh0b
        Ek2wgqfosLGADeN/VlrxxaVvJ2LKxyQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-jMJtEjLQNTeXWTaNoMr99w-1; Fri, 13 Jan 2023 12:13:31 -0500
X-MC-Unique: jMJtEjLQNTeXWTaNoMr99w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E37231C05136;
        Fri, 13 Jan 2023 17:13:29 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 95D1E40C2064;
        Fri, 13 Jan 2023 17:13:23 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        David Hildenbrand <david@redhat.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH mm-unstable v1 23/26] um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date:   Fri, 13 Jan 2023 18:10:23 +0100
Message-Id: <20230113171026.582290-24-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
References: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using bit 10, which is
yet unused for swap PTEs.

The pte_mkuptodate() is a bit weird in __pte_to_swp_entry() for a swap PTE
... but it only messes with bit 1 and 2 and there is a comment in
set_pte(), so leave these bits alone.

While at it, mask the type in __swp_entry().

Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/um/include/asm/pgtable.h | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 4e3052f2671a..cedc5fd451ce 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -21,6 +21,9 @@
 #define _PAGE_PROTNONE	0x010	/* if the user mapped it with PROT_NONE;
 				   pte_present gives true */
 
+/* We borrow bit 10 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x400
+
 #ifdef CONFIG_3_LEVEL_PGTABLES
 #include <asm/pgtable-3level.h>
 #else
@@ -288,16 +291,46 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 
 #define update_mmu_cache(vma,address,ptep) do {} while (0)
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <--------------- offset ----------------> E < type -> 0 0 0 1 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_NEWPAGE (bit 1) is always set to 1 in set_pte().
+ */
 #define __swp_type(x)			(((x).val >> 5) & 0x1f)
 #define __swp_offset(x)			((x).val >> 11)
 
 #define __swp_entry(type, offset) \
-	((swp_entry_t) { ((type) << 5) | ((offset) << 11) })
+	((swp_entry_t) { (((type) & 0x1f) << 5) | ((offset) << 11) })
 #define __pte_to_swp_entry(pte) \
 	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_set_bits(pte, _PAGE_SWP_EXCLUSIVE);
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_clear_bits(pte, _PAGE_SWP_EXCLUSIVE);
+	return pte;
+}
+
 /* Clear a kernel PTE and flush it from the TLB */
 #define kpte_clear_flush(ptep, vaddr)		\
 do {						\
-- 
2.39.0

