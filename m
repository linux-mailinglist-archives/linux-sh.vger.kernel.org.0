Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3737F0C8F
	for <lists+linux-sh@lfdr.de>; Wed,  6 Nov 2019 04:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388130AbfKFDIL (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 5 Nov 2019 22:08:11 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42526 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388124AbfKFDIL (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 5 Nov 2019 22:08:11 -0500
Received: by mail-pf1-f193.google.com with SMTP id s5so9473639pfh.9
        for <linux-sh@vger.kernel.org>; Tue, 05 Nov 2019 19:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/G9/EYu0l2ESdnK4ajQQiEyd8+b46lioiBkhKgr6Q6c=;
        b=abHc+16e/e4agekZzRNyHqU+nnWQHNyUe/SH+x9rZQ2MCs5nvI1LtB4Qhc234INcsm
         e7KjoOCtwGBESgEqhR4j+ZbbREtxNcqs8ZJCoVoZ7Q0L8GQf/ET21x8b1dFgkHYbhJ0K
         C5EUuH4U00ds8EO3JQCLUMuBf3Yg2pZUdCOYv9Fscu8mMBZXf+qzeNRnvFBgjxF1Y9XK
         xer3Gd1SbIRs6mIRHGO7Ak0UlSSMi6JlI9YBy/JGV7qDGbuW3kybHM5i9FDTzUzDyYht
         Q+TbQQlqfTfvXtA9tTl0GaT0f/iGsoB8swagi43R9UzueXA1zH/WFfT7gbr8f4wxChbg
         Leng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/G9/EYu0l2ESdnK4ajQQiEyd8+b46lioiBkhKgr6Q6c=;
        b=ud+mgMkF6fU5QoFb+//w+uE50KPX7ZVf445xYnLCRoGQ08IsYjGCTY42j6aJxQL+1q
         9rkZMgE0DdvRz9oEQoqv0UumM9oFEbP31uo8y41fniUhLptO46wRK1EG+rDeMsfFFkBg
         1jrumP+nhUCfNjh+3OxbPzXen76yS/nWOw1uBpMgIwmw5sSAL0o10eBpqFiXX2F+eR8l
         Owuj3/3CP7+pqMEaE8OK8FQPUZtCoU5wmeCc0x6IvtOAoFozsz6KhnAKRMc09i0hMF3Z
         4c8wMGosXcme1e6EnXs8WBAwxH0I5CGqRJvsn3e6XIVWW2syjCgR4mbzpspZdUxGykch
         ALIw==
X-Gm-Message-State: APjAAAWxSyk3ytKsZAhy6yy/xj1NrWpib/saSBAFNyH9zjW/jup2beVh
        VJLB64aqRzPsbMjpUX/MBu8RYg==
X-Google-Smtp-Source: APXvYqzIG4qL8rczi5+SV61Jr/MQjXsS6bwF3fCdoo2imVlNZNN7W93e/FutOFWUpAwy1A5lH83qkQ==
X-Received: by 2002:a17:90a:1db:: with SMTP id 27mr605462pjd.57.1573009690497;
        Tue, 05 Nov 2019 19:08:10 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:08:09 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 32/50] sh: Add loglvl to show_trace()
Date:   Wed,  6 Nov 2019 03:05:23 +0000
Message-Id: <20191106030542.868541-33-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Add log level parameter to show_trace() as a preparation to introduce
show_stack_loglvl().

Cc: Rich Felker <dalias@libc.org>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sh/include/asm/processor_32.h |  2 +-
 arch/sh/kernel/dumpstack.c         | 10 +++++-----
 arch/sh/kernel/process_32.c        |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/processor_32.h b/arch/sh/include/asm/processor_32.h
index 0e0ecc0132e3..d44409413418 100644
--- a/arch/sh/include/asm/processor_32.h
+++ b/arch/sh/include/asm/processor_32.h
@@ -171,7 +171,7 @@ static __inline__ void enable_fpu(void)
 #define thread_saved_pc(tsk)	(tsk->thread.pc)
 
 void show_trace(struct task_struct *tsk, unsigned long *sp,
-		struct pt_regs *regs);
+		struct pt_regs *regs, const char *loglvl);
 
 #ifdef CONFIG_DUMP_CODE
 void show_code(struct pt_regs *regs);
diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index 959064b90055..d488a47a1f0f 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -127,16 +127,16 @@ static const struct stacktrace_ops print_trace_ops = {
 };
 
 void show_trace(struct task_struct *tsk, unsigned long *sp,
-		struct pt_regs *regs)
+		struct pt_regs *regs, const char *loglvl)
 {
 	if (regs && user_mode(regs))
 		return;
 
-	printk("\nCall trace:\n");
+	printk("%s\nCall trace:\n", loglvl);
 
-	unwind_stack(tsk, regs, sp, &print_trace_ops, "");
+	unwind_stack(tsk, regs, sp, &print_trace_ops, (void *)loglvl);
 
-	printk("\n");
+	printk("%s\n", loglvl);
 
 	if (!tsk)
 		tsk = current;
@@ -158,5 +158,5 @@ void show_stack(struct task_struct *tsk, unsigned long *sp)
 	stack = (unsigned long)sp;
 	dump_mem("Stack: ", KERN_DEFAULT, stack, THREAD_SIZE +
 		 (unsigned long)task_stack_page(tsk));
-	show_trace(tsk, sp, NULL);
+	show_trace(tsk, sp, NULL, KERN_DEFAULT);
 }
diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
index a094633874c3..456cc8d171f7 100644
--- a/arch/sh/kernel/process_32.c
+++ b/arch/sh/kernel/process_32.c
@@ -59,7 +59,7 @@ void show_regs(struct pt_regs * regs)
 	printk("MACH: %08lx MACL: %08lx GBR : %08lx PR  : %08lx\n",
 	       regs->mach, regs->macl, regs->gbr, regs->pr);
 
-	show_trace(NULL, (unsigned long *)regs->regs[15], regs);
+	show_trace(NULL, (unsigned long *)regs->regs[15], regs, KERN_DEFAULT);
 	show_code(regs);
 }
 
-- 
2.23.0

