Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4FE519164E
	for <lists+linux-sh@lfdr.de>; Tue, 24 Mar 2020 17:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgCXQ04 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 24 Mar 2020 12:26:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59610 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgCXQ04 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 24 Mar 2020 12:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=h2EwIaOH/anLec0JD5F6Hx0W2recRoJEZf2x7dpcnFY=; b=AbBG958lXvVsasnxD64D1yRZjI
        uc3/OblwmG4sRujdUnOKo6FKqq7pCfRj+K5rR7dc70eHa+Qx50nPNyeZXfRD7KmyOuKvILG8RZJZV
        0R/kBiYWZnUXvaKxuxpAhwHnjIU+M4Up6JPzfdFXBq/x6JTcaErosZNgbAzlsKnynH8p6xkbkWvHm
        ta9sYxt+yUbZOfSG7pvwQcsg/Q9GUwQy7VwsFrn1aHo6sggXL2YloCR3mpg1gKhHOyd8I47yHv5ic
        jPKhADzF5BQQP/HpsK9pIdffcrIjmaVSiOjdVXWNKD4H0u7ZQx2YihG5MrPueKi5psY7jK2ye2rz0
        lrJWM8Ww==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmOB-0007eN-MR; Tue, 24 Mar 2020 16:26:52 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] sh: unexport register_trapped_io and match_trapped_io_handler
Date:   Tue, 24 Mar 2020 17:26:30 +0100
Message-Id: <20200324162633.754714-8-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324162633.754714-1-hch@lst.de>
References: <20200324162633.754714-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
index 60c828a2b8a2..92a512e442b0 100644
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
2.25.1

