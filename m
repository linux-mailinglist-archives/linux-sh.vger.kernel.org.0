Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7BF29F13E
	for <lists+linux-sh@lfdr.de>; Thu, 29 Oct 2020 17:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgJ2QWg (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 29 Oct 2020 12:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgJ2QWg (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 29 Oct 2020 12:22:36 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80427C0613D2
        for <linux-sh@vger.kernel.org>; Thu, 29 Oct 2020 09:21:43 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id z17so4101471iog.11
        for <linux-sh@vger.kernel.org>; Thu, 29 Oct 2020 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=dDDY2n44/yiJc9kIpA6+cCqw3kJQ8Reh+jA99UHFsq8=;
        b=GBKRlnJAuCO6iNlq5+vk/OyxmieM7ET+VBBp+lyubNHbPf/vi9nTu0UeJ7NiIMxi5V
         4w7/+Nym/SktFam6r/dk3fRjpIda0ZmHAKyC5LSrUGjpqLctob0A79ZPy4NJHjHYXXKm
         ++0E+8tObwuRkLBRnfSUM5amX98tn5on5B1HKiSsjR+FW7RY/kXANwlGfYaSYS5aZ9/i
         gj+QjcMPmHmiJUCmnUUQlKRNAypcLqmPFXmjdtYxsXnw37sPgSIKCn7PfAkFUthxA6+C
         3LtxYi8IRN1JBB8DrCWeqHPIVVxr4iif1oi9c98Toml8ehgo4H8u3bG4lYYj56cGP7PE
         an4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=dDDY2n44/yiJc9kIpA6+cCqw3kJQ8Reh+jA99UHFsq8=;
        b=lrsUQfvn2pjnWnu7E1hvFnw5dTPT/+9ABPs+k7FL5jRqpMBhMF5Be5b47OcY3O/OEl
         YF2/QSMaF+fmkbsnSifKDcDtfIdr7sBsBMyG7nwLDfnFXHaS7SyoRjm1SywfeYfw4F44
         551eLhjSe83tZHeWDaVYLLHpDM8nhb9Ith5dr7Q91tkhDrRaQP3EhzopmHPVcz5GIPw0
         eejgaYR9NPGOhnm9enx/BlEuDi3weQUTPb04jniL9YFAeapGAR7vxjKgLpPomjZjd9/0
         iFxtfBwEbUXXzdVEaTFAeSj63KXUfBw7e5sWKCGXz853KQhoyA/4bsDk7NtTr3fBZQ2f
         PWbw==
X-Gm-Message-State: AOAM530T+6mhUUiGqTgLnEj8+qP5yCstwTCwAgTyh2tds8GghsWmL7M2
        pT+F36p6taF4hK670+HTOptLu0uhW4LFlQ==
X-Google-Smtp-Source: ABdhPJzaaxKsPrXgWsDzJr641iPY5j7iQv1XIu8QYvZ8/hwVuWv394V+7PV8Na/IGxQtQdE6pf7IPQ==
X-Received: by 2002:a05:6602:22cf:: with SMTP id e15mr4046964ioe.1.1603988502630;
        Thu, 29 Oct 2020 09:21:42 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id u23sm2369807iog.38.2020.10.29.09.21.42
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:21:42 -0700 (PDT)
To:     linux-sh@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
Message-ID: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
Date:   Thu, 29 Oct 2020 10:21:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for sh.

Cc: linux-sh@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/sh/include/asm/thread_info.h | 4 +++-
 arch/sh/kernel/signal_32.c        | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
index 243ea5150aa0..598d0184ffea 100644
--- a/arch/sh/include/asm/thread_info.h
+++ b/arch/sh/include/asm/thread_info.h
@@ -105,6 +105,7 @@ extern void init_thread_xstate(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
+#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
 #define TIF_SINGLESTEP		4	/* singlestepping active */
 #define TIF_SYSCALL_AUDIT	5	/* syscall auditing active */
 #define TIF_SECCOMP		6	/* secure computing */
@@ -116,6 +117,7 @@ extern void init_thread_xstate(void);
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
 #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
@@ -132,7 +134,7 @@ extern void init_thread_xstate(void);
 #define _TIF_ALLWORK_MASK	(_TIF_SYSCALL_TRACE | _TIF_SIGPENDING      | \
 				 _TIF_NEED_RESCHED  | _TIF_SYSCALL_AUDIT   | \
 				 _TIF_SINGLESTEP    | _TIF_NOTIFY_RESUME   | \
-				 _TIF_SYSCALL_TRACEPOINT)
+				 _TIF_SYSCALL_TRACEPOINT | _TIF_NOTIFY_SIGNAL)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_ALLWORK_MASK & ~(_TIF_SYSCALL_TRACE | \
diff --git a/arch/sh/kernel/signal_32.c b/arch/sh/kernel/signal_32.c
index 1add47fd31f6..8cfae5a75edb 100644
--- a/arch/sh/kernel/signal_32.c
+++ b/arch/sh/kernel/signal_32.c
@@ -466,7 +466,10 @@ static void do_signal(struct pt_regs *regs, unsigned int save_r0)
 	if (!user_mode(regs))
 		return;
 
-	if (get_signal(&ksig)) {
+	if (ti_work & _TIF_NOTIFY_SIGNAL)
+		tracehook_notify_signal();
+
+	if ((ti_work & _TIF_SIGPENDING) && get_signal(&ksig)) {
 		handle_syscall_restart(save_r0, regs, &ksig.ka.sa);
 
 		/* Whee!  Actually deliver the signal.  */
@@ -499,7 +502,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, unsigned int save_r0,
 				 unsigned long thread_info_flags)
 {
 	/* deal with pending signal delivery */
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs, save_r0);
 
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
-- 
2.29.0

-- 
Jens Axboe

