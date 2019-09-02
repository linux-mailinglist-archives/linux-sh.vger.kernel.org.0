Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5CA5647
	for <lists+linux-sh@lfdr.de>; Mon,  2 Sep 2019 14:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfIBMfZ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 2 Sep 2019 08:35:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34621 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731723AbfIBMe6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 2 Sep 2019 08:34:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id y135so9779638wmc.1
        for <linux-sh@vger.kernel.org>; Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XOZ9G7G9MWu3PapBqwm76MzTbTk7qh7g47mE4DOAzps=;
        b=S02UO1ON99M1ouFNv8Fx0Xfkw7LOATunblr4HuZkddsYv/0NpCFEoEpOmOcnwsI8nY
         VElm2FAR+R/tHlyAC8hk1GoYi6+xQwuNbqFjtLSO0CpOk3Tzs3VdS93tFz15As0KPeBH
         UPJ7XsSxHjHFbfU3clWqLaBu5DJoT+go9nASHDJLsIIUvm4cscKqWHqdTjyrvLVQbPsW
         LiSHRSxqkQpNj6t15AFHNOTC8jy+ckjaVKdloIB83XMyl6hKi02d1Js3e6kCUlsZRK4a
         WvMbpKsMfc3vqm3H/Ee0G8Lkc3dJSCDM6c3tKCCq/WXG1oKwVrALh2/fv9nq4ZpO3nO5
         7Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XOZ9G7G9MWu3PapBqwm76MzTbTk7qh7g47mE4DOAzps=;
        b=amBTV0Lw2EXJ60c6KPAGT4xe6wJYWQESDmRCHyAn+V4JJUCzv3kAorcRL1VQEBVaAd
         aznP4q1Cbsa+TTtHvTQKTe1vDhTemxJSAsQXwjHRO8zcJ1luHqbu6opihn6Oqmy2z/58
         FcH2c00hOGlRGz3Rqs5IjJWEF2uF76zL52F7gPSiakavlFu0Fanvt/AW6f4prIfF2tqY
         Yrbkj3sO13mZwAa4ptwjplBaElH/IP8mkdcZf5z+Y7rgYqUOIWt9C9NxDix2Bwci8abc
         5BW6CHkQqaUDrYhAlEIqh3HEIKlxrVbX49kCQWB1GwVjSihWKjjthfNtqRQ6PT0YmU/q
         EITw==
X-Gm-Message-State: APjAAAUjGtcu1mXVhxifHwunFyW9HQJIKjg13gHfnWUX7BMBf3JSrwyS
        B13gDA72bhQhQbP2Dn3tRzJa5g==
X-Google-Smtp-Source: APXvYqyPyCZkVkGyJylO/Z4gFXwGq95akjDrBPerrKkIdPHewT4cqgI0NrgE4gHZcdxk3CuDm2BYqw==
X-Received: by 2002:a1c:eb13:: with SMTP id j19mr33248298wmh.18.1567427696092;
        Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
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
Subject: [RESEND PATCH v3 3/7] sh: ecovec24: don't set unused fields in platform data
Date:   Mon,  2 Sep 2019 14:34:40 +0200
Message-Id: <20190902123444.19924-4-brgl@bgdev.pl>
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

Platform data fields other than fbdev are no longer used by the
backlight driver. Remove them.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 6926bb3865b9..64a5a1662b6d 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,9 +386,6 @@ static struct property_entry gpio_backlight_props[] = {
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
-	.gpio = GPIO_PTR1,
-	.def_value = 1,
-	.name = "backlight",
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
-- 
2.21.0

