Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EA2C4C2
	for <lists+linux-sh@lfdr.de>; Tue, 28 May 2019 12:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfE1Ktf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 May 2019 06:49:35 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54966 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbfE1Ktf (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 28 May 2019 06:49:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBA415AD;
        Tue, 28 May 2019 03:49:34 -0700 (PDT)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.194.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F5CA3F59C;
        Tue, 28 May 2019 03:49:33 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH RESEND 7/7] sh64: entry: Remove unneeded need_resched() loop
Date:   Tue, 28 May 2019 11:48:48 +0100
Message-Id: <20190528104848.13160-8-valentin.schneider@arm.com>
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
 arch/sh/kernel/cpu/sh5/entry.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/sh/kernel/cpu/sh5/entry.S b/arch/sh/kernel/cpu/sh5/entry.S
index de68ffdfffbf..40e6d9a7a6a2 100644
--- a/arch/sh/kernel/cpu/sh5/entry.S
+++ b/arch/sh/kernel/cpu/sh5/entry.S
@@ -897,7 +897,6 @@ resume_kernel:
 	ld.l	r6, TI_PRE_COUNT, r7
 	beq/u	r7, ZERO, tr0
 
-need_resched:
 	ld.l	r6, TI_FLAGS, r7
 	movi	(1 << TIF_NEED_RESCHED), r8
 	and	r8, r7, r8
@@ -911,9 +910,7 @@ need_resched:
 	ori	r7, 1, r7
 	ptabs	r7, tr1
 	blink	tr1, LINK
-
-	pta	need_resched, tr1
-	blink	tr1, ZERO
+	blink   tr0, ZERO
 #endif
 
 	.global ret_from_syscall
-- 
2.20.1

