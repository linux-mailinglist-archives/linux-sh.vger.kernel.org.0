Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8E255E982
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jun 2022 18:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347460AbiF1OyI (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Jun 2022 10:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347455AbiF1OyB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 28 Jun 2022 10:54:01 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3ED739A
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 07:53:59 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x184so19899436ybg.12
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vsLZ4itLb8yCme9zL9SXTWJXCTaMaHUvxCRr4pVmzPo=;
        b=hr+LOJOCejSbhs13LtB4ad2iVHUb+RAG9UvlGywImgCuWnbv9Uz0CuXpr7kdL2EXyM
         Zl3qZVecs/jCPbL36y5mfL0HhG/kKAAg5CMELOsO8zieEy+pumtY6i3i9lUzK6EDUaJc
         ij34SuQoLj/NiOxDwRIPbpShAuux9rUl4DMeRDPsX6BzEAEbfgiBkZR8fpdCYwEniTFB
         rUqH8uIe91EnJHMjEePoJ34++jQzFYkaVhwsw6SpYElF68QAdJJOFJ35ZmrerpdmqSoc
         KvqV3wMzW9sxWtFKFxX5f0P0Jvv4ZBX10XEVhIHB536OA3Q6fXumnmTBqPHUsHo1ZiVe
         4+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vsLZ4itLb8yCme9zL9SXTWJXCTaMaHUvxCRr4pVmzPo=;
        b=xMc8W1OEDq6sFNoTYQZ93lVssisf1McB6AQcqIi4cHbFDnHRIyEbv/FWTHeZ673QqI
         uL5GQvkr0zOneGn0H6L7k6GIQ+ppPhPj134NM74qVTTpLiKye7TjshyHTlFNW6Ib5HXr
         YXdlthq08iizgGkcM5ip2+vPitrBChvf5Q4u3QTf7rQ0+plpOgZOD2e5xZSDELZjcN1K
         XWGwlMV5tn/MU1pBWu0w43VTnHCMIPsunAaw+ERBOxiHez1pu/PO05rxbhbyUmNNCs7M
         3oxxihXubA4CBaQ2Uyl+NPSzLKx1H1QKnyzlnafobTOyjWjo06LGGqjPjPyHKuJ2COmg
         Ms5g==
X-Gm-Message-State: AJIora8VEcpMVhhHzS0BUROPDw6yP79euWc8T7c86lHG3p2roPMwFyqF
        6XvGRD7nLyf1xMJBpAdkxBdPDjfLc05LED9LrZG5pw==
X-Google-Smtp-Source: AGRyM1vqDPdKqBHAN5BWgtuoqgS2YkXMiHwIjI7rhq0LUMqvW//SUblW3opNkhuDW9IWNxEP1SI0g+pLXiP+fSqQZuA=
X-Received: by 2002:a5b:74e:0:b0:66c:df8d:12f6 with SMTP id
 s14-20020a5b074e000000b0066cdf8d12f6mr9546552ybq.609.1656428038960; Tue, 28
 Jun 2022 07:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-4-elver@google.com>
 <CACT4Y+bh06ZF5s4Mfq+CJ8RJ+Fm41NeXt=C8Kkx11t9hgABpYQ@mail.gmail.com>
In-Reply-To: <CACT4Y+bh06ZF5s4Mfq+CJ8RJ+Fm41NeXt=C8Kkx11t9hgABpYQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 28 Jun 2022 16:53:22 +0200
Message-ID: <CANpmjNOT=npm9Bu9QGNO=SgCJVB2fr8ojO4-u-Ffgw4gmRuSfw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] perf/hw_breakpoint: Optimize list of per-task breakpoints
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org,
        x86@kernel.org, linux-sh@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 28 Jun 2022 at 15:08, Dmitry Vyukov <dvyukov@google.com> wrote:
