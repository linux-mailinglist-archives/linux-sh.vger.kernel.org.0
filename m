Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00742444B5
	for <lists+linux-sh@lfdr.de>; Thu, 13 Jun 2019 18:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392588AbfFMQiy (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 13 Jun 2019 12:38:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40286 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730605AbfFMHJi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 13 Jun 2019 03:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ElF4KFxnTN8NVc88tt0y4MMjoTddrZGvw4p+yUVzP0U=; b=dL2lPSaK4zy9M24J86sGaXbDZa
        RC0554izSE4kBKH/BFW7U0gl5oP7rDDmiC17wzv1mOlxzo2xT1h6SMbUtsS9tMSaLOgITQszC9dJo
        7FIXEzJgv8P/a16YVU3Y3goRVp3b0r+8L2PMD9j03L+gRzy4uMsXeUaJRGlrqRXIhKO4XrQpv+deb
        y4heffJjtVFSxPWR05hmXB07z8WAfCEHfLiQ43cAcPlbo51rMpOaa1fcigajCl1sqNHOxONUzMwo/
        HKWilWfgK5bDjed4Desa/V6wsXUTWjIPL1hj0GNoKG1qt9iEg6ln8UyIbIjRSSLvdnZKKE8lksclO
        Axz/keXA==;
Received: from mpp-cp1-natpool-1-013.ethz.ch ([82.130.71.13] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbJrV-0004H5-1L; Thu, 13 Jun 2019 07:09:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] binfmt_flat: remove the unused OLD_FLAT_FLAG_RAM definition
Date:   Thu, 13 Jun 2019 09:08:53 +0200
Message-Id: <20190613070903.17214-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
References: <20190613070903.17214-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/flat.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/flat.h b/include/linux/flat.h
index 21d901ba191b..2b7cda6e9c1b 100644
--- a/include/linux/flat.h
+++ b/include/linux/flat.h
@@ -72,15 +72,12 @@ typedef union {
 # if defined(mc68000) && !defined(CONFIG_COLDFIRE)
 		signed long offset : 30;
 		unsigned long type : 2;
-#   	define OLD_FLAT_FLAG_RAM    0x1 /* load program entirely into RAM */
 # elif defined(__BIG_ENDIAN_BITFIELD)
 		unsigned long type : 2;
 		signed long offset : 30;
-#   	define OLD_FLAT_FLAG_RAM    0x1 /* load program entirely into RAM */
 # elif defined(__LITTLE_ENDIAN_BITFIELD)
 		signed long offset : 30;
 		unsigned long type : 2;
-#   	define OLD_FLAT_FLAG_RAM    0x1 /* load program entirely into RAM */
 # else
 #   	error "Unknown bitfield order for flat files."
 # endif
-- 
2.20.1

