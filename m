Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53CE1FCFBF
	for <lists+linux-sh@lfdr.de>; Wed, 17 Jun 2020 16:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgFQOhT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 17 Jun 2020 10:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgFQOgv (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 17 Jun 2020 10:36:51 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B383C061798
        for <linux-sh@vger.kernel.org>; Wed, 17 Jun 2020 07:36:50 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by andre.telenet-ops.be with bizsmtp
        id sEcn220011Jlgh201EcnRF; Wed, 17 Jun 2020 16:36:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlZBG-0007q5-U9; Wed, 17 Jun 2020 16:36:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlZBG-0004mj-Sr; Wed, 17 Jun 2020 16:36:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 9/9] sh: machvec: Modernize printing of kernel messages
Date:   Wed, 17 Jun 2020 16:36:39 +0200
Message-Id: <20200617143639.18315-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617143639.18315-1-geert+renesas@glider.be>
References: <20200617143639.18315-1-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

  - Convert from printk() to pr_*(),
  - Add missing continuations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
  - Add Tested-by.
---
 arch/sh/kernel/machvec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sh/kernel/machvec.c b/arch/sh/kernel/machvec.c
index beadbbdb44867759..0e9fa33a9b6ab38c 100644
--- a/arch/sh/kernel/machvec.c
+++ b/arch/sh/kernel/machvec.c
@@ -64,10 +64,10 @@ static int __init early_parse_mv(char *from)
 
 	mvp = get_mv_byname(mv_name);
 	if (unlikely(!mvp)) {
-		printk("Available vectors:\n\n\t'%s', ", sh_mv.mv_name);
+		pr_info("Available vectors:\n\n\t'%s', ", sh_mv.mv_name);
 		for_each_mv(mvp)
-			printk("'%s', ", mvp->mv_name);
-		printk("\n\n");
+			pr_cont("'%s', ", mvp->mv_name);
+		pr_cont("\n\n");
 		panic("Failed to select machvec '%s' -- halting.\n",
 		      mv_name);
 	} else
@@ -104,7 +104,7 @@ void __init sh_mv_setup(void)
 			sh_mv = *(struct sh_machine_vector *)&__machvec_start;
 	}
 
-	printk(KERN_NOTICE "Booting machvec: %s\n", get_system_type());
+	pr_notice("Booting machvec: %s\n", get_system_type());
 
 	/*
 	 * Manually walk the vec, fill in anything that the board hasn't yet
-- 
2.17.1

