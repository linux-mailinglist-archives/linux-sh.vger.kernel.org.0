Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7BD1E9BD8
	for <lists+linux-sh@lfdr.de>; Mon,  1 Jun 2020 04:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgFACzV (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 31 May 2020 22:55:21 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:36524 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgFACzV (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 31 May 2020 22:55:21 -0400
Date:   Sun, 31 May 2020 22:55:15 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Rob Landley <rob@landley.net>,
        Christoph Hellwig <hch@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] sh: remove sh5 support
Message-ID: <20200601025514.GS1079@brightrain.aerifal.cx>
References: <20200424221948.1120587-1-arnd@arndb.de>
 <20200507143552.GA28683@infradead.org>
 <20200528054600.GA29717@infradead.org>
 <20200528161416.GY1079@brightrain.aerifal.cx>
 <20200529143059.GA25475@infradead.org>
 <20200529175335.GK1079@brightrain.aerifal.cx>
 <e86e1d78-9597-811a-da0e-42a910b0c9fe@physik.fu-berlin.de>
 <8b4ff7fe-c10c-fc8e-72bc-88ef69bdb2b4@landley.net>
 <eea4f39c-23d4-d435-a770-652d71268f34@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eea4f39c-23d4-d435-a770-652d71268f34@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, May 31, 2020 at 10:03:13AM +0200, John Paul Adrian Glaubitz wrote:
> On 5/31/20 5:20 AM, Rob Landley wrote:
> > On 5/30/20 3:08 AM, John Paul Adrian Glaubitz wrote:
> >> On 5/29/20 7:53 PM, Rich Felker wrote:
> >>> Frustratingly, I _still_ don't have an official tree on kernel.org for
> >>> the purpose of being the canonical place for linux-next to pull from,
> >>> due to policies around pgp keys and nobody following up on signing
> >>> mine. This is all really silly since there are ridiculously many
> >>> independent channels I could cryptographically validate identity
> >>> through with vanishing probability that they're all compromised. For
> >>> the time being I'll reactivate my repo on git.musl-libc.org.
> >>
> >> May I suggest to pick up these patches, for example? There might be
> >> more I missed, but getting these merged should already help a lot with
> >> the clean-up of arch/sh.
> > 
> > Does that include the 2 fixes to build with current binutils I made puppy eyes
> > about last -rc7 (in march)?
> > 
> > https://marc.info/?l=linux-sh&m=158544749818664&w=2
> Yes, listed as "[PATCH 1/2] arch/sh: vmlinux.scr".
> 
> @Rich: Do you think you can merge all those fixes in your local tree within
>        the next days and send a PR to Linus?
> 
> Otherwise, I can volunteer to become a third maintainer for arch/sh as I have
> the hardware for testing and can accept patches and send PRs.
> 
> We shouldn't let contributors to arch/sh wait for too long.

Yes, I'll try to get my tree ready for next/PR use tomorrow.

Rich
