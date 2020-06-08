Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644B41F141C
	for <lists+linux-sh@lfdr.de>; Mon,  8 Jun 2020 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgFHIGn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 8 Jun 2020 04:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgFHIGn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 8 Jun 2020 04:06:43 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DA3C08C5C3
        for <linux-sh@vger.kernel.org>; Mon,  8 Jun 2020 01:06:42 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:c85f:a5bf:b1bd:702b])
        by baptiste.telenet-ops.be with bizsmtp
        id oY6e2200M0R8aca01Y6ejA; Mon, 08 Jun 2020 10:06:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jiCnm-0005zj-HL; Mon, 08 Jun 2020 10:06:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jiCnm-0007G7-Ei; Mon, 08 Jun 2020 10:06:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "J . P . Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Revert "sh: add missing EXPORT_SYMBOL() for __delay"
Date:   Mon,  8 Jun 2020 10:06:36 +0200
Message-Id: <20200608080636.27862-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This reverts commit d1f56f318d234fc5db230af2f3e0088f689ab3c0.

__delay() is an internal implementation detail on several architectures.
Drivers should not call __delay() directly, as it has non-standardized
semantics, or may not even exist.
Hence there is no need to export __delay() to modules.

See also include/asm-generic/delay.h:

    /* Undefined functions to get compile-time errors */
    ...
    extern void __delay(unsigned long loops);

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Sorry for missing this when Adrian posted his list of mising patches.

References:
[1] "Re: Build regressions/improvements in v5.4-rc2"
    https://lore.kernel.org/r/CAMuHMdUERaoHLNKi03zCuYi7NevgBFjXrV=pt0Yy=HOeRiL25Q@mail.gmail.com/
[2] "Re: [PATCH] sh: add missing EXPORT_SYMBOL() for __delay"
    http://lore.kernel.org/r/CAMuHMdWb_ipn7FVHbz8=PTdGod=MW+2xHY7yuq3yJcWwNnDvcg@mail.gmail.com
---
 arch/sh/lib/delay.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/lib/delay.c b/arch/sh/lib/delay.c
index 540e670dbafcd826..dad8e6a54906bece 100644
--- a/arch/sh/lib/delay.c
+++ b/arch/sh/lib/delay.c
@@ -29,7 +29,6 @@ void __delay(unsigned long loops)
 		: "0" (loops)
 		: "t");
 }
-EXPORT_SYMBOL(__delay);
 
 inline void __const_udelay(unsigned long xloops)
 {
-- 
2.17.1

