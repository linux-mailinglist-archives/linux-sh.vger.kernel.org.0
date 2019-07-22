Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C90C9702FF
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfGVPDW (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:03:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39901 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfGVPDW (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:03:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so39750979wrt.6
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
        b=PJAy/C6vXvCtjG9cGnPYgiNGwkOIJk+KMB3Hs8FT99JhTqlwQM4ckAzGH3iKRAayZ+
         iV/nZcbx791twxijQMtdSxUHDo93XhTru7W+g3/iYIZ8gMfa+OPKrLh3YOS5xrDbE7ru
         0sMb2R218gWc90gUVV2gMVObSFCCTCRfQE86Q1B63igf9cqq132AGo8H4Wv6hd1Ejjtb
         h2gFntQ4iRMvTfsbHbE7QWzSjxJP1E450Ju/Mr1HGI6tAcA1irI5MnKCUzxTgpdqr5Zf
         GNGAMIFY5x2IiKME7B71HGD5bkP3IoDbd9tUWm5H+vZopp4bVu030OERZT3QXuEgMU5a
         7yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
        b=h88VSEEWICHl51zhYfRPxh7WPrEIV9GRY0QsFsFhEJBw9JxpR3Yu5Bgwbz/6CsJyKz
         Yx6/c1wQZ3kJfuYjY4w6n2ljThnGY6v2/zyoskmd2Rals0tFSiIhG/cCI3ccosnJy0nu
         8CPeGt8qZu4CaT36aZU41z30AoAOvfnbV0CLpnQVmV4lB4DNXjRzhZhM9ah0wVfgYoYU
         ZPD1h2SHlKMaRtWVUKOO+PQnNmydU38yzBrLzm2f3ohlkpWeu2XpSmY36nLoMAWTcDjM
         u1G6YpzMsZTKNLv8AIx0cUfXBPoSQ5DokZIwpwWotEnk/n/Q0cjcJphRY84c1m4SRWIc
         52HA==
X-Gm-Message-State: APjAAAXLg+2yMaQTRI7o/4Fcq/ciUVJqAW784vpqUtaDbOEiRNP64r1F
        bYCIDQjWvY068OZ5uYwvgIk=
X-Google-Smtp-Source: APXvYqxoeDtZa5rhm0zJCPGIZ4TMlrHuW999eBJciN+bFmDJu+7YqfLFUW1lZ8pkGVH3rxoddiSyZQ==
X-Received: by 2002:a5d:4205:: with SMTP id n5mr67472226wrq.52.1563807800356;
        Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:19 -0700 (PDT)
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
Subject: [PATCH v2 4/7] backlight: gpio: remove unused fields from platform data
Date:   Mon, 22 Jul 2019 17:02:59 +0200
Message-Id: <20190722150302.29526-5-brgl@bgdev.pl>
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

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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
2.21.0

