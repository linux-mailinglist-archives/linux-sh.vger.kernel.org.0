Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDD15F7ADC
	for <lists+linux-sh@lfdr.de>; Fri,  7 Oct 2022 17:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiJGPqN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 7 Oct 2022 11:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiJGPqG (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 7 Oct 2022 11:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC62D73FE
        for <linux-sh@vger.kernel.org>; Fri,  7 Oct 2022 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665157562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
        b=BZA1mUhQ1XFUvLBhkzQsHi0wpFG1oNfYc8dFSzqmMU0VuDWXhTgvo7L2DO94u3WCTxqgan
        XRIiTY90TWz2MBL/kvKSLN/AUVqaLmXSVSiTuus+4/trFZHpcDhMy2K8KfyH10s148n2Mo
        vtOSjatyFRQvKhJ+bIlXEHZ+cbIRuMo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-wLq6WUzOMyiaYsZQ_NYOzA-1; Fri, 07 Oct 2022 11:46:01 -0400
X-MC-Unique: wLq6WUzOMyiaYsZQ_NYOzA-1
Received: by mail-wr1-f69.google.com with SMTP id m20-20020adfa3d4000000b0022e2fa93dd1so1560639wrb.2
        for <linux-sh@vger.kernel.org>; Fri, 07 Oct 2022 08:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
        b=qa2tJwiPiOBFNIA2XA/khWs7BsgAG8HS8LNzGiZveFLm894k3R4v7vfqTCFGrfJWD/
         3A1rmWU2CjYexm1a3DOnPmqbjixvYoLOpEptOmakGQi8Dv8rstCJfhZQGhnkNHHs/fzz
         PhWj1rfBjLFyJKIT+lpVliv9YEbf4/LWrPVOle6FPSBQAJdKVLz9Vbe9hFlZ/bUCEYYb
         GysA/u5DQJ1UKbxkyp6BhQXeN2AmDB0cj1yRPMjLXAXRe/tTRILl2lmQdsyit6DE0+XI
         TqUUEQBC0wohE5sXwHKwJe7o5hdJ2wPYNnIBRFORh1aCi42Hpf+HybW65c6HNT4pCgm8
         y0fQ==
X-Gm-Message-State: ACrzQf1dkA/1wKzOrHW55va2Okt0FhIsqbfUaBzKFU/S6+WRzeMRihS6
        HiJs0VHH5RUoDPc0N6TImkznhnqsAw4NpENHzX5KmthVkEgkLzFPH4V9Son3EJh8C4ZSrggCyb8
        O9OhJtMZ3IBuMImOL1yA=
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004390wms.114.1665157556421;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EpDwoqxaA3kuqs1iO/JBIwLdmLfBJiR2SaBRc8PnLfbv3ObEmlrGj1DHjl4vmQIuUA923ig==
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004355wms.114.1665157556194;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:45:55 -0700 (PDT)
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
Subject: [RFC PATCH 2/5] sched, smp: Trace send_call_function_single_ipi()
Date:   Fri,  7 Oct 2022 16:45:30 +0100
Message-Id: <20221007154533.1878285-2-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221007154145.1877054-1-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

send_call_function_single_ipi() is the thing that sends IPIs at the bottom
of smp_call_function*() via either generic_exec_single() or
smp_call_function_many_cond(). Give it an IPI-related tracepoint.

Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/arm/kernel/smp.c   | 3 ---
 arch/arm64/kernel/smp.c | 1 -
 kernel/sched/core.c     | 7 +++++--
 kernel/smp.c            | 4 ++++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 978db2d96b44..3b280d55c1c4 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -48,9 +48,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mpu.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/ipi.h>
-
 /*
  * as from 2.5, kernels no longer have an init_tasks structure
  * so we need some other way of telling a new secondary core
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index ffc5d76cf695..937d2623e06b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -51,7 +51,6 @@
 #include <asm/ptrace.h>
 #include <asm/virt.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/ipi.h>
 
 DEFINE_PER_CPU_READ_MOSTLY(int, cpu_number);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 60fdc0faf1c9..14e5e137172f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -81,6 +81,7 @@
 #include <linux/sched/rseq_api.h>
 #include <trace/events/sched.h>
 #undef CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
 
 #include "sched.h"
 #include "stats.h"
@@ -3753,10 +3754,12 @@ void send_call_function_single_ipi(int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	if (!set_nr_if_polling(rq->idle))
+	if (!set_nr_if_polling(rq->idle)) {
+		trace_ipi_send_cpu(_RET_IP_, cpu);
 		arch_send_call_function_single_ipi(cpu);
-	else
+	} else {
 		trace_sched_wake_idle_without_ipi(cpu);
+	}
 }
 
 /*
diff --git a/kernel/smp.c b/kernel/smp.c
index e8cdc025a046..7a7a22d69972 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -26,6 +26,10 @@
 #include <linux/sched/debug.h>
 #include <linux/jump_label.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
+#undef CREATE_TRACE_POINTS
+
 #include "smpboot.h"
 #include "sched/smp.h"
 
-- 
2.31.1

