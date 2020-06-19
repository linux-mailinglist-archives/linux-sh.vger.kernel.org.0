Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F152014B0
	for <lists+linux-sh@lfdr.de>; Fri, 19 Jun 2020 18:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394396AbgFSQOB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 19 Jun 2020 12:14:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29406 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394390AbgFSQNo (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 19 Jun 2020 12:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592583223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sy544NXeYcNhbxOT1ou9Gq9AWlj9fShUn5juJrQIV8c=;
        b=ZOUwbmxF4kYLXvysuPcuZfOaW68kyWgu+nqd0vAPLVFkFxzsJmjhM4H+lftptS/BXE0nqm
        FS17HFIhD1+8C5U+5O5L3dpxtF3rj2B6QVpNU7UednZ8fRUhEbkuCgJBHReslGcqMKVwC3
        47Eu5FbYpAnmoniVQZQC3hIK8GdOM+g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-WJVyBkAENQ2HffLnx_gKMg-1; Fri, 19 Jun 2020 12:13:41 -0400
X-MC-Unique: WJVyBkAENQ2HffLnx_gKMg-1
Received: by mail-qk1-f197.google.com with SMTP id x22so7505152qkj.6
        for <linux-sh@vger.kernel.org>; Fri, 19 Jun 2020 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sy544NXeYcNhbxOT1ou9Gq9AWlj9fShUn5juJrQIV8c=;
        b=ojjiSrg7xET02cMWFsUXN6TKNcBgrSaUP6UKDyiprlHfb2wcugza/vPLrTREQPHpqk
         ttwd3RIPCa5C/qxn51y1ohzENgtFOCunuSTTkLvgcTXfK9035RfEVvJxCouTlATkuU5/
         z3zGazpvdZhf2waSEvdvnH4SCdbOHITPG34gSgmD7A4+MxUPqELQ9wd3NvIlly1s9kph
         HXXOwVsW2at/d+RzCcOiBSfXW23ztEVXaofHNpKirEvboim3/f4EIsoNdN/FZSZm92hJ
         4I4ijT1JkhsI5OYCPZ0ruwqichZjc9h1Se2dOCqbXbSUqC3ylZJptqmHnW6nQcchkbts
         c5jA==
X-Gm-Message-State: AOAM532j0t+p1svwHtjJ+rY78AH1a7xSOO7Syt8M4VW/+/2S6l87G+dY
        7gPTk4qllVXBO2OZksEznuPENoBGznUoC891t6TNMYSN/RsczeK6CLUKmWWgKxeV4uAVyTbzZtQ
        rINvcQ0A9xhxlvodURrE=
X-Received: by 2002:a05:6214:134f:: with SMTP id b15mr9246750qvw.208.1592583220598;
        Fri, 19 Jun 2020 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYciDEcz+6ytfRwjREBcuIkBV9R3diCFzYltXp0h47AZIc6TyB3mcZDytKnQbnKaSsy8vd+w==
X-Received: by 2002:a05:6214:134f:: with SMTP id b15mr9246728qvw.208.1592583220420;
        Fri, 19 Jun 2020 09:13:40 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f203sm502143qke.135.2020.06.19.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:13:39 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Peter Xu <peterx@redhat.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 19/26] mm/sh: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:13:38 -0400
Message-Id: <20200619161338.9714-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
MIME-Version: 1.0
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
index a4e670a9c9b3..ba6f7ed570e5 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -464,22 +464,13 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
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

