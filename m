Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3531EFCD7
	for <lists+linux-sh@lfdr.de>; Fri,  5 Jun 2020 17:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFEPnp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 5 Jun 2020 11:43:45 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:41446 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgFEPnp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 5 Jun 2020 11:43:45 -0400
Date:   Fri, 5 Jun 2020 11:43:44 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Rob Landley <rob@landley.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] sh: remove sh5 support
Message-ID: <20200605154343.GU1079@brightrain.aerifal.cx>
References: <20200424221948.1120587-1-arnd@arndb.de>
 <20200507143552.GA28683@infradead.org>
 <20200528054600.GA29717@infradead.org>
 <20200528161416.GY1079@brightrain.aerifal.cx>
 <20200529143059.GA25475@infradead.org>
 <20200529175335.GK1079@brightrain.aerifal.cx>
 <e86e1d78-9597-811a-da0e-42a910b0c9fe@physik.fu-berlin.de>
 <20200601181259.GV1079@brightrain.aerifal.cx>
 <20200602013332.GY1079@brightrain.aerifal.cx>
 <0af28795-b27a-2dd9-0d0f-c2a8d4b8d512@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0af28795-b27a-2dd9-0d0f-c2a8d4b8d512@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Jun 05, 2020 at 05:38:18PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> On 6/2/20 3:33 AM, Rich Felker wrote:
> >>>> [PATCH 1/2] arch/sh: vmlinux.scr
> >>>> https://marc.info/?l=linux-sh&m=158429470120959&w=2
> >>
> >> OK.
> > 
> > Included in -mm.
> 
> I just had a look at your tree and it looks you forgot to merge the second
> patch of the series, see:
> 
> > https://marc.info/?l=linux-sh&m=158429470221261&w=2
> 
> Can you include the patch as well?

This one is outside arch/sh and I'm not sure it's permissible to go up
through my tree. I was also under the impression that only part 1 was
needed to fix the immediate problem on sh and tha part 2 was for
completeness and to make sure the same doesn't happen on other archs
in the future, but maybe my understanding here is incorrect.

> And would it be okay to send a PR to Linus
> after that?

Sure, will do right away once we resolve what to do with the above,
and provided you don't have anything else you want me to evaluate for
inclusion.

Rich
