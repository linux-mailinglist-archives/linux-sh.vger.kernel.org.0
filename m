Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029B624559C
	for <lists+linux-sh@lfdr.de>; Sun, 16 Aug 2020 06:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgHPEBt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Aug 2020 00:01:49 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:43158 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgHPEBs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 16 Aug 2020 00:01:48 -0400
Date:   Sun, 16 Aug 2020 00:01:47 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Ping: Pull Request for 5.9
Message-ID: <20200816040146.GX3265@brightrain.aerifal.cx>
References: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
 <6ad2b6e9-cd0c-5d31-1183-37fdfe2d3ff1@physik.fu-berlin.de>
 <20200815021754.GR3265@brightrain.aerifal.cx>
 <66205dc3-0193-9aad-b0c6-01d49655f8d3@physik.fu-berlin.de>
 <1c81600d-1007-1c5e-eb8b-cd355c1275ff@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c81600d-1007-1c5e-eb8b-cd355c1275ff@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, Aug 15, 2020 at 10:24:28PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> On 8/15/20 12:40 PM, John Paul Adrian Glaubitz wrote:
> > On 8/15/20 4:17 AM, Rich Felker wrote:
> >>> Would it be possible to include Geert's fix for the IDE interface
> >>> of the LANDISK USL-5P devices [1]?
> >>
> >> Yep, I'm preparing the pull request and was just about to ask if it
> >> should be included. Anything else not in next already that should be?
> > 
> > Great.
> > 
> > Let me check out your -next tree and see what we already have.
> Just had a look and also compiled and test-ran the kernel from for-next
> on my SH7785LCR system. Works fine and all known issues are fixed.
> 
> So, from my side it's a go ahead ;-).

sh-for-5.9 (including the landisk fix) has been merged.

Rich
