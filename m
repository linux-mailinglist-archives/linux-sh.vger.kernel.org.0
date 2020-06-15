Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758DE1FA36D
	for <lists+linux-sh@lfdr.de>; Tue, 16 Jun 2020 00:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgFOWXM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 15 Jun 2020 18:23:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47796 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726408AbgFOWXM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 15 Jun 2020 18:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hWAHEvELG7PCXiHldR7PdlXbQKIkg3HJngutFs9FQdI=;
        b=UlGeKXoeZhFrOieO3gUOvSLpX8Z9rF9W5J+WUUmDIwlxiUBfCuVxFF3GB22cQJzn4wqQeM
        Vg+O1dpVotdt58NBroipESOft4XPnD1BTjggZNSMw3511PzG/hlOR3kpBcHgjjiG9gVFI6
        +bexyHQX9ijyDK1XzFF8so7rJSQTJA8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-6tPmUm1eNUCeex6coCvA-w-1; Mon, 15 Jun 2020 18:23:09 -0400
X-MC-Unique: 6tPmUm1eNUCeex6coCvA-w-1
Received: by mail-qk1-f199.google.com with SMTP id i82so15346855qke.10
        for <linux-sh@vger.kernel.org>; Mon, 15 Jun 2020 15:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hWAHEvELG7PCXiHldR7PdlXbQKIkg3HJngutFs9FQdI=;
        b=DEice0dLZnVe/K75eLFfuSiurD54kGO6f5mCMWtWnDgpnqey6LzaAjEBXEVR7PXmsg
         Mz/FPaEcY7SCQip/OPvg91nLB1cuHrqmpcQY8cVzAD75gAIgROTpxY134bk/fTLxmi24
         MPYhOWhDZdK1IDARMRpNsTbuuFMKmr3OwzTNv5IcMJBXAMZdY88lyvvBiqwF0Vqaxg4K
         P/XtNHddXuoVXgVF5n7Ob0ubRCr1A2jaSnBMUSeeRpj1laOnTcbAY1fW5CpXeX0XFDV9
         fNl/7ozxbeNa9ukdb2Zoi2GLD5OtXO0RzxUijrXOUgiD8WdTC3muUJoW+/Xpon5Vgehw
         XszQ==
X-Gm-Message-State: AOAM530dXNDhd0/NOnkzZS61y5pYL7pwhvpEyhvDKgh5x+FIsvtwm577
        jYDHMXVDRyXQkk64dDH/rnxGIUjTA89MlqixWOor3T4Y+P9NmaVQU9o83DSyIzbkwTfV2eNIxog
        9DIXQrdJ7cfZxFlRkolY=
X-Received: by 2002:a0c:f84c:: with SMTP id g12mr26695598qvo.31.1592259788750;
        Mon, 15 Jun 2020 15:23:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyBZmVWyEmv0sPI1YBaFXr2Se+d7tyy64EI3sFlERYrvc/tp+2ai4tWd5V/XX5SRT29OLZxQ==
X-Received: by 2002:a0c:f84c:: with SMTP id g12mr26695582qvo.31.1592259788510;
        Mon, 15 Jun 2020 15:23:08 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id q38sm14019321qtb.74.2020.06.15.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:23:07 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 20/25] mm/sh: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:23:06 -0400
Message-Id: <20200615222306.8502-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.

CC: Yoshinori Sato <ysato@users.sourceforge.jp>
CC: Rich Felker <dalias@libc.org>
CC: linux-sh@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sh/mm/fault.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 5f23d7907597..06b232973488 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -379,7 +379,7 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	struct task_struct *tsk;
 	struct mm_struct *mm;
 	struct vm_area_struct * vma;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	tsk = current;
@@ -412,8 +412,6 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	if ((regs->sr & SR_IMASK) != SR_IMASK)
 		local_irq_enable();
 
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
 	/*
 	 * If we're in an interrupt, have no user context or are running
 	 * with pagefaults disabled then we must not take the fault:
@@ -465,21 +463,13 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	 * the fault.
 	 */
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
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
 
@@ -493,4 +483,5 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	}
 
 	up_read(&mm->mmap_sem);
+	mm_fault_accounting(tsk, regs, address, major);
 }
-- 
2.26.2

