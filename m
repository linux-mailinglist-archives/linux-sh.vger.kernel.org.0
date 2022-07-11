Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B7A56595C
	for <lists+linux-sh@lfdr.de>; Mon,  4 Jul 2022 17:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbiGDPGk (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 4 Jul 2022 11:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbiGDPGX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 4 Jul 2022 11:06:23 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5D911805
        for <linux-sh@vger.kernel.org>; Mon,  4 Jul 2022 08:06:16 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id y6-20020a056402270600b00433940d207eso3928152edd.1
        for <linux-sh@vger.kernel.org>; Mon, 04 Jul 2022 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1aXAa75QFld8JbpbPPEthMJig82bhovg/Ry5+b6na1M=;
        b=QbMgulhIjFHZOKr5YUDv8X5y5GYgyld0Dc3IFnyu3IQSon/TLP4ioIa3f89U8smZwo
         U+WA93et7dQm/OMnt016E80SrrPFeQBKr7TT8q/bG/+pIobmaX9cV85MGeJbgfwiPq1b
         Ava89xEesjG1OvK8d5HhEqp6Dk3T9DeQmZyzZkzFWENmRt6DEyJf1XZ/EdlOu86I7EvX
         atAyCVgS3XzUh3vzK3iLPDIDyYfir4UE8EUj4i/7Gr8GaAqkFojlXvkAl6EOkbu8sGt2
         N+bA+TrhJ8zM0Ge7Q8+mtkxw4fiHMoiDRKfXJ/9ftoItH4d7yqJ4645bBLJu9qa0u2ti
         D/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1aXAa75QFld8JbpbPPEthMJig82bhovg/Ry5+b6na1M=;
        b=rWR3nfBCJsU6eN9/DZaLWUYYZu9hFyvi3Qiexst3U4clMIXm6+nmc03Epr2oWEBuCu
         k2KQJkOoWgb+zPh9O/Rpc4CiwegS1TLTK2QsKMDz9w5BuhXUgbIym/tyRdtBoc2PgwQO
         ecX3tRPgvp8kdTBCmJkfOV34nheRZqh6gSVbTFtPy44Fvm/wyFK7hM29Js8db0U0DuWA
         XlxjcV6iPnwFTovFDyp+qMi+TNGT2v2GB0Oxvi4HBNMlNC0fq+kpqPCIv/N5+pCWdMDS
         NAvZqB+YN8c8T61WJb4jhPqNny6GtgkEQoZcmBdcd6fzBkRR72OfieUrSSDCr438riuv
         6DEg==
X-Gm-Message-State: AJIora9Zl03hUSfMQ7yA2V1tiDh6u0iMFiJUAAIaxi+t4f4t+mYPLvSM
        Jo8jrEsywMtKoIkNtCqYHxNMsmNqRA==
X-Google-Smtp-Source: AGRyM1tnS2+/lSiOrADgLXm9+tmDXyuUPdB8J41yHrIo69EYrjqFBse/Y2ng0gs6mRRVIL7V2CbZUYdG9w==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a17:906:74d6:b0:722:e521:7343 with SMTP id
 z22-20020a17090674d600b00722e5217343mr28873376ejl.432.1656947175193; Mon, 04
 Jul 2022 08:06:15 -0700 (PDT)
Date:   Mon,  4 Jul 2022 17:05:07 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-8-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 07/14] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Due to being a __weak function, hw_breakpoint_weight() will cause the
compiler to always emit a call to it. This generates unnecessarily bad
code (register spills etc.) for no good reason; in fact it appears in
profiles of `perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512`:

    ...
    0.70%  [kernel]       [k] hw_breakpoint_weight
    ...

While a small percentage, no architecture defines its own
hw_breakpoint_weight() nor are there users outside hw_breakpoint.c,
which makes the fact it is currently __weak a poor choice.

Change hw_breakpoint_weight()'s definition to follow a similar protocol
to hw_breakpoint_slots(), such that if <asm/hw_breakpoint.h> defines
hw_breakpoint_weight(), we'll use it instead.

The result is that it is inlined and no longer shows up in profiles.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
 include/linux/hw_breakpoint.h | 1 -
 kernel/events/hw_breakpoint.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index a3fb846705eb..f319bd26b030 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -80,7 +80,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
 extern int reserve_bp_slot(struct perf_event *bp);
 extern void release_bp_slot(struct perf_event *bp);
-int hw_breakpoint_weight(struct perf_event *bp);
 int arch_reserve_bp_slot(struct perf_event *bp);
 void arch_release_bp_slot(struct perf_event *bp);
 void arch_unregister_hw_breakpoint(struct perf_event *bp);
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 9fb66d358d81..9c9bf17666a5 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -124,10 +124,12 @@ static __init int init_breakpoint_slots(void)
 }
 #endif
 
-__weak int hw_breakpoint_weight(struct perf_event *bp)
+#ifndef hw_breakpoint_weight
+static inline int hw_breakpoint_weight(struct perf_event *bp)
 {
 	return 1;
 }
+#endif
 
 static inline enum bp_type_idx find_slot_idx(u64 bp_type)
 {
-- 
2.37.0.rc0.161.g10f37bed90-goog

