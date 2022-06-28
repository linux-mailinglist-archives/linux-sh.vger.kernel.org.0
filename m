Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83DB55DB31
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jun 2022 15:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344432AbiF1KAO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Jun 2022 06:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344522AbiF1J7q (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 28 Jun 2022 05:59:46 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E372E9F9
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 02:59:27 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id j14-20020adfa54e000000b0021b8c8204easo1677216wrb.0
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Jb90vJz+Ljcdy/bwa5mhGZHGcIkLbD1O6C8oBBBl+eM=;
        b=O4kzeA4uwPzfZrTv+R6CAB9mf4IwLNl9HmogLNqBtirsv/TJduU5R1rqyCbjWO/o2f
         Z/85lxL5bb/m9WgOUl0Sxz2BWol2PAtzlhIH7uVqbFgectJ6z4d/9Sd6ZbFRnyqBnnc3
         mEMu1TsBWj1L7N8AdpIABe97RMrdYa7ibk+d0h7QgmGZBiSnFjegfpCGyrtEjETjTKwa
         RS2BB8H+9IdB4gtjuPD1v0WK37uTt1cgbMJbPgn8auSfFEVT+c78xXRW/0P00WL/+OxA
         lPovavzynUnMGxec6wTi/BSkkZNZl7tciXXJVJ8CM77kEXYebdF2ia9hnoMju2opBxpm
         irSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Jb90vJz+Ljcdy/bwa5mhGZHGcIkLbD1O6C8oBBBl+eM=;
        b=Ww9eAFIUMWG2/TbnSwlSRNKqX5LnPA/Y0IeYUhrwc8NP0Cz2Cj9+NPasei8420wtc0
         azHmC2oHfG84T+GWJeYwzFMo0LVRt8roxgeewGob4fkR0yIZpZU4Q2MFOMyRCwEB6L1b
         woc2RdS+DTLP9vWLyuYOmQQS1dEtAMAGxm1VGpS63k71zhtq9qGLckjFze8gHQ5ByhxM
         KsRsN6GQtCp3eZnHpfg63e4OsGx3Q/Wx4hPt0d5iGkVfo4MkCxavnd+mRjgyW1WZE6D1
         1dIJ/xG01oZARQBdE7hs1FRP1adVonvxGbDNHt98L/b+sU/HvY0HwlTJggGcD58CEf+w
         n1CQ==
X-Gm-Message-State: AJIora9e9KNzpyuG4gkPo8p0R6nA5qVHanP1RryLljGzeAdmbzJCu7+Y
        8DYQrtrhpAMJ0UGwMo1TqD7rSw9ekg==
X-Google-Smtp-Source: AGRyM1tNfI+Taa+L1bg2xVeEsfJaA/Kx29KRD7M1wfmWxKr4H13GUgpJ0exWuzj17c9Ln+AsOu1Iypvrig==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a5d:6045:0:b0:21b:9397:41aa with SMTP id
 j5-20020a5d6045000000b0021b939741aamr17128186wrt.713.1656410365913; Tue, 28
 Jun 2022 02:59:25 -0700 (PDT)
Date:   Tue, 28 Jun 2022 11:58:30 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-11-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 10/13] perf/hw_breakpoint: Reduce contention with large
 number of tasks
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

While optimizing task_bp_pinned()'s runtime complexity to O(1) on
average helps reduce time spent in the critical section, we still suffer
due to serializing everything via 'nr_bp_mutex'. Indeed, a profile shows
that now contention is the biggest issue:

    95.93%  [kernel]       [k] osq_lock
     0.70%  [kernel]       [k] mutex_spin_on_owner
     0.22%  [kernel]       [k] smp_cfm_core_cond
     0.18%  [kernel]       [k] task_bp_pinned
     0.18%  [kernel]       [k] rhashtable_jhash2
     0.15%  [kernel]       [k] queued_spin_lock_slowpath

when running the breakpoint benchmark with (system with 256 CPUs):

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.207 [sec]
 |
 |      108.267188 usecs/op
 |     6929.100000 usecs/op/cpu

The main concern for synchronizing the breakpoint constraints data is
that a consistent snapshot of the per-CPU and per-task data is observed.

