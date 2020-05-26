Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AF71AF4AB
	for <lists+linux-sh@lfdr.de>; Sat, 18 Apr 2020 22:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgDRUUg (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Apr 2020 16:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728586AbgDRUUf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Apr 2020 16:20:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C739C061A0F
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z6so6784586wml.2
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LcoZoY+566ZuItEznOv7gQpyH1CF6rKNXLWS0JKZOFQ=;
        b=VTYuaj8Dx2y14E4sA5nnckUhZZpcb9YJne0E/JZ1sPuFowZrkrjfi05zZs9NFOKkuk
         Qc9nrxbA7nAqpihx+/BPGSJ+i6GeojCveh1kyoWMQJbfxusOkcg1LudmQiM+eWGobCXT
         Kj6q42dTJAsDYMO3Sg8OR7yLhfouUohnoT1n8qymriWe460HoGUm45GDPEdEn5YPTmuH
         T90a1C/bNK8gNP/1cDEQyOW3//jTMyzVwl7v6/Cxzi2OJIHjYNhDZhtk2NZi0NrYafy8
         s4K2gCfy6MXw5CCOeYKiIdP+sLbSEa/lSBMLjYpHD9iks8Z9DBXnkdJtjDb1VwAZxv4F
         cCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcoZoY+566ZuItEznOv7gQpyH1CF6rKNXLWS0JKZOFQ=;
        b=ucxHInuLjAElSe9LmmoFwRKw9niWw8aaj+QVHMCDceyxlxwOlRz0IDawlpHFnx9MRq
         3W5Vg6zLcrnRt6focjNcjIyW18fHYCoP4ZVq+MnLUkG5w+U/E5vf3tkaPwciTjC9HjuZ
         rEkrvqQqCCrbKirWOnWw299htJJtVcC10tucHobvu4WumyFGeVUg5DW7xj6yU9TKa+O3
         yCOJsvR0mF5ynkVfiL2TwRI41QEpqievUkVFEsOyoHVtr199X5AscZnFYGwEmDLRjyDi
         kujOh+PzL+Ey+rVr4orQNWR99n0C65c+sGhpEF4ToOjie9GHW0xN/oU5fXWxoYEPVLwh
         j2GQ==
X-Gm-Message-State: AGi0PubLPyBmGnJbGuXfLDiWH4F2EM8bErFhmDxGATmpsozxuj4QCOiS
        6Kj6iRMLDr0ZkPYBMGWLOpNLxw==
X-Google-Smtp-Source: APiQypLOrtiHeskPBcAJn2a1NOGH95CKgYTAcjHADXwnkneh+OMdFWq8yIS82xgT/1caanc+29GOTQ==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr3514110wml.133.1587241233846;
        Sat, 18 Apr 2020 13:20:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:33 -0700 (PDT)
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
Subject: [PATCHv3 32/50] sh: Add loglvl to show_trace()
Date:   Sat, 18 Apr 2020 21:19:26 +0100
Message-Id: <20200418201944.482088-33-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
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
2.26.0

