Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682F0E369B
	for <lists+linux-sh@lfdr.de>; Thu, 24 Oct 2019 17:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503187AbfJXP1D (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Oct 2019 11:27:03 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55340 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503092AbfJXP1D (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Oct 2019 11:27:03 -0400
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id HTT12100Y5USYZQ01TT1J4; Thu, 24 Oct 2019 17:27:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNf0v-00077O-H8; Thu, 24 Oct 2019 17:27:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNf0v-0007wz-G0; Thu, 24 Oct 2019 17:27:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jiri Kosina <trivial@kernel.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] sh: mach-highlander: Spelling s/Conector/Connector/
Date:   Thu, 24 Oct 2019 17:27:00 +0200
Message-Id: <20191024152700.30520-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Fix misspellings of "Connector".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/include/mach-common/mach/highlander.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/mach-common/mach/highlander.h b/arch/sh/include/mach-common/mach/highlander.h
index 66d3e40fd0464b9c..fb44c299d0337e3f 100644
--- a/arch/sh/include/mach-common/mach/highlander.h
+++ b/arch/sh/include/mach-common/mach/highlander.h
@@ -18,7 +18,7 @@
 #define PA_IRLPRI4      (PA_BCR+0x000a) /* Interrupt Priorty 4 */
 #define PA_RSTCTL       (PA_BCR+0x000c) /* Reset Control */
 #define PA_PCIBD        (PA_BCR+0x000e) /* PCI Board detect control */
-#define PA_PCICD        (PA_BCR+0x0010) /* PCI Conector detect control */
+#define PA_PCICD        (PA_BCR+0x0010) /* PCI Connector detect control */
 #define PA_EXTGIO       (PA_BCR+0x0016) /* Extension GPIO Control */
 #define PA_IVDRMON      (PA_BCR+0x0018) /* iVDR Moniter control */
 #define PA_IVDRCTL      (PA_BCR+0x001a) /* iVDR control */
@@ -80,7 +80,7 @@
 #define	PA_SDPOW	(PA_BCR+0x0004)	/* SD Power control */
 #define	PA_RSTCTL	(PA_BCR+0x0006)	/* Device Reset control */
 #define	PA_PCIBD	(PA_BCR+0x0008)	/* PCI Board detect control */
-#define	PA_PCICD	(PA_BCR+0x000a)	/* PCI Conector detect control */
+#define	PA_PCICD	(PA_BCR+0x000a)	/* PCI Connector detect control */
 #define	PA_ZIGIO1	(PA_BCR+0x000c)	/* Zigbee IO control 1 */
 #define	PA_ZIGIO2	(PA_BCR+0x000e)	/* Zigbee IO control 2 */
 #define	PA_ZIGIO3	(PA_BCR+0x0010)	/* Zigbee IO control 3 */
-- 
2.17.1

