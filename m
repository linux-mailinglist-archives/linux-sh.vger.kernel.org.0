Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD777038C
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbfGVPUs (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:20:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40575 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfGVPUs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:20:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so35760871wmj.5
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rcQE3lqQ7qHdpTliGnphmcGBT5sq5T1i6sYO3p/vgc8=;
        b=V+zBb66mMoZKT+uP6vSPu6gSa0cocMmWscUDuipWZQXinBTzJl0+/SZPTSnx/eG+W7
         M2gj/SB4fPiH3QDjf67mfQ8Nq5e0taThlxRK+Pbv7iY6AjFz4MRd5WmNbZAH+RPBNaXn
         oOJ3sPFg2QfJ4sHMHeXZKOUX6YXHy+63u7p2v9E8LBX9VH9uUxjd8OySrTsVephTd/5R
         zd5znXce9+FzwhGw8znDlGTMr6/pjW832Gw97gSXXtorFOujysfZYyCcISGscjrm85Yj
         kuuLzWhOidE+E7wuLCQSBOYLTMQtQx0W6tctgLTMOj716nlnXLGkUcDWZPCJqLVA93M9
         0vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rcQE3lqQ7qHdpTliGnphmcGBT5sq5T1i6sYO3p/vgc8=;
        b=KlcQNjX/2ToKUlf/zNVekie9JPeeLB9zoPCRgmdZkJLWo413nsGISAIaIgQsjqK+TJ
         w/XyBbDmM0wy1k/Z1DOf4hkZv5pIJ05wal43CPgJZYukwoNRE9FAqU0RG0sqC7npolfN
         MukEmkkDM9VkV+EJvB1Axwm23hlEFx3c3PD9IpzA6eaEjZ86znPz1pdQjqXXpiCRCtgR
         177nlddlySfTZJAfezyvaUkVWCNdrlqcyGW/3eH89sL+mqZ5yP2rRif8Hc6sHpJYrukL
         Zd2XvTXX+A0pLxeTW8D408Muu/2g6TngfTc+KZxrlaU1/f5WUxhk7UGdN+/5FAetW0e+
         QuGw==
X-Gm-Message-State: APjAAAXSYIwG2yvlG6PGNz9yc0nTdo4zQZ2k/+dMqjn4R6u58ha7W1UK
        7eWjv14tNbnMTxOUUkfSF7/gOQ==
X-Google-Smtp-Source: APXvYqxCxsboFZaheGk5qi4oj8GmwA1c5IhO90rjs/b8WLMO0LzRMCPUTyNiuTec/jgg8DLQfEd8uA==
X-Received: by 2002:a7b:cc04:: with SMTP id f4mr65955957wmh.125.1563808846569;
        Mon, 22 Jul 2019 08:20:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a81sm39805102wmh.3.2019.07.22.08.20.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:20:45 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:20:44 +0100
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
Subject: Re: [PATCH v2 5/7] backlight: gpio: remove dev from struct
 gpio_backlight
Message-ID: <20190722152044.7zwf2xtzbpesjrmv@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-6-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 22, 2019 at 05:03:00PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This field is unused. Remove it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

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
