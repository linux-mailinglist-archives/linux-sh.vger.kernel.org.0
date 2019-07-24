Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A452729EC
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfGXIZW (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46482 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbfGXIZV (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so45897830wru.13
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HpxCRy2V5Agh4JLerbqys83epZFNSOhcfRgJphFvhIM=;
        b=x19yNdi/wQM2QHEWsQ8Fml/XsADvHcBE6EJCk5MVdtjRIYLdcz8QxPF6qBAO/K2CdR
         FPqD88r5piJ1E8YFxjZL6g97vhm37EM9ZEeqHPRtITeuG9dgMFd6OI2rl3kcxyRxGr2/
         AR5YqqHwRuiTh7exj0tZLBHZKBFwKtKGR3YMgT21+68aAndEk8RQF7rg4NUK2SiKQcHO
         rRqpGbAwY3EMvnAmAf58IAZZ3pEMM/x10whrww55L/YQ+PzmVafOq5xEQhagdFtY4f7R
         irg/VdMVaHIJMgs+Tc3kf4xhNgxgrtaUSIa1o0gFgToMLgCzbjz/eaoyeBumRIhB+oEA
         b5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpxCRy2V5Agh4JLerbqys83epZFNSOhcfRgJphFvhIM=;
        b=bHtrR4r4o0s2UUOT7Aw5Cjqe0yKjNJgV+LPGWWF5tTrSlM2I0/nFcJxsj6OCgru4hX
         6VL80cOkutTqCGEAU+mbWMkixVhG4m7KleCYDliYkQzWw9Bx8CRHBpf5T/gsZJQf+/DE
         eJrAvVqQksAT8vIdLrdlh6g2i2hne08Omk4nNdexvDS5SRAiCU4yGpYPEZ9iIMZ1b6q8
         5OeZiy/bq2nqefk8WU7kwewVsHqPQ+9peCYmidjKVPJDiAJhXSK8j53stYPF9okiH/3v
         3xctuMpDS7rD2K6ZYyvvqhL12IC1OgBO3NvjV6QNjD3h8L7WZpC4xAiIaqnGy8mFWYFe
         go9Q==
X-Gm-Message-State: APjAAAXrUeHvyLaCavYxxKWyMj+OgjRplRse9I0kaJHlpF8qTp0T90o2
        CUiwyp6VIH00iOv9q2g2RhE=
X-Google-Smtp-Source: APXvYqwH9jsfXEOv3fcGiDqEzST6zq9dWSrvlyiiGgXaYsEM7ZSrxfCt9vxBHSk4uEnWLIx49qhpiQ==
X-Received: by 2002:adf:8bc2:: with SMTP id w2mr3587116wra.7.1563956720281;
        Wed, 24 Jul 2019 01:25:20 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
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
Subject: [PATCH v3 7/7] backlight: gpio: use a helper variable for &pdev->dev
Date:   Wed, 24 Jul 2019 10:25:08 +0200
Message-Id: <20190724082508.27617-8-brgl@bgdev.pl>
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

Instead of dereferencing pdev each time, use a helper variable for
the associated device pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index cd6a75bca9cc..7dc4f90d926b 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -54,29 +54,29 @@ static const struct backlight_ops gpio_backlight_ops = {
 
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
-	struct gpio_backlight_platform_data *pdata =
-		dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	enum gpiod_flags flags;
 	int ret, def_value;
 
-	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
+	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	def_value = device_property_read_bool(&pdev->dev, "default-on");
+	def_value = device_property_read_bool(dev, "default-on");
 	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
-	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
+	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
 	if (IS_ERR(gbl->gpiod)) {
 		ret = PTR_ERR(gbl->gpiod);
 		if (ret != -EPROBE_DEFER) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"Error: The gpios parameter is missing or invalid.\n");
 		}
 		return ret;
@@ -85,11 +85,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
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
 
-- 
2.21.0

