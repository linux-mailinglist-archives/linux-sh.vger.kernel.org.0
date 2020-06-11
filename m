Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1081F6316
	for <lists+linux-sh@lfdr.de>; Thu, 11 Jun 2020 09:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgFKH6m (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 11 Jun 2020 03:58:42 -0400
Received: from outpost17.zedat.fu-berlin.de ([130.133.4.110]:57653 "EHLO
        outpost17.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726950AbgFKH6l (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 11 Jun 2020 03:58:41 -0400
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jjI6b-000sre-KZ; Thu, 11 Jun 2020 09:58:33 +0200
Received: from z6.physik.fu-berlin.de ([160.45.32.137] helo=z6)
          by relay1.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jjI6b-00291v-Hw; Thu, 11 Jun 2020 09:58:33 +0200
Received: from glaubitz by z6 with local (Exim 4.94)
        (envelope-from <glaubitz@physik.fu-berlin.de>)
        id 1jjI6R-00COLi-8p; Thu, 11 Jun 2020 09:58:23 +0200
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     linux-sh@vger.kernel.org
Cc:     Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        NIIBE Yutaka <gniibe@fsij.org>, linux-kernel@vger.kernel.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH] sh: Implement __get_user_u64() required for 64-bit get_user()
Date:   Thu, 11 Jun 2020 09:58:11 +0200
Message-Id: <20200611075811.2949870-2-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200611075811.2949870-1-glaubitz@physik.fu-berlin.de>
References: <20200611075811.2949870-1-glaubitz@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: 160.45.32.137
X-ZEDAT-Hint: RV
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Trying to build the kernel with CONFIG_INFINIBAND_USER_ACCESS enabled fails

     ERROR: "__get_user_unknown" [drivers/infiniband/core/ib_uverbs.ko] undefined!

with on SH since the kernel misses a 64-bit implementation of get_user().

Implement the missing 64-bit get_user() as __get_user_u64(), matching the
already existing __put_user_u64() which implements the 64-bit put_user().

Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/include/asm/uaccess_32.h | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/sh/include/asm/uaccess_32.h b/arch/sh/include/asm/uaccess_32.h
index 624cf55acc27..5d7ddc092afd 100644
--- a/arch/sh/include/asm/uaccess_32.h
+++ b/arch/sh/include/asm/uaccess_32.h
@@ -26,6 +26,9 @@ do {								\
 	case 4:							\
 		__get_user_asm(x, ptr, retval, "l");		\
 		break;						\
+	case 8:							\
+		__get_user_u64(x, ptr, retval);			\
+		break;						\
 	default:						\
 		__get_user_unknown();				\
 		break;						\
@@ -66,6 +69,56 @@ do {							\
 
 extern void __get_user_unknown(void);
 
+#if defined(CONFIG_CPU_LITTLE_ENDIAN)
+#define __get_user_u64(x, addr, err) \
+({ \
+__asm__ __volatile__( \
+	"1:\n\t" \
+	"mov.l	%2,%R1\n\t" \
+	"mov.l	%T2,%S1\n\t" \
+	"2:\n" \
+	".section	.fixup,\"ax\"\n" \
+	"3:\n\t" \
+	"mov  #0,%R1\n\t"   \
+	"mov  #0,%S1\n\t"   \
+	"mov.l	4f, %0\n\t" \
+	"jmp	@%0\n\t" \
+	" mov	%3, %0\n\t" \
+	".balign	4\n" \
+	"4:	.long	2b\n\t" \
+	".previous\n" \
+	".section	__ex_table,\"a\"\n\t" \
+	".long	1b, 3b\n\t" \
+	".long	1b + 2, 3b\n\t" \
+	".previous" \
+	:"=&r" (err), "=&r" (x) \
+	:"m" (__m(addr)), "i" (-EFAULT), "0" (err)); })
+#else
+#define __get_user_u64(x, addr, err) \
+({ \
+__asm__ __volatile__( \
+	"1:\n\t" \
+	"mov.l	%2,%S1\n\t" \
+	"mov.l	%T2,%R1\n\t" \
+	"2:\n" \
+	".section	.fixup,\"ax\"\n" \
+	"3:\n\t" \
+	"mov  #0,%S1\n\t"   \
+	"mov  #0,%R1\n\t"   \
+	"mov.l	4f, %0\n\t" \
+	"jmp	@%0\n\t" \
+	" mov	%3, %0\n\t" \
+	".balign	4\n" \
+	"4:	.long	2b\n\t" \
+	".previous\n" \
+	".section	__ex_table,\"a\"\n\t" \
+	".long	1b, 3b\n\t" \
+	".long	1b + 2, 3b\n\t" \
+	".previous" \
+	:"=&r" (err), "=&r" (x) \
+	:"m" (__m(addr)), "i" (-EFAULT), "0" (err)); })
+#endif
+
 #define __put_user_size(x,ptr,size,retval)		\
 do {							\
 	retval = 0;					\
-- 
2.27.0

