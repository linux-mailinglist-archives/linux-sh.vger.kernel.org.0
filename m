Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29AFDDCADE
	for <lists+linux-sh@lfdr.de>; Fri, 18 Oct 2019 18:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394502AbfJRQUb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 18 Oct 2019 12:20:31 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32923 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfJRQUb (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 18 Oct 2019 12:20:31 -0400
Received: by mail-il1-f194.google.com with SMTP id v2so6073000ilm.0
        for <linux-sh@vger.kernel.org>; Fri, 18 Oct 2019 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9uIYAnyPMezy1SrLVChvjUvSTT25CSaPRKsdjVZO6n8=;
        b=RsS1qicPZcnkl76YmnbfWfB4DsiuiCLUqloFqkV4cKo1n8DFJo7UEQSSDFodJSbKB/
         aBWZqVCPZgMDcLDXyYzENWxYIXywuatRXqle5E7LpooPoQQUBy7bYET/lR3hCkblPVpQ
         lRCxDCweDqgN5VH3+jmycEAt4tkhNiTGcj63IOj6HoqYIOC+FHhzbw0j2Z6Q6PcheRlq
         V05ZlaVDqncElnNNeR/8BJBUr0rrldkoPBjEym9DYsl1rkcPeHcDWbU59h32Cz6ffBHn
         hRdElR9UrqvDGkKzkyMvLFvQ1KF9n7QBf9pfXR5M4kaxLzPEox6QLi5JDuA66WL4yGC9
         X2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9uIYAnyPMezy1SrLVChvjUvSTT25CSaPRKsdjVZO6n8=;
        b=CckPpHpLmRP5Gs/hbZ+Df3X29ZLNnGoKZoizujhONMS2tKujfrOz8lmP98uAgwHwCH
         TgAkRRPU1iJ0cjNdQZ12BAirayROp03tUFcdqU1T+tIYlRL14rZttJ7vrS9lGwRCFrKb
         NBMl1v+iEN6446a6/UkPUqgdopMu4eZhGiiZEQ9LRbXbbHqUsJZRw+yo9vH1KosFUqoS
         XiJZcNZavBQpw8Q8iXTEy2PnQw2RIhDGb5N5gtGEDfkkOJO2W6FhsNw4QhY1DO6r10Vq
         PPvqzxM+p5lPkZ0oFxRSSjlN0Ztuq8zdNxJYCMcMliXb02jYNh9guaYVugNNFyH7AwjZ
         hE5g==
X-Gm-Message-State: APjAAAVa3iIkGGWI40wAIHX5eyLZ6NTAj8Uadc5wix4TFhtlyGTByafr
        QZtWew3lXsgvvcvSqXrFX2YScPHDWJgoPRc3Ujr6OQ==
X-Google-Smtp-Source: APXvYqw2YK1lwgF/TFTkt9RSwtJ17zC9sjmAtKYD5ZCcsqeN2ggjp9zo5LRHoqTvo6xjx+0AuXbxZHCiRDt5708hL+c=
X-Received: by 2002:a92:410c:: with SMTP id o12mr11498464ila.287.1571415630625;
 Fri, 18 Oct 2019 09:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
 <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
 <20191016130536.222vsi5whkoy6vzo@uno.localdomain> <20191017072550.GK4365@dell>
 <20191018150426.7w5q55nhkiqbqhuk@uno.localdomain>
In-Reply-To: <20191018150426.7w5q55nhkiqbqhuk@uno.localdomain>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Oct 2019 18:20:19 +0200
Message-ID: <CAMRc=Mc0-c_Cnbbh981pXQHW70GW1kh5hYioxJQM6JrOnCe4NQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

pt., 18 pa=C5=BA 2019 o 17:02 Jacopo Mondi <jacopo@jmondi.org> napisa=C5=82=
(a):
>
> Hi,
>
> On Thu, Oct 17, 2019 at 08:25:50AM +0100, Lee Jones wrote:
> > On Wed, 16 Oct 2019, Jacopo Mondi wrote:
> >
> > > Hi, sorry for not having replied earlier
> > >
> > > On Wed, Oct 16, 2019 at 02:56:57PM +0200, Linus Walleij wrote:
> > > > On Mon, Oct 14, 2019 at 10:12 AM Lee Jones <lee.jones@linaro.org> w=
rote:
> > > >
> > > > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
> > > > >
> > > > > I guess we're just waiting for the SH Acks now?
> > > >
> > > > The one maintainer with this board is probably overloaded.
> > > >
> > > > I would say just apply it, it can't hold back the entire series.
> > >
> > > I've been able to resurect the Ecovec, and I've also been given a cop=
y
> > > of its schematics file a few weeks ago.
> > >
> > > It's in my TODO list to test this series but I didn't manage to find
> > > time. If I pinky promise I get back to you before end of the week,
> > > could you wait for me ? :)
>
> Finally had some time to spend on this.
>
> As I've reported to Bartosz, this version does not work on Ecovec out
> of the box, as the GPIO line connected to the backlight needs to be
> configured to work in output mode before registering the backlight
> device.
>
> With this simple change:
>
> $ git diff
> diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-e=
covec24/setup.c
> index dd427bac5cde..eec6e805c3ed 100644
> --- a/arch/sh/boards/mach-ecovec24/setup.c
> +++ b/arch/sh/boards/mach-ecovec24/setup.c
> @@ -1473,6 +1473,7 @@ static int __init arch_setup(void)
>  #endif
>  #endif
>
> +       gpio_direction_output(GPIO_PTR1, 1);

This is a hack actually. The problem lies with the gpio backlight
driver - it should really set the mode to output, not leave it as is.
If there's no good reason to keep it as it is now, I'll add another
patch to the series that moves the call to devm_gpiod_get() to where
we've already determined the initial value in probe() and pass an
appropriate GPIOD_OUT_HIGH/LOW flag.

Bart

>         gpiod_add_lookup_table(&gpio_backlight_lookup);
>         gpio_backlight_device =3D platform_device_register_full(
>                                         &gpio_backlight_device_info);
>
> I can now control the gpio through the backlight interface.
>
> So please add this bit on top of next iteration and add my:
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks and sorry for the long time it took!
>
> >
> > Yes, no problem.
> >
> > --
> > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > Linaro Services Technical Lead
> > Linaro.org =E2=94=82 Open source software for ARM SoCs
> > Follow Linaro: Facebook | Twitter | Blog
