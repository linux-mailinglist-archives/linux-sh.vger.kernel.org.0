Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54868CDAAE
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfJGDcH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:32:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40708 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfJGDcG (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:32:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so7723138pfb.7
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=AukjubrN4PDGMujmBkvHkgJfZ+2GlL0+Em3we5DHYt1NKwR5PJeW21D490d/mSjHb/
         WlavS8gY35Bu5tottt++wT/UVqxZQHKZ88I/ijmFGikylQxJznYzS/4/cnHa2yWjxH4S
         r85pSvF9OuxrZu/koI8IPS3ydYYxYFxoDDN+jD8Sl5vdFB6Nkj37zoHjwOd/HLsCucJO
         XuWDYoOx69SijkEI1t4XJNUF5xo9kNXa7/7z2U+qkTiKueqpcOYocwP5edhzj95An56K
         hteswR2v8OjuGxYiyRu/wtgLcILNVCsjJeun6mrx5hFvSrKDb0MLgl+om7f+IQRNTzyj
         CjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=nw++3PS3EapbMWYz5bVRPnmd9jIt/NXFx0BRYH4sGQ0aV6c1z3fLS6aWG5g2vmYbXH
         aNh2TM4WkOEFD+Nptu4qXChfH11ZmaDEfi2WhXA7QcRtjCxJs3SWjB5CzGkN/z0tp6qL
         Tx7bUxWzzaFB2PsrjK3pgUqbSKml7aEJWOogQL6v8yZwikQk6wvfZSEpQCqLnabNyS+z
         0zf18IVhlJ/IFzkvLpeCKt2zuJsO/KMj9PV5j+FykoVraZc2QoJ/Zp0Dk0Zw6wnK0cD+
         hyXbmnjllD2hm9eOlY7iCcn/xuTt/XorIRqZUSWM9r7JCwmhgnpc80oWMFZxo7gI8WOn
         Najw==
X-Gm-Message-State: APjAAAXu3O9vb2H2RQYTkjW+bakR/xHVhIQT8hoHGhZeumFLISf1m4mi
        ARxQSKI0AR8FBUBhojIUouc1IQ==
X-Google-Smtp-Source: APXvYqz7s9JwaUSBo6GqoNnv0tsqJVGVlvVsWe22/BTdaniihiz1pfKEjqrkRml5q/ctrY69oeOThQ==
X-Received: by 2002:aa7:8585:: with SMTP id w5mr30810659pfn.82.1570419125926;
        Sun, 06 Oct 2019 20:32:05 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:05 -0700 (PDT)
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
Subject: [PATCH v5 2/7] sh: ecovec24: add additional properties to the backlight device
Date:   Mon,  7 Oct 2019 05:31:55 +0200
Message-Id: <20191007033200.13443-3-brgl@bgdev.pl>
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

Add a GPIO lookup entry and a device property for GPIO backlight to the
board file. Tie them to the platform device which is now registered using
platform_device_register_full() because of the properties. These changes
are inactive now but will be used once the gpio backlight driver is
modified.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 30 +++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index acaa97459531..aaa8ea62636f 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -371,6 +371,19 @@ static struct platform_device lcdc_device = {
 	},
 };
 
+static struct gpiod_lookup_table gpio_backlight_lookup = {
+	.dev_id		= "gpio-backlight.0",
+	.table = {
+		GPIO_LOOKUP("sh7724_pfc", GPIO_PTR1, NULL, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct property_entry gpio_backlight_props[] = {
+	PROPERTY_ENTRY_BOOL("default-on"),
+	{ }
+};
+
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
 	.gpio = GPIO_PTR1,
@@ -378,13 +391,15 @@ static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.name = "backlight",
 };
 
-static struct platform_device gpio_backlight_device = {
+static const struct platform_device_info gpio_backlight_device_info = {
 	.name = "gpio-backlight",
-	.dev = {
-		.platform_data = &gpio_backlight_data,
-	},
+	.data = &gpio_backlight_data,
+	.size_data = sizeof(gpio_backlight_data),
+	.properties = gpio_backlight_props,
 };
 
+static struct platform_device *gpio_backlight_device;
+
 /* CEU0 */
 static struct ceu_platform_data ceu0_pdata = {
 	.num_subdevs			= 2,
@@ -1006,7 +1021,6 @@ static struct platform_device *ecovec_devices[] __initdata = {
 	&usb1_common_device,
 	&usbhs_device,
 	&lcdc_device,
-	&gpio_backlight_device,
 	&keysc_device,
 	&cn12_power,
 #if defined(CONFIG_MMC_SDHI) || defined(CONFIG_MMC_SDHI_MODULE)
@@ -1462,6 +1476,12 @@ static int __init arch_setup(void)
 #endif
 #endif
 
+	gpiod_add_lookup_table(&gpio_backlight_lookup);
+	gpio_backlight_device = platform_device_register_full(
+					&gpio_backlight_device_info);
+	if (IS_ERR(gpio_backlight_device))
+		return PTR_ERR(gpio_backlight_device);
+
 	return platform_add_devices(ecovec_devices,
 				    ARRAY_SIZE(ecovec_devices));
 }
-- 
2.23.0

