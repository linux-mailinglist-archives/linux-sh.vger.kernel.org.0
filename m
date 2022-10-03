Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A655F36FA
	for <lists+linux-sh@lfdr.de>; Mon,  3 Oct 2022 22:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJCUYn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 3 Oct 2022 16:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJCUYl (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 3 Oct 2022 16:24:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505CE2AE8;
        Mon,  3 Oct 2022 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=JRXvgrD3pH5/cR8O4XMTwokUJc0cwbJcPUmd9Gahf4o=; b=n9fkPbywwKH2/jSKoFdzNPgLb/
        1cKaxJAhIjZafIsTDKcUygdaDj97mXI+qKCNObCFPEi4NtFdCuaJJg3pwnjVtmLsYzUASP9BHqnGA
        ueV3UTCeIRmaqxNqNLZerWYsqCL4aAXTHjILol81131nNbug2cMt8K47oA7hoZNk5wur5R2Y+cPx1
        8uIxaHBzv+GrD4HHcq7iZMvqEgywMqBmEEDK7Q7mmp1UusDvdLht59qeynNREPBivbr8rCNeDQ7sg
        NyAHE9i3otyZTX40+8ZEAixl6xNkV77usWoBXirDTCMiIfWivf0dGJAu0lC7gS01+0T1D+ZcAI72H
        WYidAURw==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ofRzQ-00GdVD-Ux; Mon, 03 Oct 2022 20:24:37 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Igor Zhbanov <izh1979@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] sh: nmi_debug: fix return value of __setup handler
Date:   Mon,  3 Oct 2022 13:24:25 -0700
Message-Id: <20221003202425.11130-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) argument or environment
strings. Also, error return codes don't mean anything to
obsolete_checksetup() -- only non-zero (usually 1) or zero.
So return 1 from nmi_debug_setup().

Fixes: 1e1030dccb10 ("sh: nmi_debug support.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Igor Zhbanov <izh1979@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
---
v2: add more Cc's;
    refresh and resend;
v3: add Arnd to Cc: list

 arch/sh/kernel/nmi_debug.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/sh/kernel/nmi_debug.c
+++ b/arch/sh/kernel/nmi_debug.c
@@ -49,7 +49,7 @@ static int __init nmi_debug_setup(char *
 	register_die_notifier(&nmi_debug_nb);
 
 	if (*str != '=')
-		return 0;
+		return 1;
 
 	for (p = str + 1; *p; p = sep + 1) {
 		sep = strchr(p, ',');
@@ -70,6 +70,6 @@ static int __init nmi_debug_setup(char *
 			break;
 	}
 
-	return 0;
+	return 1;
 }
 __setup("nmi_debug", nmi_debug_setup);
