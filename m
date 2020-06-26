Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E495620AE19
	for <lists+linux-sh@lfdr.de>; Fri, 26 Jun 2020 10:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbgFZIHj (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 26 Jun 2020 04:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728938AbgFZIHi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 26 Jun 2020 04:07:38 -0400
Received: from casper.infradead.org (unknown [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E3FC08C5C1;
        Fri, 26 Jun 2020 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=9mvz1gMkyoGTE/uYkR0YFesaWUHN2JLoZ84hifwq/lw=; b=XrsF4PUOiNc1/K70Sby6ULuuPl
        D69FsD9p3dOeXatDf+wL1o0s61FBVwayNyPukRevjXKRSdiPN5fKDsDYxG3IA4Q1qZAguM71tLMUW
        7uBuYKKd/mOFCl9Urp/0pRpnikmuNwGVC4kfU1ChIugfkINn8H3cQJZ1ZmhcfODK7D8FtGtvEBYka
        zBSkHePCl4ccNzClschPrGj/QawszWGQSWz1X7xXHf8G0EV487d4s8GGR2fEiYoKWHjdcGTsszpKd
        pKqekbzYpGTSnqYbGnqIPZ2F97F7qAU0TUmOyFUtBMPwcE4RQrbBpuRTCB3WU17EwkANINQQ2H2pY
        RLAN+e2A==;
Received: from [2001:4bb8:184:76e3:2b32:1123:bea8:6121] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jojOI-0007sx-5g; Fri, 26 Jun 2020 08:07:18 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: ioremap and dma cleanups and fixes for superh (resend)
Date:   Fri, 26 Jun 2020 10:07:07 +0200
Message-Id: <20200626080717.1999041-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Yoshinori and Rich,

can you take a look and possibly pick up the series below that untangles
and sorts out minor issues with the sh ioremap and dma code?
