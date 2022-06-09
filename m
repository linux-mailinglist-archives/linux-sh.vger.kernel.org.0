Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164F5544CF7
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbiFINEK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 09:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbiFINEH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 09:04:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD311A831
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 06:04:03 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u26so37156392lfd.8
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ttY9K7oKZbh11a10HcfqLnujPYVmbT7GbfuOgBGqzQU=;
        b=tFVostOOlcKSIw03GgoWpDuw1Ca3oT+37r0fLx1YKS5mU3SyJi8fKo6b14CMdatl04
         cEGEhv5F50E5LMLD9V/bv0oH5cIliTsAMx/ZMRVhtA2buxXErXFZK6mhuggC8460bg7E
         4S8CpB8WFwMfU97oBk7gl/RCOg0U3VZbWBIcqHknlo/OfZAw+4Kd6h6vFigeHHx4QQ/k
         wEHO8SCjWGx6bNYN6F+ClswlVHkO3gD1wwTHpIYoQc85fzYFGNDujKPnP1BRZpvJ1q3z
         70WqpO8xBUu9qsfRsDE8LKAhhTkM8hcJhyIlYCdSlruyYJQwA5S4Bb3M7KBTCyDmX3xh
         UVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ttY9K7oKZbh11a10HcfqLnujPYVmbT7GbfuOgBGqzQU=;
        b=QdZruWUU8L+xgJ5yixzv50adENk1xUGt/MOKztpPRoS7V+vmEeOkycgz2ZwIxa4kOb
         eNPkUtiLeqTQYTWcb6e9yBBYXmwcdMI4UrO0ErvxCvZtXaW8xAUpyNi+msPSdstMmlSo
         tKQouy+d1Kf0EpmZuJb0h8TT5c2fL0kqikhZ5Zpc41V42nV0GTs2iSvuJhB7xBkwDdoF
         z0FuVUtzka7lj0/PHjElUaXa7ArdMdnvM2DUEbhxYOSsnj77YDyUNpDOgYbfJWDIOsVb
         nw89u68AlRu60bDkfrtuMAq/SQlETKu6XuDGDLVs0gwSZB+ahycrMTj2hK2rPU7UZAkX
         FKBA==
X-Gm-Message-State: AOAM533WNfHL65yKqfICjjXE7r42bjVjRrE4kWI+E48XDLZqm/RHK9WP
        Ii0lT2ephPhEJRXnuMbtmHrldcRQX/A/ofzN3zExUw==
X-Google-Smtp-Source: ABdhPJzWzM3HQwEZ+IcGcl4BBFuYQse0DRv+DQfaGw91wTYAcPcoq3gsQ9i6oJangUV6aSVLMGZrXjMrZ5sXPE3NWOs=
X-Received: by 2002:a05:6512:3c94:b0:477:ba25:de54 with SMTP id
 h20-20020a0565123c9400b00477ba25de54mr24421667lfv.137.1654779841905; Thu, 09
 Jun 2022 06:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113046.780504-1-elver@google.com> <20220609113046.780504-7-elver@google.com>
In-Reply-To: <20220609113046.780504-7-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 9 Jun 2022 15:03:48 +0200
Message-ID: <CACT4Y+aHZ4RTsz_SY=U5NKRWR1M4f0cy1WdepJyBGkbYy7_=TA@mail.gmail.com>
Subject: Re: [PATCH 6/8] perf/hw_breakpoint: Reduce contention with large
 number of tasks
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

