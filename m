Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6317D22D323
	for <lists+linux-sh@lfdr.de>; Sat, 25 Jul 2020 02:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgGYAOH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 24 Jul 2020 20:14:07 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:5258 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726576AbgGYAOH (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 24 Jul 2020 20:14:07 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id 485E53F5D3827F249023;
        Sat, 25 Jul 2020 08:14:05 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id 06P0Dxpl089151;
        Sat, 25 Jul 2020 08:13:59 +0800 (GMT-8)
        (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2020072508144113-4388909 ;
          Sat, 25 Jul 2020 08:14:41 +0800 
From:   Yi Wang <wang.yi59@zte.com.cn>
To:     ysato@users.sourceforge.jp
Cc:     dalias@libc.org, akpm@linux-foundation.org, peterz@infradead.org,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn,
        wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>
Subject: [PATCH] sh: sh4: Fix reference count leak in sq_dev_add
Date:   Sat, 25 Jul 2020 08:17:26 +0800
Message-Id: <1595636246-15392-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2020-07-25 08:14:41,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-25 08:14:05,
        Serialize complete at 2020-07-25 08:14:05
X-MAIL: mse-fl1.zte.com.cn 06P0Dxpl089151
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Liao Pingfang <liao.pingfang@zte.com.cn>

kobject_init_and_add() takes reference even when it fails. If this
function returns an error, kobject_put() must be called to properly
clean up the memory associated with the object.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
---
 arch/sh/kernel/cpu/sh4/sq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index d432164..3fbd6fd 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -350,6 +350,8 @@ static int sq_dev_add(struct device *dev, struct subsys_interface *sif)
 				     "%s", "sq");
 	if (!error)
 		kobject_uevent(kobj, KOBJ_ADD);
+	else
+		kobject_put(kobj);
 	return error;
 }
 
-- 
2.9.5

