Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4206DFF8D
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbfJVIgl (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:36:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41932 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJVIgk (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:40 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so17000115wrm.8
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=Bq+WXbKond/Rk9fhT8Y+bUAcQeyz3dkHjScEjk448jWb1Cp5GqJJPCE/dB22YytQit
         h6rjUQWMBpc6TooG9agn4sMX+chbXQnG5/8GgY+UxdpejJgraAYrt48FfVjryUqgw14o
         eKxMTfkTMWm6W1yJ42/yHNIZN8oq7M3iZ8mEiAbWi4ivzIihNzO6TCeTyTQVmTlgQkKe
         w6GlUVEL7VzvEO8ptqVO/U2g/gEt53Lk5q/TY+E9Eno8mRgVIsykdcC0QMwT9om0FLNt
         R47+/7FvF2qIahLXXIjlHw8sxq2q5/N9Ji3jmmIME4Sz3qd6qMUDOxZG0TtzF9ObGur4
         yPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=Y+vvQV6IPiKc5F445L7+7fWLsxMGZF5SYUD2syhcINrEEtGfDRF++b3rlkE6fhMYYS
         LsU1gDKUf95F9AKDjdaTJyseG6zS9zDeSV6a/MLXYt0Y2E6qUYcRkbFjtBGdnq8Q7Tsg
         PRLr6gKL3y1udBOmR/xtnHsaZ7GAddhWPK5Xd3mwHXcE5miYespGIzhxDa+sgBRbDfzH
         xb6B/y0t6nxd5Eh8/QFR7S9TKArqlA2wzPfY6BXQN6FX40x50Ylj703EYPw2uUAsNXL3
         A0A8YYgn71LLPJArUXJmKuFl3/49qtHutY7AH9Xcw1gZs7aLruwALX/AyXwChFTS3aet
         HYnw==
X-Gm-Message-State: APjAAAW8KVXda81BoP470OmEjjA3jpanPeIb964uMxbcVuUmTRE5zDfh
        aHyHDI7Eu0aj5TJ5aDEFkPXLkw==
X-Google-Smtp-Source: APXvYqxz6AIr8fWnzKdVVzEewafWfmryfrIOZCjdoeaPq7mVTlB+8VWT79OlNyvmz2Bd6kRuyVN66w==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr2396794wrq.129.1571733397641;
        Tue, 22 Oct 2019 01:36:37 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:37 -0700 (PDT)
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
Subject: [PATCH v7 1/9] backlight: gpio: remove unneeded include
Date:   Tue, 22 Oct 2019 10:36:22 +0200
Message-Id: <20191022083630.28175-2-brgl@bgdev.pl>
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

