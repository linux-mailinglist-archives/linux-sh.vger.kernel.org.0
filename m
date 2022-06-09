Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3A5544A1D
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 13:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiFILbB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 07:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiFILa7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 07:30:59 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6692239A64B
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 04:30:58 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-30974094b5cso199638017b3.20
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=jgek/xbFyP6k/AwYv1XTJdXWbQnAo26L2HOt5DoBXsU=;
        b=Fy1H55PfDYCeMv8rBas4mMZS/7wfUvzeY4alUyUvMTdSV3m3MAHIgl2lhFhM4iqz3P
         YnaeOG+42f2NjxIhArYfXRZSxZonJWpaECkFLRCvTg1F76NCfywWgev/wqpvNYq4Hhwo
         AdtkN0B+vIuRGRU/wnQialrAQTiWXlVD/60uOsII0WFLwboa5gkk6vMW4GvQjOMP5i7E
         gA63ioD8KVexeU0PApbtl5WMaQ4uoZ82otDrNIf4MSwUeY1q0JhvWuBFiDOYPjMHZlSQ
         rKxrnJrlJigxt/xzjjLJLCi+IOankjnEysaeMJ17SLfYsH3lqjGVKvcnmM7DtTaIhjo7
         46AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=jgek/xbFyP6k/AwYv1XTJdXWbQnAo26L2HOt5DoBXsU=;
        b=SZXeXKRS3GhbFVve6mcrKS7VUIUTuurqgbGsF61qi+O1DNrWB9H8nYYG7w/vZwCCDH
         TAnoK7hRhWxYBTU9/2cGrcFc5SKoVQHe6KSwHIr45Up1TaUjW27oCKPkAeHldRSuTGua
         AAQj4/oyExhp3Me8Uu+PDeYuWVAN4EBp8LaVlwVS1Fu4h5gAWOMdARgzNxKr03hiliul
         DDGDgPdqBXDV6lxiw/c2MP+V5Dhu387UDTgxLAsyzHWaG43ZjzwBwwuQqc9bKQv8z/J8
         VyvpwLpXAp9So68rpeXKUhnSS/+pkW+fsU2/DCl+fg81Ul5kZlJmJDeBI/WadzSmROxj
         aw9Q==
X-Gm-Message-State: AOAM530TUv/5TEaaQfJfY3r6fCF2+F9NL5RhUQSSczxR9ypn5TcibUAw
        rm88DMZ8+ZTU/wXNof4rbY6TLH0LbQ==
X-Google-Smtp-Source: ABdhPJwXl9EhYDUHMoRUsonHSMafUY49HAbhznQ0um7Z0gJyfC6OvtmdmrnCE0gDShvyyDzCT8kDCUNF2w==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:dcf:e5ba:10a5:1ea5])
 (user=elver job=sendgmr) by 2002:a05:6902:102c:b0:663:32b8:4b24 with SMTP id
 x12-20020a056902102c00b0066332b84b24mr30477830ybt.1.1654774257606; Thu, 09
 Jun 2022 04:30:57 -0700 (PDT)
Date:   Thu,  9 Jun 2022 13:30:38 +0200
Message-Id: <20220609113046.780504-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH 0/8] perf/hw_breakpoint: Optimize for thousands of tasks
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
        linux-perf-users@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
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

The hw_breakpoint subsystem's code has seen little change in over 10
years. In that time, systems with >100s of CPUs have become common,
along with improvements to the perf subsystem: using breakpoints on
thousands of concurrent tasks should be a supported usecase.

The breakpoint constraints accounting algorithm is the major bottleneck
in doing so:

  1. task_bp_pinned() has been O(#tasks), and called twice for each CPU.

  2. Everything is serialized on a global mutex, 'nr_bp_mutex'.

This series first optimizes task_bp_pinned() to only take O(1) on
average, and then reworks synchronization to allow concurrency when
checking and updating breakpoint constraints for tasks. Along the way,
smaller micro-optimizations and cleanups are done as they seemed obvious
when staring at the code (but likely insignificant).

The result is (on a system with 256 CPUs) that we go from:

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
	 	[ ^ more aggressive benchmark parameters took too long ]
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 236.418 [sec]
 |
 |   123134.794271 usecs/op
 |  7880626.833333 usecs/op/cpu

... to -- with all optimizations:

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.071 [sec]
 |
 |       37.134896 usecs/op
 |     2376.633333 usecs/op/cpu

On the used test system, that's an effective speedup of ~3315x per op.

Which is close to the theoretical ideal performance through
optimizations in hw_breakpoint.c -- for reference, constraints
accounting disabled:

 | perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.067 [sec]
 |
 |       35.286458 usecs/op
 |     2258.333333 usecs/op/cpu

At this point, the current implementation is only ~5% slower than the
theoretical ideal. However, given constraints accounting cannot
realistically be disabled, this is likely as far as we can push it.

Marco Elver (8):
  perf/hw_breakpoint: Optimize list of per-task breakpoints
  perf/hw_breakpoint: Mark data __ro_after_init
  perf/hw_breakpoint: Optimize constant number of breakpoint slots
  perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
  perf/hw_breakpoint: Remove useless code related to flexible
    breakpoints
  perf/hw_breakpoint: Reduce contention with large number of tasks
  perf/hw_breakpoint: Optimize task_bp_pinned() if CPU-independent
  perf/hw_breakpoint: Clean up headers

 arch/sh/include/asm/hw_breakpoint.h  |   5 +-
 arch/x86/include/asm/hw_breakpoint.h |   5 +-
 include/linux/hw_breakpoint.h        |   1 -
 include/linux/perf_event.h           |   3 +-
 kernel/events/hw_breakpoint.c        | 374 +++++++++++++++++++--------
 5 files changed, 276 insertions(+), 112 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog
