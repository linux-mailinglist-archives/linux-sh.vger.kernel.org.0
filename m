Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1DFBA563B
	for <lists+linux-sh@lfdr.de>; Mon,  2 Sep 2019 14:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbfIBMfB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 2 Sep 2019 08:35:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33659 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731768AbfIBMfB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 2 Sep 2019 08:35:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so11858378wme.0
        for <linux-sh@vger.kernel.org>; Mon, 02 Sep 2019 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iBLJsFDHxwQO5fDJ/0XiJk/ChmWyJTLddlv7y7zlKto=;
        b=lwjSsLjUer1VFsgWsDkSA4eN6sALaf4s+oUA+k3XyXbOV0PLVLfHF1wEBKgjAUsM7B
         FqlsuujinuKAzlU/2L38daWRY1ekKA01/UqW69QBIURMfm6KK9bUojE4BNJvIZx0HFpC
         ISx/AmjTBTU9c30Fsu48V5cGMES1/BdDcqgBSsXZxUErSspRTJFgFwwYlOz+PnigdkOL
         eUPhvmAOL418pfzBbbfsKKpec96TNxLRjPJvpmP98sRtW2XO5kIoPn17kwq9sN/SQMjj
         6B5pZamHMxUOAXR2CtMRs3dkTOVI/fxhmBZ0DPZW4nxgFnmr9naHl2XEp7Z20DmqMXUs
         UQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iBLJsFDHxwQO5fDJ/0XiJk/ChmWyJTLddlv7y7zlKto=;
        b=d/rxNzRlHSCVpofzwY3zsqFTlsjmf0gCY7LahynVXBJU5i0qTRMj1FJbvR7lNWOtVK
         Vpt1POsyCU2iyCIeCru8lSR3yVCCxCdeEUUfHR7VnruPcYwpfkOly/gV8g4qfwW+/AGp
         7mZ44tpfqVxOlTnVyg+pOURDSfa/9ojiCfXeBImSU9Z7isGe5Fq/qun/eQs7tlgNnHmW
         H4laUUOkFqnh5yeMfqdDiVcUs9QP4AAzSKn29qQGtqxFBqalH/L5wgey222s0sF6/+Sh
         UvH9BMPEi4KSpkusvlMOC14K32xrHCBOnj/YSASr/KfaqjO7TqM/Mu+Kwo/cgzExZn2/
         XPCA==
X-Gm-Message-State: APjAAAXpPhbaLbqH9AC3v1G1Ea4qeqatH65v+N3NBigtAhwAV1E4Slbk
        gLw8dci/tlFSkttxgsnYTvEZ2A==
X-Google-Smtp-Source: APXvYqwuZajd1J/NSYA/QGRzkfcMxV+ED2cD7wbF0dc30G/G6uOz9gOEoa4lQU/BcyHW3BPU/kspoA==
X-Received: by 2002:a1c:f103:: with SMTP id p3mr34157179wmh.18.1567427699432;
        Mon, 02 Sep 2019 05:34:59 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
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
Subject: [RESEND PATCH v3 6/7] backlight: gpio: remove def_value from struct gpio_backlight
Date:   Mon,  2 Sep 2019 14:34:43 +0200
Message-Id: <20190902123444.19924-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

