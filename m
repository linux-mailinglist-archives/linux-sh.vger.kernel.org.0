Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CE41AF4CB
	for <lists+linux-sh@lfdr.de>; Sat, 18 Apr 2020 22:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgDRUVu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Apr 2020 16:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728572AbgDRUUe (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Apr 2020 16:20:34 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89E3C061A0C
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:33 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 188so354212wmc.2
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=02ncpUWPOHgvp2gQK45y2PX57WXY5wDzEwn6uRMd/a4=;
        b=i3agjhlaFSKeAt8OsfRmtLMa8qcY7EJbDdsYO22Dk6k4AWVwkJvEMJktfbxIcwgpgq
         fxbFgXd8yNKqZlTPnkSguKMjNDMekZA+G3AahG8DBhRLRCLhutkN389E4EtlFW6b/0nI
         /fRjaWX7MnAjz6q1tWpKw11Rdgr+Ehhknn+aPSG3Ez+RPzYIjYWB5vrS4gkCR/vB7fkK
         IlD10mlWg+qtOW0/NGk1rlrHr89vb7+86XX7PirKXyKS2wD7RZZ3+rS1W1Y5hsBw1mdq
         XLc/oTyRGJTot/C8BxU0Ii3KppIfF0utBwN3DDunikx9dyLd+QoMJimGBHtj/pMpeDht
         imjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02ncpUWPOHgvp2gQK45y2PX57WXY5wDzEwn6uRMd/a4=;
        b=ST+E9j4xgxX1LYJCtkKjwOMptReaU3N/dzXYKMwSrjgV3SHDt5YllaYbOiiL2PDG/d
         +IlZsPp0vjenyPJfrpD29z1kQ6lL2svDnnjhTc6/CH9+st6Tuk27MoY6WtNvxHWbFZGa
         Cza+VRsljFN3cgr6cYJrJ2jt9RWtwWXvAVTPA3Zhplh5Ly5Tv9n6caQqPpGoVO4bCfmF
         1h6wbP2UBfNz1aEMGelv7TBm7+d8X5mNVSaltx+EQn0W0M0WV2b3QMOkqwEcUG/bVuhF
         J6gp4Lchi/9vlbzI8t8BCUT1ysqjTlnwF0iPEAHYDoBcC3tbf0h1GNVDRJtml59f0as0
         5EwA==
X-Gm-Message-State: AGi0Pubf73+NbezdC3SrKNH0XatpDRgHiYuWFjVWuNvF9fkKbpBM63kq
        yM19Q+uhERAfMjiseFU7I4bpYQ==
X-Google-Smtp-Source: APiQypLUZt3Vx49G1+SWsofQX0B1CdTrM3RUf80Hec5W2S04Ke5KQlEiu04eSHuB9S+4zGJS/kfVxQ==
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr9612350wme.139.1587241232531;
        Sat, 18 Apr 2020 13:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:32 -0700 (PDT)
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
Subject: [PATCHv3 31/50] sh: Add loglvl to printk_address()
Date:   Sat, 18 Apr 2020 21:19:25 +0100
Message-Id: <20200418201944.482088-32-dima@arista.com>
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

Add log level argument to printk_address() as a preparation to introduce
show_stack_loglvl().

As a good side-effect show_fault_oops() now prints the address with
KERN_EMREG as the rest of output, making sure there won't be situation
where "PC: " is printed without actual address.

Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sh/include/asm/kdebug.h | 3 ++-
 arch/sh/kernel/dumpstack.c   | 6 +++---
 arch/sh/mm/fault.c           | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/sh/include/asm/kdebug.h b/arch/sh/include/asm/kdebug.h
index de8693fabb1d..960545306afa 100644
--- a/arch/sh/include/asm/kdebug.h
+++ b/arch/sh/include/asm/kdebug.h
@@ -12,7 +12,8 @@ enum die_val {
 };
 
 /* arch/sh/kernel/dumpstack.c */
-extern void printk_address(unsigned long address, int reliable);
+extern void printk_address(unsigned long address, int reliable,
+			   const char *loglvl);
 extern void dump_mem(const char *str, const char *loglvl,
 		     unsigned long bottom, unsigned long top);
 
diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index 2c1a78e5776b..959064b90055 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -44,9 +44,9 @@ void dump_mem(const char *str, const char *loglvl,
 	}
 }
 
-void printk_address(unsigned long address, int reliable)
+void printk_address(unsigned long address, int reliable, const char *loglvl)
 {
-	printk(" [<%p>] %s%pS\n", (void *) address,
+	printk("%s [<%p>] %s%pS\n", loglvl, (void *) address,
 			reliable ? "" : "? ", (void *) address);
 }
 
@@ -118,7 +118,7 @@ static int print_trace_stack(void *data, char *name)
  */
 static void print_trace_address(void *data, unsigned long addr, int reliable)
 {
-	printk_address(addr, reliable);
+	printk_address(addr, reliable, (char *)data);
 }
 
 static const struct stacktrace_ops print_trace_ops = {
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 5f23d7907597..f5da8f5ea389 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -196,7 +196,7 @@ show_fault_oops(struct pt_regs *regs, unsigned long address)
 
 	printk(KERN_CONT " at %08lx\n", address);
 	printk(KERN_ALERT "PC:");
-	printk_address(regs->pc, 1);
+	printk_address(regs->pc, 1, KERN_ALERT);
 
 	show_pte(NULL, address);
 }
-- 
2.26.0

