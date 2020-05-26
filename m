Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C261AF4B3
	for <lists+linux-sh@lfdr.de>; Sat, 18 Apr 2020 22:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgDRUUh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Apr 2020 16:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728586AbgDRUUg (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Apr 2020 16:20:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B995C061A0C
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:36 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so7138507wrv.10
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pWP1TiVa3Z/49zUv5iBWad3qqtGR6PIT7upIk6b62Jo=;
        b=Xf9zp2g4LCddomJz7JWy+3gYRrTMItbNxGNfRcpX1cXgWLb6ETr7vFhWMAZpdbp28k
         ou1eQSjRG9G7c69lo2USYUtWUy1Nkw7+DV11Dh2NqJxBV3gtDCCt6YwCs6Brbyot0oCu
         OhJgYe76XpZQVfwQ3lK30zqY1lHV3mXgsCxPQfV/dBKD3vwAUcB1D0RjqmkpBcCAk2c+
         xGYYGG6eFn8oNOVzzcDFme4mpn17EsoOlhyezLjcCme/vnTAHifsAvB+CN47kj30eUqr
         FLYhYBt2P0fXiaGQA3h4yLcMQilt2z8We+gdIQKBny7lvOvccNCmG1zANSEBk613JL7b
         9PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWP1TiVa3Z/49zUv5iBWad3qqtGR6PIT7upIk6b62Jo=;
        b=KUeFHbGp/fiCM84jxc9hx9gHto3Ea4xvrem9ropTqPDZIJ2muWvvEH/tQbXQWbPVpd
         KRQRsCielXYP2TKIQ/06aNLDXkNtpAxlABJIKk10uBva+J850CP1qBDnVnsmFInKmr7d
         /NGQ0egxSyF1IzEOpbxAid5tu4bIFSPGPhXW12YQ1y3jXtiL7FsEVMulSyHwmp/u3mcG
         gIn1pYLbiiGSywrW4v1Fs4ISO2YYL3gTcvDlOkUjbRouTVsK6g9xbecApXyTO5WqRD+E
         5JxGzw3xOU9V6mrQIgu4VRM/JlR5/R1SAQb+Qhqz81K1Ys3fc/s8e1MP3LD4RkQy3Pgd
         8Btg==
X-Gm-Message-State: AGi0PuYzWWpeeGe89bc7fudyUxrqyuAXZXxkvXzgSBmr6rqyS6oI3GXJ
        PUt/tFucy++uszgFRsLi3rVKsQ==
X-Google-Smtp-Source: APiQypLHLGID2ARNYIaz/2slcwB5mzsYUtgu99lpIjUi2FHkb0Okl1ZImZjnpQgBFImF+H37yJigxQ==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr11403027wrp.271.1587241235272;
        Sat, 18 Apr 2020 13:20:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:34 -0700 (PDT)
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
Subject: [PATCHv3 33/50] sh: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:27 +0100
Message-Id: <20200418201944.482088-34-dima@arista.com>
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

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: Rich Felker <dalias@libc.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sh/kernel/dumpstack.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index d488a47a1f0f..cc51e9d74667 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -144,7 +144,8 @@ void show_trace(struct task_struct *tsk, unsigned long *sp,
 	debug_show_held_locks(tsk);
 }
 
-void show_stack(struct task_struct *tsk, unsigned long *sp)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *sp,
+		       const char *loglvl)
 {
 	unsigned long stack;
 
@@ -156,7 +157,12 @@ void show_stack(struct task_struct *tsk, unsigned long *sp)
 		sp = (unsigned long *)tsk->thread.sp;
 
 	stack = (unsigned long)sp;
-	dump_mem("Stack: ", KERN_DEFAULT, stack, THREAD_SIZE +
+	dump_mem("Stack: ", loglvl, stack, THREAD_SIZE +
 		 (unsigned long)task_stack_page(tsk));
-	show_trace(tsk, sp, NULL, KERN_DEFAULT);
+	show_trace(tsk, sp, NULL, loglvl);
+}
+
+void show_stack(struct task_struct *task, unsigned long *sp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT);
 }
-- 
2.26.0

