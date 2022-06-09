Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D285544BF8
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 14:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiFIM2l (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 08:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241492AbiFIM2Z (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 08:28:25 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D16913FA5
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 05:28:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b7so13434085ljr.6
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ZkVNogiVa8TD8+T4Yv+cG2dpFAwHLFgC+ukHCJDT4I=;
        b=IMiMlQXzfUPcw+2OYtInMvM+UurNQEg1HuNbNUI2Yie5fl0zYgUctTMI2LTZZ5nwhk
         t6BUf/I4RveOFGJzjVDTAzjnilpq8YetOifH/y9O7DI+Dv4YQ4NNZkazU2SH5pvQ3MCI
         ULJxqXOjPmG4zkE+aZi6kSC6A3zT+/+paWGtk/ZXl2FO2Bj1b+3AO3yh1YKpv1RS663q
         /KplhvEht9zrJvEUQpt852lRcfB3Vx8ZzK19+5vwth+eiKWRIewLT97C1US/SvpNFtC4
         rZ2j9hkJNRqPUQ+Yeqzhbg4PwVlciNIhCFWrc3lG7mn8BkYG2E9Aevo2ESPNcmcWKc1E
         LHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZkVNogiVa8TD8+T4Yv+cG2dpFAwHLFgC+ukHCJDT4I=;
        b=RZCVIXB7cdm44OtiKpo1CBGvLBWS1lxoyL8k2ADtrt4mCawikwxv4RliuHArvUg94R
         wNmdW4tTPnFB2gyGb/w8OFT0PG5LVRpf9xN61xzKyT378Jj0dB1sl9PoNM0f1LTgSGF/
         SDFSsXb6UD/f5g0aM9A4Lfv+3JOa/quLa+8lT/ffeaIQImSMcAGSyuWOHE6zIsPKMbxf
         brWrzLH3GVdNsbYgUKR8YQ/ZlO1I3UsNka0CQW/KjO9/M8tr8yCjEXQxw2eWHuAAiPMc
         eV0PBbxwY8VsH2PAdgVBeIEQj09TRIwfKka5W0o9JmTcpdPCw5EK9lHld0waF1eX4VF/
         PnOw==
X-Gm-Message-State: AOAM53077FzUE/xeaY/QHgeTrUr7r4jjnCzkO3zPIFsyeHfArqOtU4I+
        n8y34o5Vkh4kirrX4Q9PyakS5zZAtGu2rVnyqW/+bk6/k2w=
X-Google-Smtp-Source: ABdhPJxpbYQfKdgekEkNg9JFGcwYFChokxhgQwQATVrBYFZVLYc2xioTL1GBM4ncwJzPdWOXTxbGWM2QIuW5mBKcDb0=
X-Received: by 2002:a2e:8882:0:b0:255:6858:d4c0 with SMTP id
 k2-20020a2e8882000000b002556858d4c0mr24538236lji.268.1654777699961; Thu, 09
 Jun 2022 05:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113046.780504-1-elver@google.com>
In-Reply-To: <20220609113046.780504-1-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 9 Jun 2022 14:28:08 +0200
Message-ID: <CACT4Y+bA44uBgOZ7Hn74zrnX+agqGQWbkq=bzOX+A726nB2M7Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] perf/hw_breakpoint: Optimize for thousands of tasks
To:     Marco Elver <elver@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, 9 Jun 2022 at 13:30, Marco Elver <elver@google.com> wrote:
>
> The hw_breakpoint subsystem's code has seen little change in over 10
> years. In that time, systems with >100s of CPUs have become common,
> along with improvements to the perf subsystem: using breakpoints on
> thousands of concurrent tasks should be a supported usecase.
>
> The breakpoint constraints accounting algorithm is the major bottleneck
> in doing so:
>
>   1. task_bp_pinned() has been O(#tasks), and called twice for each CPU.
>
>   2. Everything is serialized on a global mutex, 'nr_bp_mutex'.
>
> This series first optimizes task_bp_pinned() to only take O(1) on
> average, and then reworks synchronization to allow concurrency when
> checking and updating breakpoint constraints for tasks. Along the way,
> smaller micro-optimizations and cleanups are done as they seemed obvious
> when staring at the code (but likely insignificant).
>
> The result is (on a system with 256 CPUs) that we go from:
>
>  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>                 [ ^ more aggressive benchmark parameters took too long ]
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 236.418 [sec]
>  |
>  |   123134.794271 usecs/op
>  |  7880626.833333 usecs/op/cpu
>
> ... to -- with all optimizations:
>
>  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.071 [sec]
>  |
>  |       37.134896 usecs/op
>  |     2376.633333 usecs/op/cpu
>
> On the used test system, that's an effective speedup of ~3315x per op.

Awesome!

> Which is close to the theoretical ideal performance through
> optimizations in hw_breakpoint.c -- for reference, constraints
> accounting disabled:
>
>  | perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.067 [sec]
>  |
>  |       35.286458 usecs/op
>  |     2258.333333 usecs/op/cpu
>
> At this point, the current implementation is only ~5% slower than the
> theoretical ideal. However, given constraints accounting cannot
> realistically be disabled, this is likely as far as we can push it.
>
> Marco Elver (8):
>   perf/hw_breakpoint: Optimize list of per-task breakpoints
>   perf/hw_breakpoint: Mark data __ro_after_init
>   perf/hw_breakpoint: Optimize constant number of breakpoint slots
>   perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
>   perf/hw_breakpoint: Remove useless code related to flexible
>     breakpoints
>   perf/hw_breakpoint: Reduce contention with large number of tasks
>   perf/hw_breakpoint: Optimize task_bp_pinned() if CPU-independent
>   perf/hw_breakpoint: Clean up headers
>
>  arch/sh/include/asm/hw_breakpoint.h  |   5 +-
>  arch/x86/include/asm/hw_breakpoint.h |   5 +-
>  include/linux/hw_breakpoint.h        |   1 -
>  include/linux/perf_event.h           |   3 +-
>  kernel/events/hw_breakpoint.c        | 374 +++++++++++++++++++--------
>  5 files changed, 276 insertions(+), 112 deletions(-)
>
> --
> 2.36.1.255.ge46751e96f-goog
