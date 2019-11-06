Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3983BF0C8A
	for <lists+linux-sh@lfdr.de>; Wed,  6 Nov 2019 04:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbfKFDIE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 5 Nov 2019 22:08:04 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45364 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388062AbfKFDIE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 5 Nov 2019 22:08:04 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so5778044pga.12
        for <linux-sh@vger.kernel.org>; Tue, 05 Nov 2019 19:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=io42nr5GEPs0pfn13L4hlLJiHXMQomrZ5qcRKTkiezg=;
        b=a/21JQkTH7UKW7PqNv0dJjwH+ZtUvz7pxIDq070SAJBqqTJcVlQ2WweWVzvECPcfps
         7+NU5qbL/l6oEApRnpLBObZFhbrQDUI7A5y7A6v7a7BR6eo3Eid2Jtc/KECybayr8VR3
         P20Wzqz5hXGOmgnKHCawJ/LEV/kO5m4aIqe0wTBziuWEsDg7Di+le+FaQLR6xJEoFH2K
         wEMfJTA4eEwP73YJ1qfmTo4PbJhXt7APeeDjENcCcd7SRDahWKSH8t9nnh3DXCsNLX2N
         S5kyEY38YJ/gnziTOGpTStPkile13418qrzj7txgYrvYaZIlFmdlbCGn1lggLO/D+7A+
         aSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=io42nr5GEPs0pfn13L4hlLJiHXMQomrZ5qcRKTkiezg=;
        b=nvFBsaMC2PdrHQXO/MTU4emSf7wf9iNSrdRWUy9Ran171Uj4c6G6MLFl0AT2F8dbE1
         tMyH59t4mcIrCyKX9mk/WFYKC032Rc1gOspaJKapnvk95fn/7rZH90QztCf4ftADVs3u
         ox9eXuffMtNhck/chPA/VHQoCPUu2Rj39w8LJ1I+nI4cqb/V00P8POqU2Y8teNaJ4egc
         GmzgLp5QUvffq13MhFNvO0QYVSN7RytqxDXdKKTkuMrDh0+JmeLt9IcR6w9UQcSoiAem
         AXcW9BxcBhKCt/fXg6EFP/WjhC2b5Tm54kQpz3+UXeZAFLUrYePJV9DwCG1xXJs6d1QR
         z0Yw==
X-Gm-Message-State: APjAAAVPMDhoJyxePlgCtDx9pFi+mMmKBKDHJG5ASsv/XXEL3AvyEqnI
        fHBs4o5vLYSUdO/4cLM7lYKRgQ==
X-Google-Smtp-Source: APXvYqybClkOX+JRUfvkEiHPClbgMwdtHetrO6+PtPaknfq8Nb/X6npTEoaruNa2yfxJZKRzYOsQ4g==
X-Received: by 2002:a17:90a:234c:: with SMTP id f70mr569834pje.109.1573009683377;
        Tue, 05 Nov 2019 19:08:03 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:08:02 -0800 (PST)
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
Subject: [PATCH 30/50] sh: Remove needless printk()
Date:   Wed,  6 Nov 2019 03:05:21 +0000
Message-Id: <20191106030542.868541-31-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Currently `data' is always an empty line "".
No need for additional printk() call.

Cc: Rich Felker <dalias@libc.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sh/kernel/dumpstack.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index 6784b914fba0..2c1a78e5776b 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -118,7 +118,6 @@ static int print_trace_stack(void *data, char *name)
  */
 static void print_trace_address(void *data, unsigned long addr, int reliable)
 {
-	printk("%s", (char *)data);
 	printk_address(addr, reliable);
 }
 
-- 
2.23.0