>
>  On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
> >
> > On a machine with 256 CPUs, running the recently added perf breakpoint
> > benchmark results in:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 236.418 [sec]
> >  |
> >  |   123134.794271 usecs/op
> >  |  7880626.833333 usecs/op/cpu
> >
> > The benchmark tests inherited breakpoint perf events across many
> > threads.
> >
> > Looking at a perf profile, we can see that the majority of the time is
> > spent in various hw_breakpoint.c functions, which execute within the
> > 'nr_bp_mutex' critical sections which then results in contention on that
> > mutex as well:
> >
> >     37.27%  [kernel]       [k] osq_lock
> >     34.92%  [kernel]       [k] mutex_spin_on_owner
> >     12.15%  [kernel]       [k] toggle_bp_slot
> >     11.90%  [kernel]       [k] __reserve_bp_slot
> >
> > The culprit here is task_bp_pinned(), which has a runtime complexity of
> > O(#tasks) due to storing all task breakpoints in the same list and
> > iterating through that list looking for a matching task. Clearly, this
> > does not scale to thousands of tasks.
> >
> > Instead, make use of the "rhashtable" variant "rhltable" which stores
> > multiple items with the same key in a list. This results in average
> > runtime complexity of O(1) for task_bp_pinned().
> >
> > With the optimization, the benchmark shows:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 0.208 [sec]
> >  |
> >  |      108.422396 usecs/op
> >  |     6939.033333 usecs/op/cpu
> >
> > On this particular setup that's a speedup of ~1135x.
> >
> > While one option would be to make task_struct a breakpoint list node,
> > this would only further bloat task_struct for infrequently used data.
> > Furthermore, after all optimizations in this series, there's no evidence
> > it would result in better performance: later optimizations make the time
> > spent looking up entries in the hash table negligible (we'll reach the
> > theoretical ideal performance i.e. no constraints).
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Commit message tweaks.
> > ---
> >  include/linux/perf_event.h    |  3 +-
> >  kernel/events/hw_breakpoint.c | 56 ++++++++++++++++++++++-------------
> >  2 files changed, 37 insertions(+), 22 deletions(-)
> >
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 01231f1d976c..e27360436dc6 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -36,6 +36,7 @@ struct perf_guest_info_callbacks {
> >  };
> >
> >  #ifdef CONFIG_HAVE_HW_BREAKPOINT
> > +#include <linux/rhashtable-types.h>
> >  #include <asm/hw_breakpoint.h>
> >  #endif
> >
> > @@ -178,7 +179,7 @@ struct hw_perf_event {
> >                          * creation and event initalization.
> >                          */
> >                         struct arch_hw_breakpoint       info;
> > -                       struct list_head                bp_list;
> > +                       struct rhlist_head              bp_list;
> >                 };
> >  #endif
> >                 struct { /* amd_iommu */
> > diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> > index 1b013968b395..add1b9c59631 100644
> > --- a/kernel/events/hw_breakpoint.c
> > +++ b/kernel/events/hw_breakpoint.c
> > @@ -26,10 +26,10 @@
> >  #include <linux/irqflags.h>
> >  #include <linux/kdebug.h>
> >  #include <linux/kernel.h>
> > -#include <linux/list.h>
> >  #include <linux/mutex.h>
> >  #include <linux/notifier.h>
> >  #include <linux/percpu.h>
> > +#include <linux/rhashtable.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> >
> > @@ -54,7 +54,13 @@ static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
> >  }
> >
> >  /* Keep track of the breakpoints attached to tasks */
> > -static LIST_HEAD(bp_task_head);
> > +static struct rhltable task_bps_ht;
> > +static const struct rhashtable_params task_bps_ht_params = {
> > +       .head_offset = offsetof(struct hw_perf_event, bp_list),
> > +       .key_offset = offsetof(struct hw_perf_event, target),
> > +       .key_len = sizeof_field(struct hw_perf_event, target),
> > +       .automatic_shrinking = true,
> > +};
> >
> >  static int constraints_initialized;
> >
> > @@ -103,17 +109,23 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
> >   */
> >  static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
> >  {
> > -       struct task_struct *tsk = bp->hw.target;
> > +       struct rhlist_head *head, *pos;
> >         struct perf_event *iter;
> >         int count = 0;
> >
> > -       list_for_each_entry(iter, &bp_task_head, hw.bp_list) {
> > -               if (iter->hw.target == tsk &&
> > -                   find_slot_idx(iter->attr.bp_type) == type &&
> > +       rcu_read_lock();
> > +       head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
> > +       if (!head)
> > +               goto out;
> > +
> > +       rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {
> > +               if (find_slot_idx(iter->attr.bp_type) == type &&
> >                     (iter->cpu < 0 || cpu == iter->cpu))
> >                         count += hw_breakpoint_weight(iter);
> >         }
> >
> > +out:
> > +       rcu_read_unlock();
> >         return count;
> >  }
> >
> > @@ -186,7 +198,7 @@ static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
> >  /*
> >   * Add/remove the given breakpoint in our constraint table
> >   */
> > -static void
> > +static int
> >  toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >                int weight)
> >  {
> > @@ -199,7 +211,7 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >         /* Pinned counter cpu profiling */
> >         if (!bp->hw.target) {
> >                 get_bp_info(bp->cpu, type)->cpu_pinned += weight;
> > -               return;
> > +               return 0;
> >         }
> >
> >         /* Pinned counter task profiling */
> > @@ -207,9 +219,9 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >                 toggle_bp_task_slot(bp, cpu, type, weight);
> >
> >         if (enable)
> > -               list_add_tail(&bp->hw.bp_list, &bp_task_head);
> > +               return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> >         else
> > -               list_del(&bp->hw.bp_list);
> > +               return rhltable_remove(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> >  }
> >
> >  __weak int arch_reserve_bp_slot(struct perf_event *bp)
> > @@ -307,9 +319,7 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
> >         if (ret)
> >                 return ret;
> >
> > -       toggle_bp_slot(bp, true, type, weight);
> > -
> > -       return 0;
> > +       return toggle_bp_slot(bp, true, type, weight);
> >  }
> >
> >  int reserve_bp_slot(struct perf_event *bp)
> > @@ -334,7 +344,7 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
> >
> >         type = find_slot_idx(bp_type);
> >         weight = hw_breakpoint_weight(bp);
> > -       toggle_bp_slot(bp, false, type, weight);
> > +       WARN_ON(toggle_bp_slot(bp, false, type, weight));
> >  }
> >
> >  void release_bp_slot(struct perf_event *bp)
> > @@ -678,7 +688,7 @@ static struct pmu perf_breakpoint = {
> >  int __init init_hw_breakpoint(void)
> >  {
> >         int cpu, err_cpu;
> > -       int i;
> > +       int i, ret;
> >
> >         for (i = 0; i < TYPE_MAX; i++)
> >                 nr_slots[i] = hw_breakpoint_slots(i);
> > @@ -689,18 +699,24 @@ int __init init_hw_breakpoint(void)
> >
> >                         info->tsk_pinned = kcalloc(nr_slots[i], sizeof(int),
> >                                                         GFP_KERNEL);
> > -                       if (!info->tsk_pinned)
> > -                               goto err_alloc;
> > +                       if (!info->tsk_pinned) {
> > +                               ret = -ENOMEM;
> > +                               goto err;
> > +                       }
> >                 }
> >         }
> >
> > +       ret = rhltable_init(&task_bps_ht, &task_bps_ht_params);
> > +       if (ret)
> > +               goto err;
> > +
> >         constraints_initialized = 1;
> >
> >         perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
> >
> >         return register_die_notifier(&hw_breakpoint_exceptions_nb);
>
> It seems there is a latent bug here:
> if register_die_notifier() fails we also need to execute the err: label code.

I think we should ignore it, because it's just a notifier when the
kernel dies. I'd rather have working breakpoints (which we have if we
made it to this point) when the kernel is live, and sacrifice some bad
behaviour when the kernel dies.

> Otherwise the patch looks good.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Thanks,
-- Marco
