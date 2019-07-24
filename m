Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F3472D18
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 13:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfGXLNU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 07:13:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43456 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfGXLNP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 07:13:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so46492708wru.10
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7Vbm5wjodc/SiuXfd2hEHkZgRHnDrgsvnClch0dv500=;
        b=zjqzTsV3sC2VxjWuPXKIKiVPljJPuNhPm9Eo3muadrJX0uOfyeRP1+0z8ruC5+uBE8
         kVQXypwUufH1EOWhSVEgvJXaLmrs0dD55o0bQZSbPtok43uPOWIpgx/J9ZAgKcMaFDvL
         Q40uZcOODl7gy7dZ7D8EvD3qHOxoegPBkNvZbDy2dht2yPpcz8YA3FqP8NlU2lS2Msop
         7sLjI5SyXrArFojZqSZa/e/oXEezqOZOSvnXHGQv8PbPyAG2kVKvRxQ73NEGep2YjF3P
         9dVHmIOtgEXHiVWyCgsdpGlyQcxDu6ipd0Rj/NtFnYRAUHak5chJc/jqi6L4LTZESixq
         xvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Vbm5wjodc/SiuXfd2hEHkZgRHnDrgsvnClch0dv500=;
        b=KPgZSLRD5Vtp8yadXlUJS8JBBcG7Hx+YfAwd9dI9g5DVRLqgJ6R2wie46ydTRb1B9I
         Jz2LjhOLlExBYUcjnxeuxZL3hDLorREwvKkn/jA8WK+xZnrYODgxyg0p/W04TbGcZna+
         5hhDJpewlhBEjaVDE3FD/5YmIsrboxU5wbl5Wg6UyyXqnwzm6pKmoEziqp81TElXbaTQ
         WbRsrt2JI1ZbIgFvPQKaQe9tTg/XrCQrLlY/lUfUoX/hjTalyg1zuOdvZn8j3Fq8k+Bg
         FKw7KuqCjd4z2RyUns0q/dF1SsLcXjggwDHWDhC1G3H/EvueepL7rt/jRxYxCAddfQGE
         awgQ==
X-Gm-Message-State: APjAAAV5GDJHRkLC8JQrirB6vthjO5yM901mkrzf271bYI9JkQCK/Voq
        ABe09uyhyG9b6iHAKq+t9Yl1S4ZFMSvqwA==
X-Google-Smtp-Source: APXvYqxXj3Bvg1DEF4zdhtIcF4p/ecaSTdTJ//QjjR1Lmf36EMffI7ShBaIJZCpNdPfg/rB/y9TOjQ==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr72432053wrn.198.1563966793314;
        Wed, 24 Jul 2019 04:13:13 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id g10sm33641138wrw.60.2019.07.24.04.13.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 04:13:12 -0700 (PDT)
Date:   Wed, 24 Jul 2019 12:13:11 +0100
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
Subject: Re: [PATCH v3 5/7] backlight: gpio: remove dev from struct
 gpio_backlight
Message-ID: <20190724111311.zkhc4qzdktrw4sak@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-6-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 24, 2019 at 10:25:06AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This field is unused. Remove it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/gpio_backlight.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 01262186fa1e..70882556f047 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -19,9 +19,7 @@
>  #include <linux/slab.h>
>  
>  struct gpio_backlight {
> -	struct device *dev;
>  	struct device *fbdev;
> -
>  	struct gpio_desc *gpiod;
>  	int def_value;
>  };
> @@ -69,8 +67,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	if (gbl == NULL)
>  		return -ENOMEM;
>  
> -	gbl->dev = &pdev->dev;
> -
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -- 
> 2.21.0
> 
