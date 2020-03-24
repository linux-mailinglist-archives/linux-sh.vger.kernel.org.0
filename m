Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F94E191653
	for <lists+linux-sh@lfdr.de>; Tue, 24 Mar 2020 17:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgCXQ1B (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 24 Mar 2020 12:27:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59626 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgCXQ1A (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 24 Mar 2020 12:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=5ajJapMqVXyIc6ffXxblxvPy8Gskb0uqSs/rjbljrR4=; b=NbZfUIk/mtXukMCVJAfwI/Ot8N
        bVp670xO3ZZQK4E9C9peZlNCwMYA+gnXjz4bnCwOXX5qarmhS909IRd4SPVzAyOLqaeovM8agISNY
        5Ma5+tjQLudsd/zdkj2I19zELpNTusOooSChdvZlZSLHvaJoiyZW+CfFTnIPKYysNfJWgPtDQagGd
        Ctez/FmhnCkt8qvC6UcLwJgXuGdRYz5hR3j4duHhtJnHfAKL6wJA7im6wcxhR/7FYknIjAEi+IjHK
        FD3HxfJhsGQpyErAnRP6RDorocS5QiL7Ad9J9J4ufb7UNeCb9WWCrunJpoj4wlxDwRIMrrQZytRcB
        IxuqQq1Q==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmOG-0007fH-Fj; Tue, 24 Mar 2020 16:26:56 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] sh: don't allow non-coherent DMA for NOMMU
Date:   Tue, 24 Mar 2020 17:26:32 +0100
Message-Id: <20200324162633.754714-10-hch@lst.de>
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

The code handling non-coherent DMA depends on being able to remap code
as non-cached.  But that can't be done without an MMU, so using this
option on NOMMU builds is broken.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 808b638b11f3..b97d9712c252 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -48,6 +48,7 @@ config SUPERH
 	select MAY_HAVE_SPARSE_IRQ
 	select MODULES_USE_ELF_RELA
 	select NEED_SG_DMA_LENGTH
+	select NO_DMA if !MMU && !DMA_COHERENT
 	select NO_GENERIC_PCI_IOPORT_MAP if PCI
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND
@@ -155,7 +156,7 @@ config DMA_COHERENT
 	bool
 
 config DMA_NONCOHERENT
-	def_bool !DMA_COHERENT
+	def_bool !NO_DMA && !DMA_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 
 config PGTABLE_LEVELS
-- 
2.25.1

