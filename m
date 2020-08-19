Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F0D249E26
	for <lists+linux-sh@lfdr.de>; Wed, 19 Aug 2020 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgHSMfw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 19 Aug 2020 08:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgHSMfw (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 19 Aug 2020 08:35:52 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54762C061757
        for <linux-sh@vger.kernel.org>; Wed, 19 Aug 2020 05:35:51 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id HQbp2300A4C55Sk06Qbpoc; Wed, 19 Aug 2020 14:35:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NJl-0002HX-De; Wed, 19 Aug 2020 14:35:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NJl-00052p-Ca; Wed, 19 Aug 2020 14:35:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] sh: boards: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 19 Aug 2020 14:35:48 +0200
Message-Id: <20200819123548.19350-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The SuperH/J2 DT platform code is not a clock provider, and just needs
to call of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/sh/boards/of-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
index d91065e81a4e5cff..97a536d986a23f91 100644
--- a/arch/sh/boards/of-generic.c
+++ b/arch/sh/boards/of-generic.c
@@ -6,10 +6,10 @@
  */
 
 #include <linux/of.h>
+#include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/clocksource.h>
 #include <linux/irqchip.h>
-#include <linux/clk-provider.h>
 #include <asm/machvec.h>
 #include <asm/rtc.h>
 
-- 
2.17.1

