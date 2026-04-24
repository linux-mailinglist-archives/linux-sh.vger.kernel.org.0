Return-Path: <linux-sh+bounces-3723-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM0RHUdJ62mWKgAAu9opvQ
	(envelope-from <linux-sh+bounces-3723-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Fri, 24 Apr 2026 12:43:19 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CA45D496
	for <lists+linux-sh@lfdr.de>; Fri, 24 Apr 2026 12:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05618300861B
	for <lists+linux-sh@lfdr.de>; Fri, 24 Apr 2026 10:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB74351C11;
	Fri, 24 Apr 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx+C3ZuG"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A52DF6E9;
	Fri, 24 Apr 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027312; cv=none; b=H8OKXJYRknxz+QjTIOxqoxTVdOBE1gMkM91o6L2caDfXbHo9XlyYiLtDw39/3gG/rTp5aaPZlWc/vEnpLmE8AwfcpxfXcvGmsE/7QIVQ4/H8vtZhsAqkmY/8Wnx/iFSig7zmxSJP45oD+MxEyIuh44qijzT5dVf18nO+HeThoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027312; c=relaxed/simple;
	bh=h/6Jxxor81wMhfQiI5GP4MyduOe4/Y9St/bFFJRhbk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5mQIhfkAU9VraZNBKrJQYzQYf7TKTIEFDFBFDv3n5Oe95PLdrHexwtfjaqOeFHeBya3/l5X9i4xdFNRtfSnXwCoQ0KXBEb6DWAKszWMUjjwo+KG9eyCx5TM4FP8FIE2l8sV9ubyzN+XKl/1TZXtS/+L8TqBTytclPEy5RcX0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx+C3ZuG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A24C19425;
	Fri, 24 Apr 2026 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027312;
	bh=h/6Jxxor81wMhfQiI5GP4MyduOe4/Y9St/bFFJRhbk4=;
	h=From:To:Cc:Subject:Date:From;
	b=Jx+C3ZuGioLlPr+zTxpZxWp0Yu8fQljvQ4Pw6su0hqRzfy26R2rqGiRiX2Y+rOy7c
	 ZD61I1fOdTPn5C6TeQVc09zl2edMF7ezNqVsszyfDvY1Z/ecEQOIE1OsxeyZHOt7E5
	 9tPUHtgYw2BjI43on2yK81d0gLYRcZfXOqh/12dcLDi0bvN4rZHWnblT8dDuq7TmWG
	 vqaU64QYrJxXlABx/XxUQxjMXsP3bZZ42CZFjiBz7eLKA81HvHPGlzyNHCm4zxPXP/
	 SP4abAY5jtmEQz3xHIFNCVdxEm2DqM38kDbPov1eEDJyYIf3HT5jTPqbnErTYZiiNj
	 eitL9I3NTUt0Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDyn-0000000Aypo-3fFM;
	Fri, 24 Apr 2026 12:41:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] maple: switch to dynamic root device
Date: Fri, 24 Apr 2026 12:41:42 +0200
Message-ID: <20260424104142.2617115-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 813CA45D496
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3723-lists,linux-sh=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-sh@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Driver core expects devices to be dynamically allocated and will, for
example, complain loudly when no release function has been provided.

Use root_device_register() to allocate and register the root device
instead of open coding using a static device.

Note that this also fixes a reference leak in case device_register()
fails which may be flagged by static checkers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/sh/maple/maple.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
index 5585f220e495..7c0f847ee368 100644
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -44,7 +44,7 @@ static LIST_HEAD(maple_sentq);
 static DEFINE_MUTEX(maple_wlist_lock);
 
 static struct maple_driver maple_unsupported_device;
-static struct device maple_bus;
+static struct device *maple_bus;
 static int subdevice_map[MAPLE_PORTS];
 static unsigned long *maple_sendbuf, *maple_sendptr, *maple_lastptr;
 static unsigned long maple_pnp_time;
@@ -229,7 +229,7 @@ static struct maple_device *maple_alloc_dev(int port, int unit)
 		return NULL;
 	}
 	mdev->dev.bus = &maple_bus_type;
-	mdev->dev.parent = &maple_bus;
+	mdev->dev.parent = maple_bus;
 	init_waitqueue_head(&mdev->maple_wait);
 	return mdev;
 }
@@ -761,10 +761,6 @@ static int maple_match_bus_driver(struct device *devptr,
 	return 0;
 }
 
-static void maple_bus_release(struct device *dev)
-{
-}
-
 static struct maple_driver maple_unsupported_device = {
 	.drv = {
 		.name = "maple_unsupported_device",
@@ -779,11 +775,6 @@ static const struct bus_type maple_bus_type = {
 	.match = maple_match_bus_driver,
 };
 
-static struct device maple_bus = {
-	.init_name = "maple",
-	.release = maple_bus_release,
-};
-
 static int __init maple_bus_init(void)
 {
 	int retval, i;
@@ -791,9 +782,11 @@ static int __init maple_bus_init(void)
 
 	__raw_writel(0, MAPLE_ENABLE);
 
-	retval = device_register(&maple_bus);
-	if (retval)
+	maple_bus = root_device_register("maple");
+	if (IS_ERR(maple_bus)) {
+		retval = PTR_ERR(maple_bus);
 		goto cleanup;
+	}
 
 	retval = bus_register(&maple_bus_type);
 	if (retval)
@@ -806,22 +799,21 @@ static int __init maple_bus_init(void)
 	/* allocate memory for maple bus dma */
 	retval = maple_get_dma_buffer();
 	if (retval) {
-		dev_err(&maple_bus, "failed to allocate DMA buffers\n");
+		dev_err(maple_bus, "failed to allocate DMA buffers\n");
 		goto cleanup_basic;
 	}
 
 	/* set up DMA interrupt handler */
 	retval = maple_set_dma_interrupt_handler();
 	if (retval) {
-		dev_err(&maple_bus, "bus failed to grab maple "
-			"DMA IRQ\n");
+		dev_err(maple_bus, "bus failed to grab maple DMA IRQ\n");
 		goto cleanup_dma;
 	}
 
 	/* set up VBLANK interrupt handler */
 	retval = maple_set_vblank_interrupt_handler();
 	if (retval) {
-		dev_err(&maple_bus, "bus failed to grab VBLANK IRQ\n");
+		dev_err(maple_bus, "bus failed to grab VBLANK IRQ\n");
 		goto cleanup_irq;
 	}
 
@@ -855,7 +847,7 @@ static int __init maple_bus_init(void)
 	maple_pnp_time = jiffies + HZ;
 	/* prepare initial queue */
 	maple_send();
-	dev_info(&maple_bus, "bus core now registered\n");
+	dev_info(maple_bus, "bus core now registered\n");
 
 	return 0;
 
@@ -878,7 +870,7 @@ static int __init maple_bus_init(void)
 	bus_unregister(&maple_bus_type);
 
 cleanup_device:
-	device_unregister(&maple_bus);
+	root_device_unregister(maple_bus);
 
 cleanup:
 	printk(KERN_ERR "Maple bus registration failed\n");
-- 
2.53.0


