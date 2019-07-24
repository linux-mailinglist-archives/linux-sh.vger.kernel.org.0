Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88EE3729F9
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfGXIZl (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41471 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfGXIZT (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so42716779wrm.8
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
        b=Ru8/V2KuUXMTU8q4g8iglT+1D551XJ1jRu1e/mkMhxZ41/k+vNUX9+CBHpMMATMLcL
         qA7G90MOkXL0es1XDru84jIee/hoFp5YxCFwfo0CgWKkTkJSlHOqCEr1iMF31PkLvpAm
         vxWfi3/v9hnpL85NJbcn84NuLHK8ZwfNr8R1aicwnOSGGBohMr4+VtbWERpElGqBQvj4
         J7dN+52l7aCDWASYucxYNDxixUcCvgVIwkPoWyDWNVcMPfl8K9m6vSmglYR+bwChB6TE
         SabhVALFMspdy8q97T4skJ5NHKGlkr5mA0aqOWlMKI4cH00E1sSr0uZYF75qmVgmJd/s
         Tr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
        b=Iqv2WZLMk0P0X4QCSn9OVX+M8tpL0L8KqCs6Cnmo155CUv8azIy/M5Ep5cIkJ1kHTu
         7jVeedBpQTmgdg8G8QiV9xnnyJLQnKfWLF9tIH0gs48ZM00uvNA6MybtuVS7x71QGuW1
         jeETH0qVTqSrV7i6Hl92UjIS3LMmPO1Nal3Yy4VnQvspSXt8hKJbSMvJTe7eNyojALvC
         5JiqF5Bj3ISEwisn6BnbbdTJjX8rkf1TEERQjlI8UalPKEEoXbP4Op0fH58ubggYIqbr
         lnZ6z4ugTl17dNHsFkkCmyCZ/+1ekuNTwjirt17lVx8SVfP9S53pxk1eSLChyAIJBlpf
         Usjg==
X-Gm-Message-State: APjAAAU0HiySee1s+TBOAIBirBcIRsUgbLZUisvZcFdppr/Cp6ye6d6o
        2vBwy7L7qhoQAm0zt62z2Y8=
X-Google-Smtp-Source: APXvYqzovu25Xh93eS5i9WI728LZP4TFmEiOkc764Y7T62dKsCFZMLaetBHEt9+L/8KfHBSTKqd9ZA==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr29586503wrv.40.1563956718056;
        Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
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
Subject: [PATCH v3 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date:   Wed, 24 Jul 2019 10:25:06 +0200
Message-Id: <20190724082508.27617-6-brgl@bgdev.pl>
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

This field is unused. Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 01262186fa1e..70882556f047 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -19,9 +19,7 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *dev;
 	struct device *fbdev;
-
 	struct gpio_desc *gpiod;
 	int def_value;
 };
@@ -69,8 +67,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = &pdev->dev;
-
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-- 
2.21.0

