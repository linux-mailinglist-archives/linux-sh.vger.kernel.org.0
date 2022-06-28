Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F79455DFE9
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jun 2022 15:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344223AbiF1J7J (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Jun 2022 05:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344473AbiF1J7H (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 28 Jun 2022 05:59:07 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355D62E9C2
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 02:59:05 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id q18-20020a056402519200b004358ce90d97so9102275edd.4
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+Sjjp8jJ7/w0ICOZmYCWvjg7GfEBySyn/+1KfIaOHFY=;
        b=RQpMHh1moTKaRIBjxXnduRTRj1+XOs4vQaRansot4504YpMW6JzxCakSHA0ZB4Cbth
         8fE7QYR5gdwuuaesCuj6XqcfWzoDjKmsmgaVQUd9ciCsaFlXLjQc6VaTmcJ3HkDwTkCz
         lOzuMdxSDRGinWsvPnlsnskh/2yJjhaHqEUVX8Gz1KwncT77mu6T69CeJ3IHvSJcRCvX
         nH9J/YmoHWMI0HlmqnbB1Mr1kCY3tLb/zQaeGzLuHfAt6JljFU2hCl0oBIAG6AyvE7rU
         WE53JOuwEcSvVKQkeW0RqqwgqUTloh7LaQJOmf46hlOvJ76Ol3QtEYr4vWDHFDTWSw58
         K/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+Sjjp8jJ7/w0ICOZmYCWvjg7GfEBySyn/+1KfIaOHFY=;
        b=bJU83XSAz5kBvu2DpSFx7ZgMSYNfdTjtBBmKXJteM8yFg2R92VjZAmmQGPuSG7AZJI
         RoktA9xxyE2FlPT+bNacYM/o5XxHg589LBQlMTHcYdOc/fiJhozvvABbFT8ZI77H0LBo
         V0yLAsNVX62VfharbGojEBmyyheD4nyx4u4TzGvDdMW7fn9PKmNCH5D6ZNgPOcjWWNSm
         8jTT5DYbFNkW4zQXpaNddF7h3tDdYOSw/zgoPN98f6rzZi3ORtJKc10nVim+6wpsnpq2
         IAwiR+0Gk1sRayWMcVFmOz0G2na+EYcpwLffKyw2yI0HYthYWOmm7ocf+OIgppD5SlRc
         yYTw==
X-Gm-Message-State: AJIora/N4YuPwOG0XCec3HfCRQy2Kx8HV6UIfwLfQDE2vYGXJnUXFh7t
        68U53AdH19HzfcIFxBnJ7DS+jkONvw==
X-Google-Smtp-Source: AGRyM1sFuMxPEYN4PW/X/08GhQyD29MIQ2ajj7eQl0T18mWtYdHFG3Mm0EGUOshAqjgz3PRkgvonVGYROw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a05:6402:1386:b0:431:6911:a151 with SMTP id
 b6-20020a056402138600b004316911a151mr22335610edv.105.1656410343984; Tue, 28
 Jun 2022 02:59:03 -0700 (PDT)
Date:   Tue, 28 Jun 2022 11:58:22 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-3-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 02/13] perf/hw_breakpoint: Clean up headers
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org,
        x86@kernel.org, linux-sh@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Clean up headers:

 - Remove unused <linux/kallsyms.h>

 - Remove unused <linux/kprobes.h>

 - Remove unused <linux/module.h>

 - Remove unused <linux/smp.h>

 - Add <linux/export.h> for EXPORT_SYMBOL_GPL().

 - Add <linux/mutex.h> for mutex.

 - Sort alphabetically.

 - Move <linux/hw_breakpoint.h> to top to test it compiles on its own.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
---
v2:
* Move to start of series.
---
 kernel/events/hw_breakpoint.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index f32320ac02fd..1b013968b395 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -17,23 +17,22 @@
  * This file contains the arch-independent routines.
  */
 
+#include <linux/hw_breakpoint.h>
+
+#include <linux/bug.h>
+#include <linux/cpu.h>
+#include <linux/export.h>
+#include <linux/init.h>
 #include <linux/irqflags.h>
-#include <linux/kallsyms.h>
-#include <linux/notifier.h>
-#include <linux/kprobes.h>
 #include <linux/kdebug.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/percpu.h>
 #include <linux/sched.h>
-#include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/list.h>
-#include <linux/cpu.h>
-#include <linux/smp.h>
-#include <linux/bug.h>
 
-#include <linux/hw_breakpoint.h>
 /*
  * Constraints data
  */
-- 
2.37.0.rc0.161.g10f37bed90-goog

