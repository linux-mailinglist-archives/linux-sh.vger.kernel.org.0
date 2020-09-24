Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAB2767E5
	for <lists+linux-sh@lfdr.de>; Thu, 24 Sep 2020 06:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgIXEbp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Sep 2020 00:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgIXEbp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Sep 2020 00:31:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B75C0613CE
        for <linux-sh@vger.kernel.org>; Wed, 23 Sep 2020 21:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=j0cFLPmndaBA+ERC6bm8tE6hSdeeGMeW2Ei5NRrRtDg=; b=pwUxQca+IRzyRf+xoIM1qiYrns
        gnLfl0HPVPzKccLvZcp5+ZYU4unnXsTMAqac7h7BamplunPNnNn31CSG+C0QsCUUEuDm/1LrtfLgH
        vegVPV32K/n9IGqoRvsWWoSRoVRI81jWa0JITlfm3i9973urcuLvHr0dDggAkl+35mVyFBd+yYYT3
        8Oqh63RfjjRGPOXV/4U5PpGBiMWAVLn3k+RGugBD2FVELkwCfbBDmVBxYnylUpEE4Q2RGrcFA8iiI
        OveI8AYBCj1E7bFg19OIJk20EqC/jPxc0+Wt1CjMHywtRL1yE20BAgKrFsdJKEfSRmmpxPDA8xNaH
        D6FEgx2w==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLIuy-0002SN-8K; Thu, 24 Sep 2020 04:31:40 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     ysato@users.sourceforge.jp, dalias@libc.org
Cc:     linux-sh@vger.kernel.org
Subject: [PATCH] sh: remove CONFIG_IDE from most defconfig
Date:   Thu, 24 Sep 2020 06:31:39 +0200
Message-Id: <20200924043139.522028-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Remove CONFIG_IDE from defconfigs that did not actually select chipset
drivers, and switch ones that have libata drivers to libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
diff --git a/arch/sh/configs/sh03_defconfig b/arch/sh/configs/sh03_defconfig
index f0073ed3994771..48b457d59e790a 100644
--- a/arch/sh/configs/sh03_defconfig
+++ b/arch/sh/configs/sh03_defconfig
---
 arch/sh/configs/landisk_defconfig  | 9 ++++-----
 arch/sh/configs/microdev_defconfig | 2 --
 arch/sh/configs/sdk7780_defconfig  | 6 ++----
 arch/sh/configs/sdk7786_defconfig  | 3 ---
 arch/sh/configs/se7750_defconfig   | 1 -
 arch/sh/configs/sh03_defconfig     | 3 ---
 6 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index ba6ec042606f5d..e6c5ddf070c008 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -27,13 +27,12 @@ CONFIG_NETFILTER=y
 CONFIG_ATALK=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_OFFBOARD=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_AEC62XX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_ATP867X=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_MULTI_LUN=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=m
diff --git a/arch/sh/configs/microdev_defconfig b/arch/sh/configs/microdev_defconfig
index c65667d00313ba..e9825196dd66af 100644
--- a/arch/sh/configs/microdev_defconfig
+++ b/arch/sh/configs/microdev_defconfig
@@ -20,8 +20,6 @@ CONFIG_IP_PNP=y
 # CONFIG_IPV6 is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
diff --git a/arch/sh/configs/sdk7780_defconfig b/arch/sh/configs/sdk7780_defconfig
index d10a0414123a51..d00376eb044f8a 100644
--- a/arch/sh/configs/sdk7780_defconfig
+++ b/arch/sh/configs/sdk7780_defconfig
@@ -44,16 +44,14 @@ CONFIG_NET_SCHED=y
 CONFIG_PARPORT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_GENERIC=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_SCSI_SPI_ATTRS=y
 CONFIG_SCSI_FC_ATTRS=y
 CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
 CONFIG_NETDEVICES=y
diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 61bec46ebd66a8..4a44cac640bc94 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -116,9 +116,6 @@ CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_MULTI_LUN=y
diff --git a/arch/sh/configs/se7750_defconfig b/arch/sh/configs/se7750_defconfig
index 3f1c13799d799c..4defc7628a498a 100644
--- a/arch/sh/configs/se7750_defconfig
+++ b/arch/sh/configs/se7750_defconfig
@@ -29,7 +29,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_ROM=y
-CONFIG_IDE=y
 CONFIG_SCSI=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
diff --git a/arch/sh/configs/sh03_defconfig b/arch/sh/configs/sh03_defconfig
index f0073ed3994771..48b457d59e790a 100644
--- a/arch/sh/configs/sh03_defconfig
+++ b/arch/sh/configs/sh03_defconfig
@@ -39,9 +39,6 @@ CONFIG_IP_PNP_RARP=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=m
-CONFIG_BLK_DEV_IDETAPE=m
 CONFIG_SCSI=m
 CONFIG_BLK_DEV_SD=m
 CONFIG_BLK_DEV_SR=m
-- 
2.28.0

