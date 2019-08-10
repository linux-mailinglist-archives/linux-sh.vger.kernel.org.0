Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457C1888B3
	for <lists+linux-sh@lfdr.de>; Sat, 10 Aug 2019 07:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfHJFp4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 10 Aug 2019 01:45:56 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.206]:22877 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725763AbfHJFp4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 10 Aug 2019 01:45:56 -0400
X-Greylist: delayed 1268 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Aug 2019 01:45:55 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id DC09247C1
        for <linux-sh@vger.kernel.org>; Sat, 10 Aug 2019 00:24:46 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id wJryhgpzOiQerwJryh3lOM; Sat, 10 Aug 2019 00:24:46 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oERw7Zagc8e+GcpWT+JUI3LRQ5Inl5suTHBjA9dFT1Y=; b=N3h2CNG+7Ct2r5p4HjdwBf1409
        KXCpj98BX8dgLCPc1bG1xhp2Jxv0DjaQAZZOp2omtmbTz1bAMRIMOIJczO4Vzn90trbTr9218c/s/
        g+pOuC4QnJuC0o6/Hlqz+7DlgduHQ3ELVVEZey5zACJXt2O3QgjaL+rJRge0iSXjj8VjWBc1JTvKS
        wKBVw9rBigNwxgRi962iPjGcyeAdyquNpHfhvWF62XieWnQgup9nddNBlM878i2W2WNGM24sBVxrZ
        /W3JqFaUXuIsz5GDCYzw2SiQRVUBvr1kA7OBd6FWOAKpzY1LYIUn+ALdURUg9tyib8h7mY5dwE0dt
        A2J91y+w==;
Received: from [187.192.11.120] (port=56878 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hwJru-000l1G-T2; Sat, 10 Aug 2019 00:24:43 -0500
Date:   Sat, 10 Aug 2019 00:24:42 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v2] sh: kernel: disassemble: Mark expected switch
 fall-throughs
Message-ID: <20190810052442.GA21354@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hwJru-000l1G-T2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:56878
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 14
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Remove logically dead code and mark switch cases where we are expecting
to fall through.

Fix the following warnings (Building: defconfig sh):

arch/sh/kernel/disassemble.c:478:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]
arch/sh/kernel/disassemble.c:487:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]
arch/sh/kernel/disassemble.c:496:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Remove logically dead code. Pointed out by Joe Perches.

NOTE: If no one cares, I'll apply this to my tree and queue it up
      for 5.3-rc4.

 arch/sh/kernel/disassemble.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/sh/kernel/disassemble.c b/arch/sh/kernel/disassemble.c
index defebf1a9c8a..845543780cc5 100644
--- a/arch/sh/kernel/disassemble.c
+++ b/arch/sh/kernel/disassemble.c
@@ -475,8 +475,6 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 				printk("dbr");
 				break;
 			case FD_REG_N:
-				if (0)
-					goto d_reg_n;
 			case F_REG_N:
 				printk("fr%d", rn);
 				break;
@@ -488,7 +486,7 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 					printk("xd%d", rn & ~1);
 					break;
 				}
-			d_reg_n:
+				/* else, fall through */
 			case D_REG_N:
 				printk("dr%d", rn);
 				break;
@@ -497,6 +495,7 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 					printk("xd%d", rm & ~1);
 					break;
 				}
+				/* else, fall through */
 			case D_REG_M:
 				printk("dr%d", rm);
 				break;
-- 
2.22.0

