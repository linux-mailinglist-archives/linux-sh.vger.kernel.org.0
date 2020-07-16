Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E998F221F0D
	for <lists+linux-sh@lfdr.de>; Thu, 16 Jul 2020 10:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgGPIye (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 16 Jul 2020 04:54:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42212 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbgGPIyd (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 16 Jul 2020 04:54:33 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A31C8F25C6363608FE4D;
        Thu, 16 Jul 2020 16:54:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 16:54:29 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
CC:     <linux-sh@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE
Date:   Thu, 16 Jul 2020 16:58:23 +0800
Message-ID: <20200716085823.11422-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Yongqiang Liu <liuyongqiang13@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
---
 drivers/sh/intc/virq-debugfs.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/sh/intc/virq-debugfs.c b/drivers/sh/intc/virq-debugfs.c
index a2759073e..939915a07 100644
--- a/drivers/sh/intc/virq-debugfs.c
+++ b/drivers/sh/intc/virq-debugfs.c
@@ -16,7 +16,7 @@
 #include <linux/debugfs.h>
 #include "internals.h"
 
-static int intc_irq_xlate_debug(struct seq_file *m, void *priv)
+static int intc_irq_xlate_show(struct seq_file *m, void *priv)
 {
 	int i;
 
@@ -37,17 +37,7 @@ static int intc_irq_xlate_debug(struct seq_file *m, void *priv)
 	return 0;
 }
 
-static int intc_irq_xlate_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, intc_irq_xlate_debug, inode->i_private);
-}
-
-static const struct file_operations intc_irq_xlate_fops = {
-	.open = intc_irq_xlate_open,
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(intc_irq_xlate);
 
 static int __init intc_irq_xlate_init(void)
 {
-- 
2.17.1

