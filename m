Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3150616C9A
	for <lists+linux-sh@lfdr.de>; Wed,  2 Nov 2022 19:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiKBSiP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Nov 2022 14:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiKBShW (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Nov 2022 14:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3478F2FFDB
        for <linux-sh@vger.kernel.org>; Wed,  2 Nov 2022 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667414085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7XyLq04ta6QuCycJK0DkWOlQEFxqI5/2Oi7Ln2qoW2w=;
        b=bylsIkBIA9GR36G6LdH36cp6JI0jySj0yoyei/mLQcITbQJTmm/0w0h618CgxWlNLSIQjY
        1ufEmRq34tYmcHnYNNaJZB7civJiG5txy5+Ulz0VmGNA8RFHS1FO/ykI+lgQE+HcbBoi1u
        elAbhaKOLajw/SxHWQwzS5xR5gipdkc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-FiEoo7LCPLuapDGOVapCgA-1; Wed, 02 Nov 2022 14:34:42 -0400
X-MC-Unique: FiEoo7LCPLuapDGOVapCgA-1
Received: by mail-qt1-f197.google.com with SMTP id ew11-20020a05622a514b00b003a524196d31so6914735qtb.2
        for <linux-sh@vger.kernel.org>; Wed, 02 Nov 2022 11:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XyLq04ta6QuCycJK0DkWOlQEFxqI5/2Oi7Ln2qoW2w=;
        b=Pm8wRfqaaJELVPgb4dUNQmnvlRGN1961xF9rnPMcQHnJjv2b0byrl035073gld0v/5
         OkWMhRauTWRhDkxvAonD9OXsF6ZaOX6G0L3Hpk34pICDPX0NWltgKRyMoiopCecg4GXi
         UzdTDPgGpkjwhTbLnhowecVEHEP+hUXgpblPKD2I8jxldgXC75VaMumlRuuQV5Y4AJAU
         KdHah+LL9j3qk6Oo0CN7ebKh2sOt2KldFSvcXs8sccE4B5xtg6PHpBeN6wDG/jRcJwrX
         ZOC8Eh0iUoFEZwocwnV0SjpOMt4t4fhmFs+Azh2Z/ydB3sKUK8alOzLrb/nev1Y/afUe
         StYQ==
X-Gm-Message-State: ACrzQf3tE/wA1DmNTo6QFgMgayxxKLDGDFHGclIyy1eHOvc1OUsPWGvP
        1mjKQHBb5+EwcjAYCIn8M9Vwi7rFTVRfuNUpuOrM0khSL+p96S8DjDdGrgiyo/KBj7URvUhWLJy
        Mrt4whMMkoyBIEQX/TR8=
X-Received: by 2002:a05:622a:110:b0:39d:33f:7502 with SMTP id u16-20020a05622a011000b0039d033f7502mr21405677qtw.233.1667414081823;
        Wed, 02 Nov 2022 11:34:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55Ji1MqyBOQLGXo2l/bSvuQt49ZAkCzlyyMp5CHGsdCK97M9vqAD8ECZ5Nyub/9y/Uvf6gSw==
X-Received: by 2002:a05:622a:110:b0:39d:33f:7502 with SMTP id u16-20020a05622a011000b0039d033f7502mr21405647qtw.233.1667414081547;
        Wed, 02 Nov 2022 11:34:41 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:40 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
Date:   Wed,  2 Nov 2022 18:33:36 +0000
Message-Id: <20221102183336.3120536-7-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The newly-introduced ipi_send_cpumask tracepoint has a "callback" parameter
which so far has only been fed with NULL.

While CSD_TYPE_SYNC/ASYNC and CSD_TYPE_IRQ_WORK share a similar backing
struct layout (meaning their callback func can be accessed without caring
about the actual CSD type), CSD_TYPE_TTWU doesn't even have a function
attached to its struct. This means we need to check the type of a CSD
before eventually dereferencing its associated callback.

This isn't as trivial as it sounds: the CSD type is stored in
__call_single_node.u_flags, which get cleared right before the callback is
executed via csd_unlock(). This implies checking the CSD type before it is
enqueued on the call_single_queue, as the target CPU's queue can be flushed
before we get to sending an IPI.

Furthermore, send_call_function_single_ipi() only has a CPU parameter, and
would need to have an additional argument to trickle down the invoked
function. This is somewhat silly, as the extra argument will always be
pushed down to the function even when nothing is being traced, which is
unnecessary overhead.

Two options present themselves:
a) Create copies of send_call_function_{single_ipi, ipi_mask}() that take
   an extra argument used for tracing, so that codepaths remain unchanged
   when tracing isn't in effect (a sort of manual -fipa-sra).

b) Stash the CSD func in somewhere as a side effect that
   the portion of send_call_function_{single_ipi, ipi_mask}() under the
   tracepoint's static key can fetch.

a) creates redundant code, and b) is quite fragile due to requiring extra
care for "reentrant" functions (async SMP calls).

This implements a).

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/irq_work.c   |  2 ++
 kernel/sched/core.c | 35 ++++++++++++++++++++++++-----------
 kernel/sched/smp.h  |  1 +
 kernel/smp.c        | 42 ++++++++++++++++++++++++++++++++++++++----
 4 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index aec38c294ce68..fcfa75c4a5daf 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -24,6 +24,8 @@
 
 #include <trace/events/ipi.h>
 
+#include "sched/smp.h"
+
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);
 static DEFINE_PER_CPU(struct task_struct *, irq_workd);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 02181f8072b5f..41196ca67e913 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3743,17 +3743,30 @@ void sched_ttwu_pending(void *arg)
 	rq_unlock_irqrestore(rq, &rf);
 }
 
