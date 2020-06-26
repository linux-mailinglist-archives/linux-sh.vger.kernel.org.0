Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF05520AE23
	for <lists+linux-sh@lfdr.de>; Fri, 26 Jun 2020 10:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgFZIH5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 26 Jun 2020 04:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbgFZIHs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 26 Jun 2020 04:07:48 -0400
Received: from casper.infradead.org (unknown [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0168C08C5DD;
        Fri, 26 Jun 2020 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=mJrdBgQpUS2E8ZU9OhPctyoTZb0a1wZwaSFfhF40f0Q=; b=KbcrgPFIMxf+SRpjbAbJsxZ1pG
        hHzG8e/6C6K0MueNoopFG5qN8mbxlQJ5QFC55ZeGYWX+fn5qICBRZD2drW2xZ+5IGpyXEwHDbsypJ
        MWCWrEfg5LKHmXrUWTnGvaWM5bQXmbbZUeQ+XrsHbir0Zzr82mQREU8I1HYjMNyMJyr8iCT6ztaAM
        gJ0MunMelxk1a/nX6MYI6I/FeLJ1liwvOI64Rek/oK9DyVFbsThSwwL504S8xPSuMNUonwAkxmaNG
        4lD8AzRL4TJ2M4DFEoNL6wAp9t2A7i12IXzqGwOPaqn+PY/5aO4MSkLAQBXFzlzzsjZHbEUFh1eGA
        BUhsQ5kw==;
Received: from [2001:4bb8:184:76e3:2b32:1123:bea8:6121] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jojOQ-0007tf-Js; Fri, 26 Jun 2020 08:07:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] sh: unexport register_trapped_io and match_trapped_io_handler
Date:   Fri, 26 Jun 2020 10:07:14 +0200
Message-Id: <20200626080717.1999041-8-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626080717.1999041-1-hch@lst.de>
References: <20200626080717.1999041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Both functions are only used by compiled in core code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/kernel/io_trapped.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sh/kernel/io_trapped.c b/arch/sh/kernel/io_trapped.c
index 037aab2708b7ac..004ad0130b1038 100644
--- a/arch/sh/kernel/io_trapped.c
+++ b/arch/sh/kernel/io_trapped.c
@@ -102,7 +102,6 @@ int register_trapped_io(struct trapped_io *tiop)
 	pr_warn("unable to install trapped io filter\n");
 	return -1;
 }
-EXPORT_SYMBOL_GPL(register_trapped_io);
 
 void __iomem *match_trapped_io_handler(struct list_head *list,
 				       unsigned long offset,
@@ -131,7 +130,6 @@ void __iomem *match_trapped_io_handler(struct list_head *list,
 	spin_unlock_irqrestore(&trapped_lock, flags);
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(match_trapped_io_handler);
 
 static struct trapped_io *lookup_tiop(unsigned long address)
 {
-- 
2.26.2

