Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509591A1014
	for <lists+linux-sh@lfdr.de>; Tue,  7 Apr 2020 17:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgDGPVN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Apr 2020 11:21:13 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:33478 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgDGPVN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 Apr 2020 11:21:13 -0400
Date:   Tue, 7 Apr 2020 11:21:12 -0400
From:   Rich Felker <dalias@libc.org>
To:     Rob Landley <rob@landley.net>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: v5.6 is still throwing a stack trace on boot.
Message-ID: <20200407152112.GK11469@brightrain.aerifal.cx>
References: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
 <20200404000730.GE11469@brightrain.aerifal.cx>
 <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
 <20200404005125.GF11469@brightrain.aerifal.cx>
 <cc602220-8000-a6ba-5b7f-5b00c7faa0ff@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc602220-8000-a6ba-5b7f-5b00c7faa0ff@landley.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Apr 07, 2020 at 09:21:26AM -0500, Rob Landley wrote:
> On 4/3/20 7:51 PM, Rich Felker wrote:
> > On Fri, Apr 03, 2020 at 07:28:27PM -0500, Rob Landley wrote:
> >>>> ---[ end trace 76213c1325250d90 ]---
> >>>
> >>> Which hardware is this on? The qemu emulated board you're using?
> >>
> >> Yes, qemu -M r2d. Built with attached miniconf, and run via:
> >>
> >> qemu-system-sh4 -M r2d -serial null -serial mon:stdio -nographic -no-reboot \
> >>   -m 256 -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" -kernel zImage \
> >>   -initrd sh4.cpio.gz
> > 
> > OK. This is nbd, it's just some pedantry added in commit
> > 128227e7fe4087b60f1bd31f762e61237eb23790. Essentially it's complaining
> > that something requested zero-filled slab memory when it's about to
> > run a constructor to fill in the memory. The backtrace is (as usual)
> > somewhat bogus looking and grep isn't helping me find where it's being
> > called from. I'll keep looking and see if I can track it down.
> 
> Did you?
> 
> Also, https://marc.info/?l=linux-sh&m=158544749818664&w=2 still doesn't seem to
> be upstream?

See Geert's reply,

Message-ID: <CAMuHMdVm-871S5tOdQw0KbRao+L0Wg46Rk3yNRyW45zJf3qt4w@mail.gmail.com>

I think the patch is correct but still don't thoroughly understand it
(in terms of where these functions are used and whether it preserves
the property that everything that needs zero-fill gets it). Will
follow up soon.

Rich
