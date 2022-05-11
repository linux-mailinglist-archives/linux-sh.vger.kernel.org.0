Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E6D523277
	for <lists+linux-sh@lfdr.de>; Wed, 11 May 2022 14:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbiEKMEw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 11 May 2022 08:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241146AbiEKMEr (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 11 May 2022 08:04:47 -0400
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374D592318;
        Wed, 11 May 2022 05:04:43 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=32;SR=0;TI=SMTPD_---0VCwISV4_1652270676;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VCwISV4_1652270676)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 11 May 2022 20:04:37 +0800
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
To:     akpm@linux-foundation.org, mike.kravetz@oracle.com
Cc:     catalin.marinas@arm.com, will@kernel.org, songmuchun@bytedance.com,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, arnd@arndb.de, baolin.wang@linux.alibaba.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v4 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when unmapping
Date:   Wed, 11 May 2022 20:04:19 +0800
Message-Id: <0a2e547238cad5bc153a85c3e9658cb9d55f9cac.1652270205.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
References: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
References: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On some architectures (like ARM64), it can support CONT-PTE/PMD size
hugetlb, which means it can support not only PMD/PUD size hugetlb:
2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
size specified.

When unmapping a hugetlb page, we will get the relevant page table
entry by huge_pte_offset() only once to nuke it. This is correct
for PMD or PUD size hugetlb, since they always contain only one
pmd entry or pud entry in the page table.

However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
since they can contain several continuous pte or pmd entry with
same page table attributes, so we will nuke only one pte or pmd
entry for this CONT-PTE/PMD size hugetlb page.

And now try_to_unmap() is only passed a hugetlb page in the case
where the hugetlb page is poisoned. Which means now we will unmap
only one pte entry for a CONT-PTE or CONT-PMD size poisoned hugetlb
page, and we can still access other subpages of a CONT-PTE or CONT-PMD
size poisoned hugetlb page, which will cause serious issues possibly.

So we should change to use huge_ptep_clear_flush() to nuke the
hugetlb page table to fix this issue, which already considered
CONT-PTE and CONT-PMD size hugetlb.

We've already used set_huge_swap_pte_at() to set a poisoned
swap entry for a poisoned hugetlb page. Meanwhile adding a VM_BUG_ON()
to make sure the passed hugetlb page is poisoned in try_to_unmap().

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/rmap.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 4e96daf..219e287 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1528,6 +1528,11 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 
 		if (folio_test_hugetlb(folio)) {
 			/*
+			 * The try_to_unmap() is only passed a hugetlb page
+			 * in the case where the hugetlb page is poisoned.
+			 */
+			VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
+			/*
 			 * huge_pmd_unshare may unmap an entire PMD page.
 			 * There is no way of knowing exactly which PMDs may
 			 * be cached for this mm, so we must flush them all.
@@ -1562,28 +1567,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					break;
 				}
 			}
+			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
 		} else {
 			flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
-		}
-
-		/*
-		 * Nuke the page table entry. When having to clear
-		 * PageAnonExclusive(), we always have to flush.
-		 */
-		if (should_defer_flush(mm, flags) && !anon_exclusive) {
 			/*
-			 * We clear the PTE but do not flush so potentially
-			 * a remote CPU could still be writing to the folio.
-			 * If the entry was previously clean then the
-			 * architecture must guarantee that a clear->dirty
-			 * transition on a cached TLB entry is written through
-			 * and traps if the PTE is unmapped.
+			 * Nuke the page table entry. When having to clear
+			 * PageAnonExclusive(), we always have to flush.
 			 */
-			pteval = ptep_get_and_clear(mm, address, pvmw.pte);
+			if (should_defer_flush(mm, flags) && !anon_exclusive) {
+				/*
+				 * We clear the PTE but do not flush so potentially
+				 * a remote CPU could still be writing to the folio.
+				 * If the entry was previously clean then the
+				 * architecture must guarantee that a clear->dirty
+				 * transition on a cached TLB entry is written through
+				 * and traps if the PTE is unmapped.
+				 */
+				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
-		} else {
-			pteval = ptep_clear_flush(vma, address, pvmw.pte);
+				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
+			} else {
+				pteval = ptep_clear_flush(vma, address, pvmw.pte);
+			}
 		}
 
 		/*
-- 
1.8.3.1

