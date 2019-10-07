Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E9CCDAB9
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGDcY (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:32:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44456 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfJGDcM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:32:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id q15so6171996pll.11
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=bZlGFSZZDV/Cfp22DU/NgsaVo8wYUYI8yHknx+coDeipjtN9VtPDfxSY8zd2elzjXa
         Y/QzPRSOScAuDQp/IMJFwpSwC40pb1zcW8kXEe7fYxJCWYGS9yKxYaGuj93pRoiquK5Q
         aADQ/bgClY7XcmZdf5e8az+S9cDB4r8TO0kDoB5x1T5HoLfh2+Sp9sMZ6rZiMBMBvqf9
         +nQxtRD6ehrn7bTu8VeoWMlJApH8e/ve5A7RBTl78Qz/InuJYkrl5xvMoQmYAZK+CskA
         64Ogkzl4ist0WFjZ+VGhAYTYFLqSOTkH0t/NncBzxiZu/4gNEZkC7jbsaBgdp7uNk0PA
         0VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
        b=uZx+SjBqRQorDMBpKiZWoqxGoslRdfbjJfQKiEI9nnx958UAmKUB224bG0oe60n85y
         tDdCjIWJXLT6o8qWlcQxOoo9SRE+/CyBqpuMuPI2NESr+o7mi/lU7/KYJNd6cZGlIArq
         Nlvk0irIT8m6PqwWfrj24abeDFdTlpE3+LSOZQDnwpwU4ENbSxP72aHpB5Q1qMCy1Kxs
         kZ8bu0lYNGVewD6w7d90Lnb1yXPySG16odAjdQRg0w03gvmvrWOsey+Ij1bJDypy3RnJ
         JXahv+cj3NosBcuiZUZ/AWoBBdZFcpglohOmHcsmSUJwsoiyuGSLaHIyo3zvInmSkVzL
         YxgQ==
X-Gm-Message-State: APjAAAUHsmUtVQqs1Sgfm+fCgT/h7DMQQRV6o+k1UTeRn0VT0k4HL6hP
        lH21Llv/4Ken5+7jcU+LDOLTdQ==
X-Google-Smtp-Source: APXvYqyMJpRgbsk8LYwFFeym3A3ODf7oVSr8gKY6I9NTk6wL5VBDQB09tM4CGa5DcdvslC6UztiJAA==
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr27459476pld.61.1570419129714;
        Sun, 06 Oct 2019 20:32:09 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:09 -0700 (PDT)
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
Subject: [PATCH v5 5/7] backlight: gpio: remove unused fields from platform data
Date:   Mon,  7 Oct 2019 05:31:58 +0200
Message-Id: <20191007033200.13443-6-brgl@bgdev.pl>
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

