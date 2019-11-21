Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40201059BD
	for <lists+linux-sh@lfdr.de>; Thu, 21 Nov 2019 19:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKUSly (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 21 Nov 2019 13:41:54 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:61632 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfKUSly (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 21 Nov 2019 13:41:54 -0500
Received: from 79.184.253.244.ipv4.supernova.orange.pl (79.184.253.244) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 1158072d821797ee; Thu, 21 Nov 2019 19:41:51 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Len Brown <len.brown@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Len Brown <lenb@kernel.org>,
        Rafael Wysocki <rafael@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 1/2] cpuidle: Drop disabled field from struct cpuidle_state
Date:   Thu, 21 Nov 2019 19:41:51 +0100
Message-ID: <3690440.Wzkxfdnirm@kreacher>
In-Reply-To: <5961586.ml7s97geqL@kreacher>
References: <5961586.ml7s97geqL@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

After recent cpuidle updates the "disabled" field in struct
cpuidle_state is only used by two drivers (intel_idle and shmobile
cpuidle) for marking unusable idle states, but that may as well be
achieved with the help of a state flag, so define an "unusable" idle
state flag, CPUIDLE_FLAG_UNUSABLE, make the drivers in question use
it instead of the "disabled" field and make the core set
CPUIDLE_STATE_DISABLED_BY_DRIVER for the idle states with that flag
set.

After the above changes, the "disabled" field in struct cpuidle_state
is not used any more, so drop it.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

Changes from RFC:

 - Do not add extra braces (unrelated to the rest of the patch).

---
 arch/sh/kernel/cpu/shmobile/cpuidle.c |    8 ++++----
 drivers/cpuidle/cpuidle.c             |    2 +-
 drivers/cpuidle/poll_state.c          |    1 -
 drivers/idle/intel_idle.c             |    6 +++---
 include/linux/cpuidle.h               |    2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)

Index: linux-pm/drivers/idle/intel_idle.c
===================================================================
--- linux-pm.orig/drivers/idle/intel_idle.c
+++ linux-pm/drivers/idle/intel_idle.c
@@ -1291,8 +1291,8 @@ static void sklh_idle_state_table_update
 			return;
 	}
 
-	skl_cstates[5].disabled = 1;	/* C8-SKL */
-	skl_cstates[6].disabled = 1;	/* C9-SKL */
+	skl_cstates[5].flags |= CPUIDLE_FLAG_UNUSABLE;	/* C8-SKL */
+	skl_cstates[6].flags |= CPUIDLE_FLAG_UNUSABLE;	/* C9-SKL */
 }
 /*
  * intel_idle_state_table_update()
@@ -1355,7 +1355,7 @@ static void __init intel_idle_cpuidle_dr
 			continue;
 
 		/* if state marked as disabled, skip it */
-		if (cpuidle_state_table[cstate].disabled != 0) {
+		if (cpuidle_state_table[cstate].flags & CPUIDLE_FLAG_UNUSABLE) {
 			pr_debug("state %s is disabled\n",
 				 cpuidle_state_table[cstate].name);
 			continue;
Index: linux-pm/include/linux/cpuidle.h
===================================================================
--- linux-pm.orig/include/linux/cpuidle.h
+++ linux-pm/include/linux/cpuidle.h
@@ -54,7 +54,6 @@ struct cpuidle_state {
 	unsigned int	exit_latency; /* in US */
 	int		power_usage; /* in mW */
 	unsigned int	target_residency; /* in US */
-	bool		disabled; /* disabled on all CPUs */
 
 	int (*enter)	(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
@@ -77,6 +76,7 @@ struct cpuidle_state {
 #define CPUIDLE_FLAG_POLLING	BIT(0) /* polling state */
 #define CPUIDLE_FLAG_COUPLED	BIT(1) /* state applies to multiple cpus */
 #define CPUIDLE_FLAG_TIMER_STOP BIT(2) /* timer is stopped on this state */
+#define CPUIDLE_FLAG_UNUSABLE	BIT(3) /* avoid using this state */
 
 struct cpuidle_device_kobj;
 struct cpuidle_state_kobj;
Index: linux-pm/arch/sh/kernel/cpu/shmobile/cpuidle.c
===================================================================
--- linux-pm.orig/arch/sh/kernel/cpu/shmobile/cpuidle.c
+++ linux-pm/arch/sh/kernel/cpu/shmobile/cpuidle.c
@@ -67,7 +67,7 @@ static struct cpuidle_driver cpuidle_dri
 			.enter = cpuidle_sleep_enter,
 			.name = "C2",
 			.desc = "SuperH Sleep Mode [SF]",
-			.disabled = true,
+			.flags = CPUIDLE_FLAG_UNUSABLE,
 		},
 		{
 			.exit_latency = 2300,
@@ -76,7 +76,7 @@ static struct cpuidle_driver cpuidle_dri
 			.enter = cpuidle_sleep_enter,
 			.name = "C3",
 			.desc = "SuperH Mobile Standby Mode [SF]",
-			.disabled = true,
+			.flags = CPUIDLE_FLAG_UNUSABLE,
 		},
 	},
 	.safe_state_index = 0,
@@ -86,10 +86,10 @@ static struct cpuidle_driver cpuidle_dri
 int __init sh_mobile_setup_cpuidle(void)
 {
 	if (sh_mobile_sleep_supported & SUSP_SH_SF)
-		cpuidle_driver.states[1].disabled = false;
+		cpuidle_driver.states[1].flags = CPUIDLE_FLAG_NONE;
 
 	if (sh_mobile_sleep_supported & SUSP_SH_STANDBY)
-		cpuidle_driver.states[2].disabled = false;
+		cpuidle_driver.states[2].flags = CPUIDLE_FLAG_NONE;
 
 	return cpuidle_register(&cpuidle_driver, NULL);
 }
Index: linux-pm/drivers/cpuidle/cpuidle.c
===================================================================
--- linux-pm.orig/drivers/cpuidle/cpuidle.c
+++ linux-pm/drivers/cpuidle/cpuidle.c
@@ -570,7 +570,7 @@ static int __cpuidle_register_device(str
 		return -EINVAL;
 
 	for (i = 0; i < drv->state_count; i++)
-		if (drv->states[i].disabled)
+		if (drv->states[i].flags & CPUIDLE_FLAG_UNUSABLE)
 			dev->states_usage[i].disable |= CPUIDLE_STATE_DISABLED_BY_DRIVER;
 
 	per_cpu(cpuidle_devices, dev->cpu) = dev;
Index: linux-pm/drivers/cpuidle/poll_state.c
===================================================================
--- linux-pm.orig/drivers/cpuidle/poll_state.c
+++ linux-pm/drivers/cpuidle/poll_state.c
@@ -53,7 +53,6 @@ void cpuidle_poll_state_init(struct cpui
 	state->target_residency_ns = 0;
 	state->power_usage = -1;
 	state->enter = poll_idle;
-	state->disabled = false;
 	state->flags = CPUIDLE_FLAG_POLLING;
 }
 EXPORT_SYMBOL_GPL(cpuidle_poll_state_init);



