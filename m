Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750AD2ADACA
	for <lists+linux-sh@lfdr.de>; Tue, 10 Nov 2020 16:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbgKJPtn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 10 Nov 2020 10:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730799AbgKJPtn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 10 Nov 2020 10:49:43 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5E3C0613D1
        for <linux-sh@vger.kernel.org>; Tue, 10 Nov 2020 07:49:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id qfph2300U4C55Sk06fphKK; Tue, 10 Nov 2020 16:49:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcVtt-001DQ1-6b; Tue, 10 Nov 2020 16:49:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcVts-00Dmpb-PM; Tue, 10 Nov 2020 16:49:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend2] sh/intc: Restore devm_ioremap() alignment
Date:   Tue, 10 Nov 2020 16:49:39 +0100
Message-Id: <20201110154939.3285928-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Restore alignment of the continuation of the devm_ioremap() call in
register_intc_controller().

Fixes: 4bdc0d676a643140 ("remove ioremap_nocache and devm_ioremap_nocache")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/sh/intc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index f8e070d67fa3266d..a14684ffe4c1a8ef 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -214,7 +214,7 @@ int __init register_intc_controller(struct intc_desc *desc)
 			d->window[k].phys = res->start;
 			d->window[k].size = resource_size(res);
 			d->window[k].virt = ioremap(res->start,
-							 resource_size(res));
+						    resource_size(res));
 			if (!d->window[k].virt)
 				goto err2;
 		}
-- 
2.25.1

