Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE8A7A143
	for <lists+linux-sh@lfdr.de>; Tue, 30 Jul 2019 08:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbfG3G05 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 30 Jul 2019 02:26:57 -0400
Received: from verein.lst.de ([213.95.11.211]:48085 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbfG3G05 (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 30 Jul 2019 02:26:57 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 221D568AEF; Tue, 30 Jul 2019 08:26:52 +0200 (CEST)
Date:   Tue, 30 Jul 2019 08:26:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Takashi Iwai <tiwai@suse.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Michal Simek <monstr@monstr.eu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] dma-mapping: provide a better default
 ->get_required_mask
Message-ID: <20190730062651.GA29518@lst.de>
References: <20190725063401.29904-1-hch@lst.de> <20190725063401.29904-5-hch@lst.de> <CAMuHMdUBPj8AVSuDwaBB_4gRD6k7vzo0WAFJEkTUbxSw31bzUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUBPj8AVSuDwaBB_4gRD6k7vzo0WAFJEkTUbxSw31bzUg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 29, 2019 at 11:57:19AM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Thu, Jul 25, 2019 at 8:35 AM Christoph Hellwig <hch@lst.de> wrote:
> > Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
> > of IOVA space, and the generic direct mapping code already provides its
> > own routines that is intelligent based on the amount of memory actually
> > present.  Wire up the dma-direct routine for the ARM direct mapping code
> > as well, and otherwise default to the constant 32-bit mask.  This way
> > we only need to override it for the occasional odd IOMMU that requires
> > 64-bit IOVA support, or IOMMU drivers that are more efficient if they
> > can fall back to the direct mapping.
> 
> As I know you like diving into cans of worms ;-)
> 
> Does 64-bit IOVA support actually work in general? Or only on 64-bit
> platforms, due to dma_addr_t to unsigned long truncation on 32-bit?

Most IOMMUs use 32-bit IOVAs, and thus we default to the 32-bit mask
because it is common and failsafe vs the normal linux assumptions.
However the ia64 SGI SN2 platform, and the powerpc IBM ebus
implementations seem to require a 64-bit mask already, so we keep that
behavior as is.
