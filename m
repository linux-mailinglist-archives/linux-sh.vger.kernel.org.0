Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7567C729F1
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGXIZd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55564 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfGXIZV (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:21 -0400
Received: by mail-wm1-f67.google.com with SMTP id a15so40928377wmj.5
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
        b=wyVGQpD+T3uiZkn3LiRgv0LYR+71l0MHfD4iNRDIwOQSK1f0Vsijy1ZdZwYSok7pGz
         z6LQ/p4UKx3DYKA1xd/DhH3xxwduColASNq35D+f1bZwGtV1216ArwUnZkLSVo0OtHQT
         v37sruntHU3mWDOLAWr7Rdt/I5/oCDYSICOp/dVFtoGCsJBP+j6iLKLMDQWiklPMQGRj
         /MD5+fKLNv8D2Y26FgKUwdHv/cC7IUtLWGtnucaCJ8jkJKrcEF5Z4bcCeTM3atrAeCXh
         qHm6EZZVaObTXL7NmmkRvgeBJ7fNCV1kZMYsReZIJ7ScJgSUHLEuRxbDDoy2a9VXOHJm
         N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
        b=DnSKpVt4lv9Z6c+8kzf1t2ODfBJzZPCWSeQw5Szh0cOwE0J9eRNuBnoiNWbljjlCmm
         LwzWTwaamSBQVG0F1JmVGps+DXyQ5SDTm+AhudFMkFz51PkFNsjK6YcGKQwnj4waTgab
         aYPkILHP8zN04rmnb1TWGDb8gu4s7rdIVnonh1gVjFjj3hgMWIeRyq6vHElzQzH4OS2v
         g3NuYWpD1tO0WZ/aLkesIzMv0W4bGnBRgnvlxksSwH/SAWH5uIj5BEcnnZu53fJrV+EO
         exEZX7d6j2R9qLNcuiGPcjRvJouQliBo9ZZUgWyzG3Lq1d0XW53RvzVR/FwLWGApvBwm
         DrvA==
X-Gm-Message-State: APjAAAXPKAtsek6qTNzyI2DMfzVW53zxteej5AdqQgdTjVW9ROegw6w4
        lmUxO90/XnGLffAdcXTKeUs=
X-Google-Smtp-Source: APXvYqzkgEv3bgw2h6q7V26EkyUVPqeJGTwwUSYmcdpXaPZAm+K0dgiQU1XSSJC6xbDuOYYXG2bWGg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr71172006wmb.66.1563956719095;
        Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
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
Subject: [PATCH v3 6/7] backlight: gpio: remove def_value from struct gpio_backlight
Date:   Wed, 24 Jul 2019 10:25:07 +0200
Message-Id: <20190724082508.27617-7-brgl@bgdev.pl>
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

This field is unused outside of probe(). There's no need to store it.
We can make it into a local variable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 70882556f047..cd6a75bca9cc 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -21,7 +21,6 @@
 struct gpio_backlight {
 	struct device *fbdev;
 	struct gpio_desc *gpiod;
-	int def_value;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
@@ -61,7 +60,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	enum gpiod_flags flags;
-	int ret;
+	int ret, def_value;
 
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -70,8 +69,8 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
-	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+	def_value = device_property_read_bool(&pdev->dev, "default-on");
+	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
 	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
 	if (IS_ERR(gbl->gpiod)) {
@@ -94,7 +93,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	bl->props.brightness = gbl->def_value;
+	bl->props.brightness = def_value;
 	backlight_update_status(bl);
 
 	platform_set_drvdata(pdev, bl);
-- 
2.21.0

