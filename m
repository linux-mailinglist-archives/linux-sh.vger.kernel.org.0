Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1940CBBDC
	for <lists+linux-sh@lfdr.de>; Fri,  4 Oct 2019 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbfJDNfr (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 4 Oct 2019 09:35:47 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:48500 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388244AbfJDNfq (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 4 Oct 2019 09:35:46 -0400
X-Greylist: delayed 895 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Oct 2019 09:35:46 EDT
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1iGNVR-0002sV-00; Fri, 04 Oct 2019 13:20:25 +0000
Date:   Fri, 4 Oct 2019 09:20:25 -0400
From:   Rich Felker <dalias@libc.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jslaby@suse.com>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 0/2] drivers: make early_platform code SuperH-specific
Message-ID: <20191004132025.GQ16318@brightrain.aerifal.cx>
References: <20191003092913.10731-1-brgl@bgdev.pl>
 <20191004130031.GA596158@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004130031.GA596158@kroah.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Oct 04, 2019 at 03:00:31PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Oct 03, 2019 at 11:29:11AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Some time ago I started a discussion about the need for a proper early device
> > probing mechanism[1]. One that would be based on real platform drivers and
> > support both platform data and device tree.
> > 
> > While we're far from reaching any consensus on the implementation, Arnd
> > suggested that I start off by moving the SuperH-specific early platform
> > drivers implementation to arch/sh[2].
> > 
> > This series is the first attempt at making way for a new, less hacky
> > implementation.
> > 
> > The first patch moves all the early_platform code to arch/sh.
> > 
> > The second patch prefixes all early_platform symbols with 'sh_'.
> > 
> > [1] https://lkml.org/lkml/2018/4/26/657
> > [2] https://lkml.org/lkml/2018/4/27/239
> > 
> > v1 -> v2:
> > - certain drivers are compiled for arm/mach-shmobile too - we need to
> >   add ifdefs for CONFIG_SUPERH around early_platform calls
> > 
> > v2 -> v3:
> > - added a stub for is_early_platform_device() which always returns false
> >   on non-SuperH architectures
> > 
> > v3 -> v4:
> > - rebased on top of v5.4-rc1
> > - removed patches that are already upstream from the series
> > 
> > Bartosz Golaszewski (2):
> >   drivers: move the early platform device support to arch/sh
> >   sh: add the sh_ prefix to early platform symbols
> 
> I like this, any objection from anyone if I take this in my driver-core
> tree for 5.5-rc1?

I don't think I have any objection. It will probably make gratuitous
merge conflicts with Sato-san's old device tree sh4 work when we get
back to finishing that, but that's not really a big deal.

Rich
