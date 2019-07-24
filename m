Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DB772CFF
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 13:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfGXLM2 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 07:12:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39583 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfGXLM2 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 07:12:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so46490370wrt.6
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Mf8w5hPQ8vkoVY1yIn2y097hPhW6Wz39EJFUer/8/I=;
        b=RmdGRok0fXh/6pwCnKE20oo1XLTAnNpBQ/haiHKDt849cme4tzL7w6Uy1QaQVOeraA
         kMQpxu6aEqhCWOvu9huGYWkRbYFu0UsdSxnrBRtjeqJ6f1M12j43TRDv+Trm3V5Dd2ZQ
         FEeqmte9nGupLrujUrDcfuhTbB+/Un26j7BM6cSbLsTTuxKUET2fMxOsat3mPOonuh0m
         jyPqjTQiF2GvoPNrKGJMLG94+hEiomyQ/71hbuMYwy43WgZtGoY+Kwi9b/S4+DH1+Nvn
         MqfRXgoQuMT23Xv/h+9H1/UMJQxy6Ewu8liXu08KkLR2jZPS6CpACmme/592N09VbnC3
         FlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Mf8w5hPQ8vkoVY1yIn2y097hPhW6Wz39EJFUer/8/I=;
        b=oDH0ogxECGMGC3EhN0zbLS7d/cNb8HoWdSO0oOIiD47X2d5OfB6CBtdzSW0halBrVl
         T9eW4MnBzfbLz2Yawx/Bt3HjwNyP6C6GXP7Jasl67B2Y/3+JEv+6t20yqzfLCedPafXS
         /sMFNfSaPkXPNfM/ZsMiI6io4/bdbQl4I/GDKZFQNgULO+NTYt4030alYCVRT+NafYYI
         2rfLTPjunxirRbgwpYXKkzaWBgJYkDn/yethZMGpN6LNXDdQveTrwSzVjHVr3B3P3ycH
         V/Ypi+Ap2bWDXYfWvgIVoLSOLV0dEtLpawJUrTbe8/bs47BMnb693VMAsDACz1hXzpr9
         1Ftw==
X-Gm-Message-State: APjAAAXp1vOeNtwO/FQJlPiJ5yfpTa/39LBjJ2Lb//xHMTDAHr2D63MB
        bTvkCX2hBTrHf9cUrd11pjkzmw==
X-Google-Smtp-Source: APXvYqyGihY987W1wtDENE5DlizL290ek5v9J4SXoQGdoqEePNMqO7vAu54DHqwKZ688fzGQ2kh5wA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr15180099wrp.32.1563966745286;
        Wed, 24 Jul 2019 04:12:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id j33sm89874753wre.42.2019.07.24.04.12.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 04:12:24 -0700 (PDT)
Date:   Wed, 24 Jul 2019 12:12:22 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190724111222.6wcq72btthz4l3r7@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-3-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 24, 2019 at 10:25:03AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Now that the last user of platform data (sh ecovec24) defines a proper
> GPIO lookup and sets the 'default-on' device property, we can drop the
> platform_data-specific GPIO handling and unify a big chunk of code.
> 
> The only field used from the platform data is now the fbdev pointer.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/gpio_backlight.c | 64 +++++-------------------
>  1 file changed, 13 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index e84f3087e29f..01262186fa1e 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -55,30 +55,6 @@ static const struct backlight_ops gpio_backlight_ops = {
>  	.check_fb	= gpio_backlight_check_fb,
>  };
>  
> -static int gpio_backlight_probe_dt(struct platform_device *pdev,
> -				   struct gpio_backlight *gbl)
> -{
> -	struct device *dev = &pdev->dev;
> -	enum gpiod_flags flags;
> -	int ret;
> -
> -	gbl->def_value = device_property_read_bool(dev, "default-on");
> -	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> -
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -
> -		if (ret != -EPROBE_DEFER) {
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		}
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct gpio_backlight_platform_data *pdata =
> @@ -86,6 +62,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> +	enum gpiod_flags flags;
>  	int ret;
>  
>  	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
> @@ -94,35 +71,20 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  
>  	gbl->dev = &pdev->dev;
>  
> -	if (pdev->dev.fwnode) {
> -		ret = gpio_backlight_probe_dt(pdev, gbl);
> -		if (ret)
> -			return ret;
> -	} else if (pdata) {
> -		/*
> -		 * Legacy platform data GPIO retrieveal. Do not expand
> -		 * the use of this code path, currently only used by one
> -		 * SH board.
> -		 */
> -		unsigned long flags = GPIOF_DIR_OUT;
> -
> +	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
> -		gbl->def_value = pdata->def_value;
> -		flags |= gbl->def_value ? GPIOF_INIT_HIGH : GPIOF_INIT_LOW;
> -
> -		ret = devm_gpio_request_one(gbl->dev, pdata->gpio, flags,
> -					    pdata ? pdata->name : "backlight");
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "unable to request GPIO\n");
> -			return ret;
> +
> +	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
> +	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
> +	if (IS_ERR(gbl->gpiod)) {
> +		ret = PTR_ERR(gbl->gpiod);
> +		if (ret != -EPROBE_DEFER) {
> +			dev_err(&pdev->dev,
> +				"Error: The gpios parameter is missing or invalid.\n");
>  		}
> -		gbl->gpiod = gpio_to_desc(pdata->gpio);
> -		if (!gbl->gpiod)
> -			return -EINVAL;
> -	} else {
> -		dev_err(&pdev->dev,
> -			"failed to find platform data or device tree node.\n");
> -		return -ENODEV;
> +		return ret;
>  	}
>  
>  	memset(&props, 0, sizeof(props));
> -- 
> 2.21.0
> 
