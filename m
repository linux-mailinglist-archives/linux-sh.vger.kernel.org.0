Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9316070311
	for <lists+linux-sh@lfdr.de>; Mon, 22 Jul 2019 17:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfGVPDv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Jul 2019 11:03:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35686 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfGVPDS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Jul 2019 11:03:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id y4so39813581wrm.2
        for <linux-sh@vger.kernel.org>; Mon, 22 Jul 2019 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdufiTePFKOcw3PXCBBvJkARSPrI+OCusBaTYJELEjQ=;
        b=TsqapSCFfaQBoVbpHKI/m+obmflr41GlOM1rPFV007j2Zv7OerhmRuJG21pozO+P1A
         jTOHiU/zOVdxrV2v/bG8njldvSpnDW/pU1d6WXmgBNL+ZAnPJupgIR2OUZFCHmVY5JRO
         NC6gJyFpSSdFodmwdDchaBFsttM8pha0dZkeDgf/TnHgkD16mDRERvJpAH/bTYE0OjoE
         VlXyqbWGtjvdZfwHscynD/iZnEqcFwQZhNU5rNIDzLMje3EkV/XxY8ZMvwv/X28jazwS
         NBASzJ6jmaUrYhaiWMIHR1bEPDSX8z4JsW9XGg0EN2DqxVK3oKAYiXwjq+EHr1zxllVK
         pNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdufiTePFKOcw3PXCBBvJkARSPrI+OCusBaTYJELEjQ=;
        b=P9Hlthu+Mu5ND9EhOnx2S9Xm4TQi7j82VPCSb4jzCdJBZhb25jtCquZ8wiBg6S45S2
         vY1zpk8W6gAgtIZusqgFD3lfOvE7G2XQtaO65dYZu9cDr0zrEvxnkGBi2Yzo3GqJUjEj
         Aleef1mwbDDfs/bDzoApXHZCSpGN+upavcmSrM8N2VECuPCVRvqYJQOOeROTIew1IWHi
         QjWcl35tz3fpEmxOXKZcPdONZn44ctw9QPe97ctwO63+AnT+EzealGrECWrYcKbe27rV
         Nwwp2SCWkhhKTPo7K3oCp9RlqL7ObAihcgSR7WmhMgiP3U26lUBbFJU/G4ujNzDicAys
         r+gA==
X-Gm-Message-State: APjAAAWrUPtKVkDHIeFo3mOOkIlPpfh6oDaUOPa1HqxHgqiHKGym2wtG
        RjmO+GeRkmittLZsePE0uXE=
X-Google-Smtp-Source: APXvYqwoKpD/MpcmzIu1lOX2+THt1HzZrurirW2Y9G174HfbVtdYjcEwBdY78NR/Z3UWvwPmL5JvNA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr60089734wrv.239.1563807795684;
        Mon, 22 Jul 2019 08:03:15 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:15 -0700 (PDT)
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
Subject: [PATCH v2 0/7] backlight: gpio: simplify the driver
Date:   Mon, 22 Jul 2019 17:02:55 +0200
Message-Id: <20190722150302.29526-1-brgl@bgdev.pl>
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

Bartosz Golaszewski (7):
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data
  backlight: gpio: remove dev from struct gpio_backlight
  backlight: gpio: remove def_value from struct gpio_backlight
  backlight: gpio: use a helper variable for &pdev->dev

 arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
 drivers/video/backlight/gpio_backlight.c     | 87 ++++++--------------
 include/linux/platform_data/gpio_backlight.h |  3 -
 3 files changed, 48 insertions(+), 75 deletions(-)

-- 
2.21.0

