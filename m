Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651A472D20
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 13:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfGXLN0 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 07:13:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40054 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727597AbfGXLNY (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 07:13:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so46514116wrl.7
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NvtrvMV4Nt63Balca848q6E3+ZhiwJtTkFp748N0uOg=;
        b=KNjXtO5njYFUIck/ozHOGMIWJ6z+FSABuu2c1L59UTM9K87f1GzdoroCF41tDBxyrR
         7k+3fRTPUuhaq3B9Hijc4O3kz+rsb715JXcHhmvy1cm/35kj00R/EzG/AUcxC0wYxppv
         iBNLNR0Qu5clqaICWCeBMs7+LCiY7oa2wyFkQ4Nr6JaJiBv0yc9XgOn8jvykpYj4jW3W
         V7sQmX8uE7OD2tdKkFLBFOh541lVAexffqWUb9dR4X2gRStG/Mh45aD1PUGXtyWMOwnB
         /9zrSd3j+rQ0U9jRbeOYdTkoQdGX8XweZvzgaNJlPlXtjl8+spgMq1rkvRyuwBZuvav9
         Bcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NvtrvMV4Nt63Balca848q6E3+ZhiwJtTkFp748N0uOg=;
        b=MrTUoC7l/ZotA7j0Mb055atqho5K/PUFMTEF3Va0SVDiSHye15UDk5Z8PU1+xqd11f
         FsHf6wQi5m9FK1DTXtSkP3BOB3kWl6SFH7iBBY9wOZj9pBv7RTsncxpi9YdJlFIAHj6C
         lQNkhotZa2tWDb8MLaxAEV8HJxIFYqqZNB2Wi48zbOxFzCweQlScaTk7xenZkJhPiWEk
         7OMLbxg/+97wIESN1oo/itK7HuRQUco89rhLZuzbkcdmUxQ08AB2VRYRJYChzsLB4X4Q
         HEkZWbwAzRtUf2PNRQnz7ktlLM6mxVtCobbmgJNdsedB5ncSwgs/1Uus7ozzG6VqWW8s
         KJ3Q==
X-Gm-Message-State: APjAAAXNN9mL32dDv5fRu7U0qSQDdly+Wd1LFrC4pl5ORf6hl60uwTyx
        mAgTaPfP2snO8h1XlsslHph5oA==
X-Google-Smtp-Source: APXvYqx/dJQm29UHdXc22ek+l/R3WZ8DvlqPT7fB+ZSBlOpP1Vt6kKQ09cwEg8JrNSUsNUX8cyM6bw==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr93203495wro.284.1563966802936;
        Wed, 24 Jul 2019 04:13:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c30sm80678542wrb.15.2019.07.24.04.13.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 04:13:22 -0700 (PDT)
Date:   Wed, 24 Jul 2019 12:13:20 +0100
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
Subject: Re: [PATCH v3 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Message-ID: <20190724111320.wqcquhmlylgfkv6f@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-7-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 24, 2019 at 10:25:07AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This field is unused outside of probe(). There's no need to store it.
> We can make it into a local variable.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
