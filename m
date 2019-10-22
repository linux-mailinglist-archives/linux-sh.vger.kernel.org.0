Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C085DFFA7
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731371AbfJVIhS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:37:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51091 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387575AbfJVIgl (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id q13so6108101wmj.0
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2xc7P6YHG166j+xVZ+q+qvlahi4iLSSnRxTtpR6znoo=;
        b=dunLQ6gemIPjAP14+LRlmcclJuj0+sE8QniGZlmFE08l1BlWFoQ3/YWyhzvhngeu+J
         dtmBlbSAa2m99suSdqj0+hnyNzLlrwshDFR2kGmSShauix4nPJOF3InPnR1y8mrqX4r0
         WL0tptIRlo0DXkwgFnfzkS4P/sEbB9x+RS6chKfgD95OyHdRXNg4xNZ/5p2SvKSXXhVW
         dkoYqMMZqsxitmArA1FzomKEKu1XhgBnOIJv3ypzSa4fBNMGMuYJa2shWuSFjBsH2kf/
         DBq3Pjy9PiZ/YTenBUFmd1ty84SsEbnThYuB02SajOxgoRHhSeja1ud5df0UmMs1+aEu
         Kvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xc7P6YHG166j+xVZ+q+qvlahi4iLSSnRxTtpR6znoo=;
        b=XViONz57W0CNZKhqFbD957AI+pUdHWbQsZJz8e9gD2qnkvkmiv0wipLwGMVDLBNs83
         XjbnB0HCxuEaAiUBjS3yi2I3jGfXXhJBKoSrrrl1Embd4tcB7qymxzjNsC8ADEjR0kBI
         P0ljohl8XXfrxw8dOvqMq5rYDp+Ids/Tt/70ZjI2b5JxYxPeYyvqzeIUewvXiHBUNwwh
         fL5/RzJ/kcCoYtbrthdXixS8VqhcL8aMHP9+XSYvArb/Bqhy8Qu6Qzq5/OcwMJ9B0AvN
         3dH1djsRCT6EABnp1ab7NAjjs+d6RTjSp2KuyFS5OOi2D0gogDRQVVje/J65q0mfQhY+
         Bemw==
X-Gm-Message-State: APjAAAXjkOitCo64bsg54YJ0qv8WlIMbZKtqAJE47egwHLatsHeDTu5x
        CgMR/6UXujV7W1GS1sBOzbSnVA==
X-Google-Smtp-Source: APXvYqyy9MvnYosLqyhGfKwbAizvJ2k43MowPI9FAKwbz4NYrwbFvayyhqWxgKL+r8/O7OFc8r1k2Q==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr933111wmj.130.1571733398843;
        Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
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
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 2/9] backlight: gpio: remove stray newline
Date:   Tue, 22 Oct 2019 10:36:23 +0200
Message-Id: <20191022083630.28175-3-brgl@bgdev.pl>
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

Remove a double newline from the driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/gpio_backlight.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 7e1990199fae..3955b513f2f8 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -91,7 +91,6 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 	return FB_BLANK_UNBLANK;
 }
 
-
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct gpio_backlight_platform_data *pdata =
-- 
2.23.0

