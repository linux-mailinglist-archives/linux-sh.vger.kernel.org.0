Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F948884F
	for <lists+linux-sh@lfdr.de>; Sat, 10 Aug 2019 07:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbfHJFB5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 10 Aug 2019 01:01:57 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.119]:12992 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbfHJFB4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 10 Aug 2019 01:01:56 -0400
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 6A5781ECD79
        for <linux-sh@vger.kernel.org>; Sat, 10 Aug 2019 00:01:55 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id wJVrhAxPA90onwJVrh0Nt3; Sat, 10 Aug 2019 00:01:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JDIqY2cej5MXXLKNmQZWHt5rIYXlsg9boU/BzQ+gAIA=; b=aM5hjr/tAwY+xb8ZVWXAvX8KHK
        fol843Mp0I/tHMYweaPEB5SGqExXKtJm/PPZWQU7+JhsV2130POhQXbNH9v90pLksyvcxZhWpAAoA
        75gISP2kWKiUuZDTZYZkFVrxCL3+GUnV4QQA50R7p34Zt5PTkcqcpiOfGNOprbSwmX6tpKnL/9k4X
        pbeDyX0/clugbKz3QY47JC/aMZjYzlHKBpGd3n+3cIBLEvDwmS1CBLS5/+XMJpl+7hlJJR33MC0oH
        WH9gY7zetwxkrwZc9cGPaTXwpPOPG/cN2nzj2s3Zca+A15Bpd4OHnZOBpUba+Pzclcmi7PBxijSPA
        aTTrc9yw==;
Received: from [187.192.11.120] (port=56646 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hwJVq-000Z5F-AQ; Sat, 10 Aug 2019 00:01:54 -0500
Date:   Sat, 10 Aug 2019 00:01:53 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] sh: kernel: disassemble: Mark expected switch fall-throughs
Message-ID: <20190810050153.GA13927@embeddedor>
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
X-Exim-ID: 1hwJVq-000Z5F-AQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:56646
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Mark switch cases where we are expecting to fall through.

Fix the following warnings (Building: defconfig sh):

arch/sh/kernel/disassemble.c:478:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]
arch/sh/kernel/disassemble.c:487:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]
arch/sh/kernel/disassemble.c:496:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---

If no one cares, I'll apply this to my tree and queue it up for 5.3-rc4.

 arch/sh/kernel/disassemble.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sh/kernel/disassemble.c b/arch/sh/kernel/disassemble.c
index defebf1a9c8a..91c87e9891da 100644
--- a/arch/sh/kernel/disassemble.c
+++ b/arch/sh/kernel/disassemble.c
@@ -477,6 +477,7 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 			case FD_REG_N:
 				if (0)
 					goto d_reg_n;
+				/* else, fall through */
 			case F_REG_N:
 				printk("fr%d", rn);
 				break;
@@ -488,6 +489,7 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 					printk("xd%d", rn & ~1);
 					break;
 				}
+				/* else, fall through */
 			d_reg_n:
 			case D_REG_N:
 				printk("dr%d", rn);
@@ -497,6 +499,7 @@ static void print_sh_insn(u32 memaddr, u16 insn)
 					printk("xd%d", rm & ~1);
 					break;
 				}
+				/* else, fall through */
 			case D_REG_M:
 				printk("dr%d", rm);
 				break;
-- 
2.22.0

