Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DE9CDABA
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfJGDcH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:32:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46095 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfJGDcG (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:32:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id q5so7697072pfg.13
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=edi7NYtYkiqE1uOWeL+U87Ck5mZpITswFODSgMcBAtpM60H+NcmQ1P13TeUemB2tXb
         nYWc7NXa2Rygyfr0y+T+T6F/VX/YcYhwJX+hIjXFAxA8pv3CNNRtzGAYoje6QugPsHgW
         7f8J7IIc8ejfyyLdcO4inN5wtPcu/z7VdbEHq9yvGW3on1vSaNYWpqxFWSVJhJUpvlVu
         jNDWGewuuI45w5ms+ZPxtc5MHS2i/2ehOYqGySiFBXVOb3KMy9aSruKofSgiOehdlH1F
         PR3LajUBOwTC7I5nYpXz+9X6zPjE5V7Qrh6z9DBAFH+HjVolLxiJbfAn1FVYsHHgLIz/
         9JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=dpKYQiykfu8tvej5aI2tFjpPy0msLCPduGiFO6SwZCj2hpJnMUGasvy+4iIQ1hkO4S
         GKWp2SkoVakiiSZfh9wjcj/c6Xn3Ts1Y5+DzXhKfyjbuXGFHV55nQ7yks0qEd8JtexNB
         qAPrc1NUb9z86hp0h6u6Zo/gt8GR7ueXTKHfJ426E3Xl3+jq3kfMeXyTKy2Q9KrWjVd2
         viMn0J42EHeQypJZkajuv9O27ZoynGI2dTrilbnbZrjNOzRCjoga2Ij7ITay8X1rzrOU
         8+zidX1N8pFXMw1m0xUFpMpBY0T02Jtc9pHY8boBs9oRAU3Ne+DdwtJWpnf4xFIpQlHQ
         mT7w==
X-Gm-Message-State: APjAAAUAE49R71wsTgKESFMnzwsnXncB8mdBTjjRvVuloKtSBv8thyZ6
        rvcvhX1+iaTKRW5SxQh1quKDuQ==
X-Google-Smtp-Source: APXvYqwD1Ahm73jrBPcdOwtpwjSteXXDBGfgtBkjwZk7/DaYkZiI+mMtwaDZj10mJprtCxD4b2Gkfw==
X-Received: by 2002:a63:1915:: with SMTP id z21mr5731158pgl.343.1570419124423;
        Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
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
Subject: [PATCH v5 1/7] backlight: gpio: remove unneeded include
Date:   Mon,  7 Oct 2019 05:31:54 +0200
Message-Id: <20191007033200.13443-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We no longer use any symbols from of_gpio.h. Remove this include.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 18e053e4716c..7e1990199fae 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -12,7 +12,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_data/gpio_backlight.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
-- 
2.23.0

