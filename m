Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA231150FE
	for <lists+linux-sh@lfdr.de>; Fri,  6 Dec 2019 14:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLFN2y (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 6 Dec 2019 08:28:54 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:51586 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfLFN2y (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 6 Dec 2019 08:28:54 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id adUr2100C5USYZQ01dUr2F; Fri, 06 Dec 2019 14:28:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDf9-0006FD-Ag; Fri, 06 Dec 2019 14:28:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDf9-0007f1-89; Fri, 06 Dec 2019 14:28:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-usb@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: host: ehci-sh: Remove unused platform data support
Date:   Fri,  6 Dec 2019 14:28:49 +0100
Message-Id: <20191206132849.29406-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

ehci_sh_platdata was never used, remove it. It can be resurrected from
git history when needed.

This basically reverts commit 3e0c70d050c7ed6d ("usb: ehci-sh: Add PHY
init function with platform data").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/ehci-sh.c            |  7 -------
 include/linux/platform_data/ehci-sh.h | 16 ----------------
 2 files changed, 23 deletions(-)
 delete mode 100644 include/linux/platform_data/ehci-sh.h

diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index 2afde14dc425c261..c25c51d26f26035b 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -8,7 +8,6 @@
  */
 #include <linux/platform_device.h>
 #include <linux/clk.h>
-#include <linux/platform_data/ehci-sh.h>
 
 struct ehci_sh_priv {
 	struct clk *iclk, *fclk;
@@ -76,7 +75,6 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct ehci_sh_priv *priv;
-	struct ehci_sh_platdata *pdata;
 	struct usb_hcd *hcd;
 	int irq, ret;
 
@@ -89,8 +87,6 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 		goto fail_create_hcd;
 	}
 
-	pdata = dev_get_platdata(&pdev->dev);
-
 	/* initialize hcd */
 	hcd = usb_create_hcd(&ehci_sh_hc_driver, &pdev->dev,
 			     dev_name(&pdev->dev));
@@ -127,9 +123,6 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 	clk_enable(priv->fclk);
 	clk_enable(priv->iclk);
 
-	if (pdata && pdata->phy_init)
-		pdata->phy_init();
-
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to add hcd");
diff --git a/include/linux/platform_data/ehci-sh.h b/include/linux/platform_data/ehci-sh.h
deleted file mode 100644
index 219bd79dabfc0a0e..0000000000000000
--- a/include/linux/platform_data/ehci-sh.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * EHCI SuperH driver platform data
- *
- * Copyright (C) 2012  Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
- * Copyright (C) 2012  Renesas Solutions Corp.
- */
-
-#ifndef __USB_EHCI_SH_H
-#define __USB_EHCI_SH_H
-
-struct ehci_sh_platdata {
-	void (*phy_init)(void); /* Phy init function */
-};
-
-#endif /* __USB_EHCI_SH_H */
-- 
2.17.1

