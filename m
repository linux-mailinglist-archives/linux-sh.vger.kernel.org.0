Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FC6729FD
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfGXIZS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33961 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfGXIZS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so45979208wrm.1
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
        b=pjvnwWlg1S0JJObJ4VAQYglevZH6RzmSr9LO8Vogmks9DNfq/Ol7Vv994gV+BUd3ea
         BzBvGJRFZG460Sx04z9WdPLd5/AWYUsRQsPfSbsvEdQZbEzWUWAM2vwkxE7EBHXG+iQY
         h3q3/kwA6euG7dAy9zWHIe292Lm41qMYTqLzrGHC6RXOOWBrDIlBoML4fRdfoSzJrh1v
         8924F2s+Z5KscpUb/O8kWJ0k9TcHopYH2o18DLKSTopAiitXP7ZveOS4UIOKF6zdZHJm
         QGVgGP4zLRsWceIkaRs7WzkZzgwaK5qgmUcXdwmgxGYb9fTRcWyQYB+4fwYPsXpV6aCj
         u2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
        b=ooP/aKAiItaE9AE0RWTRHHeqgXnu9tYMMAmKjmuIawnWtVVZxfWJm4UNKCsNmi4Qxh
         UB9exObg3LeXu4wBurINhgf+OI5JZuyx8LRWjFQ4oy4A7qHfgH1B9Tg8ICN3vVTTIrAA
         r/X5QcQhleWTfwVpw32pzSA+Gm8nPROh/kj0SSfK2XR+hDGoY+r4mIlwx6IPoZeGIWux
         W+1e+SV9pGP/npBaDfrX0YGEMZ6WW6FBvTQeTMWEt4eHwMvfK8unE0ZZSGhnTOlO6I/o
         5kQpI4hG/B/5moiijaV9pJyQaSCI2DFQSbck/uM5D2ofVTG8fREHQaEa7KCS0VZRGoy3
         Qwag==
X-Gm-Message-State: APjAAAUqpEXT8eh1CK8EbfnInE105sJ+zgCyxLUAQI6GCWywQqKDO3Fo
        oGLJHPuHuxHiq5aQOt11CPI=
X-Google-Smtp-Source: APXvYqwzyOuZJqgrEqGk5ckOvAjzeH6Yh+/HufAQdFV4AXpJer4oPxFe3x+2qPBsY0spQGgjJr4fWA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr11543282wrn.11.1563956717025;
        Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:16 -0700 (PDT)
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
Subject: [PATCH v3 4/7] backlight: gpio: remove unused fields from platform data
Date:   Wed, 24 Jul 2019 10:25:05 +0200
Message-Id: <20190724082508.27617-5-brgl@bgdev.pl>
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

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

