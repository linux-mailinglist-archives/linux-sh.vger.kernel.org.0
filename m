Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA91E78DC96
	for <lists+linux-sh@lfdr.de>; Wed, 30 Aug 2023 20:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243125AbjH3SqE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 30 Aug 2023 14:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242515AbjH3I6a (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 30 Aug 2023 04:58:30 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E00ACD2
        for <linux-sh@vger.kernel.org>; Wed, 30 Aug 2023 01:58:27 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-0.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id 7de84e88-2400-47ca-9cea-8dedb6d6dc3e;
        Wed, 30 Aug 2023 17:42:21 +0900 (JST)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
        by sakura.ysato.name (Postfix) with ESMTPSA id 1D6351C007F;
        Wed, 30 Aug 2023 17:42:21 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [RFC PATCH 01/12] sh: Add OF target boards.
Date:   Wed, 30 Aug 2023 17:42:02 +0900
Message-Id: <95d8b86480c60012252b37b9b13e5f709a2ec177.1693384846.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1693384846.git.ysato@users.sourceforge.jp>
References: <cover.1693384846.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/Kconfig        | 12 +++++++++---
 arch/sh/boards/Kconfig | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2b3ce4fd3956..7a3e54bf0da9 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -64,10 +64,10 @@ config SUPERH
 	select MODULES_USE_ELF_RELA
 	select NEED_SG_DMA_LENGTH
 	select NO_DMA if !MMU && !DMA_COHERENT
-	select NO_GENERIC_PCI_IOPORT_MAP if PCI
+	select NO_GENERIC_PCI_IOPORT_MAP if !SH_DEVICE_TREE
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND
-	select PCI_DOMAINS if PCI
+	select PCI_DOMAINS if PCI && !SH_DEVICE_TREE
 	select PERF_EVENTS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
@@ -363,14 +363,17 @@ config CPU_SUBTYPE_SH7091
 config CPU_SUBTYPE_SH7750R
 	bool "Support SH7750R processor"
 	select CPU_SH4
+	select COMMON_CLK_SH7750 if COMMMON_CLK
 
 config CPU_SUBTYPE_SH7750S
 	bool "Support SH7750S processor"
 	select CPU_SH4
+	select COMMON_CLK_SH7750 if COMMMON_CLK
 
 config CPU_SUBTYPE_SH7751
 	bool "Support SH7751 processor"
 	select CPU_SH4
+	select COMMON_CLK_SH7750 if COMMMON_CLK
 	help
 	  Select SH7751 if you have a 166 Mhz SH-4 HD6417751 CPU,
 	  or if you have a HD6417751R CPU.
@@ -378,6 +381,8 @@ config CPU_SUBTYPE_SH7751
 config CPU_SUBTYPE_SH7751R
 	bool "Support SH7751R processor"
 	select CPU_SH4
+	select COMMON_CLK_SH7750 if COMMMON_CLK
+	select PCI_SH7751 if SH_DEVICE_TREE
 
 config CPU_SUBTYPE_SH7760
 	bool "Support SH7760 processor"
@@ -702,7 +707,7 @@ config BUILTIN_DTB_SOURCE
 config ZERO_PAGE_OFFSET
 	hex
 	default "0x00010000" if PAGE_SIZE_64KB || SH_RTS7751R2D || \
-				SH_7751_SOLUTION_ENGINE
+				SH_7751_SOLUTION_ENGINE || SH_RTS7751R2D_OF
 	default "0x00004000" if PAGE_SIZE_16KB || SH_SH03
 	default "0x00002000" if PAGE_SIZE_8KB
 	default "0x00001000"
@@ -744,6 +749,7 @@ config ROMIMAGE_MMCIF
 choice
 	prompt "Kernel command line"
 	optional
+	depends on !SH_DEVICE_TREE
 	default CMDLINE_OVERWRITE
 	help
 	  Setting this option allows the kernel command line arguments
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index fafe15d3ba1d..ffdada2a128d 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -16,9 +16,14 @@ config SH_DEVICE_TREE
 	bool
 	select OF
 	select OF_EARLY_FLATTREE
+	select OF_ADDRESS
 	select TIMER_OF
 	select COMMON_CLK
 	select GENERIC_CALIBRATE_DELAY
+	select GENERIC_IOMAP
+	select GENERIC_IRQ_CHIP
+	select SYS_SUPPORTS_PCI
+	select GENERIC_PCI_IOMAP if PCI
 
 config SH_JCORE_SOC
 	bool "J-Core SoC"
@@ -161,6 +166,17 @@ config SH_RTS7751R2D
 	  Select RTS7751R2D if configuring for a Renesas Technology
 	  Sales SH-Graphics board.
 
+config SH_RTS7751R2D_OF
+	bool "RTS7751R2D (DeviceTree)"
+	depends on CPU_SUBTYPE_SH7751R
+	select HAVE_PCI
+	select IO_TRAPPED if MMU
+	select SH_DEVICE_TREE
+	select COMMON_CLK
+	help
+	  Select RTS7751R2D if configuring for a Renesas Technology
+	  Sales SH-Graphics board. (Use DeviceTree)
+
 config SH_RSK
 	bool "Renesas Starter Kit"
 	depends on CPU_SUBTYPE_SH7201 || CPU_SUBTYPE_SH7203 || \
@@ -300,8 +316,20 @@ config SH_LANDISK
 	bool "LANDISK"
 	depends on CPU_SUBTYPE_SH7751R
 	select HAVE_PCI
+	select SYS_SUPPORTS_PCI
+	help
+	  I-O DATA DEVICE, INC. "LANDISK Series" support.
+
+config SH_LANDISK_OF
+	bool "LANDISK (DeviceTree)"
+	depends on CPU_SUBTYPE_SH7751R
+	select HAVE_PCI
+	select SYS_SUPPORTS_PCI
+	select SH_DEVICE_TREE
+	select COMMON_CLK
 	help
 	  I-O DATA DEVICE, INC. "LANDISK Series" support.
+	  Use Device Tree.
 
 config SH_TITAN
 	bool "TITAN"
-- 
2.39.2

