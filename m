Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B4220BCA1
	for <lists+linux-sh@lfdr.de>; Sat, 27 Jun 2020 00:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgFZWgh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 26 Jun 2020 18:36:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57167 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726177AbgFZWgg (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 26 Jun 2020 18:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sy544NXeYcNhbxOT1ou9Gq9AWlj9fShUn5juJrQIV8c=;
        b=cb6AqNEpsnxVqvtxgDy74le7v9W/m0Jz/nvFom8LmsZ2GgCH9xqXQLzfJWRu6iylK1073M
        Ggs/x2HuTgVqVS7R2Ly3Aoffcs8EzuC/Oj0nexchEKyKAPp7K5FSDULHoHVGo8TJDO0wI1
        cr4MHuGoxNc9GUL5UrWnKm0zUU4Ps1s=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-lCr5yQQzN0qJpBmWWvcCog-1; Fri, 26 Jun 2020 18:36:33 -0400
X-MC-Unique: lCr5yQQzN0qJpBmWWvcCog-1
Received: by mail-qt1-f199.google.com with SMTP id h30so7526366qtb.7
        for <linux-sh@vger.kernel.org>; Fri, 26 Jun 2020 15:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sy544NXeYcNhbxOT1ou9Gq9AWlj9fShUn5juJrQIV8c=;
        b=dM9A6mLCQUcpeTS8FIyaamKdwLnKuHDgUr9GJYeZ/qZjJdW4VdtoI5s4lZlP8s8Bo7
         3WLSu5CX3xgfVT69JxFS+nZ7qJ+vOElMPB1ASBxHWUzi0Z3MKEeswl2J1oxwp/iJDem+
         PkpNC5fMW4W89D1L4UFai+zSyVG/mVrUDvbmA3heDcdAdkhXqqcSAEA86vHCvqjuV4Cb
         7DjIj371N5X8NR3znSrAdmmodr4CRP2HhVTm8vRTjVxnZVFUWzYPrXb4oaMFHJX1nGNR
         37U9lVbXOlDC1uG6gz7KZ1vvUKt9/6o+PpjNzSxsweJsaGH5B/6xiZqchwZJs2rygfQa
         iKUg==
X-Gm-Message-State: AOAM531cU/Jvg9tmwRahD9GU7xZverZX9q/9b3ysNRTxilyloFjU1e6D
        d2kKJ+dFoE1XoCKCOYCPvZ9/iQxMxrsRzxChPDWBIlwgulbErvR7JLEQgCK+U75I/xaNFu9ETTx
        pb6XH8rZgLYp74Q72ids=
X-Received: by 2002:a37:85c2:: with SMTP id h185mr4770365qkd.131.1593210992724;
        Fri, 26 Jun 2020 15:36:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcoi8cepaE8ANXOFi2PVyO15Jfd50jgJOhFJOBCe30ERvg9/Lt2pXNeV+XAP5+YiAoyA3fUQ==
X-Received: by 2002:a37:85c2:: with SMTP id h185mr4770348qkd.131.1593210992522;
        Fri, 26 Jun 2020 15:36:32 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id b4sm8623557qka.133.2020.06.26.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:36:31 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 19/26] mm/sh: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:36:30 -0400
Message-Id: <20200626223630.199909-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
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

