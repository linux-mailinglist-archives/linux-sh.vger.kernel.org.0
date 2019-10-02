Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3AEC8B70
	for <lists+linux-sh@lfdr.de>; Wed,  2 Oct 2019 16:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfJBOke (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Oct 2019 10:40:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40964 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJBOke (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Oct 2019 10:40:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id q9so1185293wrm.8
        for <linux-sh@vger.kernel.org>; Wed, 02 Oct 2019 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xuPflzsn/0nMabRW/MT553ev9ccDXsf7U9hGD8MKLiQ=;
        b=fOezBZRIOhBkH0+vOGOc3bn1f17r8HHWo8A5N5YSHRzL4/NECJx88ValUy/FtgO38s
         wrpkjJPcQaNWYASNYWewe6y7sx5LBiDuBUM7dG+3P/DOmLVVVtfPpbzSc3lGVvsuitsH
         pt+zI5lzIvDBkRvauPQlVLyDxzXBETF5eU5vGfr6XVPiKCgbd1QHVop9rag2R7cTAXPr
         XO0RBqOh9es8AVuKG1hWJL4vtGMVZSb1P/uRxHo6L0B7y04cf8gvl+cpjIdE8uOkNlzo
         i8xMJi8/uES3znh5rQyWSpRNdcbndC0ts2GFvEQPTsvIksQQW3WsfUSbFFT20Srw8Q5R
         Kxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xuPflzsn/0nMabRW/MT553ev9ccDXsf7U9hGD8MKLiQ=;
        b=LOmfe+sHI5qn20lUMHXIVHSX5IxSEQzodwOc8lCtt693KpU7p4GuNi8Eb07JFgZn6D
         aVLDqmPnE6csHOVv1SZ3CtXWMONxuixdpkofx3ceCcX6j7L1EKb82XSTOujdsf/p7M+p
         kw2gwvOuZfR/jfBQtAHVPzdhQe+y1p4ZZnykTxSag29R4hfmPk3c4OIylkT/rbEPX3dT
         z5eQlNaEVwKR3ylPVTA5gw9CIj3DGSQEq6Ccc05rOKDwOrmTzdNoONJK/jCnrlpwfPDM
         W2oEHf4paQ6q56xHPjVzQSaqNBnKss4rzP9f0YkRx7pdTeh3itRR2GYlfy1K3zzCIdoH
         jRbw==
X-Gm-Message-State: APjAAAUDG5RNJgMdutz8W6iiTPA3L9Hgk6LR/ZsOIcu7GRZyK0IU8/Ew
        FsUZgnAmiGK38NEk8nZqXegRfA==
X-Google-Smtp-Source: APXvYqxQzBe+7CgqDzvsjEknR8XWWPUStRqOZFa+eeAeIp6SkL1kb0FfgkR6tRNbregbg88YHzUFfg==
X-Received: by 2002:adf:e64e:: with SMTP id b14mr3258477wrn.16.1570027231302;
        Wed, 02 Oct 2019 07:40:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u10sm5853717wmm.0.2019.10.02.07.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:40:30 -0700 (PDT)
Date:   Wed, 2 Oct 2019 15:40:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
Subject: Re: [PATCH v4 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191002144028.6lljre76zxd52oui@holly.lan>
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-8-brgl@bgdev.pl>
 <20191002103318.6owxberhml6mbtxm@holly.lan>
 <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Oct 02, 2019 at 01:46:17PM +0200, Bartosz Golaszewski wrote:
> śr., 2 paź 2019 o 12:33 Daniel Thompson <daniel.thompson@linaro.org> napisał(a):
> >
> > On Tue, Oct 01, 2019 at 02:58:37PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > The probe function in the gpio-backlight driver is quite short. If we
> > > pull gpio_backlight_initial_power_state() into probe we can drop two
> > > more fields from struct gpio_backlight and shrink the driver code.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  drivers/video/backlight/gpio_backlight.c | 36 ++++++++----------------
> > >  1 file changed, 12 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> > > index 6247687b6330..37ec184f0c5c 100644
> > > --- a/drivers/video/backlight/gpio_backlight.c
> > > +++ b/drivers/video/backlight/gpio_backlight.c
> > > @@ -17,11 +17,8 @@
> > >  #include <linux/slab.h>
> > >
> > >  struct gpio_backlight {
> > > -     struct device *dev;
> > >       struct device *fbdev;
> > > -
> > >       struct gpio_desc *gpiod;
> > > -     int def_value;
> > >  };
> > >
> > >  static int gpio_backlight_update_status(struct backlight_device *bl)
> > > @@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_ops = {
> > >       .check_fb       = gpio_backlight_check_fb,
> > >  };
> > >
> > > -static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
> >
> > I'm inclined to view deleting this function as removing a comment (e.g.
> > the function name helps us to read the code)!
> >
> 
> Right, but why not just add a comment then?

I guess you could add a comment but keeping it pulled out in a function
makes it easier to compare against equivalent code in other drivers
(such as pwm_bl).


Daniel.


> The probe function is 50
> lines long, there's really no need to split it. This will get inlined
> anyway too.
> 
> Bart
> 
> > Removing the variables from the context structure is good but why not
> > just pass them to the function and let the compiler decided whether or
> > not to inline.
> >
> >
> > Daniel.
> >
> >
> > > -{
> > > -     struct device_node *node = gbl->dev->of_node;
> > > -
> > > -     /* Not booted with device tree or no phandle link to the node */
> > > -     if (!node || !node->phandle)
> > > -             return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> > > -
> > > -     /* if the enable GPIO is disabled, do not enable the backlight */
> > > -     if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> > > -             return FB_BLANK_POWERDOWN;
> > > -
> > > -     return FB_BLANK_UNBLANK;
> > > -}
> > > -
> > > -
> > >  static int gpio_backlight_probe(struct platform_device *pdev)
> > >  {
> > >       struct device *dev = &pdev->dev;
> > >       struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
> > > +     struct device_node *of_node = dev->of_node;
> > >       struct backlight_properties props;
> > >       struct backlight_device *bl;
> > >       struct gpio_backlight *gbl;
> > > -     int ret;
> > > +     int ret, def_value;
> > >
> > >       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> > >       if (gbl == NULL)
> > >               return -ENOMEM;
> > >
> > > -     gbl->dev = dev;
> > > -
> > >       if (pdata)
> > >               gbl->fbdev = pdata->fbdev;
> > >
> > > -     gbl->def_value = device_property_read_bool(dev, "default-on");
> > > +     def_value = device_property_read_bool(dev, "default-on");
> > >
> > >       gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> > >       if (IS_ERR(gbl->gpiod)) {
> > > @@ -109,7 +89,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
> > >               return PTR_ERR(bl);
> > >       }
> > >
> > > -     bl->props.power = gpio_backlight_initial_power_state(gbl);
> > > +     /* Not booted with device tree or no phandle link to the node */
> > > +     if (!of_node || !of_node->phandle)
> > > +             bl->props.power = def_value ? FB_BLANK_UNBLANK
> > > +                                         : FB_BLANK_POWERDOWN;
> > > +     else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> > > +             bl->props.power = FB_BLANK_POWERDOWN;
> > > +     else
> > > +             bl->props.power = FB_BLANK_UNBLANK;
> > > +
> > >       bl->props.brightness = 1;
> > >
> > >       backlight_update_status(bl);
> > > --
> > > 2.23.0
> > >
