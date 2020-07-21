Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485CA227674
	for <lists+linux-sh@lfdr.de>; Tue, 21 Jul 2020 05:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgGUDQI (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 20 Jul 2020 23:16:08 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:34574 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUDQI (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 20 Jul 2020 23:16:08 -0400
Date:   Mon, 20 Jul 2020 23:16:07 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: Suggested patches for merging
Message-ID: <20200721031605.GA4314@brightrain.aerifal.cx>
References: <8538a950-8e21-29c7-dd0e-fa6e49e2bcef@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8538a950-8e21-29c7-dd0e-fa6e49e2bcef@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Jul 17, 2020 at 09:11:49AM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> After updating my SH kernel to the latest git version and applying various proposed
> patches on top, my machines runs very stable. I suggest merging the following patches:
> 
> > [PATCH 01/10] sh: remove -Werror from Makefiles
> > https://marc.info/?l=linux-sh&m=159472940531658&w=2
> 
> > [PATCH 02/10] sh: sort the selects for SUPERH alphabetically
> > https://marc.info/?l=linux-sh&m=159472953631694&w=2
> 
> > [PATCH 03/10] sh: remove __KERNEL__ ifdefs from non-UAPI headers
> > https://marc.info/?l=linux-sh&m=159472967331732&w=2
> 
> > [PATCH 04/10] sh: move ioremap_fixed details out of <asm/io.h>
> > https://marc.info/?l=linux-sh&m=159472980331793&w=2
> 
> > [PATCH 05/10] sh: move the ioremap implementation out of line
> > https://marc.info/?l=linux-sh&m=159472993031837&w=2
> 
> > [PATCH 06/10] sh: don't include <asm/io_trapped.h> in <asm/io.h>
> > https://marc.info/?l=linux-sh&m=159472995331856&w=2
> 
> > [PATCH 07/10] sh: unexport register_trapped_io and match_trapped_io_handler
> > https://marc.info/?l=linux-sh&m=159472993331840&w=2

All ok.

> > [PATCH 08/10] dma-mapping: consolidate the NO_DMA definition in kernel/dma/Kconfig
> > https://marc.info/?l=linux-sh&m=159472994531848&w=2

I can't take this because it's for kernel/dma and arch/{m68k,um}, not
arch/sh. And I think the following depend on it:

> > [PATCH 09/10] sh: don't allow non-coherent DMA for NOMMU
> > https://marc.info/?l=linux-sh&m=159472994631849&w=2
> 
> > [PATCH 10/10] sh: use the generic dma coherent remap allocator
> > https://marc.info/?l=linux-sh&m=159472994631850&w=2

Are these needed now? If so I need the above merged by the appropriate
maintainer and then I can take these. If not I'll just defer them for
now.

> > [PATCH] sh: Implement __get_user_u64() required for 64-bit get_user()
> > https://marc.info/?l=linux-sh&m=159186232702043&w=2

Already got this.

> > [PATCH v2 0/9] sh: Modernize printing of kernel messages
> > https://lore.kernel.org/lkml/20200617143639.18315-1-geert+renesas@glider.be/

I have these queued now.

> These patches fix multiple important issues on SH, but are most likely
> going in through different trees:
> 
> > [PATCH v2] serial: core: Initialise spin lock before use in uart_configure_port()
> > https://lore.kernel.org/linux-serial/20200706143548.63985-1-andriy.shevchenko@linux.intel.com/

Indeed this is outside scope of arch/sh.

> > sh: Fix unneeded constructor in page table allocation
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=73c348f31b63d28d176ed290eb1aa2a648f3e51e
> > You seem to have already picked this one up?

Yes.

> > sh/tlb: Fix PGTABLE_LEVELS > 2
> > https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=mm/tlb&id=1f19a4bf8dcb42efc278940fb81c288c346b3eda

This last one is a fix independent of the overall series that follows
it, and since it's fixing a major regression I've picked it up. If
there's a conflict with me having it too that can be resolved in
linux-next before merge window.

Thanks for the summary and poking me to get it done.

Rich
