Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F24904F2
	for <lists+linux-sh@lfdr.de>; Fri, 16 Aug 2019 17:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfHPPsh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 16 Aug 2019 11:48:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44725 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfHPPse (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 16 Aug 2019 11:48:34 -0400
Received: by mail-io1-f68.google.com with SMTP id j4so7086861iop.11
        for <linux-sh@vger.kernel.org>; Fri, 16 Aug 2019 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/rVwYCxqOr6nRrp3LvLIcdjfULOr8AyFlrBXkong6Uc=;
        b=fXFbSidYUWUDlCh4xn1T/uZ5jLY9vlVpMj5VEkuiqHXz+qMOCKxapObfLA3nEgPC7R
         vbKAhlMWcM4J+Eji7i5R6bwo4AeGu9fnIYkpCAzv8oSULwGLPD3LqKmsHrjooKwmPZlg
         CPFFPDdRWkrJe6ua3OTZ34Gz1O0O8vSQoh64ZKeWJzsOfIgCrQ5x1SjgRLt2BFPW6eno
         miP6aVQIgyGJOM2QklUITTu5iuxab7KfiAgaTBKrd+U5OvNlNtDzA+RPScqKLXahRxhU
         onl3wAUB2zIim3HOXqpJCz4CfO6R/P8hrD8OguzyI92HPBSdWK0xd3s2kHKgHsp4TiYl
         +oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/rVwYCxqOr6nRrp3LvLIcdjfULOr8AyFlrBXkong6Uc=;
        b=IIIeqZH2Cll/D2BIyu3MxjZUDE8EVWYsrl6FrVFTfVvwpg7HjFX8jrVg3KLg/gXsh5
         HwcTK1GilAHg/2RZ961cvgXyh5gnZqRa0/83C+B2ioZepIq7F+TD5Z8/xsJNa1fkqU/3
         mmotaUWY9OqLdyv/sMdSlLX7s+kjAiYsuzIcRytWqHjvmEMOzzuuv9tqSywkxC3x3/I7
         RIMwVHJ2B39MIYhS2m3RfMBB31MnCu2nLAxmQ1XRx9VG5recDWendtLoNr74kPRZvvss
         8AzERjRGKCN+wYiI9BU83iYeaGhe7fSo5AFo1VUqwAGv+tjBF52G3Oyo7vAzdMU6JhIX
         SIuA==
X-Gm-Message-State: APjAAAW+WInJ1yYmf8tyTlOk4TanE4qseZ/cZBxy+zYV4FKOWRdoCKMd
        D84DJpny8dzMPxvBIK6TL93lkeAwuUPkibZaQgD4jA==
X-Google-Smtp-Source: APXvYqxDOUjXB1ulEsmlyPghWdRmlQ4HyP8nZKAkjmZq4xfy7xXlP40N1L/haF2XUbz+0fYOxJqch8oW/Je12YfPMR8=
X-Received: by 2002:a5d:8457:: with SMTP id w23mr472306ior.189.1565970513627;
 Fri, 16 Aug 2019 08:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl> <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Aug 2019 17:48:22 +0200
Message-ID: <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

czw., 8 sie 2019 o 10:17 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> =C5=9Br., 24 lip 2019 o 10:25 Bartosz Golaszewski <brgl@bgdev.pl> napisa=
=C5=82(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > While working on my other series related to gpio-backlight[1] I noticed
> > that we could simplify the driver if we made the only user of platform
> > data use GPIO lookups and device properties. This series tries to do
> > that.
> >
> > The first patch adds all necessary data structures to ecovec24. Patch
> > 2/7 unifies much of the code for both pdata and non-pdata cases. Patche=
s
> > 3-4/7 remove unused platform data fields. Last three patches contain
> > additional improvements for the GPIO backlight driver while we're alrea=
dy
> > modifying it.
> >
> > I don't have access to this HW but hopefully this works. Only compile
> > tested.
> >
> > [1] https://lkml.org/lkml/2019/6/25/900
> >
> > v1 -> v2:
> > - rebased on top of v5.3-rc1 and adjusted to the recent changes from An=
dy
> > - added additional two patches with minor improvements
> >
> > v2 -> v3:
> > - in patch 7/7: used initializers to set values for pdata and dev local=
 vars
> >
> > Bartosz Golaszewski (7):
> >   sh: ecovec24: add additional properties to the backlight device
> >   backlight: gpio: simplify the platform data handling
> >   sh: ecovec24: don't set unused fields in platform data
> >   backlight: gpio: remove unused fields from platform data
> >   backlight: gpio: remove dev from struct gpio_backlight
> >   backlight: gpio: remove def_value from struct gpio_backlight
> >   backlight: gpio: use a helper variable for &pdev->dev
> >
> >  arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
> >  drivers/video/backlight/gpio_backlight.c     | 82 +++++---------------
> >  include/linux/platform_data/gpio_backlight.h |  3 -
> >  3 files changed, 44 insertions(+), 74 deletions(-)
> >
> > --
> > 2.21.0
> >
>
> Hi Rich, Yoshinori,
>
> can you ack the sh patches in this series?
>
> Bart

Ping.
