Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98738DD768
	for <lists+linux-sh@lfdr.de>; Sat, 19 Oct 2019 10:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfJSIgN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 19 Oct 2019 04:36:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35097 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfJSIgM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 19 Oct 2019 04:36:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id l10so8128879wrb.2
        for <linux-sh@vger.kernel.org>; Sat, 19 Oct 2019 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXhFfTxJpOWfUV4uLITTpdbpqdC1NQz6QjTrt5AanH0=;
        b=AwGvW2qFwU4dQKW8lBPQ/vuxPkKv6boigxQ3TYodi8j7gdB94KMaRLHPKL/IYI6uJn
         1CIGOUN2ylCd2HpuFctEyL1DoxZhu3AfASOYrSkE252SsLRUzo5SywovV49r4yzVsfv6
         wqie+c7o139H5AKbInTkZ5dkRKmIJgNyF/ncbYxtrgkOuZb6cF/QiU6PbJjX+8PC4zQv
         gDqZ2Y2/aPGyq+sozGWoiqv+Xz4IUl67k4X0ixv2UiLNr14fSDGgwHxkSeSqZ2NzKyev
         /xJ9gxfoKX37xAdjGyo8ZogoPKFiRhyEPwZNLhzDv/5Yq2ZZ7+wwqHKQ0bpv6fRCpgP5
         6iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXhFfTxJpOWfUV4uLITTpdbpqdC1NQz6QjTrt5AanH0=;
        b=LaACwkLxZO7Prq6grDo6eAgt+kWrC3OJonbJ96/q+q81W8lp0rz4Ebh9c+/RBuVhO2
         +gdwKv5lhZlwj+i7EHhsiy9oCIO0CLFGJtExmCsdx+WF1sa06vT7Hd+sLb11Dr0zsVio
         Zo/bXdjWE5sAu26hSI7KhwgJPLjTkMJV7dpB0bM2mMOb0Xeui77xU2f3cFy6oY3X9qJ7
         A6M8GWI5nrUBErl8JqA9BGP0JWgW+FNffqrJw3cDm22C+xsn95zsNhDbxBSN6rtq+0Ze
         LT/cMHmIddubKInOo4ulx0fI5e2anbxEAEbp/vH2vxfUvvjKD+ibGvE6yPxJTT9JKpu8
         zbHg==
X-Gm-Message-State: APjAAAVcfrsrv4sFZjkg8f1L6KUmSgMW9LpEqEau2gzrRVLk5AoyixB1
        ttTZ9fKDka5OFGD7+u0Ee9cP5g==
X-Google-Smtp-Source: APXvYqzpywR6S9c9y4631jsXMMJsyUrRt6pwryDVgj7Rqg+mTZW63A7CSWbAN0HUSeu0YfSw4B8Tvw==
X-Received: by 2002:adf:fe10:: with SMTP id n16mr11814058wrr.288.1571474169355;
        Sat, 19 Oct 2019 01:36:09 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 01:36:08 -0700 (PDT)
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
Subject: [PATCH v6 0/9] backlight: gpio: simplify the driver
Date:   Sat, 19 Oct 2019 10:35:47 +0200
Message-Id: <20191019083556.19466-1-brgl@bgdev.pl>
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

