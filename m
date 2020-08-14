Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814B02449E9
	for <lists+linux-sh@lfdr.de>; Fri, 14 Aug 2020 14:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgHNMmz (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 14 Aug 2020 08:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHNMmz (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 14 Aug 2020 08:42:55 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD32C061384
        for <linux-sh@vger.kernel.org>; Fri, 14 Aug 2020 05:42:54 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id FQim2300D4C55Sk01Qim2t; Fri, 14 Aug 2020 14:42:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6Z2k-0005Ig-KD; Fri, 14 Aug 2020 14:42:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6Z2k-0007je-HU; Fri, 14 Aug 2020 14:42:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        kogiidena <kogiidena@eggplant.ddo.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] sh: landisk: Add missing initialization of sh_io_port_base
Date:   Fri, 14 Aug 2020 14:42:45 +0200
Message-Id: <20200814124245.29692-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The Landisk setup code maps the CF IDE area using ioremap_prot(), and
passes the resulting virtual addresses to the pata_platform driver,
disguising them as I/O port addresses.  Hence the pata_platform driver
translates them again using ioport_map().
As CONFIG_GENERIC_IOMAP=n, and CONFIG_HAS_IOPORT_MAP=y, the
SuperH-specific mapping code in arch/sh/kernel/ioport.c translates
I/O port addresses to virtual addresses by adding sh_io_port_base, which
defaults to -1, thus breaking the assumption of an identity mapping.

Fix this by setting sh_io_port_base to zero.

Fixes: 37b7a97884ba64bf ("sh: machvec IO death.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on USL-5P, using either
CONFIG_ATA/CONFIG_ATA_SFF/CONFIG_PATA_PLATFORM, or legacy
CONFIG_IDE/CONFIG_BLK_DEV_PLATFORM.

Sato-san: As you said IDE works fine on Landisk using
	  CONFIG_BLK_DEV_AEC62XX, I assume you have a different model
	  than the USL-5P, with PCI IDE?
---
 arch/sh/boards/mach-landisk/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sh/boards/mach-landisk/setup.c b/arch/sh/boards/mach-landisk/setup.c
index 16b4d8b0bb8503d9..2c44b94f82fb2740 100644
--- a/arch/sh/boards/mach-landisk/setup.c
+++ b/arch/sh/boards/mach-landisk/setup.c
@@ -82,6 +82,9 @@ device_initcall(landisk_devices_setup);
 
 static void __init landisk_setup(char **cmdline_p)
 {
+	/* I/O port identity mapping */
+	__set_io_port_base(0);
+
 	/* LED ON */
 	__raw_writeb(__raw_readb(PA_LED) | 0x03, PA_LED);
 
-- 
2.17.1

