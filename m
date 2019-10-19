Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6266FDD775
	for <lists+linux-sh@lfdr.de>; Sat, 19 Oct 2019 10:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfJSIgW (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 19 Oct 2019 04:36:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33958 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728384AbfJSIgW (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 19 Oct 2019 04:36:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so3412517wrr.1
        for <linux-sh@vger.kernel.org>; Sat, 19 Oct 2019 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=P1X7rjfTUJ3nuQIt5WgPxo/bWVF1kNL7UC7z6D3mpB5+R/b/fRt812wGTpBYsf1l4X
         yLrW5jtqYTj9YCVhQyVaKhVahExaGBVsQ24kF8hxTisINKX9Ki9dkJoqd2OpUJpey5aw
         RJJfG8f4obCZrlt1J0H/Aed3CeK19+tFD1NoDtUEVAktPR+PGIL/dtASqLofSrkNqxKp
         OuTN9is8GL3bPXKg141be4zDoB0/wM51Cbdiu+mJ4FQidBEmd8QXf3ney/4vuQGHJQlL
         h+uHFSpFqfIzhmhbYrFM7LUnDmKWRncFKOUNY6CY2/IQnjXIx1JqTuDAaUOQDcS+FrRP
         UXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=LTQFxSAjWk0U05EOiGEcVyoTm6AcOG7ZSmbj5hiM2EB4Po/xnkWIbFNfefDTniS52u
         oPDn1w46DEVvfOE/TIPG5AID9KKdl36NKI7HmGlH8DrMags8WF3qqlCMtwN3OBTdACYj
         2v0R7MxHkFrS2aMWUIcixwcCENhc2z42SaMcwTCj1Qh7cKWdHrPciXptVERiJCxE1vwW
         gmJQrRclIF1iZ+TVJ/1D9JOi3aHY44qNKWQcvqhjUhitOfumGEYRhiU5R9o5YjZaKzFf
         kWDoY37ZB53BldDkutwmyrS0u8txQBuRr1NygIRmEry0W5V9bYnCjrjiC/8+z0lZqG4N
         VCwA==
X-Gm-Message-State: APjAAAXJNgL4221AFqxfoGu6Cm/Hm2HgoPpOW+d/907AwrHa+zbzJbN2
        EI8/wewAnZ8ROFimBDeGZI8kmw==
X-Google-Smtp-Source: APXvYqyC7Ckh43yEeLj+N7+h+UruFS+0KKtHRNyoTyt/JpzLBEE5Q2IIWFp45JPp3FFZIDaUQ2sQwg==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr1432291wru.43.1571474179094;
        Sat, 19 Oct 2019 01:36:19 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 01:36:18 -0700 (PDT)
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
Subject: [PATCH v6 7/9] backlight: gpio: remove unused fields from platform data
Date:   Sat, 19 Oct 2019 10:35:54 +0200
Message-Id: <20191019083556.19466-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/platform_data/gpio_backlight.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
index 34179d600360..1a8b5b1946fe 100644
--- a/include/linux/platform_data/gpio_backlight.h
+++ b/include/linux/platform_data/gpio_backlight.h
@@ -9,9 +9,6 @@ struct device;
 
 struct gpio_backlight_platform_data {
 	struct device *fbdev;
-	int gpio;
-	int def_value;
-	const char *name;
 };
 
 #endif
-- 
2.23.0

