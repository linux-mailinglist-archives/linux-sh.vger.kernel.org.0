Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6761A309C
	for <lists+linux-sh@lfdr.de>; Thu,  9 Apr 2020 10:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgDIIDM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Apr 2020 04:03:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46984 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIIDM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Apr 2020 04:03:12 -0400
Received: by mail-ot1-f68.google.com with SMTP id 88so370285otx.13
        for <linux-sh@vger.kernel.org>; Thu, 09 Apr 2020 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=w7mWp7JlCwwX+LzbbexCkoqXbAVclFZtCQPsc2llRoI=;
        b=FvEIM7XCrbir7Gwew/pwlutnm7qZinrdK9LOjKh3zbzb/7qZQoVYsaiAHa/Yuf99B9
         g16wKQuzapH5RnjJxdDIGUZvAB8XZSurUfX02/7kfAf9x+XHw+JXLyJoL+awk1UqGjCm
         ZoJRM+KUBOpzigEZk3HxMKrfalkM46ef5s/ikzSB/t6gFUTItFp2zHeTXvvigRyUheiL
         oAQalMlvCH2meNy060w8L1wokTcM8hHQPblMLjXZlALZ7SvnLgxE012cr+H6LlMg/H1a
         VJ7tchoMd3WUIVBuyr+G8o8t+2gUBisoe1km9IX0596EwUasiT2ox8H/GggbdY9Av29r
         EVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=w7mWp7JlCwwX+LzbbexCkoqXbAVclFZtCQPsc2llRoI=;
        b=QwCoeEc17thT4nxSsYJa60MefvEE896xtfUjBil0qzyLPvcIoiay++VqXOZP/4Jhyp
         NyUtFc/8F5oFnoH8fuSlYq1bIReJxoIfoSp5+44G7Xzas6Ctb9tP2L1WjeIhuejXWgDJ
         hSRPOtCMuv73Kvv2We4XRG0g6T9Ht3aNgio5G08yodzhhCsCh5X7aFwCd4UsoFJoq5Iy
         +gkvE/hbTRafvlnGkhShk0QUXK2iBe9CwCzMQc9MLV0XzxEOl0oCCm0SfWikr3VuCvEg
         xH8G0ZgbBARNikhFEzuysJYL2NEPsUH62T4fYFuI44UtcmtSjlejkq6Hg1AoqM9CaPpb
         aQzA==
X-Gm-Message-State: AGi0PuYB9ON4gfoubWAULYLA9koM39ShrulI/Sfgil4BL6lQJEPyMXkc
        aKB3TFAk/QJP+n5eeJNqOeJJIsc7sto=
X-Google-Smtp-Source: APiQypLJ/PYzQ++Uwcc/dOcVcV5qJzxQwowiTtBhvtoXVtcbu5gX/EcOawLSuQKRj4UqU7VFV93PBA==
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr8814366otb.68.1586419391951;
        Thu, 09 Apr 2020 01:03:11 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id s27sm7928660otg.38.2020.04.09.01.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 01:03:11 -0700 (PDT)
To:     Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>
From:   Rob Landley <rob@landley.net>
Subject: [PATCH] Fix verbose arch/sh panic messages.
Message-ID: <1da19521-b70c-272c-51bb-9416ece62772@landley.net>
Date:   Thu, 9 Apr 2020 03:09:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Rob Landley <rob@landley.net>

These days printk() adds a newline, so 8 lines of memory dump becomes 80.

Signed-off-by: Rob Landley <rob@landley.net>
---

 arch/sh/kernel/dumpstack.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/sh/kernel/dumpstack.c b/arch/sh/kernel/dumpstack.c
index 9f1c9c11d62d..bfbae0d79dde 100644
--- a/arch/sh/kernel/dumpstack.c
+++ b/arch/sh/kernel/dumpstack.c
@@ -19,12 +19,14 @@
 void dump_mem(const char *str, unsigned long bottom, unsigned long top)
 {
 	unsigned long p;
+	char buf[128], *s;
 	int i;

 	printk("%s(0x%08lx to 0x%08lx)\n", str, bottom, top);

 	for (p = bottom & ~31; p < top; ) {
-		printk("%04lx: ", p & 0xffff);
+		s = buf;
+		s += sprintf(s, "%04lx: ", p & 0xffff);

 		for (i = 0; i < 8; i++, p += 4) {
 			unsigned int val;
@@ -33,13 +35,13 @@
 				printk("         ");
 			else {
 				if (__get_user(val, (unsigned int __user *)p)) {
-					printk("\n");
+					printk("FAULT\n");
 					return;
 				}
-				printk("%08x ", val);
+				s += sprintf(s, "%08x ", val);
 			}
 		}
-		printk("\n");
+		printk("%s\n", buf);
 	}
 }

