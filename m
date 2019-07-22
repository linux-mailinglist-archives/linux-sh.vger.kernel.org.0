Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A4A7030E
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfGVPDo (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:03:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40418 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfGVPDT (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:03:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so39782655wrl.7
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
        b=y/bfQV37drOfVrF4n+Iqq4NGk+7tKntp1pEhzWKHHRbiBdgwKFn5ULWP6hZT5WjrpQ
         KSmH6Gwv36Cmuit2W2oi+R7e/Sse8GlHM5GCVVh3iyZ7zTuVrLZluj9cEhZ+z8ALiExU
         K+guiU7eeyH2GcErUOnZTfQKo1mU9soy5jkATQRCpeEZQynuPngCDIDsfB1ThYKeKBxP
         vXNRA4vOqomu3/g1DTfGIWUnZjmP/hmiZ5tsttLzqE/Cg5nEeIPdrV7Qw1GbqjByCHlO
         j32I4tBQQfldKTGkt72MjMY1rAknjvyyCqPjEy1B4FtXrrHt1tZJ/Hv00wvl4+eEmtO4
         0CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
        b=DvavQwt+dMIoE2wmmtbB45j+FxCt8Hf625Sw3hFth/JUwLlaRBq1RAohvsoUcYUTfu
         dOHtGOoy8s+ViwKkKaTiXipCfPzz6Eex6eo1+4DrQmTQARvH3YD2lK51cX5ysPUcHZ4u
         4aj+Jp5QKohnevRqufSNfKmqQi9scETumFCgWdyl3YHGpiEp1it449wqt1Akp6QL/bLG
         e4VJd70GG5ukBFEJkP2mGYbLCdxg3rtl98z8I1grRO2i5lTrm2UKxN6Pl/kMthtljrzG
         Xg0FG6YVAtHI25z/F5ITVg5N2Qbr75rH+y/ubXGukiCNOzRygNTR9qxc9XFzi2kqp4+/
         NKfw==
X-Gm-Message-State: APjAAAX/KH6gwp9GyI/EZrdKTrOVx1RWs99oIp3bTylR0EXo1dr45JHv
        VuncYTPgIulT2c1d/Xm2XEY=
X-Google-Smtp-Source: APXvYqzNd/LYOJoiuysHC+W3E9wdzoFkN6mdzKjvmD/65FPIUftUgWabjvssAUboPGNuJIx70c28qQ==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr70026812wro.86.1563807797982;
        Mon, 22 Jul 2019 08:03:17 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/7] backlight: gpio: simplify the platform data handling
Date:   Mon, 22 Jul 2019 17:02:57 +0200
Message-Id: <20190722150302.29526-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Now that the last user of platform data (sh ecovec24) defines a proper
GPIO lookup and sets the 'default-on' device property, we can drop the
platform_data-specific GPIO handling and unify a big chunk of code.

The only field used from the platform data is now the fbdev pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 64 +++++-------------------
 1 file changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index e84f3087e29f..01262186fa1e 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -55,30 +55,6 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_probe_dt(struct platform_device *pdev,
-				   struct gpio_backlight *gbl)
-{
-	struct device *dev = &pdev->dev;
-	enum gpiod_flags flags;
-	int ret;
-
-	gbl->def_value = device_property_read_bool(dev, "default-on");
-	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
-
-	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
-	if (IS_ERR(gbl->gpiod)) {
-		ret = PTR_ERR(gbl->gpiod);
-
-		if (ret != -EPROBE_DEFER) {
-			dev_err(dev,
-				"Error: The gpios parameter is missing or invalid.\n");
-		}
-		return ret;
-	}
-
-	return 0;
-}
-
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct gpio_backlight_platform_data *pdata =
@@ -86,6 +62,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
+	enum gpiod_flags flags;
 	int ret;
 
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
@@ -94,35 +71,20 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	gbl->dev = &pdev->dev;
 
-	if (pdev->dev.fwnode) {
-		ret = gpio_backlight_probe_dt(pdev, gbl);
-		if (ret)
-			return ret;
-	} else if (pdata) {
-		/*
-		 * Legacy platform data GPIO retrieveal. Do not expand
-		 * the use of this code path, currently only used by one
-		 * SH board.
-		 */
-		unsigned long flags = GPIOF_DIR_OUT;
-
+	if (pdata)
 		gbl->fbdev = pdata->fbdev;
-		gbl->def_value = pdata->def_value;
-		flags |= gbl->def_value ? GPIOF_INIT_HIGH : GPIOF_INIT_LOW;
-
-		ret = devm_gpio_request_one(gbl->dev, pdata->gpio, flags,
-					    pdata ? pdata->name : "backlight");
-		if (ret < 0) {
-			dev_err(&pdev->dev, "unable to request GPIO\n");
-			return ret;
+
+	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
+	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
+	if (IS_ERR(gbl->gpiod)) {
+		ret = PTR_ERR(gbl->gpiod);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(&pdev->dev,
+				"Error: The gpios parameter is missing or invalid.\n");
 		}
-		gbl->gpiod = gpio_to_desc(pdata->gpio);
-		if (!gbl->gpiod)
-			return -EINVAL;
-	} else {
-		dev_err(&pdev->dev,
-			"failed to find platform data or device tree node.\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.21.0

