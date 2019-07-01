Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231F72C4C4
	for <lists+linux-sh@lfdr.de>; Tue, 28 May 2019 12:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfE1Ktd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 May 2019 06:49:33 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54958 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbfE1Ktc (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 28 May 2019 06:49:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94B0B341;
        Tue, 28 May 2019 03:49:32 -0700 (PDT)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.194.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C3DF3F59C;
        Tue, 28 May 2019 03:49:31 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH RESEND 6/7] sh: entry: Remove unneeded need_resched() loop
Date:   Tue, 28 May 2019 11:48:47 +0100
Message-Id: <20190528104848.13160-7-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528104848.13160-1-valentin.schneider@arm.com>
References: <20190528104848.13160-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Since the enabling and disabling of IRQs within preempt_schedule_irq()
is contained in a need_resched() loop, we don't need the outer arch
code loop.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
---
 arch/sh/kernel/entry-common.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/sh/kernel/entry-common.S b/arch/sh/kernel/entry-common.S
index d31f66e82ce5..65a105de52a0 100644
--- a/arch/sh/kernel/entry-common.S
+++ b/arch/sh/kernel/entry-common.S
@@ -93,7 +93,7 @@ ENTRY(resume_kernel)
 	mov.l	@(TI_PRE_COUNT,r8), r0	! current_thread_info->preempt_count
 	tst	r0, r0
 	bf	noresched
-need_resched:
+
 	mov.l	@(TI_FLAGS,r8), r0	! current_thread_info->flags
 	tst	#_TIF_NEED_RESCHED, r0	! need_resched set?
 	bt	noresched
@@ -107,8 +107,6 @@ need_resched:
 	mov.l	1f, r0
 	jsr	@r0			! call preempt_schedule_irq
 	 nop
-	bra	need_resched
-	 nop
 
 noresched:
 	bra	__restore_all
-- 
2.20.1

