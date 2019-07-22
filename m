Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3928E70399
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfGVPWK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:22:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37144 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfGVPWK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:22:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so35733717wme.2
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CjN06kskuSN63zvz3I8U6ASqKJRxwYLJel4cw/9K0lw=;
        b=SW2BLq/I4O/PnHgn1NA2q1TeVho/oHOeDcYpL3qFIQggNojxG22k4aZiFGmAg3qjZw
         sNH03/H7fUd1hP+JYWFhSUX8oVoTRU3bnRNRtsbc1lJviN3M++fuo80AkU9hWv+dRbu6
         mg0kIKTw66qN8Z3uRv1t8IVBOT8WAVgLsmzb74vtLhqfx+4hcnmk6kNrJvkgbtcno8JY
         0FDCNFNg9zgMDxr5NKN1TXvrZYwVniccPCYF6S1oN3eH/gHp9jUbauxk12vI4YbezNDT
         UsyQt5Z+DG/nC780HdW0gYFTNsc/rKkiLemjOICIiX9L0i2dF+lRJlhDPXFtvtYGgReH
         kIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CjN06kskuSN63zvz3I8U6ASqKJRxwYLJel4cw/9K0lw=;
        b=oYGojShUGSUSWsaAjf+5kZs7uNOnfsW6oNDPJ0oyJiD3dc5Hrh/mhqX/Ot+BGwWRBU
         thRERpsLU8a4IWiwdLcXp/YAArwFvVC8vWyAg3lMCOZZv+0Qi+brWXZxxHyJ4gEZwSbg
         M6plI8Cw1Tne+QpcSBBEVcPUCXE2w2j/6e3jHKwmtO7Ij8+Mw0iazhGNbGPkjINYF3BV
         jcFLVmD9Wmv6eI5gQyccKQT4Ugh72lFaSMJvDE70rqehJtOPvP8LOFZzfu+KnPrpeKjs
         Rcg8l6xeAotcT8hbiX+6oHpKTNLhY0y5FoeT41UmYwLSefUks+IBHgbGMwYDFuZJuX2m
         hUfQ==
X-Gm-Message-State: APjAAAX2j5MGGNPOfu0CMYYN4aYCyR+K0QNJDTQPg0wmkcAhrAeu6R45
        THc+1F5Q9Myo63WJoZmjrw2AWWKNSTyBNA==
X-Google-Smtp-Source: APXvYqxEqJt2WlO+GoY0nM0FoV0BovseVpbAQSrNlFd4NlDuP4uXJmvali/FscgOt4YbJnNBVzR6bg==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr61057896wmk.99.1563808928497;
        Mon, 22 Jul 2019 08:22:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id i18sm51360450wrp.91.2019.07.22.08.22.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:22:07 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:22:06 +0100
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
Subject: Re: [PATCH v2 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Message-ID: <20190722152206.bfjlws53yknq3xv4@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-7-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 22, 2019 at 05:03:01PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This field is unused outside of probe(). There's no need to store it.
> We can make it into a local variable.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/gpio_backlight.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 70882556f047..cd6a75bca9cc 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -21,7 +21,6 @@
>  struct gpio_backlight {
>  	struct device *fbdev;
>  	struct gpio_desc *gpiod;
> -	int def_value;
>  };
>  
>  static int gpio_backlight_update_status(struct backlight_device *bl)
> @@ -61,7 +60,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	enum gpiod_flags flags;
> -	int ret;
> +	int ret, def_value;
>  
>  	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
> @@ -70,8 +69,8 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
> -	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +	def_value = device_property_read_bool(&pdev->dev, "default-on");
> +	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>  
>  	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
>  	if (IS_ERR(gbl->gpiod)) {
> @@ -94,7 +93,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return PTR_ERR(bl);
>  	}
>  
> -	bl->props.brightness = gbl->def_value;
> +	bl->props.brightness = def_value;
>  	backlight_update_status(bl);
>  
>  	platform_set_drvdata(pdev, bl);
> -- 
> 2.21.0
> 
