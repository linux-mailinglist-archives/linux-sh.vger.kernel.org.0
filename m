Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 716B1C8787
	for <lists+linux-sh@lfdr.de>; Wed,  2 Oct 2019 13:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfJBLq3 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Oct 2019 07:46:29 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38071 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfJBLq3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Oct 2019 07:46:29 -0400
Received: by mail-io1-f67.google.com with SMTP id u8so56092691iom.5
        for <linux-sh@vger.kernel.org>; Wed, 02 Oct 2019 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lh5QxEdgvHoHF5Kz6XaPdjsoiPWGW9FM0Kf+u5LlWyg=;
        b=Q5Qfdh7fI7j00zuYn+3Gvvh3U82Zj6uRr+9t+BfK+QrN6GksTsq1TtHlWVSl3DUc/+
         KICkXd3QUhZFpe0w3wAfln7jgkv7gbMfFyG9fjM2V98eIGe3r3Gng/xkExa+eJEFFilu
         E15hdttybPJelTM62xKCQWTnZbv7QjtcbEnLaCqCktZpjN59SdX2dYOtnQ/wc+v0t2zu
         Z60M1o7opM5Y6bF/275R2KooX4xy51xnRv1hzx06KJKXKTdmdvkrexBDIvQoo7fX23JK
         JdQfSCs2jHEui+2UrN44EqlEtaVfgEtssfzfXCF4hdHKwb59nnOUY2wEhzYHMnDt+aS1
         bpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lh5QxEdgvHoHF5Kz6XaPdjsoiPWGW9FM0Kf+u5LlWyg=;
        b=iobrq8HDwx6OyYz3sK+vkHPDjRK/M9uMjLRfAFEzYFHwvB9YObM36hG1/ZDQU89ky0
         gFKVYWcea9rwokf+zwUriZyuvcVZMAgxFOreqdkFwA0LdWtdvSCgm/XXJ68vxSiZHXkX
         MqJ3kVeqZFELUpsFLligIW74WCI/oGGXFmlkMV6zjj6gqC3+JkM6GZNWkv0M77NfzhaF
         BD3i7RneLnG29+KSQTdvtNCeiJHMwMzyebA7F8FmrSTOSF8jHuqiYu3o36vbNRCtNdLA
         0DAM4TXYwrpZnIYcw33N1M80yoarD+CClJlFKVgBbrVqUd0PqAM/PJvjRM7PvI401xCT
         9yvw==
X-Gm-Message-State: APjAAAUuw/+WX7EmE0GdXUHW0S00wFKEajG6Y+M7jyGEvbd4fiQukJNI
        SEYqgIHLb+avpinEf2//uJZrof7JkU2FieKZilrjrw==
X-Google-Smtp-Source: APXvYqwXVEvFlzog8KQO34/KztiH9WkMTSYCCR8KfOcAkvzoP5pNsY8XDceXykJ+ii5hdUUGdRQ24Jdi2x774Jju/0E=
X-Received: by 2002:a5d:8911:: with SMTP id b17mr2872420ion.287.1570016788323;
 Wed, 02 Oct 2019 04:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125837.4472-1-brgl@bgdev.pl> <20191001125837.4472-8-brgl@bgdev.pl>
 <20191002103318.6owxberhml6mbtxm@holly.lan>
In-Reply-To: <20191002103318.6owxberhml6mbtxm@holly.lan>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Oct 2019 13:46:17 +0200
Message-ID: <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] backlight: gpio: pull gpio_backlight_initial_power_state()
 into probe
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

=C5=9Br., 2 pa=C5=BA 2019 o 12:33 Daniel Thompson <daniel.thompson@linaro.o=
rg> napisa=C5=82(a):
>
> On Tue, Oct 01, 2019 at 02:58:37PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The probe function in the gpio-backlight driver is quite short. If we
> > pull gpio_backlight_initial_power_state() into probe we can drop two
> > more fields from struct gpio_backlight and shrink the driver code.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/video/backlight/gpio_backlight.c | 36 ++++++++----------------
> >  1 file changed, 12 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> > index 6247687b6330..37ec184f0c5c 100644
> > --- a/drivers/video/backlight/gpio_backlight.c
> > +++ b/drivers/video/backlight/gpio_backlight.c
> > @@ -17,11 +17,8 @@
> >  #include <linux/slab.h>
> >
> >  struct gpio_backlight {
> > -     struct device *dev;
> >       struct device *fbdev;
> > -
> >       struct gpio_desc *gpiod;
> > -     int def_value;
> >  };
> >
> >  static int gpio_backlight_update_status(struct backlight_device *bl)
> > @@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_op=
s =3D {
> >       .check_fb       =3D gpio_backlight_check_fb,
> >  };
> >
> > -static int gpio_backlight_initial_power_state(struct gpio_backlight *g=
bl)
>
> I'm inclined to view deleting this function as removing a comment (e.g.
> the function name helps us to read the code)!
>

Right, but why not just add a comment then? The probe function is 50
lines long, there's really no need to split it. This will get inlined
anyway too.

Bart

> Removing the variables from the context structure is good but why not
> just pass them to the function and let the compiler decided whether or
> not to inline.
>
>
> Daniel.
>
>
> > -{
> > -     struct device_node *node =3D gbl->dev->of_node;
> > -
> > -     /* Not booted with device tree or no phandle link to the node */
> > -     if (!node || !node->phandle)
> > -             return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWER=
DOWN;
> > -
> > -     /* if the enable GPIO is disabled, do not enable the backlight */
> > -     if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> > -             return FB_BLANK_POWERDOWN;
> > -
> > -     return FB_BLANK_UNBLANK;
> > -}
> > -
> > -
> >  static int gpio_backlight_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct gpio_backlight_platform_data *pdata =3D dev_get_platdata(d=
ev);
> > +     struct device_node *of_node =3D dev->of_node;
> >       struct backlight_properties props;
> >       struct backlight_device *bl;
> >       struct gpio_backlight *gbl;
> > -     int ret;
> > +     int ret, def_value;
> >
> >       gbl =3D devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> >       if (gbl =3D=3D NULL)
> >               return -ENOMEM;
> >
> > -     gbl->dev =3D dev;
> > -
> >       if (pdata)
> >               gbl->fbdev =3D pdata->fbdev;
> >
> > -     gbl->def_value =3D device_property_read_bool(dev, "default-on");
> > +     def_value =3D device_property_read_bool(dev, "default-on");
> >
> >       gbl->gpiod =3D devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> >       if (IS_ERR(gbl->gpiod)) {
> > @@ -109,7 +89,15 @@ static int gpio_backlight_probe(struct platform_dev=
ice *pdev)
> >               return PTR_ERR(bl);
> >       }
> >
> > -     bl->props.power =3D gpio_backlight_initial_power_state(gbl);
> > +     /* Not booted with device tree or no phandle link to the node */
> > +     if (!of_node || !of_node->phandle)
> > +             bl->props.power =3D def_value ? FB_BLANK_UNBLANK
> > +                                         : FB_BLANK_POWERDOWN;
> > +     else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> > +             bl->props.power =3D FB_BLANK_POWERDOWN;
> > +     else
> > +             bl->props.power =3D FB_BLANK_UNBLANK;
> > +
> >       bl->props.brightness =3D 1;
> >
> >       backlight_update_status(bl);
> > --
> > 2.23.0
> >
