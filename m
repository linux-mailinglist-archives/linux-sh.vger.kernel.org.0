Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E71DFFA9
	for <lists+linux-sh@lfdr.de>; Tue, 22 Oct 2019 10:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbfJVIhT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 22 Oct 2019 04:37:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39307 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731243AbfJVIgl (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 22 Oct 2019 04:36:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id r141so5676285wme.4
        for <linux-sh@vger.kernel.org>; Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lPnRL6NpoSqZohNp9zgeBMxysYnhgrlrtuMJ1IcmiO4=;
        b=OVaxqkiV3r66rCJJ/etx7RcDaFZpH+qujz5COsDg5e2kyosZzs1ammXKSMfEvWjVqo
         5LUTARizfYH78ZKf1AjSkhJ0vaerruSVrLdmnWd1/zJHjTY+TRrXeiUYXKp+Mh0NSrpJ
         ieQMAoZO59R40dcP9klGlFS/jeZ5AHtdTzMf7i1wsVdXIYsmQEad9sLN2lqxuSfVkAHT
         jtFE85+X8jX1kAEtQ7n4IB0VXYKse0OXHrwGcPpbLaoY7Ofm1rbcAqCXB0uErCYA/D0a
         HZJjTK9CEXfvyAbhVNTtWRYxSdiyGshcerExV5YXr8ylFkySuMNC1oQV/N5DrJWJZmHD
         ycUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lPnRL6NpoSqZohNp9zgeBMxysYnhgrlrtuMJ1IcmiO4=;
        b=TsglA9fq4CeYTrOMUo7qRQHBA+iyGrTNCtF4pwQhKfESTNzyty6vmdQmeqzV70Lk3t
         9ozVsEAkuqSBFB8R/LRCL/3J9Szs0Az/16RuB+D0hy7SndVjxsht9W+ZG6I1nhAeByZk
         x1ahiZEetIWMcb2xTePkgN1i8LT+imMNqaO248+o8wiuz0+OoSGNUbXtykQErdvky0Ip
         RPFr9cSn4bTni/Ao5kbcA65RD/lqt8Ob/FPJYgchkcVmc8T/TJjPixxUAMK1wARZvvV5
         UV//AavNyefddfAD10bfqWxNQD6q/H0uJieEsyPYWM2J8Pdj6bd//cXMU2aHs7K7cUVb
         jjOQ==
X-Gm-Message-State: APjAAAWlynzrFIs1pXBZjPrv1unqRqoJN1LuCag35BkJrdLdM/PuZ1uS
        rfk3hPf964HiITE+v+b7o4LHMQ==
X-Google-Smtp-Source: APXvYqwin7FI5BQUaoLOJ1m7zw/wr3yxBZOmxIPUtoJU2kMR7WARJaTrWbmN83nJqNw4l2Y2RU1QXA==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr1901269wms.166.1571733396580;
        Tue, 22 Oct 2019 01:36:36 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:36 -0700 (PDT)
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
Subject: [PATCH v7 0/9] backlight: gpio: simplify the driver
Date:   Tue, 22 Oct 2019 10:36:21 +0200
Message-Id: <20191022083630.28175-1-brgl@bgdev.pl>
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

First two patches contain minor fixes. Third patch makes the driver
explicitly drive the GPIO line. Fourth patch adds all necessary data
structures to ecovec24. Patch 5/9 unifies much of the code for both
pdata and non-pdata cases. Patches 6-7/9 remove unused platform data
fields. Last two patches contain additional improvements for the GPIO
backlight driver while we're already modifying it.

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

v4 -> v5:
- in patch 7/7: added a comment replacing the name of the function being
  pulled into probe()

v5 -> v6:
- added a patch making the driver explicitly set the direction of the GPIO
  to output
- added a patch removing a redundant newline

v6 -> v7:
- renamed the function calculating the new GPIO value for status update
- collected more tags

Bartosz Golaszewski (9):
  backlight: gpio: remove unneeded include
  backlight: gpio: remove stray newline
  backlight: gpio: explicitly set the direction of the GPIO
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data
  backlight: gpio: use a helper variable for &pdev->dev
  backlight: gpio: pull gpio_backlight_initial_power_state() into probe

 arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
 drivers/video/backlight/gpio_backlight.c     | 128 +++++++------------
 include/linux/platform_data/gpio_backlight.h |   3 -
 3 files changed, 69 insertions(+), 95 deletions(-)

-- 
2.23.0

