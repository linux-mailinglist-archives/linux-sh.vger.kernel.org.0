Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50B21A6167
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2020 03:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgDMB6M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 12 Apr 2020 21:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgDMB6M (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 12 Apr 2020 21:58:12 -0400
X-Greylist: delayed 200 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Apr 2020 18:58:12 PDT
Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2A5C0A3BE0
        for <linux-sh@vger.kernel.org>; Sun, 12 Apr 2020 18:58:12 -0700 (PDT)
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-05.nifty.com with ESMTP id 03D1o2qE022218
        for <linux-sh@vger.kernel.org>; Mon, 13 Apr 2020 10:50:02 +0900
Received: from oscar.flets-west.jp (softbank060142179096.bbtec.net [60.142.179.96]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 03D1mGSZ015156;
        Mon, 13 Apr 2020 10:48:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 03D1mGSZ015156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586742497;
        bh=FZ/tcNXoAgAXq9JDrx/IBnjGSDeN1yynq2BOYQhPodU=;
        h=From:To:Cc:Subject:Date:From;
        b=m+GQ4U+9S375ShJvqBCxDDx05JNyTU578Qo/sHjuxPtGXefHrISFjRK7b51bqCW0o
         U5Fxt6J3RaTuyvZEjFJjTQFAasA+Qjvk33UUWVjaY/Bz3c+cFipnNnpxuGnDCJhLfL
         sPCihmHbR0dK48uw3InaOVaRx9OXq3EKkKaipXlRQo8vCccScSGxQipCYPRuKvP+XK
         NmVXacovfeh0ady1WNj9PjAkrTBwrSxbGkKLMhIxfjx1m9RV/hIi2ct59g0nu9YPRG
         y1XVCN3X641Ipg43U1VVSXoYp/gdR0D9Ep/53LTEQo5Ari3OofuuUN2Ww5c5GL9yud
         oG90jFJzTqPgw==
X-Nifty-SrcIP: [60.142.179.96]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] sh: fix build error in mm/init.c
Date:   Mon, 13 Apr 2020 10:47:43 +0900
Message-Id: <20200413014743.16353-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The closing parenthesis is missing.

Fixes: bfeb022f8fe4 ("mm/memory_hotplug: add pgprot_t to mhp_params")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index b9de2d4fa57e..8d2a68aea1fc 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -412,7 +412,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 	int ret;
 
-	if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot)
+	if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot))
 		return -EINVAL;
 
 	/* We only have ZONE_NORMAL, so this is easy.. */
-- 
2.25.1

