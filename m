Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3273D217B4F
	for <lists+linux-sh@lfdr.de>; Wed,  8 Jul 2020 00:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgGGWvA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Jul 2020 18:51:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35078 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729726AbgGGWu7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 Jul 2020 18:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sstMP5NBLNFJ42p1Ptb1NInEyGUfT5YQOxqtWfaqyuo=;
        b=YSkWTZLCR9/wH8KFRFK5MT4W7jB0bcBmUX5DhDBVNVnU+3wEdcxCeq+ePr5VBEdfs+SFF+
        +GhGjI9hREaq1+kkDrtsZoz3N/q5EZeVbrGJywK+jyPXJpDtw9/7veiJyFGdGPQ7SxossY
        QasFudEy/NKu1LZIjpa+Vcbb725PMHs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-65xBmO2YPnGN6x6wiRUb-w-1; Tue, 07 Jul 2020 18:50:56 -0400
X-MC-Unique: 65xBmO2YPnGN6x6wiRUb-w-1
Received: by mail-qv1-f69.google.com with SMTP id t12so17827329qvw.5
        for <linux-sh@vger.kernel.org>; Tue, 07 Jul 2020 15:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sstMP5NBLNFJ42p1Ptb1NInEyGUfT5YQOxqtWfaqyuo=;
        b=cO0A0T2Fy4Eq6qQ/F1P/llfyezsq6fHYDzJzaqydXscK+EY04YaE/TlDtjYeX/bWh3
         N40jz8W+f5PMUgfkXZ8CjCix64LEr0NNuK/8aTj6v1u8t8xhD6sr/4upDpD9Gr3KVIeL
         c3teIH0Bzz7jNrZCtxejm4V6yv43eQ2ksqVCxNGWQOdF6lBzLcD7CEYrdBUgOsITIToT
         v7gHy97V50McbJZy/t+HBYUap4NgK9kxyLTXzBETN+kUhBIs6BsGyXA4/93W96ZyvhvJ
         NdmWIVf3tbiLWc+om6q6trqmOygm7gkXkzFVpe1QPaaF+iieLImPLD4bVwUKOl/CPaOR
         dT1w==
X-Gm-Message-State: AOAM5326ktVqGl1wH4KqCxFag1ZyCABMKdlbfhEPxarckznTREDFF45r
        TFL4VZCSQqTyF4zyacmy0uxrRIWpijZDdUpYpKXKX53xKRikVZ7NBIBVD27SFgKPo6NHJO4IZcH
        01v5ZAU4z0+5HR0DTTXc=
X-Received: by 2002:ae9:ea13:: with SMTP id f19mr48305839qkg.331.1594162255792;
        Tue, 07 Jul 2020 15:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+fZbbr5VZat1rrRmd+D1Dar1PUsYOv9odYsqMkgw6s9ZuUOa/fKMkRQzzNbqSPEglj8MNYA==
X-Received: by 2002:ae9:ea13:: with SMTP id f19mr48305824qkg.331.1594162255589;
        Tue, 07 Jul 2020 15:50:55 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:54 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v5 19/25] mm/sh: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:15 -0400
Message-Id: <20200707225021.200906-20-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
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

