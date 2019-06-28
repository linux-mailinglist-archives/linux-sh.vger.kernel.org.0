Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6694459819
	for <lists+linux-sh@lfdr.de>; Fri, 28 Jun 2019 12:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfF1KDS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Jun 2019 06:03:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33828 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfF1KDH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Jun 2019 06:03:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so8977936wmd.1
        for <linux-sh@vger.kernel.org>; Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/MIsV0iC74yf/kLB48zP5Mu3PghPcknjMYE++qerELQ=;
        b=RKbWobwqHCIrkwBTlOa2hdgmXhCQq1JvHVtNEOm0X33A/V3lRp6rBHwJTZOS2ZlrsC
         D/JTSQ4w5KTYhNV7l4mm1L9tL+8Zv5GX6ZX01CI+2pG2sbWZU2YGEk/dBx9zz50MHA5t
         fGLjObyRZ8ialJJ9Ujpck3pa0VCU+xs/7VClJN4UFUf2LPq4xfUkko0QaDjNN5EJwXDp
         8koiUs4eI/hXyoZIHCY3WcCI5QQOhM2wYhdYEmHzm0aWdgYpa0xpfF3eVQ9lrv708D5D
         PCpptKKMn0a/FEuX2WMu3OkGWWHI69qpmuwM5vMFKoPbKnuxudAFGMZQcI/SHE5jz99U
         5Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/MIsV0iC74yf/kLB48zP5Mu3PghPcknjMYE++qerELQ=;
        b=ZHxueNZqjFNELQCwxqZFxSXBB9lhFlV0UFQ6hBE2mJ4lC5r9USvVvJOriLeJLj5gwx
         OwAs5cVNuSQ0IIhUfWuvSc/71gwLGUFxeZwr7be8ekZsmkxzIotSPAZg7kSnz3oBP40i
         aaIf+PTb0JGsoUulfP9HgC85an05hcCmMfIM2HG9VLURY/h0Zd1paKGcflNt48LVIZeO
         RzEu06991mQGT6YzEw1Dp2Y5szOqPJPXleCZOy8saz2YyrOeuk63ThEMUsJIcvfhWO1o
         rlJPgpcKWmHLD4rW0BI4pnrE4C+9UvNPF5ARuyvZ70VoyptwMK35k8QESmOSW3D5Jucw
         8P0w==
X-Gm-Message-State: APjAAAU5AW2Hd9YfVkaEOYeY88IokNZfb4YpN+89Y4n8rTqQz3+JuaCG
        pbm93wi7dEw6U7DYaJbG7eNYMw==
X-Google-Smtp-Source: APXvYqxMlO8Fzv7j1/DeSmWZz7jyRkBp7z4c54hGgmLMAGP1WzXIA6YdHeK1AoOXmA8GXduiCgXd+g==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr6197653wmh.60.1561716185658;
        Fri, 28 Jun 2019 03:03:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 03:03:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH RFT 2/4] backlight: gpio: simplify the platform data handling
Date:   Fri, 28 Jun 2019 12:02:51 +0200
Message-Id: <20190628100253.8385-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
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
 drivers/video/backlight/gpio_backlight.c | 46 +++++++-----------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 89e10bccfd3c..b20d2d5d5190 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -71,41 +71,21 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	gbl->dev = dev;
 
-	if (pdata) {
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
-			dev_err(dev, "unable to request GPIO\n");
-			return ret;
-		}
-		gbl->gpiod = gpio_to_desc(pdata->gpio);
-		if (!gbl->gpiod)
-			return -EINVAL;
-	} else {
-		gbl->def_value = device_property_read_bool(dev, "default-on");
-		flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
-
-		gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
-		if (IS_ERR(gbl->gpiod)) {
-			ret = PTR_ERR(gbl->gpiod);
-
-			if (ret != -EPROBE_DEFER) {
-				dev_err(dev,
-					"Error: The gpios parameter is missing or invalid.\n");
-			}
-			return ret;
+
+	gbl->def_value = device_property_read_bool(dev, "default-on");
+	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
+	if (IS_ERR(gbl->gpiod)) {
+		ret = PTR_ERR(gbl->gpiod);
+
+		if (ret != -EPROBE_DEFER) {
+			dev_err(dev,
+				"Error: The gpios parameter is missing or invalid.\n");
 		}
+		return ret;
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.21.0

