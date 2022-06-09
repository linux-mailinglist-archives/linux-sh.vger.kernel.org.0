Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81F5544A29
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 13:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243273AbiFILbH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 07:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243691AbiFILbF (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 07:31:05 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979D639E4AE
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 04:31:04 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id s4-20020a170906500400b006feaccb3a0eso10875587ejj.11
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wnAKNm59aHUnnDDyhy7DQsgawVHUm92RhZIM8y499GE=;
        b=WkMVlpXnnh1ry0CE/UDyLuTslVl/KojJzPPXdlolY5n5SJY+KHvM0s4QPsDw/ImjRh
         H7xWhFfwc7tkUsc7mIagXa6nY0nBENo5RRHA3oEV6WH+2w2X3aHNZ85++S+erMQfqPkx
         vd4C/Xgk6CSQCYAYghdKE47r5IhfLhU8b566MOuhEDdT63B/h20KCT5kzXAs8AkFhe54
         tBIQJD1p2jmbzcuTVidce8EB/oRJaEyTbhMHSxR4ShMTEDvDheLB49ozQ9DEvxGI/ipf
         EYERxwz18K4afh4hwu2YtxEc0JbjpJC0jcF2XZbqOM1AiaYhRREJCDp2LBgG31/PJS3n
         AuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wnAKNm59aHUnnDDyhy7DQsgawVHUm92RhZIM8y499GE=;
        b=4FjXEpdbi1EhjB0XffQnGxN4cwcduJr7PpCKuMylOOeq8Xy6Guc3d25KnCQEDEz+zm
         dhbPUDsDYRvP3JXrOInQdwSglDWs2J+t9tLYcGVziq/CC/qcyJhPIjWJDAVKj/oHFNQX
         V38kpQuOTA/SPqjQGROBwnbZl8Ko2vg+Kn2PzzLRe4fkwHw/61Vd8FXfj1WPJE3t3YdJ
         nx5XxspYsAMj+cCO4/UtvczpsgJtJk6KPWJayXb0gtle737CUJdDiWGcy7I44P2iJcwe
         EExj23axK/B140h2Uz4/Uyot/FIvWooK/unOlaB05TLncUMr/t/aCEjkYF3HK5+u+uSI
         KhTw==
X-Gm-Message-State: AOAM531jcWjXS/N0jjYNuspcADmUEWlJKDW4F/4F8OB/EKAQ2bKB+RJW
        BpYT+AwWgUZ8xSYsq8Nb+PvlVfAAIQ==
X-Google-Smtp-Source: ABdhPJx73qjTeXCe10FaRzf/2yFdYj63Q0oseWtLrCparCyLdJilS10nXnGYV7x816rUyXswmnTt6sQNBQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:dcf:e5ba:10a5:1ea5])
 (user=elver job=sendgmr) by 2002:a05:6402:500b:b0:431:78d0:bf9d with SMTP id
 p11-20020a056402500b00b0043178d0bf9dmr17528643eda.184.1654774262890; Thu, 09
 Jun 2022 04:31:02 -0700 (PDT)
Date:   Thu,  9 Jun 2022 13:30:40 +0200
In-Reply-To: <20220609113046.780504-1-elver@google.com>
Message-Id: <20220609113046.780504-3-elver@google.com>
Mime-Version: 1.0
References: <20220609113046.780504-1-elver@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH 2/8] perf/hw_breakpoint: Mark data __ro_after_init
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

Mark read-only data after initialization as __ro_after_init.

While we are here, turn 'constraints_initialized' into a bool.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/events/hw_breakpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 25c94c6e918d..1f718745d569 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -47,7 +47,7 @@ struct bp_cpuinfo {
 };
 
 static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
-static int nr_slots[TYPE_MAX];
+static int nr_slots[TYPE_MAX] __ro_after_init;
 
 static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
 {
@@ -63,7 +63,7 @@ static const struct rhashtable_params task_bps_ht_params = {
 	.automatic_shrinking = true,
 };
 
-static int constraints_initialized;
+static bool constraints_initialized __ro_after_init;
 
 /* Gather the number of total pinned and un-pinned bp in a cpuset */
 struct bp_busy_slots {
@@ -711,7 +711,7 @@ int __init init_hw_breakpoint(void)
 	if (ret)
 		goto err;
 
-	constraints_initialized = 1;
+	constraints_initialized = true;
 
 	perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
 
-- 
2.36.1.255.ge46751e96f-goog

