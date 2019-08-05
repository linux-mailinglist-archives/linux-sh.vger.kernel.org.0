Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5732B814D1
	for <lists+linux-sh@lfdr.de>; Mon,  5 Aug 2019 11:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfHEJMK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 5 Aug 2019 05:12:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34056 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfHEJMK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 5 Aug 2019 05:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wo3Nidt8ANHCfxiPlT6m8OyX2VllNhDuCO+MMrpvH/I=; b=YQCIQZU18z4XZ7xnEFtZ3cpMK
        Uh746e5z0+Ze8+no/kJTHFcXr5n7M0AigP68dRR1vaD8C1IiKx8GBDdf+pTzNpolrmVo1vXwL8O4U
        pofCvygM9ItpBTVbSIdiKx4Ft7TZqBmRFyRENOXy+ZZg6BYCdfwmlWAsyWiXXHCRkq/ZLfU24iiAl
        fQLrtCnL1CSEVtWnVBNfyY4ZjE+J6QuKWe2eNjfqO42FtjBo8AHpHvePL2TgIB5XCrqGiq1pT9rm2
        DwKvITQk1WE+AxkNw2InQLevcg8OBP9uZdEp/+LIuplG6j7mSGycvzt89x7fskUuyhyD2Jv80Uxoi
        tcepYDwPg==;
Received: from [195.167.85.94] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1huZ28-0004qn-Vz; Mon, 05 Aug 2019 09:12:01 +0000
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
Subject: remove default fallbacks in dma_map_ops v2
Date:   Mon,  5 Aug 2019 12:11:52 +0300
Message-Id: <20190805091159.7826-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi all,

we have a few places where the DMA mapping layer has non-trivial default
actions that are questionable and/or dangerous.

This series instead wires up the mmap, get_sgtable and get_required_mask
methods explicitly and cleans up some surrounding areas.  This also means
we could get rid of the ARCH_NO_COHERENT_DMA_MMAP kconfig option, as we
now require a mmap method wired up, or in case of non-coherent dma-direct
the presence of the arch_dma_coherent_to_pfn hook.  The only interesting
case is that the sound code also checked the ARCH_NO_COHERENT_DMA_MMAP
symbol in somewhat odd ways, so I'd like to see a review of the sound
situation before going forward with that patch.

Changes since v1:
 - add a dma_can_mmap helper for alsa
