Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E39E2DE570
	for <lists+linux-sh@lfdr.de>; Fri, 18 Dec 2020 16:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgLRPBm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 18 Dec 2020 10:01:42 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:49413 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbgLRPBj (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 18 Dec 2020 10:01:39 -0500
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MWzwP-1kb8we1aC9-00XHi6; Fri, 18 Dec 2020 15:58:29 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, msalter@redhat.com, jacquiot.aurelien@gmail.com,
        gerg@linux-m68k.org, geert@linux-m68k.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
        tglx@linutronix.de, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        maz@kernel.org, tony@atomide.com, arnd@arndb.de,
        linux-alpha@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arch@vger.kernel.org
Subject: [PATCH 16/23] arch: alpha: use generic irq error counter
Date:   Fri, 18 Dec 2020 15:57:39 +0100
Message-Id: <20201218145746.24205-17-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:BuNrPAZ8tbuJ9DpLqCoSNcPTN/hg43SyGKZ7eDkFT4x21CSANOt
 4hcjC06gI4HWH5v5ZsEzDCT15f5Rj/vp6FEoZFpl/DH+6C2ikAEkDtUYMrSznSxMWkulDKM
 Iwmz6I+i3+cwf/bGfKY05IeD9m/hg50aFp2nT05L6bkARAhhVSPj1VrgoNOkZm8KIfYI6qQ
 9Si7xQ4qT7aXFEzDE4dcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:68PyTn5wFp0=:umFv8Fu/HJdYPCRN4Cb4Gt
 2jgHCCIsuIddZvW12vAxH96qUL9Eyt7Igp7Ffu3szeWGb7KjjMNaH6tZreF3ed2qIc6c3uGEr
 wrJQgA0vIddh2bEVwXG9rRmq7ZETJjI/pk5ldZV79p8rXhNWUzZhvKmx1no2TNwHAhgJjQkPy
 wDX97zxd+aRuL+Dg+9InwvtMHyK9FZVZXCAV/O5Zw4nI4/8L9jJgunpJ0pljKFGoqnkEsMzL8
 J0F6kmrBBr1A55GTACOqaVotuj51oFLP4rH4a1wACDEA4OBo469eHaRuCzSkAjSow70UoYAuK
 kHNAFPOBBk+nYlWcm9iX1UD+NH79zOD2kkHeHg+FvnYpdc2MMWNZfA2G2ZkMcK8PfXnR3CLKE
 aS3QDNLOvOR3qD4GoCGVkNCe7byyZohlTPhQlYvKJMVtvBSY8CzhgI818DjSN
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Use the newly introduced irq error counter, that's already maintained
by all callers of ack_bad_irq(), in order to remove duplicate code.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/alpha/include/asm/hardirq.h |  3 ---
 arch/alpha/include/asm/hw_irq.h  |  2 --
 arch/alpha/kernel/irq.c          | 12 +++---------
 arch/alpha/kernel/irq_alpha.c    |  5 +++--
 arch/alpha/kernel/perf_event.c   |  6 +++---
 5 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/include/asm/hardirq.h b/arch/alpha/include/asm/hardirq.h
index 5ce5b34e8a1a..0bbc9947e364 100644
--- a/arch/alpha/include/asm/hardirq.h
+++ b/arch/alpha/include/asm/hardirq.h
@@ -2,9 +2,6 @@
 #ifndef _ALPHA_HARDIRQ_H
 #define _ALPHA_HARDIRQ_H
 
-void ack_bad_irq(unsigned int irq);
-#define ack_bad_irq ack_bad_irq
-
 #include <asm-generic/hardirq.h>
 
 #endif /* _ALPHA_HARDIRQ_H */
diff --git a/arch/alpha/include/asm/hw_irq.h b/arch/alpha/include/asm/hw_irq.h
index e2d81ac0d934..0be79f3a6cae 100644
--- a/arch/alpha/include/asm/hw_irq.h
+++ b/arch/alpha/include/asm/hw_irq.h
@@ -2,8 +2,6 @@
 #ifndef _ALPHA_HW_IRQ_H
 #define _ALPHA_HW_IRQ_H
 
-
-extern volatile unsigned long irq_err_count;
 DECLARE_PER_CPU(unsigned long, irq_pmi_count);
 
 #ifdef CONFIG_ALPHA_GENERIC
diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index c1980eea75a6..2b7dad83e0dc 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -25,18 +25,12 @@
 #include <linux/seq_file.h>
 #include <linux/profile.h>
 #include <linux/bitops.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/io.h>
 #include <linux/uaccess.h>
 
-volatile unsigned long irq_err_count;
 DEFINE_PER_CPU(unsigned long, irq_pmi_count);
 
-void ack_bad_irq(unsigned int irq)
-{
-	irq_err_count++;
-}
-
 #ifdef CONFIG_SMP 
 static char irq_user_affinity[NR_IRQS];
 
@@ -79,7 +73,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	for_each_online_cpu(j)
 		seq_printf(p, "%10lu ", per_cpu(irq_pmi_count, j));
 	seq_puts(p, "          Performance Monitoring\n");
-	seq_printf(p, "ERR: %10lu\n", irq_err_count);
+	seq_printf(p, "ERR: %10lu\n", irq_err_get());
 	return 0;
 }
 
@@ -109,7 +103,7 @@ handle_irq(int irq)
 	
 	if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
 	    illegal_count < MAX_ILLEGAL_IRQS)) {
-		irq_err_count++;
+		irq_err_inc();
 		illegal_count++;
 		printk(KERN_CRIT "device_interrupt: invalid interrupt %d\n",
 		       irq);
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index d17e44c99df9..3b6373cf73d9 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -13,6 +13,7 @@
 #include <asm/dma.h>
 #include <asm/perf_event.h>
 #include <asm/mce.h>
+#include <asm-generic/irq-err.h>
 
 #include "proto.h"
 #include "irq_impl.h"
@@ -30,7 +31,7 @@ EXPORT_SYMBOL(__min_ipl);
 static void
 dummy_perf(unsigned long vector, struct pt_regs *regs)
 {
-	irq_err_count++;
+	irq_err_inc();
 	printk(KERN_CRIT "Performance counter interrupt!\n");
 }
 
@@ -60,7 +61,7 @@ do_entInt(unsigned long type, unsigned long vector,
 		handle_ipi(regs);
 		return;
 #else
-		irq_err_count++;
+		irq_err_inc();
 		printk(KERN_CRIT "Interprocessor interrupt? "
 		       "You must be kidding!\n");
 #endif
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index e7a59d927d78..d855cece7bb1 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,7 +16,7 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
@@ -823,7 +823,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	/* la_ptr is the counter that overflowed. */
 	if (unlikely(la_ptr >= alpha_pmu->num_pmcs)) {
 		/* This should never occur! */
-		irq_err_count++;
+		irq_err_inc();
 		pr_warn("PMI: silly index %ld\n", la_ptr);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 		return;
@@ -846,7 +846,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 	if (unlikely(!event)) {
 		/* This should never occur! */
-		irq_err_count++;
+		irq_err_inc();
 		pr_warn("PMI: No event at index %d!\n", idx);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 		return;
-- 
2.11.0

