Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295DC729FF
	for <lists+linux-sh@lfdr.de>; Wed, 24 Jul 2019 10:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGXIZP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Jul 2019 04:25:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43624 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfGXIZO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Jul 2019 04:25:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so45895271wru.10
        for <linux-sh@vger.kernel.org>; Wed, 24 Jul 2019 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
        b=yS/fpv0lDg7cmmGiJlJuxWZDC7FTLbDacrHOf0iRdHeUNwswrCSddeVLBE4fTzDSh7
         Crlc8kCfIK9TKMmhBMLM1skpv9wTY7ZUenyFTibdYFbmNnH8OgZrxnSyIr+LnOLjf5GK
         iXdZ3gpPL2+YgwVWFQdaV3jQ7WP+5WionDivvwBsxj0D6JBVtrl8nolAO6STna0u8qXS
         XWm2eCsu8ikm2EnIFJSbRkXkIiWr1WSUG+j8I839mzmKDW9ZrJZYzrKh9efeK2HUtUSR
         6e5GIkzyc17iGtczLzfFbKCqD8HeRDPzb6a8BUuQOYcjOq/wKTn9VuuyZnWMBhrnvetc
         +hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
        b=jOyjslRkefC3cmbJkkEhjEcG/YXy4a9OMIJusglSi0n7S38CX5J6aJGhIGfGE4Iz2S
         UvCVlBBtvpuExxKgF5cp0eU5cSX48nsMVtQNB6AYFabPPUEpmSqO+qpR8MP3eSjPeflO
         cjvYOt79/Y5QZOSgyYUDEHvXiTM22FV+2ZQuhN/hJ4h+EWzk6kvQYSZY8foGRChlHdYv
         RiMDa//tYkHuYD8SFLA8+GyD8kN84wc9Oqj9d/PAEDhiZHKkd+kcyTTpvu/NfPB4jmh2
         iD4FxwqERyixvNCwTUOAqJ0Ur8v56kP5O2bAnNav1OOJ86SDMRw0vPq0pJIIThG+Z7IA
         ho7w==
X-Gm-Message-State: APjAAAXX5nMA/GXATdnKK62e4RO+BERx+nRrzR6UPQe5sRrae1EJdI3w
        TG9XiHfJmP0yxEG6Fzea0xA=
X-Google-Smtp-Source: APXvYqwpDOFg0SMrkMrSkLYjQMLQnQYz0BaTUXKeEAnLvEP5ghElBAxYipQ0U+HL2Q/1CRGgVkParw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr47444184wrr.5.1563956712658;
        Wed, 24 Jul 2019 01:25:12 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:12 -0700 (PDT)
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
Subject: [PATCH v3 0/7] backlight: gpio: simplify the driver
Date:   Wed, 24 Jul 2019 10:25:01 +0200
Message-Id: <20190724082508.27617-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While working on my other series related to gpio-backlight[1] I noticed
that we could simplify the driver if we made the only user of platform
data use GPIO lookups and device properties. This series tries to do
that.

The first patch adds all necessary data structures to ecovec24. Patch
2/7 unifies much of the code for both pdata and non-pdata cases. Patches
3-4/7 remove unused platform data fields. Last three patches contain
additional improvements for the GPIO backlight driver while we're already
modifying it.

I don't have access to this HW but hopefully this works. Only compile
tested.

[1] https://lkml.org/lkml/2019/6/25/900

v1 -> v2:
- rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
- added additional two patches with minor improvements

v2 -> v3:
- in patch 7/7: used initializers to set values for pdata and dev local vars

Bartosz Golaszewski (7):
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data
  backlight: gpio: remove dev from struct gpio_backlight
  backlight: gpio: remove def_value from struct gpio_backlight
  backlight: gpio: use a helper variable for &pdev->dev

 arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
 drivers/video/backlight/gpio_backlight.c     | 82 +++++---------------
 include/linux/platform_data/gpio_backlight.h |  3 -
 3 files changed, 44 insertions(+), 74 deletions(-)

-- 
2.21.0

