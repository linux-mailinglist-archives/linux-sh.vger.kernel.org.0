Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE59249E1B
	for <lists+linux-sh@lfdr.de>; Wed, 19 Aug 2020 14:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgHSMfT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 19 Aug 2020 08:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgHSMfM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 19 Aug 2020 08:35:12 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FC5C061383
        for <linux-sh@vger.kernel.org>; Wed, 19 Aug 2020 05:35:11 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id HQb92300Y4C55Sk06Qb92j; Wed, 19 Aug 2020 14:35:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NJ7-0002HR-J4; Wed, 19 Aug 2020 14:35:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NJ7-00051F-Hb; Wed, 19 Aug 2020 14:35:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] sh/intc: Restore devm_ioremap() alignment
Date:   Wed, 19 Aug 2020 14:35:08 +0200
Message-Id: <20200819123508.19252-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
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
2.17.1