The access pattern is as follows:

 1. If the target is a task: the task's pinned breakpoints are counted,
    checked for space, and then appended to; only bp_cpuinfo::cpu_pinned
    is used to check for conflicts with CPU-only breakpoints;
    bp_cpuinfo::tsk_pinned are incremented/decremented, but otherwise
    unused.

 2. If the target is a CPU: bp_cpuinfo::cpu_pinned are counted, along
    with bp_cpuinfo::tsk_pinned; after a successful check, cpu_pinned is
    incremented. No per-task breakpoints are checked.

Since rhltable safely synchronizes insertions/deletions, we can allow
concurrency as follows:

 1. If the target is a task: independent tasks may update and check the
    constraints concurrently, but same-task target calls need to be
    serialized; since bp_cpuinfo::tsk_pinned is only updated, but not
    checked, these modifications can happen concurrently by switching
    tsk_pinned to atomic_t.

 2. If the target is a CPU: access to the per-CPU constraints needs to
    be serialized with other CPU-target and task-target callers (to
    stabilize the bp_cpuinfo::tsk_pinned snapshot).

We can allow the above concurrency by introducing a per-CPU constraints
data reader-writer lock (bp_cpuinfo_sem), and per-task mutexes (reuses
task_struct::perf_event_mutex):

  1. If the target is a task: acquires perf_event_mutex, and acquires
     bp_cpuinfo_sem as a reader. The choice of percpu-rwsem minimizes
     contention in the presence of many read-lock but few write-lock
     acquisitions: we assume many orders of magnitude more task target
     breakpoints creations/destructions than CPU target breakpoints.

  2. If the target is a CPU: acquires bp_cpuinfo_sem as a writer.

With these changes, contention with thousands of tasks is reduced to the
point where waiting on locking no longer dominates the profile:

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.077 [sec]
 |
 |       40.201563 usecs/op
 |     2572.900000 usecs/op/cpu

    21.54%  [kernel]       [k] task_bp_pinned
    20.18%  [kernel]       [k] rhashtable_jhash2
     6.81%  [kernel]       [k] toggle_bp_slot
     5.47%  [kernel]       [k] queued_spin_lock_slowpath
     3.75%  [kernel]       [k] smp_cfm_core_cond
     3.48%  [kernel]       [k] bcmp

On this particular setup that's a speedup of 2.7x.

We're also getting closer to the theoretical ideal performance through
optimizations in hw_breakpoint.c -- constraints accounting disabled:

 | perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.067 [sec]
 |
 |       35.286458 usecs/op
 |     2258.333333 usecs/op/cpu

Which means the current implementation is ~12% slower than the
theoretical ideal.

For reference, performance without any breakpoints:

 | $> bench -r 30 breakpoint thread -b 0 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 0 breakpoints and 64 parallelism
 |      Total time: 0.060 [sec]
 |
 |       31.365625 usecs/op
 |     2007.400000 usecs/op/cpu

On a system with 256 CPUs, the theoretical ideal is only ~12% slower
than no breakpoints at all; the current implementation is ~28% slower.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Use percpu-rwsem instead of rwlock.
* Use task_struct::perf_event_mutex. See code comment for reasoning.
==> Speedup of 2.7x (vs 2.5x in v1).
---
 kernel/events/hw_breakpoint.c | 159 ++++++++++++++++++++++++++++------
 1 file changed, 132 insertions(+), 27 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 63e39dc836bd..128ba3429223 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -19,6 +19,7 @@
 
 #include <linux/hw_breakpoint.h>
 
+#include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/cpu.h>
 #include <linux/export.h>
@@ -28,6 +29,7 @@
 #include <linux/kernel.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/percpu-rwsem.h>
 #include <linux/percpu.h>
 #include <linux/rhashtable.h>
 #include <linux/sched.h>
@@ -41,9 +43,9 @@ struct bp_cpuinfo {
 	unsigned int	cpu_pinned;
 	/* tsk_pinned[n] is the number of tasks having n+1 breakpoints */
 #ifdef hw_breakpoint_slots
-	unsigned int	tsk_pinned[hw_breakpoint_slots(0)];
+	atomic_t	tsk_pinned[hw_breakpoint_slots(0)];
 #else
-	unsigned int	*tsk_pinned;
+	atomic_t	*tsk_pinned;
 #endif
 };
 
