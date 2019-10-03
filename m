Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B387C9A1F
	for <lists+linux-sh@lfdr.de>; Thu,  3 Oct 2019 10:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbfJCIme (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 3 Oct 2019 04:42:34 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35757 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfJCImd (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 3 Oct 2019 04:42:33 -0400
Received: by mail-io1-f67.google.com with SMTP id q10so3693743iop.2
        for <linux-sh@vger.kernel.org>; Thu, 03 Oct 2019 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TiAsOmTXWY5+HeIiqR4tev653INweUDzmx4DD0U/7BE=;
        b=vMHgQ0VTHyTFrHAZHjAmsBhYqgtl/goTUm3lB8eodLZIJ40pK5CXD8fc/SVM1zZJTd
         fkCjyEq372rTfvmxR+bhgfDmK+hLh+Q0iTMUT8qmHtQLS1hwt/3cWm7d39o7BNdLCnGO
         0Zlcour6vhFnVmmkDTXpy/9lDQSbVW1ljr0kKHXmwB/QGFDNPt6E5wjbyVx6oenehDmB
         PQa0G7jPYmuaFwpGiRsDAkVCQF6MNuSaEs8lHZjEZMUeRdhVeqEIm1sY4KWMSh+llXDX
         zVMEq9dqE+659LatNkQIJvzTdKDsNleeA91k3sOixtTsljSBdTawUMSRGCxv1yR1W6sO
         uv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TiAsOmTXWY5+HeIiqR4tev653INweUDzmx4DD0U/7BE=;
        b=KG6risdPCo/VB+L3unePSi/Usk720tCsP0IosSenhHoicoDwWqpcNKIcdHhyzZPsIu
         PaFnTIwxmL7BE80+3KlkLbKoLa3oQD1RcCBaaNOTH/IjmdtzpP7NOcqK/s2tmS4+0mvo
         /DBQDBSjucxxBz/U6N+KavhKE4PloGGgqcfdQAVag0JJcWUtU92JKGht7nAheLTc9KNb
         RKyxUEd72JcJw4xeB8NuEn3lEH0ONxb3XxeAwqzmwC9yI0UUu4v3NcTbXmToK3RP9wwj
         vbvsJdPbMEOu+pQd2HVRYB+V3Bt+wt6HJQje2smz0sZgViafSfASBpdAvw0NWm1yX5RK
         hFow==
X-Gm-Message-State: APjAAAXyGsDIHB4V3rAbAIiGbpRiwui9d+7u7kTOlfXGd5dY0bAFgpdb
        zrW/FaODJgEgS3gYfS4Nh3OwmySmG+wC52Qmwj/50w==
X-Google-Smtp-Source: APXvYqwnU3atXyFQV5w9bcutFZ1kpaJEoTe9RWOTJlFxof3+Kjdx93av/LUevYyBxeNE6dJMbgcJA08QgiSdBr2KBrw=
X-Received: by 2002:a6b:fc04:: with SMTP id r4mr6861002ioh.189.1570092152368;
 Thu, 03 Oct 2019 01:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125837.4472-1-brgl@bgdev.pl> <20191001125837.4472-8-brgl@bgdev.pl>
 <20191002103318.6owxberhml6mbtxm@holly.lan> <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
 <20191002144028.6lljre76zxd52oui@holly.lan>
In-Reply-To: <20191002144028.6lljre76zxd52oui@holly.lan>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Oct 2019 10:42:21 +0200
Message-ID: <CAMRc=MeKFG=gyogSn+WdUXwhHZE74-FwVfxgKrHNpScbFZFZrg@mail.gmail.com>
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

=C5=9Br., 2 pa=C5=BA 2019 o 16:40 Daniel Thompson <daniel.thompson@linaro.o=
rg> napisa=C5=82(a):
>
> On Wed, Oct 02, 2019 at 01:46:17PM +0200, Bartosz Golaszewski wrote:
> > =C5=9Br., 2 pa=C5=BA 2019 o 12:33 Daniel Thompson <daniel.thompson@lina=
ro.org> napisa=C5=82(a):
> > >
> > > On Tue, Oct 01, 2019 at 02:58:37PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > The probe function in the gpio-backlight driver is quite short. If =
we
> > > > pull gpio_backlight_initial_power_state() into probe we can drop tw=
o
> > > > more fields from struct gpio_backlight and shrink the driver code.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > >  drivers/video/backlight/gpio_backlight.c | 36 ++++++++------------=
----
> > > >  1 file changed, 12 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/vid=
eo/backlight/gpio_backlight.c
> > > > index 6247687b6330..37ec184f0c5c 100644
> > > > --- a/drivers/video/backlight/gpio_backlight.c
> > > > +++ b/drivers/video/backlight/gpio_backlight.c
> > > > @@ -17,11 +17,8 @@
> > > >  #include <linux/slab.h>
> > > >
> > > >  struct gpio_backlight {
> > > > -     struct device *dev;
> > > >       struct device *fbdev;
> > > > -
> > > >       struct gpio_desc *gpiod;
> > > > -     int def_value;
> > > >  };
> > > >
> > > >  static int gpio_backlight_update_status(struct backlight_device *b=
l)
> > > > @@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backligh=
t_ops =3D {
> > > >       .check_fb       =3D gpio_backlight_check_fb,
> > > >  };
> > > >
> > > > -static int gpio_backlight_initial_power_state(struct gpio_backligh=
t *gbl)
> > >
> > > I'm inclined to view deleting this function as removing a comment (e.=
g.
> > > the function name helps us to read the code)!
> > >
> >
> > Right, but why not just add a comment then?
>
> I guess you could add a comment but keeping it pulled out in a function
> makes it easier to compare against equivalent code in other drivers
> (such as pwm_bl).
>

The pwm driver seems to be the only one that has this function and
it's also much more complicated. Unless it's a hard NACK, I think that
pulling all initialization into probe looks better and shrinks the
driver visually.

Bart

>
> Daniel.
>
>
> > The probe function is 50
> > lines long, there's really no need to split it. This will get inlined
> > anyway too.
> >
> > Bart
> >
> > > Removing the variables from the context structure is good but why not
> > > just pass them to the function and let the compiler decided whether o=
r
> > > not to inline.
> > >
> > >
> > > Daniel.
> > >
> > >
> > > > -{
> > > > -     struct device_node *node =3D gbl->dev->of_node;
> > > > -
> > > > -     /* Not booted with device tree or no phandle link to the node=
 */
> > > > -     if (!node || !node->phandle)
> > > > -             return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_P=
OWERDOWN;
> > > > -
> > > > -     /* if the enable GPIO is disabled, do not enable the backligh=
t */
> > > > -     if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> > > > -             return FB_BLANK_POWERDOWN;
> > > > -
> > > > -     return FB_BLANK_UNBLANK;
> > > > -}
> > > > -
> > > > -
> > > >  static int gpio_backlight_probe(struct platform_device *pdev)
> > > >  {
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct gpio_backlight_platform_data *pdata =3D dev_get_platda=
ta(dev);
> > > > +     struct device_node *of_node =3D dev->of_node;
> > > >       struct backlight_properties props;
> > > >       struct backlight_device *bl;
> > > >       struct gpio_backlight *gbl;
> > > > -     int ret;
> > > > +     int ret, def_value;
> > > >
> > > >       gbl =3D devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> > > >       if (gbl =3D=3D NULL)
> > > >               return -ENOMEM;
> > > >
> > > > -     gbl->dev =3D dev;
> > > > -
> > > >       if (pdata)
> > > >               gbl->fbdev =3D pdata->fbdev;
> > > >
> > > > -     gbl->def_value =3D device_property_read_bool(dev, "default-on=
");
> > > > +     def_value =3D device_property_read_bool(dev, "default-on");
> > > >
> > > >       gbl->gpiod =3D devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> > > >       if (IS_ERR(gbl->gpiod)) {
> > > > @@ -109,7 +89,15 @@ static int gpio_backlight_probe(struct platform=
_device *pdev)
> > > >               return PTR_ERR(bl);
> > > >       }
> > > >
> > > > -     bl->props.power =3D gpio_backlight_initial_power_state(gbl);
> > > > +     /* Not booted with device tree or no phandle link to the node=
 */
> > > > +     if (!of_node || !of_node->phandle)
> > > > +             bl->props.power =3D def_value ? FB_BLANK_UNBLANK
> > > > +                                         : FB_BLANK_POWERDOWN;
> > > > +     else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> > > > +             bl->props.power =3D FB_BLANK_POWERDOWN;
> > > > +     else
> > > > +             bl->props.power =3D FB_BLANK_UNBLANK;
> > > > +
> > > >       bl->props.brightness =3D 1;
> > > >
> > > >       backlight_update_status(bl);
> > > > --
> > > > 2.23.0
> > > >
