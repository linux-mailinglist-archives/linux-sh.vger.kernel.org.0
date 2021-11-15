Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8BC44FEAC
	for <lists+linux-sh@lfdr.de>; Mon, 15 Nov 2021 07:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhKOGf4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 15 Nov 2021 01:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhKOGf4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 15 Nov 2021 01:35:56 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A438CC061746;
        Sun, 14 Nov 2021 22:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=h5X8gcsyL1WxSZzJUqESom9+PnxuV9JPbXOEEk5fPhs=; b=uWgnClOH7zriUsMz06ItcAyvnn
        fp6rtbr2KqzYV84LtRji4VAhAO9pMCwi2d/Oenphzj8GT82m3GRPf2SWXyQ0hpXJMXI1QZc61h3+/
        dHRYQ6lU2eWVMJ8RLjYMABFF9PoluQREcsn9Evl95AP+pbT6FEwjl0osYnkxVgiP+w6N5TumIxp0Z
        RYUsB8rlv7xgN6Ae/6+t3FLQUNjGRyNTkp30SHzqoAANvzbUOhsfvYb9QmxeuKrNSS/cQ+13y490z
        oiYmyVKlQpf9YoG7ypO1xaBsUre4GilNoMbwYTKcAndrhDL/yhVxXWgIimvOnv/7QA0wt/lCjkEDa
        b5taH/Kw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mmVY3-00ESW0-32; Mon, 15 Nov 2021 06:32:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
        Manuel Lauss <mano@roarinelk.homelinux.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: sh7760fb: document fallthrough cases
Date:   Sun, 14 Nov 2021 22:32:57 -0800
Message-Id: <20211115063257.14369-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Fix fallthrough warnings in sh776fb.c:

../drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
../drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  138 |                 lgray = 1;
../drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  143 |                 lgray = 1;

Just document the current state of code execution/flow.

Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
Cc: Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/sh7760fb.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20211112.orig/drivers/video/fbdev/sh7760fb.c
+++ linux-next-20211112/drivers/video/fbdev/sh7760fb.c
@@ -136,11 +136,13 @@ static int sh7760fb_get_color_info(struc
 		break;
 	case LDDFR_4BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_4BPP:
 		lbpp = 4;
 		break;
 	case LDDFR_6BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_8BPP:
 		lbpp = 8;
 		break;
