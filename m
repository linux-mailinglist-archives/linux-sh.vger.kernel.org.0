Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E80C3510
	for <lists+linux-sh@lfdr.de>; Tue,  1 Oct 2019 15:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388212AbfJAM7s (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Oct 2019 08:59:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34839 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388166AbfJAM7d (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 1 Oct 2019 08:59:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id y21so3153268wmi.0
        for <linux-sh@vger.kernel.org>; Tue, 01 Oct 2019 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
        b=Py0M9oMfQI+PMa52Szwcn96sG7yU+5grw98sqbRASFWjqymtUPfIXRkhfGWRJD+uDc
         DFOu0PfiYq1m23B1DGc6kJPwZwMiaRvRd1WOam26xktbHxIDyr6V06nEie2tUaHoKdtV
         AomZQ+XSHDMaZFKSreeGOeLEXAxO4iRq1Tp0sk+tnJuTJbP2SILKf6ElpGAzQ+k8jCyQ
         NMvnZtYl9F504nM6L1/fKeoVVAjAK9cwk1LrFe8bU200Hp+AZIy1y9ujvf+Q6hhBfUUV
         MFGIJrG+POreX2icEi090xnKID8hmd/owTKbPoTRDP55mYCSy1y9nWR81XgMJAB48TcD
         GdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
        b=nnXU0JYIbSDlM+Dv6CtAyvlrVWx7NavwtcmKkESzgEDHmOnN9yNNHPo4TBEwJtpVzV
         0R0PjDHPB/UZGbxjTG530LWkIIQKs8QSyjOP+jOrDu8XT1rfUS11uEsqR3YDUYyL/+/I
         yWo3zwPb1GyNZExdFrsM+pQq2z5kMeP4Mtgrnf90Q55AVDG+2IX7NZISv/a7LBDePwlU
         mkIw4rQllVlh70xGFaWAccmDoys5osjq1PR2+sFyAOIWNklkMAD1uVbBELqFtHfy++Tp
         Kqi0EmqpHONYDcKhldaJa7SstEBwmNq5RaTDDOQ+8uBts+r4VszzYLCGoQMhAoCSflJ6
         +VIA==
X-Gm-Message-State: APjAAAV9pt0xe/JXlP8K7UJ/BFKLzhNpLE4JnDeYkOO+EGK2e8tf7U0B
        bQ7gf9NZReoxuf6zJwVtY6DGvw==
X-Google-Smtp-Source: APXvYqz4hwRoZovdKY3xAs1Jj3G2pPXNemkxGMSqBibHk1SoQoNt+fHBr5oTS1QgLiaTkOSdBS1/dw==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr3528584wmk.11.1569934771921;
        Tue, 01 Oct 2019 05:59:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:31 -0700 (PDT)
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
Subject: [PATCH v4 6/7] backlight: gpio: use a helper variable for &pdev->dev
Date:   Tue,  1 Oct 2019 14:58:36 +0200
Message-Id: <20191001125837.4472-7-brgl@bgdev.pl>
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

Instead of dereferencing pdev each time, use a helper variable for
the associated device pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 20c5311c7ed2..6247687b6330 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -71,25 +71,25 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
-	struct gpio_backlight_platform_data *pdata =
-		dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret;
 
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
@@ -101,11 +101,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
-	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
-					&pdev->dev, gbl, &gpio_backlight_ops,
+	bl = devm_backlight_device_register(dev, dev_name(dev),
+					dev, gbl, &gpio_backlight_ops,
 					&props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		return PTR_ERR(bl);
 	}
 
-- 
2.23.0

