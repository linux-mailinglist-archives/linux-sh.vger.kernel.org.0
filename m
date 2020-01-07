Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E5D132623
	for <lists+linux-sh@lfdr.de>; Tue,  7 Jan 2020 13:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgAGM0a (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Jan 2020 07:26:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:42760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727177AbgAGM0a (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 7 Jan 2020 07:26:30 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7694A2072A;
        Tue,  7 Jan 2020 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578399989;
        bh=A56LkpftEiKNBwI+FjGCEPvnApz2EmDx11dfNb17Yfg=;
        h=From:To:Cc:Subject:Date:From;
        b=l7AjEYNd/5F2KSZi87yvCwXPzEHt8y6EaguPlNnLagMzdUIyMYMmHuvOlSjxnvyc4
         W2/lUEOA3KF+kt93pcz1ZIM3tFulS+LT9lqWpcXFcx3iN8oHe+TkOjY86CTst1OEFQ
         4qjYnc/X0QZcVgWYLLzkQL2QRUM3+dsQbKm23X2k=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] sh: clk: Fix discarding const qualifier warning
Date:   Tue,  7 Jan 2020 13:26:03 +0100
Message-Id: <1578399963-2229-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

ioreadX() accepts pointer to non-const memory.  This fixes warnings
like:

    drivers/sh/clk/cpg.c: In function ‘r8’:
    drivers/sh/clk/cpg.c:41:17: warning: passing argument 1 of ‘ioread8’
        discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/sh/clk/cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/sh/clk/cpg.c b/drivers/sh/clk/cpg.c
index eeb028b9cdb3..4f3d99d37809 100644
--- a/drivers/sh/clk/cpg.c
+++ b/drivers/sh/clk/cpg.c
@@ -36,17 +36,17 @@ static void sh_clk_write(int value, struct clk *clk)
 		iowrite32(value, clk->mapped_reg);
 }
 
-static unsigned int r8(const void __iomem *addr)
+static unsigned int r8(void __iomem *addr)
 {
 	return ioread8(addr);
 }
 
-static unsigned int r16(const void __iomem *addr)
+static unsigned int r16(void __iomem *addr)
 {
 	return ioread16(addr);
 }
 
-static unsigned int r32(const void __iomem *addr)
+static unsigned int r32(void __iomem *addr)
 {
 	return ioread32(addr);
 }
@@ -55,7 +55,7 @@ static int sh_clk_mstp_enable(struct clk *clk)
 {
 	sh_clk_write(sh_clk_read(clk) & ~(1 << clk->enable_bit), clk);
 	if (clk->status_reg) {
-		unsigned int (*read)(const void __iomem *addr);
+		unsigned int (*read)(void __iomem *addr);
 		int i;
 		void __iomem *mapped_status = (phys_addr_t)clk->status_reg -
 			(phys_addr_t)clk->enable_reg + clk->mapped_reg;
-- 
2.7.4