."On Thu, 9 Jun 2022 at 13:31, Marco Elver <elver@google.com> wrote:
>
> While optimizing task_bp_pinned()'s runtime complexity to O(1) on
> average helps reduce time spent in the critical section, we still suffer
> due to serializing everything via 'nr_bp_mutex'. Indeed, a profile shows
> that now contention is the biggest issue:
>
>     95.93%  [kernel]       [k] osq_lock
>      0.70%  [kernel]       [k] mutex_spin_on_owner
>      0.22%  [kernel]       [k] smp_cfm_core_cond
>      0.18%  [kernel]       [k] task_bp_pinned
>      0.18%  [kernel]       [k] rhashtable_jhash2
>      0.15%  [kernel]       [k] queued_spin_lock_slowpath
>
> when running the breakpoint benchmark with (system with 256 CPUs):
>
>  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.207 [sec]
>  |
>  |      108.267188 usecs/op
>  |     6929.100000 usecs/op/cpu
>
> The main concern for synchronizing the breakpoint constraints data is
> that a consistent snapshot of the per-CPU and per-task data is observed.
>
> The access pattern is as follows:
>
>  1. If the target is a task: the task's pinned breakpoints are counted,
>     checked for space, and then appended to; only bp_cpuinfo::cpu_pinned
>     is used to check for conflicts with CPU-only breakpoints;
>     bp_cpuinfo::tsk_pinned are incremented/decremented, but otherwise
>     unused.
>
>  2. If the target is a CPU: bp_cpuinfo::cpu_pinned are counted, along
>     with bp_cpuinfo::tsk_pinned; after a successful check, cpu_pinned is
>     incremented. No per-task breakpoints are checked.
>
> Since rhltable safely synchronizes insertions/deletions, we can allow
> concurrency as follows:
>
>  1. If the target is a task: independent tasks may update and check the
>     constraints concurrently, but same-task target calls need to be
>     serialized; since bp_cpuinfo::tsk_pinned is only updated, but not
>     checked, these modifications can happen concurrently by switching
>     tsk_pinned to atomic_t.
>
>  2. If the target is a CPU: access to the per-CPU constraints needs to
>     be serialized with other CPU-target and task-target callers (to
>     stabilize the bp_cpuinfo::tsk_pinned snapshot).
>
> We can allow the above concurrency by introducing a per-CPU constraints
> data reader-writer lock (bp_cpuinfo_lock), and per-task mutexes
> (task_sharded_mtx):
>
>   1. If the target is a task: acquires its task_sharded_mtx, and
>      acquires bp_cpuinfo_lock as a reader.
>
>   2. If the target is a CPU: acquires bp_cpuinfo_lock as a writer.
>
> With these changes, contention with thousands of tasks is reduced to the
> point where waiting on locking no longer dominates the profile:
>
>  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.080 [sec]
>  |
>  |       42.048437 usecs/op
>  |     2691.100000 usecs/op/cpu
>
>     21.31%  [kernel]       [k] task_bp_pinned
>     17.49%  [kernel]       [k] rhashtable_jhash2
>      5.29%  [kernel]       [k] toggle_bp_slot
>      4.45%  [kernel]       [k] mutex_spin_on_owner
>      3.72%  [kernel]       [k] bcmp
>
> On this particular setup that's a speedup of 2.5x.
>
> We're also getting closer to the theoretical ideal performance through
> optimizations in hw_breakpoint.c -- constraints accounting disabled:
>
>  | perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.067 [sec]
>  |
>  |       35.286458 usecs/op
>  |     2258.333333 usecs/op/cpu
>
> Which means the current implementation is ~19% slower than the
> theoretical ideal.
>
> For reference, performance without any breakpoints:
>
>  | $> bench -r 30 breakpoint thread -b 0 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 0 breakpoints and 64 parallelism
>  |      Total time: 0.060 [sec]
>  |
>  |       31.365625 usecs/op
>  |     2007.400000 usecs/op/cpu
>
> The theoretical ideal is only ~12% slower than no breakpoints at all.
> The current implementation is ~34% slower than no breakpoints at all.
> (On a system with 256 CPUs.)
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  kernel/events/hw_breakpoint.c | 155 ++++++++++++++++++++++++++++------
>  1 file changed, 128 insertions(+), 27 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index afe0a6007e96..08c9ed0626e4 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -17,6 +17,7 @@
>   * This file contains the arch-independent routines.
>   */
>
> +#include <linux/atomic.h>
>  #include <linux/irqflags.h>
>  #include <linux/kallsyms.h>
>  #include <linux/notifier.h>
> @@ -24,8 +25,10 @@
>  #include <linux/kdebug.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/percpu.h>
>  #include <linux/sched.h>
> +#include <linux/spinlock.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
>  #include <linux/rhashtable.h>
> @@ -42,9 +45,9 @@ struct bp_cpuinfo {
>         unsigned int    cpu_pinned;
>         /* tsk_pinned[n] is the number of tasks having n+1 breakpoints */
>  #ifdef hw_breakpoint_slots
> -       unsigned int    tsk_pinned[hw_breakpoint_slots(0)];
> +       atomic_t        tsk_pinned[hw_breakpoint_slots(0)];
>  #else
> -       unsigned int    *tsk_pinned;
> +       atomic_t        *tsk_pinned;
>  #endif
>  };
>
> @@ -71,8 +74,81 @@ struct bp_busy_slots {
>         unsigned int pinned;
>  };
>
> -/* Serialize accesses to the above constraints */
> -static DEFINE_MUTEX(nr_bp_mutex);
> +/*
> + * Synchronizes accesses to the per-CPU constraints; users of data in bp_cpuinfo
> + * must acquire bp_cpuinfo_lock as writer to get a stable snapshot of all CPUs'
> + * constraints. Modifications without use may only acquire bp_cpuinfo_lock as a
> + * reader, but must otherwise ensure modifications are never lost.
> + */

I can't understand this comment.
Modifications need to acquire in read mode, while only users must
acquire in write mode. Shouldn't it be the other way around? What is
"Modifications without use"?


