Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDB272D2B
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 13:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfGXLOG (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 07:14:06 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40832 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbfGXLOD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 07:14:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so41269445wmj.5
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7NyRu0tx3w+dLLQ6/dneDxJh1D9iVMTSGGH2CPUAo/c=;
        b=ufYYjVec/kvhmg39Q3zq/jFjiLdLC9vtny5aJgVO4Lp225heuEYfYuddTPewKY68GB
         GFd9hONJsyc/pjx7948e2iiOHpwjxBH1adsyByDlp2IVTXsmBc5J/T2Q13mP4Je306Ah
         whztj9zZujrWsLF/GxRhou1EKUfVQDIs4rhTUix2oaCIlIXcFEK7YVAGTTNpgg1S3bcc
         cTG22FbrfXPgn1yleXnMI4R3t7xJeEXNJ42G4rL0u1j+slO9cBA/AeIeUBd4PW1SQ3EE
         GvXB6ePJhAsLZCprxL28nuwbJtvJZvpQlsOm/o+9bMvbOG8wD/nXyunAit68PGMWKZEh
         CkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7NyRu0tx3w+dLLQ6/dneDxJh1D9iVMTSGGH2CPUAo/c=;
        b=bjU+c+fpPwhjmpL7NCfA3bqA9qEQ0DGOhZ5/Wbjn5XWMQRuMiowLdBp0siiBBq1r13
         5KOGCaZJX0h7CRdMraJr+AIEaU4WUZfyY0BCDKpchKZ7OlaTNP7DIXSOS4woPDLqAFAP
         7pc3JxtkdqJ0NFHyKbmF+nkYvKZkcpCMcJQqf3E3MUnsui4kN2VHOZP6YTXNGPCHS8Ot
         0usc9cOiTtVky3TwCRro1tbzA5fE7uBV8VG6hVme468N2OYWbSTt6nOi6C+ZT1HvOY5c
         /yrptL/XRuEKcwGnUJLk7rX4tJ2tk7DojIth5ikQCxUkiO46YNE7uj/E9t4QEL7rLPjC
         Q9RA==
X-Gm-Message-State: APjAAAW2rSx795M+dEmgc2lP7U4rFrl0LSEZy5TzTab98APo84ci5gQz
        qyvr4nAwvfZlgR3NRYtBro4kAg==
X-Google-Smtp-Source: APXvYqzfMApTQXYMpBScWR9bk4kJ2771Xs86B/GfU/9afdNHqXHh096SssyjdsJTlYUpAz1NrlsIJg==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr78332968wmf.0.1563966841429;
        Wed, 24 Jul 2019 04:14:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u13sm54703536wrq.62.2019.07.24.04.14.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 04:14:00 -0700 (PDT)
Date:   Wed, 24 Jul 2019 12:13:59 +0100
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
Subject: Re: [PATCH v3 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190724111359.c262dcwwikn3j7fu@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 24, 2019 at 10:25:08AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Instead of dereferencing pdev each time, use a helper variable for
> the associated device pointer.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/gpio_backlight.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index cd6a75bca9cc..7dc4f90d926b 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -54,29 +54,29 @@ static const struct backlight_ops gpio_backlight_ops = {
>  
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
> -	struct gpio_backlight_platform_data *pdata =
> -		dev_get_platdata(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	enum gpiod_flags flags;
>  	int ret, def_value;
>  
> -	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
> +	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
>  		return -ENOMEM;
>  
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -	def_value = device_property_read_bool(&pdev->dev, "default-on");
> +	def_value = device_property_read_bool(dev, "default-on");
>  	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>  
> -	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
> +	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
>  	if (IS_ERR(gbl->gpiod)) {
>  		ret = PTR_ERR(gbl->gpiod);
>  		if (ret != -EPROBE_DEFER) {
> -			dev_err(&pdev->dev,
> +			dev_err(dev,
>  				"Error: The gpios parameter is missing or invalid.\n");
>  		}
>  		return ret;
> @@ -85,11 +85,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = 1;
> -	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
> -					&pdev->dev, gbl, &gpio_backlight_ops,
> -					&props);
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> +					    &gpio_backlight_ops, &props);
>  	if (IS_ERR(bl)) {
> -		dev_err(&pdev->dev, "failed to register backlight\n");
> +		dev_err(dev, "failed to register backlight\n");
>  		return PTR_ERR(bl);
>  	}
>  
> -- 
> 2.21.0
> 
