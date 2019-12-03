Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4999411022D
	for <lists+linux-sh@lfdr.de>; Tue,  3 Dec 2019 17:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfLCQ0t (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 3 Dec 2019 11:26:49 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:42248 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbfLCQ0t (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 3 Dec 2019 11:26:49 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id ZUSm2100Z5USYZQ06USmFy; Tue, 03 Dec 2019 17:26:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icB0g-0007fo-Mb; Tue, 03 Dec 2019 17:26:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icB0g-0005Cu-Kd; Tue, 03 Dec 2019 17:26:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] sh: machvec: Modernize printing of kernel messages
Date:   Tue,  3 Dec 2019 17:26:44 +0100
Message-Id: <20191203162645.19950-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203162645.19950-1-geert+renesas@glider.be>
References: <20191203162645.19950-1-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

  - Convert from printk() to pr_*(),
  - Add missing continuations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
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

