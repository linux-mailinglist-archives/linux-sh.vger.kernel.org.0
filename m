Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FB4186D77
	for <lists+linux-sh@lfdr.de>; Mon, 16 Mar 2020 15:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbgCPOly (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 16 Mar 2020 10:41:54 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40189 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731614AbgCPOly (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 16 Mar 2020 10:41:54 -0400
Received: by mail-pg1-f196.google.com with SMTP id t24so9873837pgj.7
        for <linux-sh@vger.kernel.org>; Mon, 16 Mar 2020 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VA2odT+yklt19BLrVNq/tCw6Nt6X9zt0hSCnPXCKxME=;
        b=k/j9y4X7j47tha+XK5skatOkY23KD6OEOMrKVfXsfuT+3gH7r19Z2af153c3WDTu59
         jtELDqg9fdCHCZlRRJx5YE1XxeA+hliekfO57eqz6GvtBeQ8i5O69/aMl6DYC5LJo/Px
         qehGUfERGT8U05gO4MK4cPiSyngNCjIutuZGdOdErmP6JBRLpOsgwKpYqHYCKlFe4lY1
         PUJKZByerc3d1gWPDT2vlv3dCNa5Avb59kLhdGjwCQ2nm3ciK5mGS3Xutkmn7zjeTo/s
         SPG2nesujsrPhNMImuYPNFUqRViVmi6fynrYe16x0OHphROA0a0pLcCfA1ixCG4eeOWu
         TTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VA2odT+yklt19BLrVNq/tCw6Nt6X9zt0hSCnPXCKxME=;
        b=dJZJeaZtEm0KizEsohoHoGNBOyrqk3cgxHynSWTDdoigK2YIH/AGaLP/azP/p62k3j
         /X9VcKBBbmFg95Ly2jsoDwD9I2/Bq04pVrpjIBdZ7UDphBPDGK5UMxnlhIVXnIWVGrlv
         4/qT/DUIuCdhN5Md7vrKs4TIFhWEsCX+UXGMXrSgh+PGRIvnA5rce5E97kmUj2CRtC/w
         HNlLY7L/iIDFK0mH5UNxcpP5xM7tU2EN/grIguNFyLGpWCMzK1M/vTA8v7I+Q7nPw7IG
         6uK3cr6nz7dTqNW5ztcbnxSEFLxT03HqtxczbcbumSG74T1Ym73oXUdH8NrFNRuq8t/E
         8vzg==
X-Gm-Message-State: ANhLgQ3kOAz4mxNZk7F030PlvnmNpB+DU9IjbcRP3qQWsGclnn48NM3Z
        V0ducSTWU7V0qeZZUS74ik7GwQ==
X-Google-Smtp-Source: ADFU+vsA736R75MLlPSh1hDdCYWSGu/g5TvqdHRgGeWaRm/P2+orAxQQL22vEJTfjLDDZRyC6WkXig==
X-Received: by 2002:a63:790e:: with SMTP id u14mr141329pgc.361.1584369713175;
        Mon, 16 Mar 2020 07:41:53 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:41:52 -0700 (PDT)
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
Subject: [PATCHv2 29/50] sh: Add loglvl to dump_mem()
Date:   Mon, 16 Mar 2020 14:38:55 +0000
Message-Id: <20200316143916.195608-30-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
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
2.25.1

