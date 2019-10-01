Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72D2EC34FF
	for <lists+linux-sh@lfdr.de>; Tue,  1 Oct 2019 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbfJAM72 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Oct 2019 08:59:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52782 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbfJAM72 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 1 Oct 2019 08:59:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so3283569wmh.2
        for <linux-sh@vger.kernel.org>; Tue, 01 Oct 2019 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OU2bh+kVbPH2QOESllwlntXEadkasZXlFhA24tJCYMc=;
        b=rZwtI0mZre9T+U1FCWCcvcEBN85L3YXBKHzWkcFPGHcFAeM3WYEdwywJEKfA7rfFk/
         7Hfu9B48gxfbPWbmoY1voarlphxyl2u5YfnAxoOM1ZLF+VcqOqh6AcxM/2O3RSvEHSLF
         4rC2yzROzddoadVAXP+KAIYdyCxB4OBCVnMmH7F/bBFh/QWaqcQGY3iHqq0YpN/yEM4X
         SB2DlNqTIjDqR8g1WMR9vhTqPSeY5n2nbSV7tuUxYhJTJZ31nr7dHQmLnLtjQtMSm/Fg
         Cu9tJYKtjLO4SSHmxYjO2YxLREkDXzQe5+wkRkggXqXmvm9CVar6d7cDED/jfgvNPNTq
         nbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OU2bh+kVbPH2QOESllwlntXEadkasZXlFhA24tJCYMc=;
        b=tp+Wd+9PbaecxR3CdUQbb7M8rVzOg8zsaoaIkwNMBk4Z4xQfoKg1nTxjvOFaFJmVDo
         37Fmwuy9gJ3wGC4F9f1gTKe/UU9D7nqPo8FUbwmUjwg8388V13pyIas9OVOs5KQjB9eX
         ydMfSbc574goYdD+NzFwRQRdVoTCS2pY2iC62cOAGnn+WyWk51Hof8pK5OrSyvPMTAn/
         AR67nr1u9wqhAuUYY2+MY7p1bcGjueABCkSimfIwWilBz2hlUgam1wDa3TYwxqpvZxK8
         m7nEN6lsqRUvJ06O6zNH+xNGgmm9pIowuwTjkFq0mgANN7rjJ+smsl1KHuaVK+UtRJam
         TNKA==
X-Gm-Message-State: APjAAAUdalLElZFbnjS+8u3M2QYoCYFsvRpoYVFoN9LPbfNayzNpGsAo
        xWDR/EvwAHZuGssvWL5ZalEcjQ==
X-Google-Smtp-Source: APXvYqx1Kr64Tj6Qz4cblkoPu+gaNwnWELKZxN/qXd6/fHiNvyOllFG948GDKWDssvQCyIjl5kMnvw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3594002wmc.141.1569934766193;
        Tue, 01 Oct 2019 05:59:26 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:25 -0700 (PDT)
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
Subject: [PATCH v4 1/7] backlight: gpio: remove unneeded include
Date:   Tue,  1 Oct 2019 14:58:31 +0200
Message-Id: <20191001125837.4472-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We no longer use any symbols from of_gpio.h. Remove this include.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

