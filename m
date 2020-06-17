Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF7C1FCFB8
	for <lists+linux-sh@lfdr.de>; Wed, 17 Jun 2020 16:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgFQOgv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 17 Jun 2020 10:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgFQOgu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 17 Jun 2020 10:36:50 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427EAC061755
        for <linux-sh@vger.kernel.org>; Wed, 17 Jun 2020 07:36:50 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by michel.telenet-ops.be with bizsmtp
        id sEcm2200Q1Jlgh206Ecml1; Wed, 17 Jun 2020 16:36:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlZBG-0007pj-Li; Wed, 17 Jun 2020 16:36:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlZBG-0004mL-K4; Wed, 17 Jun 2020 16:36:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/9] sh: fault: Fix duplicate printing of "PC:"
Date:   Wed, 17 Jun 2020 16:36:31 +0200
Message-Id: <20200617143639.18315-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617143639.18315-1-geert+renesas@glider.be>
References: <20200617143639.18315-1-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Somewhere along the patch handling path, both the old "printk(KERN_ALERT
...)" and the new "pr_alert(...)" were retained, leading to the
duplicate printing of "PC:".

Drop the old one.

Fixes: eaabf98b0932a540 ("sh: fault: modernize printing of kernel messages")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/sh/mm/fault.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index fbe1f2fe9a8c8f55..acd1c75994983825 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -208,7 +208,6 @@ show_fault_oops(struct pt_regs *regs, unsigned long address)
 	if (!oops_may_print())
 		return;
 
-	printk(KERN_ALERT "PC:");
 	pr_alert("BUG: unable to handle kernel %s at %08lx\n",
 		 address < PAGE_SIZE ? "NULL pointer dereference"
 				     : "paging request",
-- 
2.17.1

