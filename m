Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB11E814F2
	for <lists+linux-sh@lfdr.de>; Mon,  5 Aug 2019 11:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfHEJMu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 5 Aug 2019 05:12:50 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35224 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbfHEJM1 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 5 Aug 2019 05:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0Xl4nFtLEDd2YBesciw1Tr+1Rk8AZfxgf2PNKokKF2A=; b=T/va5UGrwtLoQMnDoM2NPT+5Da
        WDpOVxCAUGw+CKlKpDUwOOYDoozVSNsU5CrsArcyWFDbNqds/nTWUgD6wqqzAjz2ICOmG5yS4pKzg
        LY2LBo6WCMh6FK0wL2D0nmyowd0pkRk+7lgmaZ88Qj6ZmxgkrTOFw7Rx+3JpyodfObRPoVVfgXaEu
        lW4ENpSu7Jd9fk4/7GgbDVXaX+QqB+ufBxGd4Bzb0SSEmXh/rcaOAouu7S9qLuLxbvTEsblE0N/5v
        6F1W/W7L4EXsIwOUENUfV7XjRSOB5X/4d4mTYuWY8N0IdlSIBI+K/wwVO5oH12q4cSiJKpxDyy04q
        4OtGUPkg==;
Received: from [195.167.85.94] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1huZ2S-00054j-47; Mon, 05 Aug 2019 09:12:21 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Takashi Iwai <tiwai@suse.de>, Robin Murphy <robin.murphy@arm.com>,
        Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dma-mapping: remove ARCH_NO_COHERENT_DMA_MMAP
Date:   Mon,  5 Aug 2019 12:11:58 +0300
Message-Id: <20190805091159.7826-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805091159.7826-1-hch@lst.de>
References: <20190805091159.7826-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Now that we never use a default ->mmap implementation, and non-coherent
architectures can control the presence of ->mmap support by enabling
ARCH_HAS_DMA_COHERENT_TO_PFN for the dma direct implementation there
is no need for a global config option to control the availability
of dma_common_mmap.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig            | 3 ---
 arch/c6x/Kconfig        | 1 -
 arch/m68k/Kconfig       | 1 -
 arch/microblaze/Kconfig | 1 -
 arch/parisc/Kconfig     | 1 -
 arch/sh/Kconfig         | 1 -
 arch/xtensa/Kconfig     | 1 -
 kernel/dma/mapping.c    | 7 -------
 8 files changed, 16 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index a7b57dd42c26..ec2834206d08 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -790,9 +790,6 @@ config COMPAT_32BIT_TIME
 	  This is relevant on all 32-bit architectures, and 64-bit architectures
 	  as part of compat syscall handling.
 
-config ARCH_NO_COHERENT_DMA_MMAP
-	bool
-
 config ARCH_NO_PREEMPT
 	bool
 
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index b4fb61c83494..e65e8d82442a 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -20,7 +20,6 @@ config C6X
 	select OF_EARLY_FLATTREE
 	select GENERIC_CLOCKEVENTS
 	select MODULES_USE_ELF_RELA
-	select ARCH_NO_COHERENT_DMA_MMAP
 	select MMU_GATHER_NO_RANGE if MMU
 
 config MMU
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index c518d695c376..614b355ae338 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -8,7 +8,6 @@ config M68K
 	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_NO_PREEMPT if !COLDFIRE
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index d411de05b628..632c9477a0f6 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -9,7 +9,6 @@ config MICROBLAZE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_EXTABLE_SORT
 	select TIMER_OF
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 6d732e451071..e9dd88b7f81e 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -52,7 +52,6 @@ config PARISC
 	select GENERIC_SCHED_CLOCK
 	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
 	select GENERIC_CLOCKEVENTS
-	select ARCH_NO_COHERENT_DMA_MMAP
 	select CPU_NO_EFFICIENT_FFS
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 6b1b5941b618..f356ee674d89 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -5,7 +5,6 @@ config SUPERH
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select HAVE_PATA_PLATFORM
 	select CLKDEV_LOOKUP
 	select DMA_DECLARE_COHERENT
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index ebc135bda921..70653aed3005 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -5,7 +5,6 @@ config XTENSA
 	select ARCH_HAS_BINFMT_FLAT if !MMU
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index ab6aa355e1a0..47765c96fe09 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -169,7 +169,6 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
 {
-#ifndef CONFIG_ARCH_NO_COHERENT_DMA_MMAP
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long off = vma->vm_pgoff;
@@ -198,9 +197,6 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 
 	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
-#else
-	return -ENXIO;
-#endif /* !CONFIG_ARCH_NO_COHERENT_DMA_MMAP */
 }
 
 /**
@@ -214,9 +210,6 @@ bool dma_can_mmap(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (IS_ENABLED(CONFIG_ARCH_NO_COHERENT_DMA_MMAP))
-		return false;
-
 	if (dma_is_direct(ops)) {
 		return dev_is_dma_coherent(dev) ||
 			IS_ENABLED(CONFIG_ARCH_HAS_DMA_COHERENT_TO_PFN);
-- 
2.20.1

