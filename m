Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B075B186D79
	for <lists+linux-sh@lfdr.de>; Mon, 16 Mar 2020 15:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731841AbgCPOl7 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 16 Mar 2020 10:41:59 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35245 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731654AbgCPOl6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 16 Mar 2020 10:41:58 -0400
Received: by mail-pj1-f67.google.com with SMTP id mq3so8825587pjb.0
        for <linux-sh@vger.kernel.org>; Mon, 16 Mar 2020 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9R5XSTLVZnVSKo/0XfK6tXbSB33SVkOVSFtlvO7+58=;
        b=JVA3g1yvmXAbwUG5G/mZ9MS4EZ2IDxpKCNFP4zMteYa2bM31Fi7foXgy2zn7U/plFb
         hbmVYdMksbxu1IcdHNwv7cN9hxMgw8remZj0VSQAcyznP5ga+nzXy6B6n1LEBfa/iKPk
         WcC44w2DAl7fQz2h6wkL6ap2QvsWQEKDflen7A0odk3dHqr6AhGDoSrijiJwz4YMfcCz
         BWgA4XngKVPOOAj2kwHw4KZY3L4f/u38YbK8oEkjbavNbUwjHy+YBw5Q2cDXkvVJfEsm
         CkSdhNcVXkN9B7psPS6hkBT2lc3AAUEFjZ8D/BARlOfJ2kYqaoxdK9Jye9edr3jUbb4I
         8sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9R5XSTLVZnVSKo/0XfK6tXbSB33SVkOVSFtlvO7+58=;
        b=lIZcyd0WBjHmMnMOQdQXyl987LV1Ji/JMKDOjq5ReHz3/T1DYbuL6fwzhiy4pXADwL
         I4P8EFfv7QR9gnCdDL4+AgZTd5nNAYM2PIIqTtGVBNIl8PW1su+2dz6opV0fW/srqYC0
         DlVw2sj4Kp4S3sbjqmYaNnA/Kphw9NJjH5OSfRQgta9Xt4+kV6AjyKU0EAWhPBicP3Ja
         e15ltv68OnQ4WhmJxWx1AuFGwj21y33Qc8Taqh37NJ9MI64DR97gRrkA2pITK7uTZxTH
         nJrkNRkkvDSeZNK41jDYbB4XOQVCQ9F9okeNdzyBIcIJICk0Di+swENUw5L8Z9T5vOS7
         oDsg==
X-Gm-Message-State: ANhLgQ17U5RyHqHHeH7Broudi8yn/lsUtP5VnkStn7gCbUJiXQB7IKM6
        sI8yUtgF3LnvMGxNfhUNq0f9cw==
X-Google-Smtp-Source: ADFU+vv9VT3Lzq9azzLTj30SKf4UnURL+HmYI2WwnZrLhXI11EpIWnehawyvpiMFoeYIjgAwqWRsow==
X-Received: by 2002:a17:90a:8b08:: with SMTP id y8mr25579391pjn.87.1584369717336;
        Mon, 16 Mar 2020 07:41:57 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:41:56 -0700 (PDT)
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
Subject: [PATCHv2 30/50] sh: Remove needless printk()
Date:   Mon, 16 Mar 2020 14:38:56 +0000
Message-Id: <20200316143916.195608-31-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
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
2.25.1

