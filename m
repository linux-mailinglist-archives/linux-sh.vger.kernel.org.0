Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCA4E2A80
	for <lists+linux-sh@lfdr.de>; Thu, 24 Oct 2019 08:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437771AbfJXGrb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Oct 2019 02:47:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33223 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbfJXGrb (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Oct 2019 02:47:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id s1so15903945wro.0
        for <linux-sh@vger.kernel.org>; Wed, 23 Oct 2019 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UclEmd8YX++NCf8kPKkA+46Pa3LHuXqjjWzo9Z3XdYM=;
        b=SO7SqUbR2Vy59Qq6nC05Ir/m4UFWccS9Wg42Qz+tm9gLjOJBtQVpbadit9ajsImgB8
         c8fISobck8KfXDkvhVEAnmQQnj/ONNNXGGRdnlPWFSRZNoHaRE7yF/P0cfwLmTpjqdj/
         o5OntZbUc+OPgDWBm113VxzXeoq8Q1/qkHgFnq10DL28gdpjzZWxSDUC/Yj86kvQO/ty
         kIU+AlVHw0avbfCfFkY02yWNr9dkyKePz29U7S/ucuVeQxt4fC7HtLggOu4eqCEw+pZo
         jrazNHTw0zilOZKo4xWqKHCeWWdeLZLc51W7hWl1BXY5W8cXvNGqmOH+TqBFnCufB1qz
         ViCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UclEmd8YX++NCf8kPKkA+46Pa3LHuXqjjWzo9Z3XdYM=;
        b=Hn3XGGOypFATyXzOrtPqS+8TLWdBTPyBwYbnEzImX+GAYZTBDxcjfo22Ww6+sXpVkT
         Lx+NyPPVVlv+7lKa8sczv/E3VTQO4RlaOPTUjXDPen6bmqimLLK+P7CWFrq4JGnXjyIm
         ZWIbMcfc29KPbhezktdIfWNaIKQcXZNr9JI05KBgbJ6/x4+4W2J0uGPkERXVTGdQSm0d
         IOJ5WcTtcCcz5pBwzPr3QxJmhxPprt3JrdRPUeHCL35Sz9kHs9Nf0YPk6J/+vim2mk5y
         v5o47W6rkY5uRepdcv/fUPdPU/rR7QHFxqb92NieMMQ0UgPNPI/4N8qXv1mrAOacbQIr
         IW5g==
X-Gm-Message-State: APjAAAVFRRYPVSSuCYfi7OCQhJBKFdsWXNZLF4Tg8WyhBbYtNwm3kxyS
        kn1qLQoh6wstnRNAEblwT7GSiw==
X-Google-Smtp-Source: APXvYqypA7QDjMUQSuSTEtC5xtMr2uR+W7rMNaXx381pXfKuL3lSrfZeffkl8xEc2dweA8MOowi2LA==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr2183760wrj.250.1571899648399;
        Wed, 23 Oct 2019 23:47:28 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id q11sm1694268wmq.21.2019.10.23.23.47.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 23:47:27 -0700 (PDT)
Date:   Thu, 24 Oct 2019 07:47:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
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
Message-ID: <20191024064726.GB15843@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191023155941.q563d3cfizre4zvt@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 23 Oct 2019, Daniel Thompson wrote:

> On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski wrote:
> > wt., 22 paź 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > While working on my other series related to gpio-backlight[1] I noticed
> > > that we could simplify the driver if we made the only user of platform
> > > data use GPIO lookups and device properties. This series tries to do
> > > that.
> > >
> > > First two patches contain minor fixes. Third patch makes the driver
> > > explicitly drive the GPIO line. Fourth patch adds all necessary data
> > > structures to ecovec24. Patch 5/9 unifies much of the code for both
> > > pdata and non-pdata cases. Patches 6-7/9 remove unused platform data
> > > fields. Last two patches contain additional improvements for the GPIO
> > > backlight driver while we're already modifying it.
> > >
> > > I don't have access to this HW but hopefully this works. Only compile
> > > tested.
> > >
> > > [1] https://lkml.org/lkml/2019/6/25/900
> > >
> > > v1 -> v2:
> > > - rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
> > > - added additional two patches with minor improvements
> > >
> > > v2 -> v3:
> > > - in patch 7/7: used initializers to set values for pdata and dev local vars
> > >
> > > v3 -> v4:
> > > - rebased on top of v5.4-rc1
> > > - removed changes that are no longer relevant after commit ec665b756e6f
> > >   ("backlight: gpio-backlight: Correct initial power state handling")
> > > - added patch 7/7
> > >
> > > v4 -> v5:
> > > - in patch 7/7: added a comment replacing the name of the function being
> > >   pulled into probe()
> > >
> > > v5 -> v6:
> > > - added a patch making the driver explicitly set the direction of the GPIO
> > >   to output
> > > - added a patch removing a redundant newline
> > >
> > > v6 -> v7:
> > > - renamed the function calculating the new GPIO value for status update
> > > - collected more tags
> > >
> > > Bartosz Golaszewski (9):
> > >   backlight: gpio: remove unneeded include
> > >   backlight: gpio: remove stray newline
> > >   backlight: gpio: explicitly set the direction of the GPIO
> > >   sh: ecovec24: add additional properties to the backlight device
> > >   backlight: gpio: simplify the platform data handling
> > >   sh: ecovec24: don't set unused fields in platform data
> > >   backlight: gpio: remove unused fields from platform data
> > >   backlight: gpio: use a helper variable for &pdev->dev
> > >   backlight: gpio: pull gpio_backlight_initial_power_state() into probe
> > >
> > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> > >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++------------
> > >  include/linux/platform_data/gpio_backlight.h |   3 -
> > >  3 files changed, 69 insertions(+), 95 deletions(-)
> > >
> > >
> > 
> > Lee, Daniel, Jingoo,
> > 
> > Jacopo is travelling until November 1st and won't be able to test this
> > again before this date. Do you think you can pick it up and in case
> > anything's broken on SH, we can fix it after v5.5-rc1, so that it
> > doesn't miss another merge window?

November 1st (-rc6) will be fine.

I'd rather apply it late-tested than early-non-tested.

Hopefully Jacopo can prioritise testing this on Thursday or Friday,
since Monday will be -rc7 which is really cutting it fine.

> Outside of holidays and other emergencies Lee usually collects up the
> patches for backlight. I'm not sure when he plans to close things for
> v5.5.

In special cases such as these I can remain flexible.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
