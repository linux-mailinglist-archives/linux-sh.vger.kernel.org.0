Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACAFE444B2
	for <lists+linux-sh@lfdr.de>; Thu, 13 Jun 2019 18:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730620AbfFMQiN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 13 Jun 2019 12:38:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41282 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730619AbfFMHJ6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 13 Jun 2019 03:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ma5eKnRXvZOzGobMa730z8X3OUv6tpzeX/HaYaLIvgA=; b=hD/Zwj4KBHEL0I+ftLuxAPlhMo
        rHa25voe5xlrgT0IZaZJboqZH8JtACHsX9IargVRvARWP+qq4JPa5u+SHn2puzt97SZJICcmOf32r
        V4KFPGa0fZbG2+Ci4WNFvK4qmZLWDyblJZ7Z8gftIWzdslvj11loMT5O4xX3gPuUMggi/A6Vro9Z6
        9+4bx4/7KHXwVLxm+UswLzzm3z5LiT1S/J6/oF1FHQhaKxyN71oo+unHjK/3kR209kXhc0GN0JWbG
        /3F72GW3CalvfqZX3zVRV+ICsWEvT067aYPVrTSx7e2CWETA1yXchyE//YtRrb8CR2Pb5hckTztTW
        yPxOgBYg==;
Received: from mpp-cp1-natpool-1-013.ethz.ch ([82.130.71.13] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbJrs-0004TL-CB; Thu, 13 Jun 2019 07:09:52 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] binfmt_flat: remove the persistent argument from flat_get_addr_from_rp
Date:   Thu, 13 Jun 2019 09:09:00 +0200
Message-Id: <20190613070903.17214-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
References: <20190613070903.17214-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The argument is never used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/c6x/include/asm/flat.h        | 2 +-
 arch/h8300/include/asm/flat.h      | 2 +-
 arch/microblaze/include/asm/flat.h | 2 +-
 arch/sh/include/asm/flat.h         | 2 +-
 arch/xtensa/include/asm/flat.h     | 2 +-
 fs/binfmt_flat.c                   | 4 +---
 include/asm-generic/flat.h         | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h
index 2d57a9204d21..9e6544b51386 100644
--- a/arch/c6x/include/asm/flat.h
+++ b/arch/c6x/include/asm/flat.h
@@ -5,7 +5,7 @@
 #include <asm/unaligned.h>
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+					u32 *addr)
 {
 	*addr = get_unaligned((__force u32 *)rp);
 	return 0;
diff --git a/arch/h8300/include/asm/flat.h b/arch/h8300/include/asm/flat.h
index 4683146f0e9e..78070f924177 100644
--- a/arch/h8300/include/asm/flat.h
+++ b/arch/h8300/include/asm/flat.h
@@ -17,7 +17,7 @@
 
 #define	flat_get_relocate_addr(rel)		(rel & ~0x00000001)
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+					u32 *addr)
 {
 	u32 val = get_unaligned((__force u32 *)rp);
 	if (!(flags & FLAT_FLAG_GOTPIC))
diff --git a/arch/microblaze/include/asm/flat.h b/arch/microblaze/include/asm/flat.h
index 9e3d8e01d294..1ab86770eaee 100644
--- a/arch/microblaze/include/asm/flat.h
+++ b/arch/microblaze/include/asm/flat.h
@@ -28,7 +28,7 @@
  */
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+					u32 *addr)
 {
 	u32 *p = (__force u32 *)rp;
 
diff --git a/arch/sh/include/asm/flat.h b/arch/sh/include/asm/flat.h
index 1002343dd84a..fee4f25555cb 100644
--- a/arch/sh/include/asm/flat.h
+++ b/arch/sh/include/asm/flat.h
@@ -12,7 +12,7 @@
 #include <asm/unaligned.h>
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+					u32 *addr)
 {
 	*addr = get_unaligned((__force u32 *)rp);
 	return 0;
diff --git a/arch/xtensa/include/asm/flat.h b/arch/xtensa/include/asm/flat.h
index 3d357371b28b..ed5870c779f9 100644
--- a/arch/xtensa/include/asm/flat.h
+++ b/arch/xtensa/include/asm/flat.h
@@ -5,7 +5,7 @@
 #include <asm/unaligned.h>
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+					u32 *addr)
 {
 	*addr = get_unaligned((__force u32 *)rp);
 	return 0;
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 1e88f4e62e65..0ca65d51bb01 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -795,7 +795,6 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * __start to address 4 so that is okay).
 	 */
 	if (rev > OLD_FLAT_VERSION) {
-		u32 __maybe_unused persistent = 0;
 		for (i = 0; i < relocs; i++) {
 			u32 addr, relval;
 			__be32 tmp;
@@ -816,8 +815,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			}
 
 			/* Get the pointer's value.  */
-			ret = flat_get_addr_from_rp(rp, relval, flags,
-							&addr, &persistent);
+			ret = flat_get_addr_from_rp(rp, relval, flags, &addr);
 			if (unlikely(ret))
 				goto err;
 
diff --git a/include/asm-generic/flat.h b/include/asm-generic/flat.h
index fcd2b45c0735..1928a3596938 100644
--- a/include/asm-generic/flat.h
+++ b/include/asm-generic/flat.h
@@ -5,7 +5,7 @@
 #include <linux/uaccess.h>
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-		u32 *addr, u32 *persistent)
+		u32 *addr)
 {
 #ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	return copy_from_user(addr, rp, 4) ? -EFAULT : 0;
-- 
2.20.1