> +static DEFINE_RWLOCK(bp_cpuinfo_lock);
> +
> +/*
> + * Synchronizes accesses to the per-task breakpoint list in task_bps_ht. Since
> + * rhltable synchronizes concurrent insertions/deletions, independent tasks may
> + * insert/delete concurrently; therefore, a mutex per task would be sufficient.
> + *
> + * To avoid bloating task_struct with infrequently used data, use a sharded
> + * mutex that scales with number of CPUs.
> + */
> +static DEFINE_PER_CPU(struct mutex, task_sharded_mtx);
> +
> +static struct mutex *get_task_sharded_mtx(struct perf_event *bp)
> +{
> +       int shard;
> +
> +       if (!bp->hw.target)
> +               return NULL;
> +
> +       /*
> +        * Compute a valid shard index into per-CPU data.
> +        */
> +       shard = task_pid_nr(bp->hw.target) % nr_cpu_ids;
> +       shard = cpumask_next(shard - 1, cpu_possible_mask);
> +       if (shard >= nr_cpu_ids)
> +               shard = cpumask_first(cpu_possible_mask);
> +
> +       return per_cpu_ptr(&task_sharded_mtx, shard);
> +}
> +
> +static struct mutex *bp_constraints_lock(struct perf_event *bp)
> +{
> +       struct mutex *mtx = get_task_sharded_mtx(bp);
> +
> +       if (mtx) {
> +               mutex_lock(mtx);
> +               read_lock(&bp_cpuinfo_lock);

Is NR_CPUS == 1 case still important to optimize? I guess with small
VMs it may be important again.
If so, we could just write-lock bp_cpuinfo_lock always if NR_CPUS == 1.

> +       } else {
> +               write_lock(&bp_cpuinfo_lock);
> +       }
> +
> +       return mtx;
> +}
> +
> +static void bp_constraints_unlock(struct mutex *mtx)
> +{
> +       if (mtx) {
> +               read_unlock(&bp_cpuinfo_lock);
> +               mutex_unlock(mtx);
> +       } else {
> +               write_unlock(&bp_cpuinfo_lock);
> +       }
> +}
> +
> +static bool bp_constraints_is_locked(struct perf_event *bp)
> +{
> +       struct mutex *mtx = get_task_sharded_mtx(bp);
> +
> +       return (mtx ? mutex_is_locked(mtx) : false) ||
> +              rwlock_is_contended(&bp_cpuinfo_lock);
> +}
> +
> +static inline void assert_bp_constraints_lock_held(struct perf_event *bp)
> +{
> +       lockdep_assert_held(&bp_cpuinfo_lock);
> +       /* Don't call get_task_sharded_mtx() if lockdep is disabled. */
> +       if (IS_ENABLED(CONFIG_LOCKDEP) && bp->hw.target)
> +               lockdep_assert_held(get_task_sharded_mtx(bp));
> +}
>
>  #ifdef hw_breakpoint_slots
>  /*
> @@ -103,7 +179,7 @@ static __init int init_breakpoint_slots(void)
>                 for (i = 0; i < TYPE_MAX; i++) {
>                         struct bp_cpuinfo *info = get_bp_info(cpu, i);
>
> -                       info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(int), GFP_KERNEL);
> +                       info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(atomic_t), GFP_KERNEL);
>                         if (!info->tsk_pinned)
>                                 goto err;
>                 }
> @@ -143,11 +219,19 @@ static inline enum bp_type_idx find_slot_idx(u64 bp_type)
>   */
>  static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
>  {
> -       unsigned int *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
> +       atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
>         int i;
>
> +       /*
> +        * At this point we want to have acquired the bp_cpuinfo_lock as a
> +        * writer to ensure that there are no concurrent writers in
> +        * toggle_bp_task_slot() to tsk_pinned, and we get a stable snapshot.
> +        */
> +       lockdep_assert_held_write(&bp_cpuinfo_lock);
> +
>         for (i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
> -               if (tsk_pinned[i] > 0)
> +               ASSERT_EXCLUSIVE_WRITER(tsk_pinned[i]); /* Catch unexpected writers. */
> +               if (atomic_read(&tsk_pinned[i]) > 0)
>                         return i + 1;
>         }
>
> @@ -164,6 +248,11 @@ static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
>         struct perf_event *iter;
>         int count = 0;
>
> +       /*
> +        * We need a stable snapshot of the per-task breakpoint list.
> +        */
> +       assert_bp_constraints_lock_held(bp);
> +
>         rcu_read_lock();
>         head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
>         if (!head)
> @@ -230,16 +319,25 @@ fetch_this_slot(struct bp_busy_slots *slots, int weight)
>  static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
>                                 enum bp_type_idx type, int weight)
>  {
> -       unsigned int *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
> +       atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
>         int old_idx, new_idx;
>
> +       /*
> +        * If bp->hw.target, tsk_pinned is only modified, but not used
> +        * otherwise. We can permit concurrent updates as long as there are no
> +        * other uses: having acquired bp_cpuinfo_lock as a reader allows
> +        * concurrent updates here. Uses of tsk_pinned will require acquiring
> +        * bp_cpuinfo_lock as a writer to stabilize tsk_pinned's value.
> +        */
> +       lockdep_assert_held_read(&bp_cpuinfo_lock);
> +
>         old_idx = task_bp_pinned(cpu, bp, type) - 1;
>         new_idx = old_idx + weight;
>
>         if (old_idx >= 0)
> -               tsk_pinned[old_idx]--;
> +               atomic_dec(&tsk_pinned[old_idx]);
>         if (new_idx >= 0)
> -               tsk_pinned[new_idx]++;
> +               atomic_inc(&tsk_pinned[new_idx]);
>  }
>
>  /*
> @@ -257,6 +355,7 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
>
>         /* Pinned counter cpu profiling */
>         if (!bp->hw.target) {
> +               lockdep_assert_held_write(&bp_cpuinfo_lock);
>                 get_bp_info(bp->cpu, type)->cpu_pinned += weight;
>                 return 0;
>         }
> @@ -265,6 +364,11 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
>         for_each_cpu(cpu, cpumask)
>                 toggle_bp_task_slot(bp, cpu, type, weight);
>
> +       /*
> +        * Readers want a stable snapshot of the per-task breakpoint list.
> +        */
> +       assert_bp_constraints_lock_held(bp);
> +
>         if (enable)
>                 return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
>         else
> @@ -372,14 +476,10 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
>
>  int reserve_bp_slot(struct perf_event *bp)
>  {
> -       int ret;
> -
> -       mutex_lock(&nr_bp_mutex);
> -
> -       ret = __reserve_bp_slot(bp, bp->attr.bp_type);
> -
> -       mutex_unlock(&nr_bp_mutex);
> +       struct mutex *mtx = bp_constraints_lock(bp);
> +       int ret = __reserve_bp_slot(bp, bp->attr.bp_type);
>
> +       bp_constraints_unlock(mtx);
>         return ret;
>  }
>
> @@ -397,12 +497,11 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
>
>  void release_bp_slot(struct perf_event *bp)
>  {
> -       mutex_lock(&nr_bp_mutex);
> +       struct mutex *mtx = bp_constraints_lock(bp);
>
>         arch_unregister_hw_breakpoint(bp);

If I understand this correctly, this can weaken protection for
arch_unregister_hw_breakpoint() and __modify_bp_slot(). Previously
they were globally serialized, but now several calls can run in
parallel. Is it OK?

>         __release_bp_slot(bp, bp->attr.bp_type);
> -
> -       mutex_unlock(&nr_bp_mutex);
> +       bp_constraints_unlock(mtx);
>  }
>
>  static int __modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
> @@ -429,11 +528,10 @@ static int __modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
>
>  static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
>  {
> -       int ret;
> +       struct mutex *mtx = bp_constraints_lock(bp);
> +       int ret = __modify_bp_slot(bp, old_type, new_type);
>
> -       mutex_lock(&nr_bp_mutex);
> -       ret = __modify_bp_slot(bp, old_type, new_type);
> -       mutex_unlock(&nr_bp_mutex);
> +       bp_constraints_unlock(mtx);
>         return ret;
>  }
>
> @@ -444,7 +542,7 @@ static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
>   */
>  int dbg_reserve_bp_slot(struct perf_event *bp)
>  {
> -       if (mutex_is_locked(&nr_bp_mutex))
> +       if (bp_constraints_is_locked(bp))
>                 return -1;
>
>         return __reserve_bp_slot(bp, bp->attr.bp_type);
> @@ -452,7 +550,7 @@ int dbg_reserve_bp_slot(struct perf_event *bp)
>
>  int dbg_release_bp_slot(struct perf_event *bp)
>  {
> -       if (mutex_is_locked(&nr_bp_mutex))
> +       if (bp_constraints_is_locked(bp))
>                 return -1;
>
>         __release_bp_slot(bp, bp->attr.bp_type);
> @@ -735,7 +833,10 @@ static struct pmu perf_breakpoint = {
>
>  int __init init_hw_breakpoint(void)
>  {
> -       int ret;
> +       int cpu, ret;
> +
> +       for_each_possible_cpu(cpu)
> +               mutex_init(&per_cpu(task_sharded_mtx, cpu));
>
>         ret = rhltable_init(&task_bps_ht, &task_bps_ht_params);
>         if (ret)
> --
> 2.36.1.255.ge46751e96f-goog
>
