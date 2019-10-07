Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05642CDAA6
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfJGDbH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:31:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37837 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfJGDbH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:31:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id u20so6182275plq.4
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
        b=YFfCnyCDD3PB6NmfHCvMPu4D33I3gel2/ZiQH7/oNm+0P6Vb31d0cOZtFqmxJe7s4b
         NDIz0EAz6COcMXSH0q8CbgvDr7hWY8KEICppEuUvMOd5PQ2oL7sKJ6qi8Wm2whbWIal6
         KNTtNHDBwyZFpSluNwVRAezxYHNw04FE8jrlENf7RwOcNhPKafLezLW2cNwzT8CzXMby
         2/TgEjatxwc0FrXbCP0SrG9oTuFqYcWEXgRJlOeQIqImOHIdLYqAcpoA+HSJlAnaXeke
         zyB39m8imjKnTWIAO+rY+2oTqtAlnD/UO1m+SdTZcEC4urp8OUa0afre5skaUcylBwsb
         ZKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
        b=kUwbX+iE5I5olAbdTL84Wqv1T3fGi+cv1CH9bNSdzeJnKUlYkGVWrF1QiVcabsrMus
         66N0dVmpdt1OZsL8MtZTkj+zAFKrlGW5vZH0TiqeVsUvZK6ULG4kpLEwa04n8XBqneD8
         RxxG4ZcqS73QXCyjfChNaDg4Eeg1CZ42QHPxD05wIqErawDJgCfVZF+uk4/p/9Ig+uNZ
         cObdmheNcONy3Bh8jPfR9rZwO3wNZ2lzKc0DTM0+IYjDgExkhkhRcCyAXUcOhWN77YJd
         raK+GlyAy1E8TMDsiu+kgIatD7DbyWrqIK820yUZhpGr/ifl2VwoeOJQypl/JmZ/4u30
         ytNw==
X-Gm-Message-State: APjAAAUOgtKx0ET0XS1pezh2NWdSEvH0JVjvzhN5yJFBHojDqYGDyKKX
        ZWx0GPV+Q8dv7TLJ0FqFczAQGQ==
X-Google-Smtp-Source: APXvYqyK0cGcQPhMCq/YDWqIcKNCnGXD/gye49/b2NpR1/JcBFAoohrPihSNRV8mJk6K6mrH0RrbQw==
X-Received: by 2002:a17:902:8b83:: with SMTP id ay3mr25944522plb.143.1570419066195;
        Sun, 06 Oct 2019 20:31:06 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id r28sm15025580pfg.62.2019.10.06.20.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:31:05 -0700 (PDT)
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
Subject: [PATCH v5 0/7] backlight: gpio: simplify the driver
Date:   Mon,  7 Oct 2019 05:30:54 +0200
Message-Id: <20191007033101.13343-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
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

v3 -> v4:
- rebased on top of v5.4-rc1
- removed changes that are no longer relevant after commit ec665b756e6f
  ("backlight: gpio-backlight: Correct initial power state handling")
- added patch 7/7

v4 ->V5:
- in patch 7/7: added a comment replacing the name of the function being
  pulled into probe()

Bartosz Golaszewski (7):
  backlight: gpio: remove unneeded include
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data
  backlight: gpio: use a helper variable for &pdev->dev
  backlight: gpio: pull gpio_backlight_initial_power_state() into probe

 arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
 drivers/video/backlight/gpio_backlight.c     | 108 +++++--------------
 include/linux/platform_data/gpio_backlight.h |   3 -
 3 files changed, 53 insertions(+), 91 deletions(-)

-- 
2.23.0

