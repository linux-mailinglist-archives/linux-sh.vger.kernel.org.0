Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF32A3BE66
	for <lists+linux-sh@lfdr.de>; Mon, 10 Jun 2019 23:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389891AbfFJVUg (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 10 Jun 2019 17:20:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37444 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390074AbfFJVUf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 10 Jun 2019 17:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jzhuFJyutEd4Klc1zDqg9CjjQcxV5ZLJVdTWaw679qk=; b=UNNZsNuY3vULON92hzCaU4vaxl
        ApjJ1BxYHasQ+8Z/Nof9zTZuRn70w7RiE+8a1+2hM6DGe/YolLpC25qG8PQx57rCWEVtEWxEpLp8Z
        61J2c0DEZL1uAmvI8PJFeuR9io4VLTCzMqmulf6J8dWs5BZ50BPreLSz7P8udVdPdQWc0g4nSta20
        qZ/4J/1LAJYxNyt/El+JnIJRzIOFI5It2uDxanozjtKDtM7eFhWq36ezNMmDMfmYOROZWC1sLC4wn
        hftHpzyU/Dkr9MBnnG1iGhFATjfqa1gM9ycyOt589wjAMcCB6UGU1m/dXs39nWr5/P5w1xmGZUDaf
        DeKuNkGg==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1haRiO-0000PP-Co; Mon, 10 Jun 2019 21:20:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] binfmt_flat: remove flat_old_ram_flag
Date:   Mon, 10 Jun 2019 23:20:04 +0200
Message-Id: <20190610212015.9157-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610212015.9157-1-hch@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Instead add a Kconfig variable that only h8300 selects.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/flat.h        | 1 -
 arch/c6x/include/asm/flat.h        | 1 -
 arch/h8300/Kconfig                 | 1 +
 arch/h8300/include/asm/flat.h      | 1 -
 arch/m68k/include/asm/flat.h       | 1 -
 arch/microblaze/include/asm/flat.h | 1 -
 arch/sh/include/asm/flat.h         | 1 -
 arch/xtensa/include/asm/flat.h     | 1 -
 fs/Kconfig.binfmt                  | 3 +++
 fs/binfmt_flat.c                   | 3 ++-
 10 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/flat.h b/arch/arm/include/asm/flat.h
index a185fe023b60..acf162111ee2 100644
--- a/arch/arm/include/asm/flat.h
+++ b/arch/arm/include/asm/flat.h
@@ -9,7 +9,6 @@
 #include <linux/uaccess.h>
 
 #define	flat_argvp_envp_on_stack()		1
-#define	flat_old_ram_flag(flags)		(flags)
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h
index c4d703b454c6..353e4d06e8c0 100644
--- a/arch/c6x/include/asm/flat.h
+++ b/arch/c6x/include/asm/flat.h
@@ -5,7 +5,6 @@
 #include <asm/unaligned.h>
 
 #define flat_argvp_envp_on_stack()			0
-#define flat_old_ram_flag(flags)			(flags)
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index ecfc4b4b6373..d30e8727b02d 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -2,6 +2,7 @@
 config H8300
         def_bool y
 	select ARCH_32BIT_OFF_T
+	select BINFMT_FLAT_OLD_ALWAYS_RAM
 	select GENERIC_ATOMIC64
 	select HAVE_UID16
 	select VIRT_TO_BUS
diff --git a/arch/h8300/include/asm/flat.h b/arch/h8300/include/asm/flat.h
index 7ef7eefded3d..14cc928d5478 100644
--- a/arch/h8300/include/asm/flat.h
+++ b/arch/h8300/include/asm/flat.h
@@ -9,7 +9,6 @@
 #include <asm/unaligned.h>
 
 #define	flat_argvp_envp_on_stack()		1
-#define	flat_old_ram_flag(flags)		1
 
 /*
  * on the H8 a couple of the relocations have an instruction in the
diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index 217fa89c8e34..7b1fb5c2809e 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -9,7 +9,6 @@
 #include <linux/uaccess.h>
 
 #define	flat_argvp_envp_on_stack()		1
-#define	flat_old_ram_flag(flags)		(flags)
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/microblaze/include/asm/flat.h b/arch/microblaze/include/asm/flat.h
index 846084fa7f04..1cd8d7f4cf12 100644
--- a/arch/microblaze/include/asm/flat.h
+++ b/arch/microblaze/include/asm/flat.h
@@ -14,7 +14,6 @@
 #include <asm/unaligned.h>
 
 #define	flat_argvp_envp_on_stack()	0
-#define	flat_old_ram_flag(flags)	(flags)
 
 /*
  * Microblaze works a little differently from other arches, because
diff --git a/arch/sh/include/asm/flat.h b/arch/sh/include/asm/flat.h
index 0d520b4cc5ea..015678d7b771 100644
--- a/arch/sh/include/asm/flat.h
+++ b/arch/sh/include/asm/flat.h
@@ -12,7 +12,6 @@
 #include <asm/unaligned.h>
 
 #define	flat_argvp_envp_on_stack()		0
-#define	flat_old_ram_flag(flags)		(flags)
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/xtensa/include/asm/flat.h b/arch/xtensa/include/asm/flat.h
index a1d88aa3ef8a..b215c1e66958 100644
--- a/arch/xtensa/include/asm/flat.h
+++ b/arch/xtensa/include/asm/flat.h
@@ -5,7 +5,6 @@
 #include <asm/unaligned.h>
 
 #define flat_argvp_envp_on_stack()			0
-#define flat_old_ram_flag(flags)			(flags)
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index f87ddd1b6d72..5658e12ad944 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -97,6 +97,9 @@ config BINFMT_FLAT
 	help
 	  Support uClinux FLAT format binaries.
 
+config BINFMT_FLAT_OLD_ALWAYS_RAM
+	bool
+
 config BINFMT_ZFLAT
 	bool "Enable ZFLAT support"
 	depends on BINFMT_FLAT
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index c0e4535dc1ec..18d82fd5f57c 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -488,7 +488,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * fix up the flags for the older format,  there were all kinds
 	 * of endian hacks,  this only works for the simple cases
 	 */
-	if (rev == OLD_FLAT_VERSION && flat_old_ram_flag(flags))
+	if (IS_ENABLED(CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM) &&
+	    rev == OLD_FLAT_VERSION)
 		flags = FLAT_FLAG_RAM;
 
 #ifndef CONFIG_BINFMT_ZFLAT
-- 
2.20.1