-void send_call_function_single_ipi(int cpu)
-{
-	struct rq *rq = cpu_rq(cpu);
-
-	if (!set_nr_if_polling(rq->idle)) {
-		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
-		arch_send_call_function_single_ipi(cpu);
-	} else {
-		trace_sched_wake_idle_without_ipi(cpu);
-	}
-}
+/*
+ * We want a variant that traces the function causing the IPI to be sent, but
+ * we don't want the extra argument to cause unnecessary overhead when tracing
+ * isn't happening.
+ */
+#define GEN_CFSI(suffix, IPI_EXP, ...)						\
+void send_call_function_single_ipi##suffix(__VA_ARGS__)				\
+{										\
+	struct rq *rq = cpu_rq(cpu);						\
+										\
+	if (!set_nr_if_polling(rq->idle)) {					\
+		IPI_EXP;							\
+		arch_send_call_function_single_ipi(cpu);			\
+	} else {								\
+		trace_sched_wake_idle_without_ipi(cpu);				\
+	}									\
+}
+
+GEN_CFSI(/* nop */,
+	 /* nop */,
+	 int cpu)
+GEN_CFSI(_trace,
+	 trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func),
+	 int cpu, smp_call_func_t func)
 
 /*
  * Queue a task on the target CPUs wake_list and wake the CPU via IPI if
diff --git a/kernel/sched/smp.h b/kernel/sched/smp.h
index 2eb23dd0f2856..8075ad5e84181 100644
--- a/kernel/sched/smp.h
+++ b/kernel/sched/smp.h
@@ -7,6 +7,7 @@
 extern void sched_ttwu_pending(void *arg);
 
 extern void send_call_function_single_ipi(int cpu);
+extern void send_call_function_single_ipi_trace(int cpu, smp_call_func_t func);
 
 #ifdef CONFIG_SMP
 extern void flush_smp_call_function_queue(void);
diff --git a/kernel/smp.c b/kernel/smp.c
index b96579fe08f09..3b8e6456ac7e7 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -161,12 +161,18 @@ void __init call_function_init(void)
 }
 
 static inline void
-send_call_function_ipi_mask(const struct cpumask *mask)
+send_call_function_ipi_mask_trace(const struct cpumask *mask, smp_call_func_t func)
 {
 	trace_ipi_send_cpumask(mask, _RET_IP_, func);
 	arch_send_call_function_ipi_mask(mask);
 }
 
+static inline void
+send_call_function_ipi_mask(const struct cpumask *mask)
+{
+	arch_send_call_function_ipi_mask(mask);
+}
+
 void smp_send_reschedule(int cpu)
 {
 	/* XXX scheduler_ipi is inline :/ */
@@ -438,12 +444,16 @@ static void __smp_call_single_queue_debug(int cpu, struct llist_node *node)
 	struct cfd_seq_local *seq = this_cpu_ptr(&cfd_seq_local);
 	struct call_function_data *cfd = this_cpu_ptr(&cfd_data);
 	struct cfd_percpu *pcpu = per_cpu_ptr(cfd->pcpu, cpu);
+	struct __call_single_data *csd;
+
+	csd = container_of(node, call_single_data_t, node.llist);
+	WARN_ON_ONCE(!(CSD_TYPE(csd) & (CSD_TYPE_SYNC | CSD_TYPE_ASYNC)));
 
 	cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
 	if (llist_add(node, &per_cpu(call_single_queue, cpu))) {
 		cfd_seq_store(pcpu->seq_ipi, this_cpu, cpu, CFD_SEQ_IPI);
 		cfd_seq_store(seq->ping, this_cpu, cpu, CFD_SEQ_PING);
-		send_call_function_single_ipi(cpu);
+		send_call_function_single_ipi_trace(cpu, csd->func);
 		cfd_seq_store(seq->pinged, this_cpu, cpu, CFD_SEQ_PINGED);
 	} else {
 		cfd_seq_store(pcpu->seq_noipi, this_cpu, cpu, CFD_SEQ_NOIPI);
@@ -501,6 +511,26 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
 		}
 	}
 #endif
+	/*
+	 * We have to check the type of the CSD before queueing it, because
+	 * once queued it can have its flags cleared by
+	 *   flush_smp_call_function_queue()
+	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
+	 * executes migration_cpu_stop() on the remote CPU).
+	 */
+	if (trace_ipi_send_cpumask_enabled()) {
+		call_single_data_t *csd;
+		smp_call_func_t func;
+
+		csd = container_of(node, call_single_data_t, node.llist);
+		func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
+			sched_ttwu_pending : csd->func;
+
+		/* See below comment on ordering requirements */
+		if (llist_add(node, &per_cpu(call_single_queue, cpu)))
+			send_call_function_single_ipi_trace(cpu, func);
+		return;
+	}
 
 	/*
 	 * The list addition should be visible to the target CPU when it pops
@@ -984,9 +1014,13 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		 * provided mask.
 		 */
 		if (nr_cpus == 1)
-			send_call_function_single_ipi(last_cpu);
+			trace_ipi_send_cpumask_enabled() ?
+				send_call_function_single_ipi_trace(last_cpu, func) :
+				send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
-			send_call_function_ipi_mask(cfd->cpumask_ipi);
+			trace_ipi_send_cpumask_enabled() ?
+				send_call_function_ipi_mask_trace(mask, func) :
+				send_call_function_ipi_mask(mask);
 
 		cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
 	}
-- 
2.31.1

