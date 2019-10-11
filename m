Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B17D45BD
	for <lists+linux-sh@lfdr.de>; Fri, 11 Oct 2019 18:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfJKQvp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 11 Oct 2019 12:51:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:35036 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726728AbfJKQvp (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 11 Oct 2019 12:51:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 60453B2AC;
        Fri, 11 Oct 2019 16:51:43 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux-kernel@vger.kernel.org
Cc:     hch@infradead.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH] sh: use dma_to_phys() instead of dev->dma_pfn_offset
Date:   Fri, 11 Oct 2019 18:51:29 +0200
Message-Id: <20191011165129.29655-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

It's more explicit and lets dma-direct handle the specifics of how to
translate addresses.

On top of that get rid of warnings as, since the introduction of commit
6fa1d28e38c ("sh: use generic dma_noncoherent_ops"), it's impossible for
the dev to be NULL.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

NOTE: this was only compile tested.

 arch/sh/kernel/dma-coherent.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
index b17514619b7e..f6618ed01a42 100644
--- a/arch/sh/kernel/dma-coherent.c
+++ b/arch/sh/kernel/dma-coherent.c
@@ -4,6 +4,7 @@
  */
 #include <linux/mm.h>
 #include <linux/init.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/module.h>
 #include <asm/cacheflush.h>
@@ -36,9 +37,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 
 	split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
 
-	*dma_handle = virt_to_phys(ret);
-	if (!WARN_ON(!dev))
-		*dma_handle -= PFN_PHYS(dev->dma_pfn_offset);
+	*dma_handle = phys_to_dma(dev, virt_to_phys(ret));
 
 	return ret_nocache;
 }
@@ -47,12 +46,9 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
 	int order = get_order(size);
-	unsigned long pfn = (dma_handle >> PAGE_SHIFT);
+	unsigned long pfn = __phys_to_pfn(dma_to_phys(dev, dma_handle));
 	int k;
 
-	if (!WARN_ON(!dev))
-		pfn += dev->dma_pfn_offset;
-
 	for (k = 0; k < (1 << order); k++)
 		__free_pages(pfn_to_page(pfn + k), 0);
 
-- 
2.23.0

