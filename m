Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B58C20FE0B
	for <lists+linux-sh@lfdr.de>; Tue, 30 Jun 2020 22:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbgF3Uqh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 30 Jun 2020 16:46:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29568 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730315AbgF3Up6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 30 Jun 2020 16:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=sstMP5NBLNFJ42p1Ptb1NInEyGUfT5YQOxqtWfaqyuo=;
        b=XHh2okKBEVigD2vxJxMPj9VPpLMNpbmiaUTPlD6qDYMBQ6lvDmbEpd2DwRuOGlME1XcQLJ
        ErZewFpBG7YIfrLkXtvB8xHD8k275z/iRxYR7JvpE/qWY9mDZ4sEW6jeFZJZD9heDIwukM
        3MMXwSEg1/powAiwBNq2+dOSNDVdkDI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-fK_LIw1iOx2oopMc9lVe1A-1; Tue, 30 Jun 2020 16:45:56 -0400
X-MC-Unique: fK_LIw1iOx2oopMc9lVe1A-1
Received: by mail-qt1-f200.google.com with SMTP id 71so7294495qte.5
        for <linux-sh@vger.kernel.org>; Tue, 30 Jun 2020 13:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sstMP5NBLNFJ42p1Ptb1NInEyGUfT5YQOxqtWfaqyuo=;
        b=fqA128k/KnFxtumXoRbRq+w6TwzJKb71hXJB8eYgstn6+AEmGjObMK4Ut9trBJS4dV
         mMcsn4Pdh5v2FIsMgH5UOPKaWBmXg95PRRJf4N31UWJunRH5+TzqAqgqvc97vNW+dUde
         f6nINNVG9VaWhvI/oGmYcPjlp3yC3/gOy5+yNR1aOiePmiS7xh1FbdODHh6hwwS6mOF6
         MKLWZJLTS8IOPGxYHN0BtMrRzwCI1Dv93aWHKG5TZRYXKKOUzaWTonSx6QxaTcRFMfkS
         JTGwKgM2lz+2zRHZKyhk+ScgUwWFrtVGApUAlbsHY46tl80sDRUb19OS45qKU8Z4vsuT
         S18w==
X-Gm-Message-State: AOAM530rjRmsUKyNFAMu3mP/BEHrHgv0j2rDy75xpvGBpru6OlyuVWbf
        cJ7kz/7mdB0IjSoD1BHWR3+NVbRhbCTmxYHXXAqPBvwxT2zicS0n443t1Yt9WNxGfFfwaUT4Z5t
        uzYIhHmfXbRdb0S0FqzY=
X-Received: by 2002:a37:6801:: with SMTP id d1mr20922045qkc.109.1593549954016;
        Tue, 30 Jun 2020 13:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL8+s36Fr/X9eM/aUs84kdpIh/dAND6uY8M4fv2gdc1FLMJbdbBR7ydewQl2OxPf7/WxSloA==
X-Received: by 2002:a37:6801:: with SMTP id d1mr20922017qkc.109.1593549953621;
        Tue, 30 Jun 2020 13:45:53 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id g5sm4383436qta.46.2020.06.30.13.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:52 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v4 19/26] mm/sh: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:51 -0400
Message-Id: <20200630204551.39391-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

CC: Yoshinori Sato <ysato@users.sourceforge.jp>
CC: Rich Felker <dalias@libc.org>
CC: linux-sh@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sh/mm/fault.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 3c0a11827f7e..482668a2f6d3 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -482,22 +482,13 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (unlikely(fault & (VM_FAULT_RETRY | VM_FAULT_ERROR)))
 		if (mm_fault_error(regs, error_code, address, fault))
 			return;
 
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR) {
-			tsk->maj_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
-				      regs, address);
-		} else {
-			tsk->min_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
-				      regs, address);
-		}
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2

