Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8887473B
	for <lists+linux-sh@lfdr.de>; Thu, 25 Jul 2019 08:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfGYGeM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 25 Jul 2019 02:34:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60408 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfGYGeM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 25 Jul 2019 02:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LxRzrmqNwWXEcTNqN3l9QmLeMxibMu/ZcBBkXbQrVyw=; b=sSnqsD3xQllFI83sT8h2y1ez1
        1+NR5rILrzn2fx0DuMS6EJFmwNO2XExgFACUjDedABMEkNIU+rd/3LQBIAijY+FYAPHBgRyh+iWj/
        IpUfZWjQUrOov9ACuWzZIpk8dEQvTgwxjZToBUZbDwwD1Q958u7eCSs6OWQKRiJiov29n3YEoK6Kx
        wZKMqYHH4+emQ89aJMh4HOldAgXeQl37NVAViusOoKrxseDk/BtaZuGi/S6ipg1+Q3ABquMo/NZB9
        3x49mtJERY+aV+t7Eevu+qlkEmOHGvaN5oa5/vwxNtpHmx+2jAwE/AJHn0l+gvbqKEdkQH9QIBqnW
        BzSzvrgfw==;
Received: from p57b3f613.dip0.t-ipconnect.de ([87.179.246.19] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqXKH-0000FL-DN; Thu, 25 Jul 2019 06:34:05 +0000
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
Subject: remove default fallbacks in dma_map_ops
Date:   Thu, 25 Jul 2019 08:33:56 +0200
Message-Id: <20190725063401.29904-1-hch@lst.de>
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
