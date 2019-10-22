Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A3CDFF90
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388429AbfJVIgn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:36:43 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40548 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388297AbfJVIgn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:43 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so15249814wmj.5
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OjHvv8ZdSVaFl2j34zmQMRFMhFwh+26xUwIofDUAWMQ=;
        b=UkLVmhIaiNsxcswxRm7saAjEeStKBBF+NXde2AaAQaH3O4OXrI2JqpEeNiYtx1tT4k
         O3tmDJV08ouTAT18mpcXHM49waszOD09C3kcJoqJ1K3QN1xmklwP/eU7Hi3Da1KpH6+p
         xHzUd7cW8tvQpL0LdK8EzIbsEydpnZXp6EgfJ09/AxanR8iqfgD2W5clxItpQ1XlxvE1
         Y3NivMmlc1FI2uZ+h4mjPDpGg07DcZC5wE4UFYAR5q7HGQNTlYTFiD5P+jRs/sNoqlfW
         5Afs8sR94u+Uqox3JbfZuJfuKgrV7Pd2SzSCLdqv7UzJb6rRU5U+dBwxaIfjR8LqHfw9
         VMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OjHvv8ZdSVaFl2j34zmQMRFMhFwh+26xUwIofDUAWMQ=;
        b=KFuFwYAbnEOsyVv4OxWmoi9QaKLtoD7jRljN6at3ne+WYqr6sFRfxJFKaZLkPvH5zj
         gnZdl4wgdh0b9p15YXWakllKio4dzCR3t+IEwt+BsS1KpOY6UY+18zpGtQXOE71Oxf4J
         18RGYicI91QVWWbQsWTXrlD2LAiDun7k78mzz/df69o3bmmDJ7DJJUPfm4RGS6NWa1Xb
         G0iu6wa3h4Cirq8vHrTdXLUO0UgDvAdJrcqHiZTKr/L1tepk9zhuVd8swzfQmFFYc12d
         MxOynih5ClWrbFH1cqzypCOI516340lt0ebkafxp7qjfDssqyxPzOvLOJgezMhJKTGfY
         vcdQ==
X-Gm-Message-State: APjAAAWwFYMfdrKcbadKWZs0ge1Ezxerh44+vFcThPqRRi++GN5vZJIB
        4iXjPZTOSX+BXFStF6t4WSNyUw==
X-Google-Smtp-Source: APXvYqwKHDyg0m8WqC6lLMl8/nhXbBRKfJRxg4+8ou9ARo5YAW/NNdc3UuYo+8foYS7XDWsI6AWPPA==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr1840598wmj.126.1571733399937;
        Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
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
Subject: [PATCH v7 3/9] backlight: gpio: explicitly set the direction of the GPIO
Date:   Tue, 22 Oct 2019 10:36:24 +0200
Message-Id: <20191022083630.28175-4-brgl@bgdev.pl>
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

The GPIO backlight driver currently requests the line 'as is', without
acively setting its direction. This can lead to problems: if the line
is in input mode by default, we won't be able to drive it later when
updating the status and also reading its initial value doesn't make
sense for backlight setting.

Request the line 'as is' initially, so that we can read its value
without affecting it but then change the direction to output explicitly
when setting the initial brightness.

Also: check the current direction and only read the value if it's output.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 3955b513f2f8..52f17c9ca1c3 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -25,9 +25,8 @@ struct gpio_backlight {
 	int def_value;
 };
 
-static int gpio_backlight_update_status(struct backlight_device *bl)
+static int gpio_backlight_get_next_brightness(struct backlight_device *bl)
 {
-	struct gpio_backlight *gbl = bl_get_data(bl);
 	int brightness = bl->props.brightness;
 
 	if (bl->props.power != FB_BLANK_UNBLANK ||
@@ -35,6 +34,14 @@ static int gpio_backlight_update_status(struct backlight_device *bl)
 	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
 		brightness = 0;
 
+	return brightness;
+}
+
+static int gpio_backlight_update_status(struct backlight_device *bl)
+{
+	struct gpio_backlight *gbl = bl_get_data(bl);
+	int brightness = gpio_backlight_get_next_brightness(bl);
+
 	gpiod_set_value_cansleep(gbl->gpiod, brightness);
 
 	return 0;
@@ -85,7 +92,8 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 		return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
 
 	/* if the enable GPIO is disabled, do not enable the backlight */
-	if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
+	if (gpiod_get_direction(gbl->gpiod) == 0 &&
+	    gpiod_get_value_cansleep(gbl->gpiod) == 0)
 		return FB_BLANK_POWERDOWN;
 
 	return FB_BLANK_UNBLANK;
@@ -98,7 +106,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret;
+	int ret, init_brightness;
 
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -151,7 +159,12 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	bl->props.power = gpio_backlight_initial_power_state(gbl);
 	bl->props.brightness = 1;
 
-	backlight_update_status(bl);
+	init_brightness = gpio_backlight_get_next_brightness(bl);
+	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to set initial brightness\n");
+		return ret;
+	}
 
 	platform_set_drvdata(pdev, bl);
 	return 0;
-- 
2.23.0

