Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273E0C4B7A
	for <lists+linux-sh@lfdr.de>; Wed,  2 Oct 2019 12:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfJBKdZ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Oct 2019 06:33:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35178 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbfJBKdY (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Oct 2019 06:33:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id y21so6418610wmi.0
        for <linux-sh@vger.kernel.org>; Wed, 02 Oct 2019 03:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wUZHS/G+/EfCLIw5f+SykywrhoRFuqH9n5f7oduoqzw=;
        b=aPJlKuY+eRR4q5p4jV4qCpE0b1aKVkj4+PZrZUlv5v56zXOetpNPtg02as20aFegDv
         7TeZz7ikn+LWA9jblA9+VZiAVm1XySTwn2milAAYnC2Rzv7xJY//GDYipTlAoQ3KMQ4R
         CwpYuupqRmGdKbHBvIqoOJDP6OlRiysRgy9YYBruBRJvud2PD7QBdtZ7f2ujAweX5ku2
         ssysEGjpCUtCqvPzBNgRpqRR3fDgveWyhWxUpQ3dreoWvdrLvl7FOJeJIR3Wx/Q+SQnc
         IB1CtCW//A0NqLofsKyy8Il33UA302qkDIijV1Rcz7nCZXrsqmtcBOv+PpAGlO4pRa2N
         zHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wUZHS/G+/EfCLIw5f+SykywrhoRFuqH9n5f7oduoqzw=;
        b=WOavFFLOezcu8MkQiNRqOslySV4gRtq4WGJqchXt0U7SZpqJ0grB/K05FdAEquObeR
         V7TwkwNNBfjngE8xo2fV63XtH9YZ1eLE1wK0xZpbqCQorOvof2HO6Ls2tCEf7TKbuhmm
         iB0r1sS3xMvAy2FaUNyi7UHiMx1XH+eyYadqrQ+SJFIDZM1i0cu2Q+uP+Kci7MGQiuXu
         0QkSBHDJkmj/5ENTPseTovM+3zfNda1hC4826TFkV3DpboVSeJ7QxThSwxn+w9J6YPAV
         CnWZJ8ui6Xy7SvNbw2eCrSPT9cPn5P14gAnAPy0+0vo5XyttxwTBufpWKl8qMjE5wEVr
         0F1w==
X-Gm-Message-State: APjAAAUZp12yvRneZiEgrDx/qN3ihN/pWvOyuN5ULjeI32T13/+35Foo
        p1tUzYke0Mcwop1x869CfoBWEg==
X-Google-Smtp-Source: APXvYqxcIUrjme+4/WrQIVIVSQ0R4d5tae6DJjxe9DjuXTy5Z9r8cXcOD8GRy4ZpWXRQoBkLG0CdNQ==
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr2439604wmr.143.1570012400648;
        Wed, 02 Oct 2019 03:33:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id l10sm26838984wrh.20.2019.10.02.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 03:33:20 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:33:18 +0100
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
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191002103318.6owxberhml6mbtxm@holly.lan>
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001125837.4472-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Oct 01, 2019 at 02:58:37PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The probe function in the gpio-backlight driver is quite short. If we
> pull gpio_backlight_initial_power_state() into probe we can drop two
> more fields from struct gpio_backlight and shrink the driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 36 ++++++++----------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6247687b6330..37ec184f0c5c 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -17,11 +17,8 @@
>  #include <linux/slab.h>
>  
>  struct gpio_backlight {
> -	struct device *dev;
>  	struct device *fbdev;
> -
>  	struct gpio_desc *gpiod;
> -	int def_value;
>  };
>  
>  static int gpio_backlight_update_status(struct backlight_device *bl)
> @@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_ops = {
>  	.check_fb	= gpio_backlight_check_fb,
>  };
>  
> -static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)

I'm inclined to view deleting this function as removing a comment (e.g.
the function name helps us to read the code)!

Removing the variables from the context structure is good but why not
just pass them to the function and let the compiler decided whether or
not to inline.


Daniel.


> -{
> -	struct device_node *node = gbl->dev->of_node;
> -
> -	/* Not booted with device tree or no phandle link to the node */
> -	if (!node || !node->phandle)
> -		return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> -
> -	/* if the enable GPIO is disabled, do not enable the backlight */
> -	if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> -		return FB_BLANK_POWERDOWN;
> -
> -	return FB_BLANK_UNBLANK;
> -}
> -
> -
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
> +	struct device_node *of_node = dev->of_node;
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> -	int ret;
> +	int ret, def_value;
>  
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
>  		return -ENOMEM;
>  
> -	gbl->dev = dev;
> -
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -	gbl->def_value = device_property_read_bool(dev, "default-on");
> +	def_value = device_property_read_bool(dev, "default-on");
>  
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
>  	if (IS_ERR(gbl->gpiod)) {
> @@ -109,7 +89,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return PTR_ERR(bl);
>  	}
>  
> -	bl->props.power = gpio_backlight_initial_power_state(gbl);
> +	/* Not booted with device tree or no phandle link to the node */
> +	if (!of_node || !of_node->phandle)
> +		bl->props.power = def_value ? FB_BLANK_UNBLANK
> +					    : FB_BLANK_POWERDOWN;
> +	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> +		bl->props.power = FB_BLANK_POWERDOWN;
> +	else
> +		bl->props.power = FB_BLANK_UNBLANK;
> +
>  	bl->props.brightness = 1;
>  
>  	backlight_update_status(bl);
> -- 
> 2.23.0
> 
