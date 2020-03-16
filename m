Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 124E8186D81
	for <lists+linux-sh@lfdr.de>; Mon, 16 Mar 2020 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgCPOmK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 16 Mar 2020 10:42:10 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33870 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731692AbgCPOmK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 16 Mar 2020 10:42:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id 23so10073262pfj.1
        for <linux-sh@vger.kernel.org>; Mon, 16 Mar 2020 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMFe9blr8w0v5KVSPBHdJ66l7hC6duxSYyDctyF+AXo=;
        b=WPdOl6ddqXrN8Bzxitbo348mdNIGZ+LxznW4sFiHMO/ZH4Xs37HqholZjdcEgCDMeq
         eYkMar2fW5/afLYWTmG4dxtJl3uwy3nIpKhhxXztIBtFXJ9raET8qxVVMYo0IoZZMfyh
         lGCLBUgVETRsN85Emz6x09rTlV2FrrAA1yEuYIob1PWKWLxdug0nteEg5qbamw1f6I+S
         oFQ4V7PkKdc6c6c9wRrZlf+NRlP8PnYr/6dYiHEO6zXFXm6qQyvGm9/pf32+7p45YPh5
         hn89U+cwMKAL+xHZh6u5ulEbK/1t7eZRaEmxPDqOkhwRvbmpS4t0sl0xFJEZB2lOrFDz
         aNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMFe9blr8w0v5KVSPBHdJ66l7hC6duxSYyDctyF+AXo=;
        b=IngqFcHcwH0yET7A4sBWw8cZftuCSxLKfuTTVgcAWKSrq0Vk4s5a6ccQJ1dPIk3qHA
         dHIJRP/IMdkWpVSVM8cVFbaWLDybEiHSwMvL8nwFMOr9PdVg51A7DLRC37cdLQ9zSWmX
         ir+wK9tBZYOWNS2WokHV0nj1poxjh/R6Jr1ToaqsZvnlwnYnJtS/3mrNj7lmivA//fG7
         pf/z2RG3KmWEHmsW9Z9ovTx4zNAMTPO+R+Kcu5S/U9uCM93STT0jRc4EaH6ZzH8o1Zuf
         uwNrb2m9w4nwwull3tHVA33thgRhb2kswhA49YZrtvPk8iMzdXdN6FH99goDD6bCdwPx
         624w==
X-Gm-Message-State: ANhLgQ3cuj9I8AD9HDgHLKJI7FiJu/pAvXdmS4unswP62ywADfph/eWm
        akbe2mrRUD319Ohl+g5+Y7oRhA==
X-Google-Smtp-Source: ADFU+vv7kVzGQR+nKWRTvJdKl9Byobb0T2jsd2Y1LlMe+oGMcWjIA8NZs3Z0zNrkx3x4sdTxc4W2gA==
X-Received: by 2002:a62:5296:: with SMTP id g144mr28469040pfb.29.1584369729742;
        Mon, 16 Mar 2020 07:42:09 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:42:09 -0700 (PDT)
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
Subject: [PATCHv2 33/50] sh: Add show_stack_loglvl()
Date:   Mon, 16 Mar 2020 14:38:59 +0000
Message-Id: <20200316143916.195608-34-dima@arista.com>
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
2.25.1

