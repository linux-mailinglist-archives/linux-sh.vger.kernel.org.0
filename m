Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6E670301
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfGVPDY (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:03:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36471 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfGVPDX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:03:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so39858688wrs.3
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LLvAXEq2SM+mYzd8MvDi1noi/4oB+ae8rtxDIe/pNO4=;
        b=HaBuYw8aP/LTLQkjoBo3QxFQrr5CvKqNDDJOUoZjamO6fWlt7hKvBHcwVDhTxa2bVk
         PGmrPqgdMzHYC40+rjS1RCR1E5fh3s4d66tpKXUu2PJoyoXOFhpbeXpgJ6AEM9p2yZ4o
         93mf4+8xW9ChHouV4+22xxtu7EsKTKnml1ymwSywVL8CPeX0NZdPM7gPIb2OmzV20UUI
         Y13RNHjxzT16PLh80llP2bp1kam0WIwrFGsbeQrfnFr6IGkG5/NtHUsUTBQGlXBAJ9Ur
         dU1qJZ6RRrzhjtNst8i/aUfgatG9XA3jevR78rlR86grA+KQBLViQ+NLtwPAgQF0Lk+L
         BGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LLvAXEq2SM+mYzd8MvDi1noi/4oB+ae8rtxDIe/pNO4=;
        b=rEadil6HLDtrNZ9dJtg9IomJmp8lvAw4Wg9kAyKfXR0eHEi9ApqMPhDbdGqBAL9thY
         J5YgfR+S+K+UgTrj1RA7nXsfGeVBe8f5GWAEy+0U3QhN7fdE9OzglPtY45ILK09lgJr6
         wPq/j/JtM7RBq6sQjJerU2vt00KiGAM2O5InxFdjz2Etc8QQMgw43c5vpShsmTFATq2j
         H+hQHAN5IEwk56zXbPEiA2yM/zPi3TxmiosAa5lEH1sm3O4QJWTwbXfcvnkQ1mN7QsS9
         iIyDk+s69c5TO3AKNSuaUDaSDaRV383UkV4HtFw/qLnbqF7S9QJevmspX6Iy9OSWw3iB
         Y0BQ==
X-Gm-Message-State: APjAAAWWGGaZGXBW5v2x8WKzxF7OJi9anceBKaUVm59zeBVkq5naG8t8
        8LKVqarfUUEy2YbF5K4Cvt0=
X-Google-Smtp-Source: APXvYqxvVgKJopHmtr3HmxSqR0pet7pHj/B1wjfvhB2W3jmIJhEdw2gzxQuq1hz3S75KUVbiMQ7OLg==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr69194280wrq.319.1563807801489;
        Mon, 22 Jul 2019 08:03:21 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
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
Subject: [PATCH v2 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date:   Mon, 22 Jul 2019 17:03:00 +0200
Message-Id: <20190722150302.29526-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field is unused. Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

