Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D54CDABE
	for <lists+linux-sh@lfdr.de>; Mon,  7 Oct 2019 05:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfJGDc3 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 6 Oct 2019 23:32:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44833 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfJGDcK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 6 Oct 2019 23:32:10 -0400
Received: by mail-pg1-f195.google.com with SMTP id i14so7299075pgt.11
        for <linux-sh@vger.kernel.org>; Sun, 06 Oct 2019 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=CdUzkW995hDj+4VhwVg9oMZHUzQGlHk72ob3OVsXRVWZgf7+4PHcvudHA/4wmxF+Nx
         q+SIn6grfSFoMvOijlJ9pQ33jnn2HTj+q/fNdBXa9XiocAuw6VtpXZ6uq4TlDqtHtpoW
         uzBnJM5AkvSTCU9MtnTncl8QA8kaeg1O2tXI77iJpYeu/i7WyUxJzuzz7F21puHWx2Vv
         n3dkHdeaikrmzXLbNk9GudGvyDoVdGfiVsmDaMrvK8ByUz5nRuPw0Z4rzejlbciaT0p9
         oCxo5hLvx+sIIVu0Vn9kz6xNFGZ12WuMxEDcZWxk1OPqX2NpNxdx+GQmU1E8FXVLopYl
         n06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
        b=lytUCHccnNImD5BPhkpfa2wKSOG9DG/HePd95QBu/6gHWSDgS9pMQXLhkdYzKFmLK4
         J+vc53CrEnOOVe9PPmOljp0g6b3nL8hpmedXudJF10IyM367f8JSwviP36I/ehx+R9kH
         kGK+2EQr7nr/APQJJtbs2akkAy9vyBtA08D0tPySaK4BwjGuHs1Fjl83hbX/JpAsqQ6b
         VG2nP3ZQgNFtQkVJuwzhmzyVmzDzcq44EX1oO6FddVf36yeE90fS447vRV7BAjot8o7D
         Z6EeET1jXXsoB2KzIcj5tndsl+vnHT5CVLgPn3hsekEUvaWxLjTUWKEPXBQ12fAQEXER
         pTXw==
X-Gm-Message-State: APjAAAWxOIrpHLwv6PmsafZcpUYRFVffbjU/fqHYm3QZZPUBOhYae2KM
        M+nVzXL2+bft5xYenOUEgtnV5A==
X-Google-Smtp-Source: APXvYqzdOWFcsQosjrpnIGRE710tR911OOtW+TNB7GzyjXHdPq3QJaRmZyw9bD+GubnD2IvAJNhmSw==
X-Received: by 2002:a62:7d54:: with SMTP id y81mr30577794pfc.86.1570419128451;
        Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
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
Subject: [PATCH v5 4/7] sh: ecovec24: don't set unused fields in platform data
Date:   Mon,  7 Oct 2019 05:31:57 +0200
Message-Id: <20191007033200.13443-5-brgl@bgdev.pl>
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

Platform data fields other than fbdev are no longer used by the
backlight driver. Remove them.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index aaa8ea62636f..dd427bac5cde 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,9 +386,6 @@ static struct property_entry gpio_backlight_props[] = {
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
-	.gpio = GPIO_PTR1,
-	.def_value = 1,
-	.name = "backlight",
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
-- 
2.23.0

