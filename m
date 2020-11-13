Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9312B1D29
	for <lists+linux-sh@lfdr.de>; Fri, 13 Nov 2020 15:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgKMOYe (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 13 Nov 2020 09:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgKMOYd (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 13 Nov 2020 09:24:33 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074ABC0613D1;
        Fri, 13 Nov 2020 06:24:33 -0800 (PST)
Message-Id: <20201113141734.324061522@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605277471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=wbnpc9X7QEbMsC5u05tOEqefGMvFIw2n/Z+aIpkv6qk=;
        b=x1p32VGaC+/58ztufANyFTCrGu/s7tRBghtopa0J2TNYGtemxE3peXZ4sDmIK8VC8MMjJF
        bkB4beAsFrnn7g5pNsuDvXrQuLAwQwYQWDBk4v1c4MfgvJloCSuDCjYxDqwDvsyo9uI1eI
        CfUFTTlRXKoe61D1dT9simW3jukPhaFUjhoohSBJoKuqBHeLyth9IHwbVT4QBBjd7jetJh
        zy5OkhXZarbq3BzVamRPPU+9TU0QA1XK7mXa66ZrbTXHjWJOhZgpJpiyDWorp5XzsuG0ue
        D1TSqOLJXpTVDWfhk4inCcRETB9syvdtBeQnTcA7VC8+Z+gPahb0NJIxMOSTLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605277471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=wbnpc9X7QEbMsC5u05tOEqefGMvFIw2n/Z+aIpkv6qk=;
        b=wt0M/xoGdUy77JWjD8mKtY9ZjC6M/bf8RphSiXlCP0VRh7/f7T9RPTgxefi4EOj9ortPvM
        ohr2G3OJDKzL3sAA==
Date:   Fri, 13 Nov 2020 15:02:21 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [patch 14/19] softirq: Make softirq control and processing RT aware
References: <20201113140207.499353218@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Provide a local lock based serialization for soft interrupts on RT which
allows the local_bh_disabled() sections and servicing soft interrupts to be
preemptible.

Provide the necessary inline helpers which allow to reuse the bulk of the
softirq processing code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/bottom_half.h |    2 
 kernel/softirq.c            |  207 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 201 insertions(+), 8 deletions(-)

--- a/include/linux/bottom_half.h
+++ b/include/linux/bottom_half.h
@@ -4,7 +4,7 @@
 
 #include <linux/preempt.h>
 
-#ifdef CONFIG_TRACE_IRQFLAGS
+#if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)
 extern void __local_bh_disable_ip(unsigned long ip, unsigned int cnt);
 #else
 static __always_inline void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -13,6 +13,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/local_lock.h>
 #include <linux/mm.h>
 #include <linux/notifier.h>
 #include <linux/percpu.h>
@@ -100,20 +101,208 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_contex
 #endif
 
 /*
- * preempt_count and SOFTIRQ_OFFSET usage:
- * - preempt_count is changed by SOFTIRQ_OFFSET on entering or leaving
- *   softirq processing.
- * - preempt_count is changed by SOFTIRQ_DISABLE_OFFSET (= 2 * SOFTIRQ_OFFSET)
+ * SOFTIRQ_OFFSET usage:
+ *
+ * On !RT kernels 'count' is the preempt counter, on RT kernels this applies
+ * to a per CPU counter and to task::softirqs_disabled_cnt.
+ *
+ * - count is changed by SOFTIRQ_OFFSET on entering or leaving softirq
+ *   processing.
+ *
+ * - count is changed by SOFTIRQ_DISABLE_OFFSET (= 2 * SOFTIRQ_OFFSET)
  *   on local_bh_disable or local_bh_enable.
+ *
  * This lets us distinguish between whether we are currently processing
  * softirq and whether we just have bh disabled.
  */
+#ifdef CONFIG_PREEMPT_RT
 
-#ifdef CONFIG_TRACE_IRQFLAGS
 /*
- * This is for softirq.c-internal use, where hardirqs are disabled
+ * RT accounts for BH disabled sections in task::softirqs_disabled_cnt and
+ * also in per CPU softirq_ctrl::cnt. This is necessary to allow tasks in a
+ * softirq disabled section to be preempted.
+ *
+ * The per task counter is used for softirq_count(), in_softirq() and
+ * in_serving_softirqs() because these counts are only valid when the task
+ * holding softirq_ctrl::lock is running.
+ *
+ * The per CPU counter prevents pointless wakeups of ksoftirqd in case that
+ * the task which is in a softirq disabled section is preempted or blocks.
+ */
+struct softirq_ctrl {
+	local_lock_t	lock;
+	int		cnt;
+};
+
+static DEFINE_PER_CPU(struct softirq_ctrl, softirq_ctrl) = {
+	.lock	= INIT_LOCAL_LOCK(softirq_ctrl.lock),
+};
+
+void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
+{
+	unsigned long flags;
+	int newcnt;
+
+	WARN_ON_ONCE(in_hardirq());
+
+	/* First entry of a task into a BH disabled section? */
+	if (!current->softirq_disable_cnt) {
+		if (preemptible()) {
+			local_lock(&softirq_ctrl.lock);
+			rcu_read_lock();
+		} else {
+			DEBUG_LOCKS_WARN_ON(this_cpu_read(softirq_ctrl.cnt));
+		}
+	}
+
+	preempt_disable();
+	/*
+	 * Track the per CPU softirq disabled state. On RT this is per CPU
+	 * state to allow preemption of bottom half disabled sections.
+	 */
+	newcnt = this_cpu_add_return(softirq_ctrl.cnt, cnt);
+	/*
+	 * Reflect the result in the task state to prevent recursion on the
+	 * local lock and to make softirq_count() & al work.
+	 */
+	current->softirq_disable_cnt = newcnt;
+
+	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS) && newcnt == cnt) {
+		raw_local_irq_save(flags);
+		lockdep_softirqs_off(ip);
+		raw_local_irq_restore(flags);
+	}
+	preempt_enable();
+}
+EXPORT_SYMBOL(__local_bh_disable_ip);
+
+static void __local_bh_enable(unsigned int cnt, bool unlock)
+{
+	unsigned long flags;
+	int newcnt;
+
+	DEBUG_LOCKS_WARN_ON(current->softirq_disable_cnt !=
+			    this_cpu_read(softirq_ctrl.cnt));
+
+	preempt_disable();
+	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS) && softirq_count() == cnt) {
+		raw_local_irq_save(flags);
+		lockdep_softirqs_on(_RET_IP_);
+		raw_local_irq_restore(flags);
+	}
+
+	newcnt = this_cpu_sub_return(softirq_ctrl.cnt, cnt);
+	current->softirq_disable_cnt = newcnt;
+	preempt_enable();
+
+	if (!newcnt && unlock) {
+		rcu_read_unlock();
+		local_unlock(&softirq_ctrl.lock);
+	}
+}
+
+void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
+{
+	bool preempt_on = preemptible();
+	unsigned long flags;
+	u32 pending;
+	int curcnt;
+
+	WARN_ON_ONCE(in_irq());
+	lockdep_assert_irqs_enabled();
+
+	local_irq_save(flags);
+	curcnt = this_cpu_read(softirq_ctrl.cnt);
+
+	/*
+	 * If this is not reenabling soft interrupts, no point in trying to
+	 * run pending ones.
+	 */
+	if (curcnt != cnt)
+		goto out;
+
+	pending = local_softirq_pending();
+	if (!pending || ksoftirqd_running(pending))
+		goto out;
+
+	/*
+	 * If this was called from non preemptible context, wake up the
+	 * softirq daemon.
+	 */
+	if (!preempt_on) {
+		wakeup_softirqd();
+		goto out;
+	}
+
+	/*
+	 * Adjust softirq count to SOFTIRQ_OFFSET which makes
+	 * in_serving_softirq() become true.
+	 */
+	cnt = SOFTIRQ_OFFSET;
+	__local_bh_enable(cnt, false);
+	__do_softirq();
+
+out:
+	__local_bh_enable(cnt, preempt_on);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL(__local_bh_enable_ip);
+
+/*
+ * Invoked from irq_enter_rcu() to prevent that tick_irq_enter()
+ * pointlessly wakes the softirq daemon. That's handled in __irq_exit_rcu().
+ * None of the above logic in the regular bh_disable/enable functions is
+ * required here.
+ */
+static inline void local_bh_disable_irq_enter(void)
+{
+	this_cpu_add(softirq_ctrl.cnt, SOFTIRQ_DISABLE_OFFSET);
+}
+
+static inline void local_bh_enable_irq_enter(void)
+{
+	this_cpu_sub(softirq_ctrl.cnt, SOFTIRQ_DISABLE_OFFSET);
+}
+
+/*
+ * Invoked from ksoftirqd_run() outside of the interrupt disabled section
+ * to acquire the per CPU local lock for reentrancy protection.
+ */
+static inline void ksoftirqd_run_begin(void)
+{
+	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+	local_irq_disable();
+}
+
+/* Counterpart to ksoftirqd_run_begin() */
+static inline void ksoftirqd_run_end(void)
+{
+	__local_bh_enable(SOFTIRQ_OFFSET, true);
+	WARN_ON_ONCE(in_interrupt());
+	local_irq_enable();
+}
+
+static inline void softirq_handle_begin(void) { }
+static inline void softirq_handle_end(void) { }
+
+static inline void invoke_softirq(void)
+{
+	if (!this_cpu_read(softirq_ctrl.cnt))
+		wakeup_softirqd();
+}
+
+static inline bool should_wake_ksoftirqd(void)
+{
+	return !this_cpu_read(softirq_ctrl.cnt);
+}
+
+#else /* CONFIG_PREEMPT_RT */
+
+/*
+ * This one is for softirq.c-internal use, where hardirqs are disabled
  * legitimately:
  */
+#ifdef CONFIG_TRACE_IRQFLAGS
 void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
 {
 	unsigned long flags;
@@ -284,6 +473,8 @@ asmlinkage __visible void do_softirq(voi
 	local_irq_restore(flags);
 }
 
+#endif /* !CONFIG_PREEMPT_RT */
+
 /*
  * We restart softirq processing for at most MAX_SOFTIRQ_RESTART times,
  * but break the loop if need_resched() is set or after 2 ms.
@@ -388,8 +579,10 @@ asmlinkage __visible void __softirq_entr
 		pending >>= softirq_bit;
 	}
 
-	if (__this_cpu_read(ksoftirqd) == current)
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
+	    __this_cpu_read(ksoftirqd) == current)
 		rcu_softirq_qs();
+
 	local_irq_disable();
 
 	pending = local_softirq_pending();

