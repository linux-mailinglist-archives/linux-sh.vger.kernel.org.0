Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F195A1E672C
	for <lists+linux-sh@lfdr.de>; Thu, 28 May 2020 18:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404827AbgE1QOS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 28 May 2020 12:14:18 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:35672 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404830AbgE1QOS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 28 May 2020 12:14:18 -0400
Date:   Thu, 28 May 2020 12:14:16 -0400
From:   Rich Felker <dalias@libc.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Rob Landley <rob@landley.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] sh: remove sh5 support
Message-ID: <20200528161416.GY1079@brightrain.aerifal.cx>
References: <20200424221948.1120587-1-arnd@arndb.de>
 <20200507143552.GA28683@infradead.org>
 <20200528054600.GA29717@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528054600.GA29717@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, May 27, 2020 at 10:46:00PM -0700, Christoph Hellwig wrote:
> [adding Linus]
> 
> On Thu, May 07, 2020 at 07:35:52AM -0700, Christoph Hellwig wrote:
> > Any progress on this?  I plan to resend the sh dma-mapping I've been
> > trying to get upstream for a year again, and they would conflict,
> > so I could look into rebasing them first.
> 
> So for years now it has been close to and in the end impossible to
> provoke sh maintainer action.  At the same point hardware is pretty much
> long gone for the real commercial variants, and never took off for the
> open hardware nommu variant.
> 
> Linus, would you ok with a 5.8 pull request to just kill off arch/sh/?

It is in active use. Please do not act on such a request. I would be
much quicker to ack things that actually need ack if I weren't CC'd on
hundreds of random non-arch-specific changes that don't need it, but I
understand that's how the kernel process works. If there are things
that need ack please feel free to ping.

Note that I specifically acked and requested the sh5 removal.

Rich
