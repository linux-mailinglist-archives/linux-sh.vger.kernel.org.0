Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428B2711E3
	for <lists+linux-sh@lfdr.de>; Tue, 23 Jul 2019 08:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfGWG2M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 23 Jul 2019 02:28:12 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:47024 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730010AbfGWG2M (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 23 Jul 2019 02:28:12 -0400
Received: by mail-io1-f68.google.com with SMTP id i10so79377282iol.13
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0GXgbin1wM5tD9QHab0bjxqBxoyIQnKJbxMwrdj3eAo=;
        b=AkGT7f1yp79PR71yxcX0rmm7mn9Z79r5K4cPrbEDACL9FDwSVMGs0ASUkteU8pEZyU
         V2uPiHHOlPEy05sWQhcen9i60a5WApuQkPTvMdbhNfXCScSJlWK5Ftvpo+KwtQ+IvVMx
         EH6BFUQyBsKwbnYnkRjGakuqODnMf9YNpP9paDvwbtk5bL8j0ruMNJygjLDmdLea83BR
         +vt0S97OasXyEI0jhBs81RbiaJWlYLS70TSoZyzpaN5TF0VnDN5dCgHJtsnshqKIYXcn
         YUeR6wczHn3AYJNWm3IeS7Uv/hmywYMSI4GjP5nHCeDNmaSAaymEU2cLJUBNAEpfmavs
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0GXgbin1wM5tD9QHab0bjxqBxoyIQnKJbxMwrdj3eAo=;
        b=aJZ51PV8tN86Il/AO2WNTUp11vhJ3Ev+VOikF+LNR5vLId2v7JOeCOHjEdQCFo/7RJ
         bDM+c3J1bUlDfq8iJ28xuKR2k8szesJAuZksk+p+HEOSQ2DZZCPa7gMIhbi8/rAJV4Ke
         jLG0zzS2U0kwF3yKlkSgTgym0FbhQwtR63N7Lqd//UOt0jWboA4mEvCsuu/cUHFsHeCF
         uA5B5QeONKLcNOl5ldHsmo+KuV5o6YmsEzAPEaFuLwHReyJg541YTRusG0faj0XzTtgi
         RpaxfgtUGHz47qmpekMRgYDgdFTatObMXlH7nFtgO2U7KIrkNsFmxDokgz+LR1bIKalw
         G+uQ==
X-Gm-Message-State: APjAAAUU2U29f05EBNxBfAhsfJiiwCK1ZlJMn/JuaVyhHz0iTnJnaeon
        ycEV8enUvp0Lz97f5Mmf6bGVfcfvDrrC78GS+KI=
X-Google-Smtp-Source: APXvYqz6WM6llZIcZ4uWt1BEXw5VYzdaK/anRXzoGyvRQ8j3uF6YDTFTrHInVfg3NOC4vy7BIyJLo2b2xJVTaI/v58A=
X-Received: by 2002:a5d:9c46:: with SMTP id 6mr9784584iof.6.1563863291632;
 Mon, 22 Jul 2019 23:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl> <20190722150302.29526-3-brgl@bgdev.pl>
 <20190722160603.GY9224@smile.fi.intel.com>
In-Reply-To: <20190722160603.GY9224@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 Jul 2019 08:28:00 +0200
Message-ID: <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data handling
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sh@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

pon., 22 lip 2019 o 18:06 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Jul 22, 2019 at 05:02:57PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Now that the last user of platform data (sh ecovec24) defines a proper
> > GPIO lookup and sets the 'default-on' device property, we can drop the
> > platform_data-specific GPIO handling and unify a big chunk of code.
> >
> > The only field used from the platform data is now the fbdev pointer.
>
> > -static int gpio_backlight_probe_dt(struct platform_device *pdev,
> > -                                struct gpio_backlight *gbl)
> > -{
> > -     struct device *dev =3D &pdev->dev;
> > -     enum gpiod_flags flags;
> > -     int ret;
> > -
> > -     gbl->def_value =3D device_property_read_bool(dev, "default-on");
> > -     flags =3D gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> > -
> > -     gbl->gpiod =3D devm_gpiod_get(dev, NULL, flags);
> > -     if (IS_ERR(gbl->gpiod)) {
> > -             ret =3D PTR_ERR(gbl->gpiod);
> > -
> > -             if (ret !=3D -EPROBE_DEFER) {
> > -                     dev_err(dev,
> > -                             "Error: The gpios parameter is missing or=
 invalid.\n");
> > -             }
> > -             return ret;
> > -     }
> > -
> > -     return 0;
> > -}
>
> Why not leave this function (perhaps with different name)?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Why would we do that if the entire probe() function is now less than
50 lines long? Also: it gets inlined by the compiler anyway. It
doesn't make sense IMO.

Bart
