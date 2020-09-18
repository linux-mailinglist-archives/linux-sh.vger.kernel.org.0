Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965D427058E
	for <lists+linux-sh@lfdr.de>; Fri, 18 Sep 2020 21:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgIRT3p (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 18 Sep 2020 15:29:45 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:55898 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIRT3p (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 18 Sep 2020 15:29:45 -0400
Date:   Fri, 18 Sep 2020 15:29:42 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Rob Landley <rob@landley.net>, linux-sh@vger.kernel.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH] sh: fix syscall tracing
Message-ID: <20200918192942.GA3265@brightrain.aerifal.cx>
References: <20200903054803.GX3265@brightrain.aerifal.cx>
 <e456a455-62cd-4f76-a69a-84d1e5b4d153@physik.fu-berlin.de>
 <20200903161639.GE3265@brightrain.aerifal.cx>
 <1a3f0f7e-f6e6-db4e-06ad-9c7d560a6265@physik.fu-berlin.de>
 <20200907174436.GK3265@brightrain.aerifal.cx>
 <3b8d5e6a-38d6-6eca-a49a-69e06680ec1c@physik.fu-berlin.de>
 <c0685f0b-e997-39e9-8ae9-ee22c8e74a01@landley.net>
 <20200910133751.GE3265@brightrain.aerifal.cx>
 <d641f6a0-0c2d-d7ea-c5e6-b02506200bb5@physik.fu-berlin.de>
 <20200916002843.GR3265@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916002843.GR3265@brightrain.aerifal.cx>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Sep 15, 2020 at 08:28:45PM -0400, Rich Felker wrote:
> On Tue, Sep 15, 2020 at 12:35:28PM +0200, John Paul Adrian Glaubitz wrote:
> > Hi Rich!
> > 
> > On 9/10/20 3:37 PM, Rich Felker wrote:
> > >> Which I reported to Rich on the 2nd and he had me test a one line patch fixing
> > >> it (adding an extra #include) on the 3rd, but I just did a fresh pull and the
> > >> j2_defconfig build still broke a week later.
> > > 
> > > Yes, that's presently the other regression fix I have queued for the
> > > second pull request.
> > 
> > Any news on this? Seems like Linus just tagged -rc5 this week.
> 
> I rebased against -rc5 and pushed for-next a couple days ago. It
> doesn't look like there are any problems so I'll proceed with the PR.

It's now been merged.
