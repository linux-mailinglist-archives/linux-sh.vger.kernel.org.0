Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F84378E42C
	for <lists+linux-sh@lfdr.de>; Thu, 31 Aug 2023 03:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbjHaBMP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 30 Aug 2023 21:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344986AbjHaBMO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 30 Aug 2023 21:12:14 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F93CE6
        for <linux-sh@vger.kernel.org>; Wed, 30 Aug 2023 18:12:08 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-1.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id d1c72fed-e7c1-48e5-ad1b-c6dd102acb9a;
        Thu, 31 Aug 2023 10:12:07 +0900 (JST)
Received: from SIOS1075.flets-east.jp (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
        by sakura.ysato.name (Postfix) with ESMTPSA id 316F71C0246;
        Thu, 31 Aug 2023 10:12:07 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        glaubitz@physik.fu-berlin.de
Subject: [RESEND RFC PATCH 12/12] sh: OF defconfig.
Date:   Thu, 31 Aug 2023 10:11:59 +0900
Message-Id: <67d119de7223c02deaa2ab71e262ea2ac819b93d.1693444193.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1693444193.git.ysato@users.sourceforge.jp>
References: <cover.1693444193.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_SOFTFAIL,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/configs/landisk-of_defconfig        | 161 ++++++++++++++++++++
 arch/sh/configs/rts7751r2dplus-of_defconfig | 159 +++++++++++++++++++
 2 files changed, 320 insertions(+)
 create mode 100644 arch/sh/configs/landisk-of_defconfig
 create mode 100644 arch/sh/configs/rts7751r2dplus-of_defconfig

diff --git a/arch/sh/configs/landisk-of_defconfig b/arch/sh/configs/landisk-of_defconfig
new file mode 100644
index 000000000000..0bd96aef77d8
--- /dev/null
+++ b/arch/sh/configs/landisk-of_defconfig
@@ -0,0 +1,161 @@
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_SH_LANDISK_OF=y
+CONFIG_MODULES=y
+CONFIG_SLAB=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_SD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ATA=y
+CONFIG_PATA_ATP867X=y
+CONFIG_PATA_OF_PLATFORM=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETERION is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RDC is not set
+CONFIG_8139CP=y
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_SH_SCI=y
+# CONFIG_SERIAL_SH_SCI_CONSOLE is not set
+CONFIG_SERIAL_SH_SCI_EARLYCON=y
+CONFIG_HW_RANDOM=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=m
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+# CONFIG_LOGO_SUPERH_MONO is not set
+# CONFIG_LOGO_SUPERH_VGA16 is not set
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_YMFPCI=m
+CONFIG_HID_A4TECH=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_PANTHERLORD=y
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SUNPLUS=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_COMMON_CLK_SH7750=y
+CONFIG_EXT2_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_MINIX_FS=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_INIT_STACK_NONE=y
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_INFO_DWARF5=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_FTRACE is not set
diff --git a/arch/sh/configs/rts7751r2dplus-of_defconfig b/arch/sh/configs/rts7751r2dplus-of_defconfig
new file mode 100644
index 000000000000..56b627142205
--- /dev/null
+++ b/arch/sh/configs/rts7751r2dplus-of_defconfig
@@ -0,0 +1,159 @@
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_SH_RTS7751R2D_OF=y
+CONFIG_MODULES=y
+CONFIG_SLAB=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_SD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ATA=y
+CONFIG_PATA_OF_PLATFORM=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETERION is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RDC is not set
+CONFIG_8139CP=y
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_SH_SCI=y
+# CONFIG_SERIAL_SH_SCI_CONSOLE is not set
+CONFIG_SERIAL_SH_SCI_EARLYCON=y
+CONFIG_HW_RANDOM=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=m
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+# CONFIG_LOGO_SUPERH_MONO is not set
+# CONFIG_LOGO_SUPERH_VGA16 is not set
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_YMFPCI=m
+CONFIG_HID_A4TECH=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_PANTHERLORD=y
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SUNPLUS=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_COMMON_CLK_SH7750=y
+CONFIG_EXT2_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_MINIX_FS=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_INIT_STACK_NONE=y
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_INFO_DWARF5=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_FTRACE is not set
-- 
2.39.2

