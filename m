Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F685123CE2
	for <lists+linux-sh@lfdr.de>; Wed, 18 Dec 2019 03:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfLRCIh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 21:08:37 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:38522 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726296AbfLRCIg (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 21:08:36 -0500
Date:   18 Dec 2019 11:08:35 +0900
X-IronPort-AV: E=Sophos;i="5.69,327,1571670000"; 
   d="scan'208";a="34701881"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Dec 2019 11:08:35 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 47E51415A827;
        Wed, 18 Dec 2019 11:08:35 +0900 (JST)
Message-ID: <87sglijsgs.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] SH: Convert ins[bwl]/outs[bwl] macros to inline functions
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Macro ins[bwl]/outs[bwl] are just calling BUG(), but that results in
unused variable warnings all over the place.
This patch convert macro to inline to avoid warning

We will get this kind of warning without this patch

	${LINUX}/drivers/iio/adc/ad7606_par.c:21:23: \
	  warning: unused variable 'st' [-Wunused-variable]
	struct ad7606_state *st = iio_priv(indio_dev);
	^~

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v2 -> v3

	- tidyup function name vs white-space

 arch/sh/include/asm/io_noioport.h | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/io_noioport.h b/arch/sh/include/asm/io_noioport.h
index 90d6109..f7938fe 100644
--- a/arch/sh/include/asm/io_noioport.h
+++ b/arch/sh/include/asm/io_noioport.h
@@ -53,12 +53,34 @@ static inline void ioport_unmap(void __iomem *addr)
 #define outw_p(x, addr)	outw((x), (addr))
 #define outl_p(x, addr)	outl((x), (addr))
 
-#define insb(a, b, c)	BUG()
-#define insw(a, b, c)	BUG()
-#define insl(a, b, c)	BUG()
+static inline void insb(unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
+
+static inline void insw(unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
+
+static inline void insl(unsigned long port, void *dst, unsigned long count)
+{
+	BUG();
+}
 
-#define outsb(a, b, c)	BUG()
-#define outsw(a, b, c)	BUG()
-#define outsl(a, b, c)	BUG()
+static inline void outsb(unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
+
+static inline void outsw(unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
+
+static inline void outsl(unsigned long port, const void *src, unsigned long count)
+{
+	BUG();
+}
 
 #endif /* __ASM_SH_IO_NOIOPORT_H */
-- 
2.7.4

