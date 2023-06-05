Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D4F722931
	for <lists+linux-sh@lfdr.de>; Mon,  5 Jun 2023 16:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbjFEOsS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 5 Jun 2023 10:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjFEOsR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 5 Jun 2023 10:48:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA5A100;
        Mon,  5 Jun 2023 07:48:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2F7B81FD66;
        Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZC4xx7emTv2a2UFR6kQdaFCgwhbw6bVXOEez8CyU1/c=;
        b=mUzZuiZ6aF053sDvpp4FriypRbZ4TZ5GdiOy2xTbj9VKtUMMmhdTXgcN8c3PA7c2K3imX3
        cq6bfAO85IQEGENNR41HhCw7IpyjuYnF6pZOFGAt0xDD8RiltH3hWX3Jpwn8YNLY7mOxqb
        cwekQorakSqzsWB6uuoBwWcMXNn9gO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976495;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZC4xx7emTv2a2UFR6kQdaFCgwhbw6bVXOEez8CyU1/c=;
        b=sCYgZIOX2i3BAehRDWCz4hGErmxZ7qxx9Yatn/fm2L/IYlhHfdUbHWsAfo2jhPyNyhIf4N
        oXX7REdgDNPP24AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF6D013A3C;
        Mon,  5 Jun 2023 14:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YFCmNa71fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:14 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/30] backlight/bd6107: Compare against struct fb_info.device
Date:   Mon,  5 Jun 2023 16:47:43 +0200
Message-Id: <20230605144812.15241-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Struct bd6107_platform_data refers to a platform device within
the Linux device hierarchy. The test in bd6107_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/bd6107.c     | 2 +-
 include/linux/platform_data/bd6107.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index f4db6c064635..fa3dd45c8f9d 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -104,7 +104,7 @@ static int bd6107_backlight_check_fb(struct backlight_device *backlight,
 {
 	struct bd6107 *bd = bl_get_data(backlight);
 
-	return bd->pdata->fbdev == NULL || bd->pdata->fbdev == info->dev;
+	return !bd->pdata->dev || bd->pdata->dev == info->device;
 }
 
 static const struct backlight_ops bd6107_backlight_ops = {
diff --git a/include/linux/platform_data/bd6107.h b/include/linux/platform_data/bd6107.h
index 54a06a4d2618..596ca4f95cfa 100644
--- a/include/linux/platform_data/bd6107.h
+++ b/include/linux/platform_data/bd6107.h
@@ -8,7 +8,7 @@
 struct device;
 
 struct bd6107_platform_data {
-	struct device *fbdev;
+	struct device *dev;
 	unsigned int def_value;
 };
 
-- 
2.40.1

