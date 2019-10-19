Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7B4DD776
	for <lists+linux-sh@lfdr.de>; Sat, 19 Oct 2019 10:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfJSIgh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 19 Oct 2019 04:36:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35334 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfJSIgX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 19 Oct 2019 04:36:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id 14so1518988wmu.0
        for <linux-sh@vger.kernel.org>; Sat, 19 Oct 2019 01:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+aYo/jE0l+r2VpUneeIaMs1HWjXHH9okkuy6GJ4hUcw=;
        b=h0zJaikzGMrQw/8lBb8sYuz2WDIJK2djdadS0yQaFn8WT5woxc5FUsuVZG+wAXttYG
         iHwMNTLMjhuKALsd3KJvXMCsxUdR+J58mQ6O1+I8jBn+8yDzdtEkwgPtbZKE9jUa3qLF
         UOlhDeSMehnwZiRaWSDC2KjDp6B3UEMLcX/BO//N3Odg99NHuaYUVRLmkJceoGeVxIoD
         4op/vdrRCqyx9zBi0qM+4v1vUKsvdAxXa5lzG28v5SviLf1vGhNZvTamx8PZkKA5Momy
         qyDXuhvg2Hn2smrWGwoY6GH+GwXdsPfjHPTETa4xb6YommzinQgnvlZmWP4hg0P6vzat
         +Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+aYo/jE0l+r2VpUneeIaMs1HWjXHH9okkuy6GJ4hUcw=;
        b=XhspUg3ErEu+VDDk5iTLh7sh+GVxL3x64Y6dS+Adga/jjmLbHG3ys+iIjoJ9Tp3LJ+
         K+sF1Xvbkwx3wpWOeiJu/Lp1qA+z2yFkOl5W7lKxuyd0+3ogt/jsLTY4PSFRK4xNSEZk
         fcphvscXgH/6d92ZpR5fN6uOkabvGf9gu3T2RZiHJlTGIirXtDlkJ4Od8doaT2M0BDln
         ZUvnMypfbiLDSAVAC2b+k5QhBB9w8htaZ0jo/g8iVU9mj68xmyX/jI5Q+T6IObV5Y7JW
         dzYxXu/B9lTjl647F1ApR1AQoLVwyRGN1hCdokx1tNY46YAPfY+G9IQqAoZRIG6QIYOE
         QPbA==
X-Gm-Message-State: APjAAAXgFqpMqnvfo1GcrGCslOZ6DrF3ATmO4Raph13WQlqxbQEjIKnP
        89nGFCCYByj8A6aCEv1YvlFNRQ==
X-Google-Smtp-Source: APXvYqwmPVh7r2j/5vnVETV3Itb96Hdk3RmxzyJeWRMyIuLuB2/Jd+9kynJT4aIzf2BZC4ibMUZKdA==
X-Received: by 2002:a1c:9894:: with SMTP id a142mr10577174wme.70.1571474180785;
        Sat, 19 Oct 2019 01:36:20 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 01:36:19 -0700 (PDT)
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
Subject: [PATCH v6 8/9] backlight: gpio: use a helper variable for &pdev->dev
Date:   Sat, 19 Oct 2019 10:35:55 +0200
Message-Id: <20191019083556.19466-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
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
index c829b82f5372..7b411f6ee15a 100644
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
 	init_brightness = gpio_backlight_get_curr_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to set initial brightness\n");
+		dev_err(dev, "failed to set initial brightness\n");
 		return ret;
 	}
 
-- 
2.23.0

