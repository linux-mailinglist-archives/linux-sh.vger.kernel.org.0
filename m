Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C8BCDAB4
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfJGDcP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:32:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34259 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbfJGDcO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:32:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id y35so7357160pgl.1
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v4a+pKVTYSrGaRJIHf88S7PAjoi+WG4Wfk9hIUcxXSg=;
        b=VEhWSNZoLO5WHHbpp9caxeGXuImosevibbsBdB/CmdKiB1x1QaJiw3PM+vtD47onTj
         YnRJWOaxfiYOZMGKnNbIAnpk+Lkq3FitSuXfKNWTeVjsYnLhroWVQs+X9ZiUO38IcwTd
         rYYrkk7IaNSq5w6fCEOUfRmZ9UZ8BXM1z/VvKLUdDa5+ITtgJ6i795wC/Ax32hcUvskA
         5XpcsN84YILPA2nLpfRifCQHKvAQu0rAFy8Ro1p1OrvG8Ax57GMGJEO+PYc96po6eCAp
         6cQLwl1Rsh7FmaNNg7cNvfCg8BiyO0ggdLaZlKDi4Ouwzk9EVF/CUd28ES5S5X3zjTX3
         ccJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v4a+pKVTYSrGaRJIHf88S7PAjoi+WG4Wfk9hIUcxXSg=;
        b=heagHuvr5O3Ri5NAQiR57emQxVVLCrsSnE+dHBPsAXRyPSOqWxbwlKP/1v76lKnteX
         M1zuJcKtv0FgtxG/YizyGjPaz8SPH1TwW/5RpqmIXqvDzIETLw9OiYy+ymXj+8X+9K9E
         rDrtcx0IW1033zg9eNSWiuVuX9Fapg8OiSwctBjynzkOw8pzb7ZbcP2adakI+gFR9I5I
         QT4DMI4SNETO7HTohmF8QHJUnc1pKjexW0ZKUfMg84xAWKxVlOC25an8oQADQAGAt572
         sg5msGwNi35evOaDEzpKEO2N8FhWXpW8RyB27++6mnthxT7IL8Os2OKf56018q/0aCbt
         Zw5Q==
X-Gm-Message-State: APjAAAWuvIktNbvmWOFQaoOE4zxUqTgBCx+oGX3oEuEwY4YPAC++bAtk
        4eDgjlMEjVtu7miC4j9euDfH2w==
X-Google-Smtp-Source: APXvYqxJi6Cn38KU2ldDEqD3uN4eN8sBJwkVwzMxJCScyN7v5yPIeq7dl+xAxIUxlchljuW1E7ZgqA==
X-Received: by 2002:a63:705b:: with SMTP id a27mr27756444pgn.136.1570419132502;
        Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 7/7] backlight: gpio: pull gpio_backlight_initial_power_state() into probe
Date:   Mon,  7 Oct 2019 05:32:00 +0200
Message-Id: <20191007033200.13443-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The probe function in the gpio-backlight driver is quite short. If we
pull gpio_backlight_initial_power_state() into probe we can drop two
more fields from struct gpio_backlight and shrink the driver code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 37 +++++++++---------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6247687b6330..407d4eaafc5c 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,11 +17,8 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *dev;
 	struct device *fbdev;
-
 	struct gpio_desc *gpiod;
-	int def_value;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
@@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
-{
-	struct device_node *node = gbl->dev->of_node;
-
-	/* Not booted with device tree or no phandle link to the node */
-	if (!node || !node->phandle)
-		return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-
-	/* if the enable GPIO is disabled, do not enable the backlight */
-	if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		return FB_BLANK_POWERDOWN;
-
-	return FB_BLANK_UNBLANK;
-}
-
-
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
+	struct device_node *of_node = dev->of_node;
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret;
+	int ret, def_value;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = dev;
-
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(dev, "default-on");
+	def_value = device_property_read_bool(dev, "default-on");
 
 	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(gbl->gpiod)) {
@@ -109,7 +89,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	bl->props.power = gpio_backlight_initial_power_state(gbl);
+	/* Set the initial power state */
+	if (!of_node || !of_node->phandle)
+		/* Not booted with device tree or no phandle link to the node */
+		bl->props.power = def_value ? FB_BLANK_UNBLANK
+					    : FB_BLANK_POWERDOWN;
+	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
+		bl->props.power = FB_BLANK_POWERDOWN;
+	else
+		bl->props.power = FB_BLANK_UNBLANK;
+
 	bl->props.brightness = 1;
 
 	backlight_update_status(bl);
-- 
2.23.0

