Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79A93DFF98
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731297AbfJVIgt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:36:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35789 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbfJVIgt (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id l10so16579535wrb.2
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtPUzVzlAqT3akLPjsGT7UZcGZsyWgLA88Ro+E/PyfY=;
        b=cRsmk4mLpvgTbx4wEvgiHZaS1tLjsi0aF4JnsopyLgGpmMEMXnYMLhL0fm42GgI70y
         XxnfMH3CqbAyZg/O28PEX1LVz/cHnOYtZeRaqgFupY16Ayblq54JIE+7se+NvkqVt4oJ
         rkrxZ4BEApr0w4Dl3bAbBNkrY4RDZDZQpIycsjrwkQAO2F/MxhV9jR84PqF1GCpkRfeh
         zUkdh3b9QBQK0qOuXbpHsQZnpHrQZTJZWgdHKh8+ww/7BucydSG0km7QHTDo5rZXH4IS
         oNR3yf1g5/XZwlKXuint/5h8UkFzAzNVIWxFNvA19Z4MTNamZGDKDsLdpg3A/rwF8i0m
         iAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtPUzVzlAqT3akLPjsGT7UZcGZsyWgLA88Ro+E/PyfY=;
        b=jwHcP77RRoHnGbMyvTx8vJ1AoLfDB2AqYjMkPRHhHUmXffmIWQeBWSZYl1m+wnQllz
         xtEXoQfgCow+YCky4yQ23EEBCHCKjM8WuFawUGfkr01Vi+cfn4gw3hUxvxbBsV7q222L
         IaS3bL0/ZBu7cCTjQI/pQMTUBCJewdPL7BJVJVXohGz40Natb1dsZoZybH6JcNfhriXW
         KY+SfqZv2mNSGjI8dkHe+27k3b439NLTy0X3ZeXDsyarUnGQlTA0XBHgkKvIaNAnNOXj
         LFVhG3fgsUMTxgvWcBkf51g5y6+rtVGy3ZZiz1Axk0YpJpvYd+cexHKWch4B5CpkArLh
         b0NA==
X-Gm-Message-State: APjAAAXsWShsH/44Svt9WAfU5Vzsw/VufHAr+vHYXsrhokYbS+G9A0vX
        25RKriVsvgON2iQg7Q6uxpfHVA==
X-Google-Smtp-Source: APXvYqyYvlPaTxYAVAqEdEsldeXrdmZ2pBJNeH+VuyZo6XrzBLOioU2qWHTeegUuyOqUciCp3tgmCA==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr2335737wrw.117.1571733406592;
        Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
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
Subject: [PATCH v7 9/9] backlight: gpio: pull gpio_backlight_initial_power_state() into probe
Date:   Tue, 22 Oct 2019 10:36:30 +0200
Message-Id: <20191022083630.28175-10-brgl@bgdev.pl>
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

The probe function in the gpio-backlight driver is quite short. If we
pull gpio_backlight_initial_power_state() into probe we can drop two
more fields from struct gpio_backlight and shrink the driver code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/gpio_backlight.c | 38 +++++++++---------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index d6969fae25cd..75409ddfba3e 100644
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
 
 static int gpio_backlight_get_next_brightness(struct backlight_device *bl)
@@ -60,41 +57,24 @@ static const struct backlight_ops gpio_backlight_ops = {
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
-	if (gpiod_get_direction(gbl->gpiod) == 0 &&
-	    gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		return FB_BLANK_POWERDOWN;
-
-	return FB_BLANK_UNBLANK;
-}
-
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
+	struct device_node *of_node = dev->of_node;
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret, init_brightness;
+	int ret, init_brightness, def_value;
 
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
@@ -115,7 +95,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	bl->props.power = gpio_backlight_initial_power_state(gbl);
+	/* Set the initial power state */
+	if (!of_node || !of_node->phandle)
+		/* Not booted with device tree or no phandle link to the node */
+		bl->props.power = def_value ? FB_BLANK_UNBLANK
+					    : FB_BLANK_POWERDOWN;
+	else if (gpiod_get_direction(gbl->gpiod) == 0 &&
+		 gpiod_get_value_cansleep(gbl->gpiod) == 0)
+		bl->props.power = FB_BLANK_POWERDOWN;
+	else
+		bl->props.power = FB_BLANK_UNBLANK;
+
 	bl->props.brightness = 1;
 
 	init_brightness = gpio_backlight_get_next_brightness(bl);
-- 
2.23.0

