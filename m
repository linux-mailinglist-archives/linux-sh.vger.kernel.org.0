Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90A7E200A
	for <lists+linux-sh@lfdr.de>; Wed, 23 Oct 2019 17:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392484AbfJWP7r (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 23 Oct 2019 11:59:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36891 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391058AbfJWP7r (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 23 Oct 2019 11:59:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id f22so20196743wmc.2
        for <linux-sh@vger.kernel.org>; Wed, 23 Oct 2019 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DpQNk5GKVU5HAVsS2lfnhXVgbc1C81TBtl7IJMFJUG8=;
        b=xgJXyFrIzYnIAL+3S/Laa0OGiram8c8HjJSo+AWxlLoq3e7mq7LkHGOB915fkNp8wD
         lG+QPGOP7/luA8dnleq8N8ayCsR5GEydJ+rS8AbUobNeUpV/V0jgZP27qayuOLKKVv9M
         DoBDrmBhvfkSVLHfEcXBdR/JRaOZziHAcOwuy+I9HkjEe6+w8KvFfy4HOhYRcugrS0I1
         cXa4xJLf+OoeE+QLEGOYloarE798piBCSZHBJ8Rs80mpA8Bqj6IWhLzYbqVFHX1V6rwG
         T/2VbdGlZ821+osz4ww0BDRxzk5d6+wdSasO20trH//+HIpg886tg+Jqw+LufgO10cir
         KUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DpQNk5GKVU5HAVsS2lfnhXVgbc1C81TBtl7IJMFJUG8=;
        b=dkOkj1Mkpyu92ICdhfcwtfl4KD6JNEDjg5enh78Un6F6hQ903fiopgDUZSKjex3aEq
         mX2XEP+gez6HTh2OQg4vJtDT89IxmmdMHWDTb5UUkrcvO8Ses4GXmNZTLIYzUdWo6VOn
         w88Vvc2DIF4zPBpcu3R+tVv88fnWKDkCshna16WHKbWyhUyPFHMHoUfZPbvoUGmoO3oY
         EvPVRuDXXSISFA3bDLjE8ENqlWydmZSYy8h6wV6E4iJMuAJuI2LO8+egRFqWTfXhm/TJ
         BLtTA4x2oY90rBhlJ2hDs9mAlQpm0fALXKP088eHjs/I4Tfl6LHpooCSfS9//vTNgtFr
         A6fA==
X-Gm-Message-State: APjAAAXxDbYOL12SELQgmB/0PZwu2QRInfEuH4NIEsfhUbaYsNSAyQLS
        xfF1I64s/eyDz4rKZjli1LQ/jw==
X-Google-Smtp-Source: APXvYqzob3uuDq3TFZkNHOCeq0PFX5T7ZcEi/y3ER2QZCW7dJ9tFg56NrLMyL5UAu8N+qEXNbsanQQ==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr579631wmh.55.1571846384525;
        Wed, 23 Oct 2019 08:59:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a186sm21168572wmd.3.2019.10.23.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 08:59:43 -0700 (PDT)
Date:   Wed, 23 Oct 2019 16:59:41 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191023155941.q563d3cfizre4zvt@holly.lan>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski wrote:
> wt., 22 paź 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > While working on my other series related to gpio-backlight[1] I noticed
> > that we could simplify the driver if we made the only user of platform
> > data use GPIO lookups and device properties. This series tries to do
> > that.
> >
> > First two patches contain minor fixes. Third patch makes the driver
> > explicitly drive the GPIO line. Fourth patch adds all necessary data
> > structures to ecovec24. Patch 5/9 unifies much of the code for both
> > pdata and non-pdata cases. Patches 6-7/9 remove unused platform data
> > fields. Last two patches contain additional improvements for the GPIO
> > backlight driver while we're already modifying it.
> >
> > I don't have access to this HW but hopefully this works. Only compile
> > tested.
> >
> > [1] https://lkml.org/lkml/2019/6/25/900
> >
> > v1 -> v2:
> > - rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
> > - added additional two patches with minor improvements
> >
> > v2 -> v3:
> > - in patch 7/7: used initializers to set values for pdata and dev local vars
> >
> > v3 -> v4:
> > - rebased on top of v5.4-rc1
> > - removed changes that are no longer relevant after commit ec665b756e6f
> >   ("backlight: gpio-backlight: Correct initial power state handling")
> > - added patch 7/7
> >
> > v4 -> v5:
> > - in patch 7/7: added a comment replacing the name of the function being
> >   pulled into probe()
> >
> > v5 -> v6:
> > - added a patch making the driver explicitly set the direction of the GPIO
> >   to output
> > - added a patch removing a redundant newline
> >
> > v6 -> v7:
> > - renamed the function calculating the new GPIO value for status update
> > - collected more tags
> >
> > Bartosz Golaszewski (9):
> >   backlight: gpio: remove unneeded include
> >   backlight: gpio: remove stray newline
> >   backlight: gpio: explicitly set the direction of the GPIO
> >   sh: ecovec24: add additional properties to the backlight device
> >   backlight: gpio: simplify the platform data handling
> >   sh: ecovec24: don't set unused fields in platform data
> >   backlight: gpio: remove unused fields from platform data
> >   backlight: gpio: use a helper variable for &pdev->dev
> >   backlight: gpio: pull gpio_backlight_initial_power_state() into probe
> >
> >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++------------
> >  include/linux/platform_data/gpio_backlight.h |   3 -
> >  3 files changed, 69 insertions(+), 95 deletions(-)
> >
> > --
> > 2.23.0
> >
> 
> Lee, Daniel, Jingoo,
> 
> Jacopo is travelling until November 1st and won't be able to test this
> again before this date. Do you think you can pick it up and in case
> anything's broken on SH, we can fix it after v5.5-rc1, so that it
> doesn't miss another merge window?

Outside of holidays and other emergencies Lee usually collects up the
patches for backlight. I'm not sure when he plans to close things for
v5.5 .


Daniel.
