Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62C22458A1
	for <lists+linux-sh@lfdr.de>; Sun, 16 Aug 2020 19:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgHPRAp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Aug 2020 13:00:45 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:43308 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgHPRAp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 16 Aug 2020 13:00:45 -0400
Date:   Sun, 16 Aug 2020 13:00:42 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: Ping: Pull Request for 5.9
Message-ID: <20200816170041.GA3265@brightrain.aerifal.cx>
References: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
 <6ad2b6e9-cd0c-5d31-1183-37fdfe2d3ff1@physik.fu-berlin.de>
 <20200815021754.GR3265@brightrain.aerifal.cx>
 <66205dc3-0193-9aad-b0c6-01d49655f8d3@physik.fu-berlin.de>
 <CAMuHMdVunSe+2OPg3kSaeLoX-AUOWqHHNb=8AZi1x2DhNOeQeA@mail.gmail.com>
 <d31c8d5d-5489-2519-460d-d872c70f0309@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31c8d5d-5489-2519-460d-d872c70f0309@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Aug 16, 2020 at 06:38:58PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Geert!
> 
> On 8/16/20 10:34 AM, Geert Uytterhoeven wrote:
> > On Sat, Aug 15, 2020 at 12:41 PM John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> >> @Geert: What about that patch to fix the serial interface on LANDISK?
> > 
> > It's a fix for serial parity handling for SCIF, and thus not really needed for
> > a serial console.    No need to worry, as it's already in.
> 
> Great. Then I hope we can work on the device tree stuff in the near future ;-).

Sounds good. I think most of it in principle isn't that bad to rebase,
but I hit lots of breakage a couple years back when I tried making the
PCI code work, and that was a show-stopper since it broke my emulated
environment. Let's look at it again now.

> My hope is that with device tree support in the kernel for SH, it might be easier
> to re-add support for the NextVoD devices of which I have plenty of.

In principle this is true, but there was a lot of out-of-tree stuff in
STlinux that may be needed to support their SoC "platform devices". We
need to find and archive git repos of that if possible, or otherwise
at least the latest releases, to study and determine what's actually
needed.

Rich
