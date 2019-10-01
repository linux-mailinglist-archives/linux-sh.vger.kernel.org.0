Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31EAC3504
	for <lists+linux-sh@lfdr.de>; Tue,  1 Oct 2019 15:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388129AbfJAM7a (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Oct 2019 08:59:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44320 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388121AbfJAM73 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 1 Oct 2019 08:59:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so2269890wrl.11
        for <linux-sh@vger.kernel.org>; Tue, 01 Oct 2019 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=oh+KX8y19td2/ns23M3vt2VkOv2Ia4jLRiwFYO9aTy10bc5KspDPauv/LlgJ6HuIkV
         kNiorugzhJnav9pxa8QAMC6gYLvWhm5EjXG5ngvIdrsNAyEGFTNc8pYUeLqgpbtbf3hd
         NYI3ibqB9GeiQ2JhrvWcME3xqD8HSuUKfBy92u3T80XeejSIzqlp2TC23PjnshFf/K9U
         8gVll5Q5F0WHRo5BdpzIgrf5p4gRs+XXRIu5cyx0mZtAxyNUJ91X13DubrAWEFZXSgNO
         yuoUzwhGKmD2z/BvnJfOolOsLFH86ryCNEJly6F7Vv89UrNfDBMJxhScdPPYgxN8rcdW
         V1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=TkJyxd/cN1TSY5VpStzEONgqYicU0tn0pA8ARw435PMWPvig8KGl38gPs1F9w+21ZE
         N1aSzkl5nLKKuCIcMFIb5B4Noom2R2FvMSNFLZxH5TfsbP2GiS3Zbi//JPATQBaBCk1n
         OvXq++zNcEnj9Tl0AlzIIfbDWYvE1qzE6IdBvr39WJgzxaqWJbzTYx0so4tRReQNJ+m1
         bPIQFJoHRZdgKHCj3lmTAmGGAH39sgaqjysZ3HkTas2H2t6LWnSya+GgEzFEECf5XrP7
         xeRHj0yH80S2FFGr5I2kIQaTvPK6WNP7V0aBBh9LACo9fcUwsW3s2P45BiDAXySsv5La
         hjRw==
X-Gm-Message-State: APjAAAXvxlji6/UmamLBcipUtX7KYooWv5JTd9FIZKDbCi68Qdixa6SG
        L5kcrGvU7WJ5WSNjJxXGzJ1kP3eYU6o=
X-Google-Smtp-Source: APXvYqwHnwSBxbkCM0IViyYM+vKWr1bCXAicb33E6GpkwJhdXYoUk5YrqBXejxcLVbOsZTTnd/bx9Q==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr18386975wrv.367.1569934767444;
        Tue, 01 Oct 2019 05:59:27 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:27 -0700 (PDT)
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
Subject: [PATCH v4 2/7] sh: ecovec24: add additional properties to the backlight device
Date:   Tue,  1 Oct 2019 14:58:32 +0200
Message-Id: <20191001125837.4472-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
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

