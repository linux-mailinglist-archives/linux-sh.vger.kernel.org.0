Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5478CDE9FA
	for <lists+linux-sh@lfdr.de>; Mon, 21 Oct 2019 12:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfJUKpO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 21 Oct 2019 06:45:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40608 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfJUKpN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 21 Oct 2019 06:45:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id o28so13359087wro.7
        for <linux-sh@vger.kernel.org>; Mon, 21 Oct 2019 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CJo1vGs4ohyige0AyAjrZb8zyvlwhFRLiB6YWgX+C3o=;
        b=lUNMfWi8td8fXPOYsOUuMBA9nWhRm0sBIXWMkl4sTFpawsp/CTPCpFr6O8gwzrzkgk
         pkxXJHfF/gQ3TH5qexZiA6RIH368flsN8Q+PTma85+Ev6H7rpZsULwO8EYlzGqtRM4gw
         7rj2u20jS7LAGi79W7V6cauUS6INpXUN64sMSlhP6LYN+rfZ8nrOtLkRdsGrYBQLjaWn
         rkgJ5ukLRCJEzn35zoa5dDskWA+2SzE5LItepTXVZpSDG8HN32mqrw2Nw26qf845wK/e
         D25QsJ3zYhtkMR6iFCZBrEwuV8SpHikU8FdSzNcQxPV+dujq4CCtNkJmNqJRRNfiwSe/
         7iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CJo1vGs4ohyige0AyAjrZb8zyvlwhFRLiB6YWgX+C3o=;
        b=tou6yTyHveEnlTw0grMewiOvX73sLEXVvjvlrQJN0bTK9EfTexZdDniboJJs/Q1CbG
         pBsIXIHfEf4wcH0+A+QcS9fJS480ODbzIZEc5Ee/UQzU7Oa4anQZB+NX1hNPwQdISzUh
         xQg278G1ovz3dCbG6swF3fvI+J7xkmT1Yon9k0Q9u6159Ef8iY+HdagxNcSCWr3LtVWv
         EP30DVaM3KJjwLna8C2UaUso226kgupQW3BhLODyjLREZj0nG3iFNmVe2fogfyD5iqhi
         3maUi025SiJFuFy0r6jgZJMcj9BWuCzrdKeWal5S1aq19JDViMnxIrOUVh8jLJzuTdDP
         xf7A==
X-Gm-Message-State: APjAAAUS2RXnq/r0mCddU7FYreJMxURFPLkUGwg9r3IT9ohjAriLc73h
        qUJbbxvHgOPBQMpvRe8oWu1eUw==
X-Google-Smtp-Source: APXvYqyOQqTEEe1cFPC48dBEDv70QO6nfTk62LM9CE+MhYiYoDPtFAT2lTxhyOfs7dYa1VCwfKoJrQ==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr17537508wrp.139.1571654711412;
        Mon, 21 Oct 2019 03:45:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x21sm921318wmj.42.2019.10.21.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 03:45:10 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:45:09 +0100
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
Subject: Re: [PATCH v6 3/9] backlight: gpio: explicitly set the direction of
 the GPIO
Message-ID: <20191021104509.p2bsll3rwe7ica6t@holly.lan>
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191019083556.19466-4-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, Oct 19, 2019 at 10:35:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The GPIO backlight driver currently requests the line 'as is', without
> acively setting its direction. This can lead to problems: if the line
> is in input mode by default, we won't be able to drive it later when
> updating the status and also reading its initial value doesn't make
> sense for backlight setting.
> 
> Request the line 'as is' initially, so that we can read its value
> without affecting it but then change the direction to output explicitly
> when setting the initial brightness.
> 
> Also: check the current direction and only read the value if it's output.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Intent looks good to me but...

> ---
>  drivers/video/backlight/gpio_backlight.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 3955b513f2f8..a36ac3a45b81 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -25,9 +25,8 @@ struct gpio_backlight {
>  	int def_value;
>  };
>  
> -static int gpio_backlight_update_status(struct backlight_device *bl)
> +static int gpio_backlight_get_curr_brightness(struct backlight_device *bl)

This function does not get the current brightness (e.g. what the
hardware is currently doing). Given we've just nuked the function that 
*did* get the current brightness from the hardware this isn't an
acceptable name.

Would like something like calc_brightness() or get_next_brightness().


Daniel.
