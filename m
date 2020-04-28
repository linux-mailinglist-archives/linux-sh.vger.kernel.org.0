Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641281BBEAF
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2020 15:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgD1NNw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Apr 2020 09:13:52 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38880 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726764AbgD1NNw (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 28 Apr 2020 09:13:52 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 885FD12357CBA1BE574A;
        Tue, 28 Apr 2020 21:13:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 21:13:39 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-sh@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] maple: fix to pass correct device identity to free_irq()
Date:   Tue, 28 Apr 2020 13:14:55 +0000
Message-ID: <20200428131455.69463-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

free_irq() expects the same device identity that was passed to
corresponding request_irq(), otherwise the IRQ is not freed.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/sh/maple/maple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
index e5d7fb81ad66..ba32bd9876f0 100644
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -868,10 +868,10 @@ static int __init maple_bus_init(void)
 	kmem_cache_destroy(maple_queue_cache);
 
 cleanup_bothirqs:
-	free_irq(HW_EVENT_VSYNC, 0);
+	free_irq(HW_EVENT_VSYNC, &maple_unsupported_device);
 
 cleanup_irq:
-	free_irq(HW_EVENT_MAPLE_DMA, 0);
+	free_irq(HW_EVENT_MAPLE_DMA, &maple_unsupported_device);
 
 cleanup_dma:
 	free_pages((unsigned long) maple_sendbuf, MAPLE_DMA_PAGES);





