Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB3BEDFF94
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731295AbfJVIgs (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:36:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40557 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731280AbfJVIgr (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so15250096wmj.5
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBwZAII4c+j90JuEwELJfoaTgwb4BYo/J/e6zDQv4+M=;
        b=hD0eu+rm2rnCFP73+AbIhyRwxjhgqFh+hxza/N1Idk4VUi0QtJM+GfN7gVPGjp4Z4j
         YUkIjUCh6x9nODKYqHv9hvjSprCJ99Tc1ygodmf5Oy3gnM2wClvINYUqlylplYGSvlZd
         eMXOa5fLbLu7NDm6e4U2VJQbpFkgloMODo+Fmpun0J973i9Vd55dDrlWsbC8zAV7prPc
         aHukaKYQxUSENUEHMncEtx7x/4n3KGxNxRnwfTzL//vvn5oKk99CynyMKx5Mu2+oXmgF
         GQYRa839XdpCQpq+MGMfkGfbdHXXJvz9W7M6sf+AGI+dYNjDZsbgsvRFuahEdRX4M6hQ
         tjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBwZAII4c+j90JuEwELJfoaTgwb4BYo/J/e6zDQv4+M=;
        b=O16SvfuxkrH58yQv2N/VXKvTCzbqbgpp8vJEkr4lfvya2Dqoh1zUIvOC0x2GbYnkQT
         l0/NteqtEQ9MHyFtq1lMFwdonUEDgqwGF9b3kiGipgfgsob9yYr4v+1M1SXCNkAyLU0+
         Xw5Z04cA3DUc1zwiW5jFDJPcU8cH7uM6BfhdR4NUiYZL7FMOck5Tr1F1ActIQS/Y5rwB
         L+J8UOcYya53SGmkwSVVbcbJJy63bdr3+AnGFTIjVsKA3YxJESvKYE83TZofVXFHV7rm
         GMaY0j2pFKHf64VCyHpNFUO7GmbZNqZRimlgHAQ3Uabcmlp077cZ0F+Cvuxn7rF5Mh5c
         IPYw==
X-Gm-Message-State: APjAAAVPn7puGXUjp4+OPe3l/QFkWTHZBnva5wjQZL7op18/rc5F/m1+
        FoEnEMtVc2OVl9hc4LZRtj64Ag==
X-Google-Smtp-Source: APXvYqxzDA6PjDB8+VXbMfmE9gebpUr/TSL5Jz2YOoPBEyJhJx7o6yy2RVS6GyJDputcJKjnWi9muA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id x8mr1724605wmj.123.1571733405470;
        Tue, 22 Oct 2019 01:36:45 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:44 -0700 (PDT)
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
Subject: [PATCH v7 8/9] backlight: gpio: use a helper variable for &pdev->dev
Date:   Tue, 22 Oct 2019 10:36:29 +0200
Message-Id: <20191022083630.28175-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of dereferencing pdev each time, use a helper variable for
the associated device pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index ddc7d3b288b7..d6969fae25cd 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -78,29 +78,29 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
-	struct gpio_backlight_platform_data *pdata =
-		dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness;
 
-	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
+	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = &pdev->dev;
+	gbl->dev = dev;
 
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
+	gbl->def_value = device_property_read_bool(dev, "default-on");
 
-	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
+	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(gbl->gpiod)) {
 		ret = PTR_ERR(gbl->gpiod);
 		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"Error: The gpios parameter is missing or invalid.\n");
 		return ret;
 	}
@@ -108,11 +108,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
-	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
-					&pdev->dev, gbl, &gpio_backlight_ops,
-					&props);
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
+					    &gpio_backlight_ops, &props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		return PTR_ERR(bl);
 	}
 
@@ -122,7 +121,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	init_brightness = gpio_backlight_get_next_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to set initial brightness\n");
+		dev_err(dev, "failed to set initial brightness\n");
 		return ret;
 	}
 
-- 
2.23.0

