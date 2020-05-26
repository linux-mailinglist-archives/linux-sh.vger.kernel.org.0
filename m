Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD69B1AF4CA
	for <lists+linux-sh@lfdr.de>; Sat, 18 Apr 2020 22:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgDRUVv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Apr 2020 16:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728558AbgDRUUb (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Apr 2020 16:20:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C67C061A0C
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r26so6794546wmh.0
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d1IZwCRxkZ1RkgDVbkLTPn57FzeyoLwSHK9lQuG45w0=;
        b=V/mZ/3MULvgsx5cK3zvfFJdiycHmCfagGEK0eOfFmP5N6VTyJVSarePBy3jxOVPWB/
         27Rqx2gUIcaClGA17dLE685kUO4MQTnu8y4l2Ge/ei+H17Ik3/y3NyISeMaffAXdGOPF
         5eb7ENt5ksG8MhErUc0A5axtEi4bUlwpKU+DCD6mK8A1wfR8Nh7l0JMLNn5/cQ2r+ir5
         9HQxFYuN4TyBzsLtdL6KzFetg3chYVRChwTWQxoC8cezw6q5hDvXBsoqvlDSwRSHmUyE
         bWww9o5in17u9HM1PQvBRJXOJ5rGI8+zqeF0l0Ij9u3VBNYgn2/0b6lwj79YJJpdNOH2
         tyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d1IZwCRxkZ1RkgDVbkLTPn57FzeyoLwSHK9lQuG45w0=;
        b=bcLxb63HsJVY4HKW8vdfRxzYboj9/phF+XOXCvKjIq40+a/dnsBLkw2ihCDLMqKdbP
         rFfWmCvcIOZmZtvhvE0bKDJBYayjERVGrgpv783MmO6Gk71Bfqf0+WNl6Jd7jww1YNp4
         LALm7uETNnIyCFv2d/kY9zV/T0TRgPkeui3cf89DfyuD3OzTLgQ1R4X5Bm7tuMWSOcPD
         Bbcn5Po8OnHPZx4Ml6otN0j2KAwmmnnpG8vQySM5vtPamCmKxiX9AtBzG4L7wdNKdeez
         +Lcf9vHc11j1ZejAePOUqt2e5HpmWWt/cFQYkNyFW10/6aSh8dDVnlph/NqwvujGlzdQ
         ET2g==
X-Gm-Message-State: AGi0PubCu9s7yUXh0EHUSzfuamYUTBpQFV3US/Khppva3YTA1MTQRvxz
        2BehxY6D7wruhtcSiRaKmXMb4Q==
X-Google-Smtp-Source: APiQypJZC/gnqg5ioys27JtJT/j994LqJN+HGN1x1huYxsVDb58NMfpLV7cneY/TO6NRFTmRDzVd2A==
X-Received: by 2002:a1c:3d83:: with SMTP id k125mr10363639wma.177.1587241229720;
        Sat, 18 Apr 2020 13:20:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:29 -0700 (PDT)
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
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
Subject: [PATCHv3 29/50] sh: Add loglvl to dump_mem()
Date:   Sat, 18 Apr 2020 21:19:23 +0100
Message-Id: <20200418201944.482088-30-dima@arista.com>
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

Add log level argument to dump_mem() as a preparation to introduce
show_stack_loglvl().

Cc: Rich Felker <dalias@libc.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sh/include/asm/kdebug.h |  3 ++-
 arch/sh/kernel/dumpstack.c   | 17 +++++++++--------
 arch/sh/kernel/traps.c       |  4 ++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/sh/include/asm/kdebug.h b/arch/sh/include/asm/kdebug.h
index 5212f5fcd752..de8693fabb1d 100644
--- a/arch/sh/include/asm/kdebug.h
+++ b/arch/sh/include/asm/kdebug.h
@@ -13,6 +13,7 @@ enum die_val {
 
 /* arch/sh/kernel/dumpstack.c */
 extern void printk_address(unsigned long address, int reliable);
-extern void dump_mem(const char *str, unsigned long bottom, unsigned long top);
+extern void dump_mem(const char *str, const char *loglvl,
+		     unsigned long bottom, unsigned long top);
 
 #endif /* __ASM_SH_KDEBUG_H */
diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index 9f1c9c11d62d..6784b914fba0 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -16,30 +16,31 @@
 #include <asm/unwinder.h>
 #include <asm/stacktrace.h>
 
-void dump_mem(const char *str, unsigned long bottom, unsigned long top)
+void dump_mem(const char *str, const char *loglvl,
+	      unsigned long bottom, unsigned long top)
 {
 	unsigned long p;
 	int i;
 
-	printk("%s(0x%08lx to 0x%08lx)\n", str, bottom, top);
+	printk("%s%s(0x%08lx to 0x%08lx)\n", loglvl, str, bottom, top);
 
 	for (p = bottom & ~31; p < top; ) {
-		printk("%04lx: ", p & 0xffff);
+		printk("%s%04lx: ", loglvl,  p & 0xffff);
 
 		for (i = 0; i < 8; i++, p += 4) {
 			unsigned int val;
 
 			if (p < bottom || p >= top)
-				printk("         ");
+				printk("%s         ", loglvl);
 			else {
 				if (__get_user(val, (unsigned int __user *)p)) {
-					printk("\n");
+					printk("%s\n", loglvl);
 					return;
 				}
-				printk("%08x ", val);
+				printk("%s%08x ", loglvl, val);
 			}
 		}
-		printk("\n");
+		printk("%s\n", loglvl);
 	}
 }
 
@@ -156,7 +157,7 @@ void show_stack(struct task_struct *tsk, unsigned long *sp)
 		sp = (unsigned long *)tsk->thread.sp;
 
 	stack = (unsigned long)sp;
-	dump_mem("Stack: ", stack, THREAD_SIZE +
+	dump_mem("Stack: ", KERN_DEFAULT, stack, THREAD_SIZE +
 		 (unsigned long)task_stack_page(tsk));
 	show_trace(tsk, sp, NULL);
 }
diff --git a/arch/sh/kernel/traps.c b/arch/sh/kernel/traps.c
index 63cf17bc760d..faad65409075 100644
--- a/arch/sh/kernel/traps.c
+++ b/arch/sh/kernel/traps.c
@@ -38,8 +38,8 @@ void die(const char *str, struct pt_regs *regs, long err)
 			task_pid_nr(current), task_stack_page(current) + 1);
 
 	if (!user_mode(regs) || in_interrupt())
-		dump_mem("Stack: ", regs->regs[15], THREAD_SIZE +
-			 (unsigned long)task_stack_page(current));
+		dump_mem("Stack: ", KERN_DEFAULT, regs->regs[15],
+			THREAD_SIZE + (unsigned long)task_stack_page(current));
 
 	notify_die(DIE_OOPS, str, regs, err, 255, SIGSEGV);
 
-- 
2.26.0

