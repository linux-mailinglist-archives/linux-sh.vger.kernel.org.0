Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B863BE57
	for <lists+linux-sh@lfdr.de>; Mon, 10 Jun 2019 23:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390287AbfFJVUz (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 10 Jun 2019 17:20:55 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38634 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390258AbfFJVUx (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 10 Jun 2019 17:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=T1XcVoygN5yZ8Kqai2i6+5m7CKaZdW1Ll8tjH35qZ4M=; b=WBKcPpc/Dav6TOWP4BMEmxfR3n
        zHLZwSwW0GJDfalVhp2jH7ZBm8FTfw1W9/rmfu+9sbKnXahDK52YZA6S5HXxEpEBzZ3M/JrBIxY+Y
        ONvNcnj921s43jY530ju+U2UHzDmeevWLFyJB6ldA2425CMitugaMuUaCsfwWqFmwnI0vUE3+94oM
        X0vWeS3vV3F55oj+Tbwt7byTH9lDOo1do96JGs7GIAry5hQenySfuT8jmXKsd1gH3DZgbliX0D/5+
        8D9+/WjhceuIKvFRcQH+80ZVDhiuwTpd9STtBHkuO4uQnPxuY5PAMiag/PTOiaS6YIGLYoilUMDmL
        jem9xwUw==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1haRih-0000h3-Np; Mon, 10 Jun 2019 21:20:48 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] binfmt_flat: provide an asm-generic/flat.h
Date:   Mon, 10 Jun 2019 23:20:11 +0200
Message-Id: <20190610212015.9157-12-hch@lst.de>
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

This file implements the flat get/put reloc helpers for architectures
that do not need to overload the relocs by simply using get_user/put_user.

Note that many nommu architectures currently use {get,put}_unaligned, which
looks a little bogus and should probably later be switched over to this
version as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/Kbuild                   |  1 +
 arch/m68k/include/asm/flat.h                  | 21 +------------------
 .../asm => include/asm-generic}/flat.h        | 12 ++++-------
 3 files changed, 6 insertions(+), 28 deletions(-)
 rename {arch/arm/include/asm => include/asm-generic}/flat.h (73%)

diff --git a/arch/arm/include/asm/Kbuild b/arch/arm/include/asm/Kbuild
index a8f149ab45b8..6b2dc15b6dff 100644
--- a/arch/arm/include/asm/Kbuild
+++ b/arch/arm/include/asm/Kbuild
@@ -5,6 +5,7 @@ generic-y += early_ioremap.h
 generic-y += emergency-restart.h
 generic-y += exec.h
 generic-y += extable.h
+generic-y += flat.h
 generic-y += irq_regs.h
 generic-y += kdebug.h
 generic-y += local.h
diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index d7102fcd43eb..46379e08cdd6 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -6,26 +6,7 @@
 #ifndef __M68KNOMMU_FLAT_H__
 #define __M68KNOMMU_FLAT_H__
 
-#include <linux/uaccess.h>
-
-static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
-{
-#ifdef CONFIG_CPU_HAS_NO_UNALIGNED
-	return copy_from_user(addr, rp, 4) ? -EFAULT : 0;
-#else
-	return get_user(*addr, rp);
-#endif
-}
-
-static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
-{
-#ifdef CONFIG_CPU_HAS_NO_UNALIGNED
-	return copy_to_user(rp, &addr, 4) ? -EFAULT : 0;
-#else
-	return put_user(addr, rp);
-#endif
-}
+#include <asm-generic/flat.h>
 
 #define FLAT_PLAT_INIT(regs) \
 	do { \
diff --git a/arch/arm/include/asm/flat.h b/include/asm-generic/flat.h
similarity index 73%
rename from arch/arm/include/asm/flat.h
rename to include/asm-generic/flat.h
index bbc27901446f..fcd2b45c0735 100644
--- a/arch/arm/include/asm/flat.h
+++ b/include/asm-generic/flat.h
@@ -1,15 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * arch/arm/include/asm/flat.h -- uClinux flat-format executables
- */
-
-#ifndef __ARM_FLAT_H__
-#define __ARM_FLAT_H__
+#ifndef _ASM_GENERIC_FLAT_H
+#define _ASM_GENERIC_FLAT_H
 
 #include <linux/uaccess.h>
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
-					u32 *addr, u32 *persistent)
+		u32 *addr, u32 *persistent)
 {
 #ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	return copy_from_user(addr, rp, 4) ? -EFAULT : 0;
@@ -27,4 +23,4 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
 #endif
 }
 
-#endif /* __ARM_FLAT_H__ */
+#endif /* _ASM_GENERIC_FLAT_H */
-- 
2.20.1

