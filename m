Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867EE72D0C
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfGXLNF (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 07:13:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51368 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfGXLNF (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 07:13:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so41454304wma.1
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VoTHpFzQYPjvAZfIE3OYqA2wlNclaoN9MrmSNOMVyog=;
        b=sNZKGEKeF2gx87AyJo4R5CYbJaKpY/ihuXG0R7rQkW4wRe4s2JJbI+yIG04881Spln
         gd+DDll/gXoZRxNp19YBgqDXmF/J+0pP21GtLnClf7RwOJrvY354Fdm3TfcMG27l63qb
         rMGjgtPNIv3Z8NCYxq/ew31B7rBrTn31oGGfsRMlZ+K4t1aL/uS2X3qN10x+rDHfzoVN
         9oxoUbHx79nwVpzbwRtVzJyRxByvgMGXYTLE7oEnIHYsTnXfJGUTSexU3YlM7mA6j/wd
         P1oV6X9iodNVjStiYAXUe2ytdYHKY/wSwZf8T4sH5oDYRLPUOay3M6DU2+z9flz1/QzN
         54FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VoTHpFzQYPjvAZfIE3OYqA2wlNclaoN9MrmSNOMVyog=;
        b=IoT/mjXly2ci0xwYP8UxR8atll8AJRy5E7GFJjh13KcHuUiolqAdGROoJqfYJTyRIx
         SD7Nlz6lZikeZixEG8X1rSaX3OfR2iYR8UI7WcD5R51Jv6eY9isyeKAczvCPQ9SF8ujh
         oLqfaKqaLAZbcrNq/bxvqY8cySyCJd77CebbpQjlT6sIAMyDlW5T5XdsJEacEtqIL0Jl
         4YT2RXgOqO1joCBCrlnfZch7p/ndNnN4ryW8uU8RUNI6+5qvSTaX6WZgN7KoJ/PgUhtt
         Zyem/K7jwcXPI2u572+yEerhfHQr1bdwuqfPYeYW26FWigMVNzAyofE+Y1H3HoXRS6ug
         BaKw==
X-Gm-Message-State: APjAAAVPPHpFFRiBPpmgfvmoRRUpcdxbjsEPLxvc0GG22vvCKlFqeOnR
        TGJJTd+umRuhHO2baQBxtPS1wQ==
X-Google-Smtp-Source: APXvYqwL4FGhbU5IvgYchPKITgSwCC6hxbCyT7AAsCPQGSECzuD1QkWBPt0+GgsrgAixoJZK+W4tng==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr72652355wme.163.1563966783080;
        Wed, 24 Jul 2019 04:13:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id p18sm45929436wrm.16.2019.07.24.04.13.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 04:13:02 -0700 (PDT)
Date:   Wed, 24 Jul 2019 12:13:00 +0100
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
Subject: Re: [PATCH v3 4/7] backlight: gpio: remove unused fields from
 platform data
Message-ID: <20190724111300.pt624m3olrpzp4nj@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-5-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 24, 2019 at 10:25:05AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Remove the platform data fields that nobody uses.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/platform_data/gpio_backlight.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
> index 34179d600360..1a8b5b1946fe 100644
> --- a/include/linux/platform_data/gpio_backlight.h
> +++ b/include/linux/platform_data/gpio_backlight.h
> @@ -9,9 +9,6 @@ struct device;
>  
>  struct gpio_backlight_platform_data {
>  	struct device *fbdev;
> -	int gpio;
> -	int def_value;
> -	const char *name;
>  };
>  
>  #endif
> -- 
> 2.21.0
> 
