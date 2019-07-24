Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBA9729E9
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfGXIZQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36457 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfGXIZP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so46003676wrs.3
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fKxkD02366JB5IdAqT4wbLtrtWIwI1gSRslxcR13y+o=;
        b=T4HKhvlgZIWgcdonCwhUhZ3z+OEMFR/VSNhly7EEEAg7ipweH4u94whK9fTSYtNalr
         A/ZDt1qF8tnciMbF2GaMwoANWwTw7ibVTh+qpbN9eBDzTNuBikvlgWFT3/W8yXiQ65o+
         L/Kfld+bCNV5HT2TCqpZdB3NEHBbGHbb7eXfQ34QumXq6miX6zEK0ZL6/RoERC8e7NXf
         aAgZY1kRFmPwv/Eftv11bIuUf9DzGT0ijX+XdWtnBOLMkYwa0ok6QAqfUmY823CadqWv
         34VWd5C7zkUqo3+hjF9c0SbM7Dzuz9p8gjzOV3rlJsApgvJndtsV5/LhA45zTSLsby8S
         u4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKxkD02366JB5IdAqT4wbLtrtWIwI1gSRslxcR13y+o=;
        b=p5fFB9QGsaXQtYZNWEgCvyJ/XBx2TJmDwzdi+/A33xIwsOlChEYMkF38vHbDRHZQvN
         QpJJvWpVKGfupL4b+XPRv6NSaG9h9c9Ti+cSkCtoVTUe+hOQvp3KtUJPDSorY2PkyARI
         /LI+GHBcBpYA7NRrKfKGApyWzvhwuIHsGLnhiL8dxqtwGRAbbi4WtlUh2WJij7240voW
         D6X3s+Dux4GzJaztXCfTNLK7ddm0zKQkgTkmE2gPJV7i9K3WHTBcIEP+j/xf8IdyyFR4
         YEEfWGpJEyHBs0onp2B//JwV9wsxhkP8KLXTdDueGBpUuDN4NYf5tcpgLyx2UbNALrCG
         2wmQ==
X-Gm-Message-State: APjAAAUXLblgLyCaT8jcwLvOtQHd1Zv70kjWDJCL5S9xXyUWRu2pqIzy
        ZFPcmdU0SvehBpcmEgPTxWk=
X-Google-Smtp-Source: APXvYqxE5ySVYgSPMcOzXIlVOzVvl/0vcbAThP9xQsCe5hN1x3daHr7gg6o2hBdJ3+G8SsYPeq5fzw==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr36709389wrn.240.1563956713776;
        Wed, 24 Jul 2019 01:25:13 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:13 -0700 (PDT)
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
Subject: [PATCH v3 1/7] sh: ecovec24: add additional properties to the backlight device
Date:   Wed, 24 Jul 2019 10:25:02 +0200
Message-Id: <20190724082508.27617-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
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
---
 arch/sh/boards/mach-ecovec24/setup.c | 30 +++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index f402aa741bf3..6926bb3865b9 100644
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
@@ -1464,6 +1478,12 @@ static int __init arch_setup(void)
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
2.21.0

