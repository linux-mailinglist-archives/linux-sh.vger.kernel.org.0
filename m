Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A7D5A4CB5
	for <lists+linux-sh@lfdr.de>; Mon, 29 Aug 2022 14:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiH2M5d (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 29 Aug 2022 08:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiH2M4b (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 29 Aug 2022 08:56:31 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9478AF7F
        for <linux-sh@vger.kernel.org>; Mon, 29 Aug 2022 05:48:23 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-340a4dcb403so106836077b3.22
        for <linux-sh@vger.kernel.org>; Mon, 29 Aug 2022 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=17GhIUVsdBD381xCSlsSf/bvMmuZOpgOvCsizfGJYww=;
        b=CbUwP42fuhmKg7ri7biMklFhB21W8cZzoP21+kt7Lgj6pRAyQfpzbZRWFbKeP6coDy
         AtkU/EIId8EZZt3IqUVsnXV5/PdeWQ/wbj3+W3aWt+UGVld9yGpyxTMNZ+LkqFqFDq4E
         Eg6dryn4nCZzZyYEDkk4dENmaVGKAEjjahQAFSW9MrwIn2ia3Ddf8nIbwrLhCtzzbI6c
         JLfLxik35LBKo1sshesg7tGD+yKVjyy6SkFYmLaXuEjFwS58Wn8DixsyUbFkK1+1u4L0
         yG9CGURYktVy3sgJ3tVijbDxB25JjEwg6LeoC3rHTdBX+q3W9l3w84Qs4AN3cxM2jwfa
         1Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=17GhIUVsdBD381xCSlsSf/bvMmuZOpgOvCsizfGJYww=;
        b=K/4Rg/XApDxBuTXSOv6aEKgDmDELx02k2qgccbYZCniqhhas3cuGFq3SiPVPwknsGn
         iNg4AxEH2jQvEDJoouKmP1zpiD4htS1BVrUXLHYY9/NjLp+pO29KFl4NMAL6BKoVirNR
         OJnsbXmoFlE3u5GyCTxlKJtxQalsgIDlgiC6S8oK9mDkWdqgrVn0bfTfOVGEat3zfB4z
         y6j+7ZhDTdI/79js0MmO8GrkbqrVmG9UNY3gSWssFUFdoVCkUJDNtsnlZghSM6nVDpX5
         BtZMu0HjXHD9pKQl3AorKTsvj65cPmTG0uiLFVlza2nd0GL0Z8hyPQmg/aP9HKYoHzIH
         7mFA==
X-Gm-Message-State: ACgBeo3Ona22ABcyH/lDrFs0Pbl9mesJf6FtA0cF1z1/mD0NL9O4Bpgt
        e0e57MiLlFtFH0oFDTPri2uUHy5M9g==
X-Google-Smtp-Source: AA6agR7saRNQPyfeUGNlvdKaMJxYtoC1JW5xi3rwIoqgRCRjBdEPFh2wH5NnVmpB77WBemcvNGm+4C/jLw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:a0d:f402:0:b0:33c:eda4:8557 with SMTP id
 d2-20020a0df402000000b0033ceda48557mr9486024ywf.183.1661777302876; Mon, 29
 Aug 2022 05:48:22 -0700 (PDT)
Date:   Mon, 29 Aug 2022 14:47:14 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-10-elver@google.com>
Subject: [PATCH v4 09/14] powerpc/hw_breakpoint: Avoid relying on caller synchronization
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
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        Ian Rogers <irogers@google.com>
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

Internal data structures (cpu_bps, task_bps) of powerpc's hw_breakpoint
implementation have relied on nr_bp_mutex serializing access to them.

Before overhauling synchronization of kernel/events/hw_breakpoint.c,
introduce 2 spinlocks to synchronize cpu_bps and task_bps respectively,
thus avoiding reliance on callers synchronizing powerpc's hw_breakpoint.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Ian Rogers <irogers@google.com>
---
v2:
* New patch.
---
 arch/powerpc/kernel/hw_breakpoint.c | 53 ++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2669f80b3a49..8db1a15d7acb 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
+#include <linux/spinlock.h>
 #include <linux/debugfs.h>
 #include <linux/init.h>
 
@@ -129,7 +130,14 @@ struct breakpoint {
 	bool ptrace_bp;
 };
 
+/*
+ * While kernel/events/hw_breakpoint.c does its own synchronization, we cannot
+ * rely on it safely synchronizing internals here; however, we can rely on it
+ * not requesting more breakpoints than available.
+ */
+static DEFINE_SPINLOCK(cpu_bps_lock);
 static DEFINE_PER_CPU(struct breakpoint *, cpu_bps[HBP_NUM_MAX]);
+static DEFINE_SPINLOCK(task_bps_lock);
 static LIST_HEAD(task_bps);
 
 static struct breakpoint *alloc_breakpoint(struct perf_event *bp)
@@ -174,7 +182,9 @@ static int task_bps_add(struct perf_event *bp)
 	if (IS_ERR(tmp))
 		return PTR_ERR(tmp);
 
+	spin_lock(&task_bps_lock);
 	list_add(&tmp->list, &task_bps);
+	spin_unlock(&task_bps_lock);
 	return 0;
 }
 
@@ -182,6 +192,7 @@ static void task_bps_remove(struct perf_event *bp)
 {
 	struct list_head *pos, *q;
 
+	spin_lock(&task_bps_lock);
 	list_for_each_safe(pos, q, &task_bps) {
 		struct breakpoint *tmp = list_entry(pos, struct breakpoint, list);
 
@@ -191,6 +202,7 @@ static void task_bps_remove(struct perf_event *bp)
 			break;
 		}
 	}
+	spin_unlock(&task_bps_lock);
 }
 
 /*
@@ -200,12 +212,17 @@ static void task_bps_remove(struct perf_event *bp)
 static bool all_task_bps_check(struct perf_event *bp)
 {
 	struct breakpoint *tmp;
+	bool ret = false;
 
+	spin_lock(&task_bps_lock);
 	list_for_each_entry(tmp, &task_bps, list) {
-		if (!can_co_exist(tmp, bp))
-			return true;
+		if (!can_co_exist(tmp, bp)) {
+			ret = true;
+			break;
+		}
 	}
-	return false;
+	spin_unlock(&task_bps_lock);
+	return ret;
 }
 
 /*
@@ -215,13 +232,18 @@ static bool all_task_bps_check(struct perf_event *bp)
 static bool same_task_bps_check(struct perf_event *bp)
 {
 	struct breakpoint *tmp;
+	bool ret = false;
 
+	spin_lock(&task_bps_lock);
 	list_for_each_entry(tmp, &task_bps, list) {
 		if (tmp->bp->hw.target == bp->hw.target &&
-		    !can_co_exist(tmp, bp))
-			return true;
+		    !can_co_exist(tmp, bp)) {
+			ret = true;
+			break;
+		}
 	}
-	return false;
+	spin_unlock(&task_bps_lock);
+	return ret;
 }
 
 static int cpu_bps_add(struct perf_event *bp)
@@ -234,6 +256,7 @@ static int cpu_bps_add(struct perf_event *bp)
 	if (IS_ERR(tmp))
 		return PTR_ERR(tmp);
 
+	spin_lock(&cpu_bps_lock);
 	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
 	for (i = 0; i < nr_wp_slots(); i++) {
 		if (!cpu_bp[i]) {
@@ -241,6 +264,7 @@ static int cpu_bps_add(struct perf_event *bp)
 			break;
 		}
 	}
+	spin_unlock(&cpu_bps_lock);
 	return 0;
 }
 
@@ -249,6 +273,7 @@ static void cpu_bps_remove(struct perf_event *bp)
 	struct breakpoint **cpu_bp;
 	int i = 0;
 
+	spin_lock(&cpu_bps_lock);
 	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
 	for (i = 0; i < nr_wp_slots(); i++) {
 		if (!cpu_bp[i])
@@ -260,19 +285,25 @@ static void cpu_bps_remove(struct perf_event *bp)
 			break;
 		}
 	}
+	spin_unlock(&cpu_bps_lock);
 }
 
 static bool cpu_bps_check(int cpu, struct perf_event *bp)
 {
 	struct breakpoint **cpu_bp;
+	bool ret = false;
 	int i;
 
+	spin_lock(&cpu_bps_lock);
 	cpu_bp = per_cpu_ptr(cpu_bps, cpu);
 	for (i = 0; i < nr_wp_slots(); i++) {
-		if (cpu_bp[i] && !can_co_exist(cpu_bp[i], bp))
-			return true;
+		if (cpu_bp[i] && !can_co_exist(cpu_bp[i], bp)) {
+			ret = true;
+			break;
+		}
 	}
-	return false;
+	spin_unlock(&cpu_bps_lock);
+	return ret;
 }
 
 static bool all_cpu_bps_check(struct perf_event *bp)
@@ -286,10 +317,6 @@ static bool all_cpu_bps_check(struct perf_event *bp)
 	return false;
 }
 
-/*
- * We don't use any locks to serialize accesses to cpu_bps or task_bps
- * because are already inside nr_bp_mutex.
- */
 int arch_reserve_bp_slot(struct perf_event *bp)
 {
 	int ret;
-- 
2.37.2.672.g94769d06f0-goog

