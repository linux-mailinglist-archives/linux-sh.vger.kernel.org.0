Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF6E8EDB97
	for <lists+linux-sh@lfdr.de>; Mon,  4 Nov 2019 10:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbfKDJWu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 4 Nov 2019 04:22:50 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:43991 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfKDJWt (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 4 Nov 2019 04:22:49 -0500
Received: by mail-il1-f193.google.com with SMTP id j2so12001421ilc.10
        for <linux-sh@vger.kernel.org>; Mon, 04 Nov 2019 01:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vp7+46dBcKq+wJhm7tcBHhOhxI41NbVk2dPfYaVzjCs=;
        b=X7UnsHYAWsVYNulf0awFFpNulF3wvzdSTFgPijQ9KFhO5FdjYR8+8W5RRtaBeSV9Gq
         xcFc2LXnxCcG5+gV/NrSd4zdJj5QtpC8O8MYJ2LL1nP96t5SyFO8qWgcoOptiNo7rkPK
         KHdpGidRDePl/0j3HW8zAPx2WyvxeO9l379+OHr3GqSBnQ29MEeHAUmVucS9KIqVKqog
         1GXIXilooUdA4FPrbSFOZ+iZQyCihlKyVaB/bMhq7MlHBMRWAOss1k0sHQNYCsr+99ET
         T98BYhpo7K6JtFacNsFDdboQEjCMsjmSopPtbCyrNA82iooXgxFkLoA7gFoVp9LVkRWj
         81Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vp7+46dBcKq+wJhm7tcBHhOhxI41NbVk2dPfYaVzjCs=;
        b=PRHNXGBZV9VXOu8MK5XVoPv+DyTh/whfdIZDtFfhbR/QbGKl2KOQ9glP+IWXOYJoj2
         BRU7remBqU51mCoNk9RSz3hsS/1gKIe9f822zzRpb48BxP6dL8zIscWxHEgDkaPoAlws
         yss7XPMziP6bVu5wGq8irZuDKycOrtlqhZZ0YRYitNRhjGN03m+0HhUTcQVCwTUEjAd0
         /0Bqa+HyavfRUUAdvkoBFambUIecKAbLttFT/4Hn9chrAy96OJ/FjQh9++Xx2XWU+Eh2
         PSPssTN7XckmbtBycwUvmX+DnNYO4I/50KHnGuzxFGGX04gkCgSsyNX0swhBF+SX2Dxd
         hQ8A==
X-Gm-Message-State: APjAAAXsUd3QH/eYnBT+q9TldF1lJ7UxI809aIObEykHoasrv/Q6avsd
        Xc96jlPLkJBcAwlnqq4qed7q/MptQjC1lf0oD79/JA==
X-Google-Smtp-Source: APXvYqzTiTqZlHfA1zV5+aakewP6d9iaJAJI5oGc7QmwUdxCqYJz+/wVh7vcTJIidSKUC+p8c8k3ZmGl9CS/g1+u8HA=
X-Received: by 2002:a92:c8:: with SMTP id 191mr27722707ila.287.1572859367845;
 Mon, 04 Nov 2019 01:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20191022083630.28175-1-brgl@bgdev.pl> <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan> <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain> <20191101085803.GD5700@dell>
 <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain>
In-Reply-To: <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Nov 2019 10:22:37 +0100
Message-ID: <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

pt., 1 lis 2019 o 16:39 Jacopo Mondi <jacopo@jmondi.org> napisa=C5=82(a):
>
> Hello,
>   as promised...
>
> On Fri, Nov 01, 2019 at 08:58:03AM +0000, Lee Jones wrote:
> > On Thu, 24 Oct 2019, Jacopo Mondi wrote:
> >
> > > Hello,
> > >
> > > On Thu, Oct 24, 2019 at 07:47:26AM +0100, Lee Jones wrote:
> > > > On Wed, 23 Oct 2019, Daniel Thompson wrote:
> > > >
> > > > > On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > wt., 22 pa=C5=BA 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev.p=
l> napisa=C5=82(a):
> > > > > > >
> > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > >
> > > > > > > While working on my other series related to gpio-backlight[1]=
 I noticed
> > > > > > > that we could simplify the driver if we made the only user of=
 platform
> > > > > > > data use GPIO lookups and device properties. This series trie=
s to do
> > > > > > > that.
> > > > > > >
> > > > > > > First two patches contain minor fixes. Third patch makes the =
driver
> > > > > > > explicitly drive the GPIO line. Fourth patch adds all necessa=
ry data
> > > > > > > structures to ecovec24. Patch 5/9 unifies much of the code fo=
r both
> > > > > > > pdata and non-pdata cases. Patches 6-7/9 remove unused platfo=
rm data
> > > > > > > fields. Last two patches contain additional improvements for =
the GPIO
> > > > > > > backlight driver while we're already modifying it.
> > > > > > >
> > > > > > > I don't have access to this HW but hopefully this works. Only=
 compile
> > > > > > > tested.
> > > > > > >
> > > > > > > [1] https://lkml.org/lkml/2019/6/25/900
> > > > > > >
> > > > > > > v1 -> v2:
> > > > > > > - rebased on top of v5.3-rc1 and adjusted to the recent chang=
es from Andy
> > > > > > > - added additional two patches with minor improvements
> > > > > > >
> > > > > > > v2 -> v3:
> > > > > > > - in patch 7/7: used initializers to set values for pdata and=
 dev local vars
> > > > > > >
> > > > > > > v3 -> v4:
> > > > > > > - rebased on top of v5.4-rc1
> > > > > > > - removed changes that are no longer relevant after commit ec=
665b756e6f
> > > > > > >   ("backlight: gpio-backlight: Correct initial power state ha=
ndling")
> > > > > > > - added patch 7/7
> > > > > > >
> > > > > > > v4 -> v5:
> > > > > > > - in patch 7/7: added a comment replacing the name of the fun=
ction being
> > > > > > >   pulled into probe()
> > > > > > >
> > > > > > > v5 -> v6:
> > > > > > > - added a patch making the driver explicitly set the directio=
n of the GPIO
> > > > > > >   to output
> > > > > > > - added a patch removing a redundant newline
> > > > > > >
> > > > > > > v6 -> v7:
> > > > > > > - renamed the function calculating the new GPIO value for sta=
tus update
> > > > > > > - collected more tags
> > > > > > >
> > > > > > > Bartosz Golaszewski (9):
> > > > > > >   backlight: gpio: remove unneeded include
> > > > > > >   backlight: gpio: remove stray newline
> > > > > > >   backlight: gpio: explicitly set the direction of the GPIO
> > > > > > >   sh: ecovec24: add additional properties to the backlight de=
vice
> > > > > > >   backlight: gpio: simplify the platform data handling
> > > > > > >   sh: ecovec24: don't set unused fields in platform data
> > > > > > >   backlight: gpio: remove unused fields from platform data
> > > > > > >   backlight: gpio: use a helper variable for &pdev->dev
> > > > > > >   backlight: gpio: pull gpio_backlight_initial_power_state() =
into probe
> > > > > > >
> > > > > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> > > > > > >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++--=
----------
> > > > > > >  include/linux/platform_data/gpio_backlight.h |   3 -
> > > > > > >  3 files changed, 69 insertions(+), 95 deletions(-)
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Lee, Daniel, Jingoo,
> > > > > >
> > > > > > Jacopo is travelling until November 1st and won't be able to te=
st this
> > > > > > again before this date. Do you think you can pick it up and in =
case
> > > > > > anything's broken on SH, we can fix it after v5.5-rc1, so that =
it
> > > > > > doesn't miss another merge window?
> > > >
> > > > November 1st (-rc6) will be fine.
> > > >
> > > > I'd rather apply it late-tested than early-non-tested.
> > > >
> > > > Hopefully Jacopo can prioritise testing this on Thursday or Friday,
> > > > since Monday will be -rc7 which is really cutting it fine.
> > >
> > > I'll do my best, I'll get home Friday late afternoon :)
> >
> > Welcome home!
> >
> > Just a little reminder in your inbox. TIA. :)
>
> For the ecovec part:
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>

Thanks Jacopo!

Lee: I hope it's not too late to get it picked up for v5.5?

Best regards,
Bartosz Golaszewski

> Thanks
>    j
>
>
> >
> > --
> > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > Linaro Services Technical Lead
> > Linaro.org =E2=94=82 Open source software for ARM SoCs
> > Follow Linaro: Facebook | Twitter | Blog
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
