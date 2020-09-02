Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D77625AC4B
	for <lists+linux-sh@lfdr.de>; Wed,  2 Sep 2020 15:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgIBNtr (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Sep 2020 09:49:47 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:48912 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgIBNtk (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Sep 2020 09:49:40 -0400
Date:   Wed, 2 Sep 2020 09:34:07 -0400
From:   Rich Felker <dalias@libc.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: mmc_spi: Allow the driver to be built when
 CONFIG_HAS_DMA is unset
Message-ID: <20200902133400.GQ3265@brightrain.aerifal.cx>
References: <20200901150438.228887-1-ulf.hansson@linaro.org>
 <20200901150654.GB30034@lst.de>
 <CAPDyKFqZXdtVokrDQvJAh-NzN0T2ayPD6MepemLEaDt1TRPduw@mail.gmail.com>
 <20200901154049.GA376@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901154049.GA376@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Sep 01, 2020 at 05:40:49PM +0200, Christoph Hellwig wrote:
> On Tue, Sep 01, 2020 at 05:36:17PM +0200, Ulf Hansson wrote:
> > > I still don't think this makes sense, as the dma_mask should always
> > > be non-NULL here.
> > 
> > If that is the case, I wonder how the driver could even have worked without DMA.
> > 
> > Because in the existing code, host->dma_dev gets assigned to
> > spi->master->dev.parent->dma_mask - which seems to turn on the DMA
> > usage in the driver.
> > 
> > What am I missing?
> 
> Do you know of other non-DMA users?  For SH nommu it probably worked
> because SH nommu used to provide a DMA implementation that worked
> fine for streaming maps, but was completely broken for coherent
> allocation.  And this driver appears to only use the former.

On the system we're using it on, there's no DMA whatsoever. It just
used to allow memory allocations suitable for DMA (which any
allocation vacuuously is when there's no DMA) but now it doesn't, due
to your change.

Just below the if block in question in this thread is:

	host->readback.is_dma_mapped = (host->dma_dev != NULL);

and similar conditions appear elsewhere all over the file in the form
of if (host->dma_dev). Of course doing DMA requires a link to a DMA
controller device, and plenty SPI devices (most obviously bit-banged
ones) lack DMA.

The right condition for the block in question here is probably just
checking dma_dev instead of dma_mask or CONFIG_HAS_DMA, but it seems
useful to optimize out the code if CONFIG_HAS_DMA is false, anyway.

Rich