@@ -65,8 +67,79 @@ static const struct rhashtable_params task_bps_ht_params = {
 
 static bool constraints_initialized __ro_after_init;
 
-/* Serialize accesses to the above constraints */
-static DEFINE_MUTEX(nr_bp_mutex);
+/*
+ * Synchronizes accesses to the per-CPU constraints; the locking rules are:
+ *
+ *  1. Atomic updates to bp_cpuinfo::tsk_pinned only require a held read-lock
+ *     (due to bp_slots_histogram::count being atomic, no update are lost).
+ *
+ *  2. Holding a write-lock is required for computations that require a
+ *     stable snapshot of all bp_cpuinfo::tsk_pinned.
+ *
+ *  3. In all other cases, non-atomic accesses require the appropriately held
+ *     lock (read-lock for read-only accesses; write-lock for reads/writes).
+ */
+DEFINE_STATIC_PERCPU_RWSEM(bp_cpuinfo_sem);
+
+/*
+ * Return mutex to serialize accesses to per-task lists in task_bps_ht. Since
+ * rhltable synchronizes concurrent insertions/deletions, independent tasks may
+ * insert/delete concurrently; therefore, a mutex per task is sufficient.
+ *
+ * Uses task_struct::perf_event_mutex, to avoid extending task_struct with a
+ * hw_breakpoint-only mutex, which may be infrequently used. The caveat here is
+ * that hw_breakpoint may contend with per-task perf event list management. The
+ * assumption is that perf usecases involving hw_breakpoints are very unlikely
+ * to result in unnecessary contention.
+ */
+static inline struct mutex *get_task_bps_mutex(struct perf_event *bp)
+{
+	struct task_struct *tsk = bp->hw.target;
+
+	return tsk ? &tsk->perf_event_mutex : NULL;
+}
+
+static struct mutex *bp_constraints_lock(struct perf_event *bp)
+{
+	struct mutex *tsk_mtx = get_task_bps_mutex(bp);
+
+	if (tsk_mtx) {
+		mutex_lock(tsk_mtx);
+		percpu_down_read(&bp_cpuinfo_sem);
+	} else {
+		percpu_down_write(&bp_cpuinfo_sem);
+	}
+
+	return tsk_mtx;
+}
+
+static void bp_constraints_unlock(struct mutex *tsk_mtx)
+{
+	if (tsk_mtx) {
+		percpu_up_read(&bp_cpuinfo_sem);
+		mutex_unlock(tsk_mtx);
+	} else {
+		percpu_up_write(&bp_cpuinfo_sem);
+	}
+}
+
+static bool bp_constraints_is_locked(struct perf_event *bp)
+{
+	struct mutex *tsk_mtx = get_task_bps_mutex(bp);
+
+	return percpu_is_write_locked(&bp_cpuinfo_sem) ||
+	       (tsk_mtx ? mutex_is_locked(tsk_mtx) :
+			  percpu_is_read_locked(&bp_cpuinfo_sem));
+}
+
+static inline void assert_bp_constraints_lock_held(struct perf_event *bp)
+{
+	struct mutex *tsk_mtx = get_task_bps_mutex(bp);
+
+	if (tsk_mtx)
+		lockdep_assert_held(tsk_mtx);
+	lockdep_assert_held(&bp_cpuinfo_sem);
+}
 
 #ifdef hw_breakpoint_slots
 /*
@@ -97,7 +170,7 @@ static __init int init_breakpoint_slots(void)
 		for (i = 0; i < TYPE_MAX; i++) {
 			struct bp_cpuinfo *info = get_bp_info(cpu, i);
 
-			info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(int), GFP_KERNEL);
+			info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(atomic_t), GFP_KERNEL);
 			if (!info->tsk_pinned)
 				goto err;
 		}
@@ -137,11 +210,19 @@ static inline enum bp_type_idx find_slot_idx(u64 bp_type)
  */
 static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
 {
-	unsigned int *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
+	atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
 	int i;
 
+	/*
+	 * At this point we want to have acquired the bp_cpuinfo_sem as a
+	 * writer to ensure that there are no concurrent writers in
+	 * toggle_bp_task_slot() to tsk_pinned, and we get a stable snapshot.
+	 */
+	lockdep_assert_held_write(&bp_cpuinfo_sem);
+
 	for (i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
-		if (tsk_pinned[i] > 0)
+		ASSERT_EXCLUSIVE_WRITER(tsk_pinned[i]); /* Catch unexpected writers. */
+		if (atomic_read(&tsk_pinned[i]) > 0)
 			return i + 1;
 	}
 
@@ -158,6 +239,11 @@ static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
 	struct perf_event *iter;
 	int count = 0;
 
+	/*
+	 * We need a stable snapshot of the per-task breakpoint list.
+	 */
+	assert_bp_constraints_lock_held(bp);
+
 	rcu_read_lock();
 	head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
 	if (!head)
@@ -214,16 +300,25 @@ max_bp_pinned_slots(struct perf_event *bp, enum bp_type_idx type)
 static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
 				enum bp_type_idx type, int weight)
 {
-	unsigned int *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
+	atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
 	int old_idx, new_idx;
 
+	/*
+	 * If bp->hw.target, tsk_pinned is only modified, but not used
+	 * otherwise. We can permit concurrent updates as long as there are no
+	 * other uses: having acquired bp_cpuinfo_sem as a reader allows
+	 * concurrent updates here. Uses of tsk_pinned will require acquiring
+	 * bp_cpuinfo_sem as a writer to stabilize tsk_pinned's value.
+	 */
+	lockdep_assert_held_read(&bp_cpuinfo_sem);
+
 	old_idx = task_bp_pinned(cpu, bp, type) - 1;
 	new_idx = old_idx + weight;
 
 	if (old_idx >= 0)
-		tsk_pinned[old_idx]--;
+		atomic_dec(&tsk_pinned[old_idx]);
 	if (new_idx >= 0)
-		tsk_pinned[new_idx]++;
+		atomic_inc(&tsk_pinned[new_idx]);
 }
 
 /*
@@ -241,6 +336,7 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 
 	/* Pinned counter cpu profiling */
 	if (!bp->hw.target) {
+		lockdep_assert_held_write(&bp_cpuinfo_sem);
 		get_bp_info(bp->cpu, type)->cpu_pinned += weight;
 		return 0;
 	}
@@ -249,6 +345,11 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 	for_each_cpu(cpu, cpumask)
 		toggle_bp_task_slot(bp, cpu, type, weight);
 
+	/*
+	 * Readers want a stable snapshot of the per-task breakpoint list.
+	 */
+	assert_bp_constraints_lock_held(bp);
+
 	if (enable)
 		return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
 	else
@@ -354,14 +455,10 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 
 int reserve_bp_slot(struct perf_event *bp)
 {
-	int ret;
-
-	mutex_lock(&nr_bp_mutex);
-
-	ret = __reserve_bp_slot(bp, bp->attr.bp_type);
-
-	mutex_unlock(&nr_bp_mutex);
+	struct mutex *mtx = bp_constraints_lock(bp);
+	int ret = __reserve_bp_slot(bp, bp->attr.bp_type);
 
+	bp_constraints_unlock(mtx);
 	return ret;
 }
 
@@ -379,12 +476,11 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
 
 void release_bp_slot(struct perf_event *bp)
 {
-	mutex_lock(&nr_bp_mutex);
+	struct mutex *mtx = bp_constraints_lock(bp);
 
 	arch_unregister_hw_breakpoint(bp);
 	__release_bp_slot(bp, bp->attr.bp_type);
-
-	mutex_unlock(&nr_bp_mutex);
+	bp_constraints_unlock(mtx);
 }
 
 static int __modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
@@ -411,11 +507,10 @@ static int __modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
 
 static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
 {
-	int ret;
+	struct mutex *mtx = bp_constraints_lock(bp);
+	int ret = __modify_bp_slot(bp, old_type, new_type);
 
-	mutex_lock(&nr_bp_mutex);
-	ret = __modify_bp_slot(bp, old_type, new_type);
-	mutex_unlock(&nr_bp_mutex);
+	bp_constraints_unlock(mtx);
 	return ret;
 }
 
@@ -426,18 +521,28 @@ static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
  */
 int dbg_reserve_bp_slot(struct perf_event *bp)
 {
-	if (mutex_is_locked(&nr_bp_mutex))
+	int ret;
+
+	if (bp_constraints_is_locked(bp))
 		return -1;
 
-	return __reserve_bp_slot(bp, bp->attr.bp_type);
+	/* Locks aren't held; disable lockdep assert checking. */
+	lockdep_off();
+	ret = __reserve_bp_slot(bp, bp->attr.bp_type);
+	lockdep_on();
+
+	return ret;
 }
 
 int dbg_release_bp_slot(struct perf_event *bp)
 {
-	if (mutex_is_locked(&nr_bp_mutex))
+	if (bp_constraints_is_locked(bp))
 		return -1;
 
+	/* Locks aren't held; disable lockdep assert checking. */
+	lockdep_off();
 	__release_bp_slot(bp, bp->attr.bp_type);
+	lockdep_on();
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog

