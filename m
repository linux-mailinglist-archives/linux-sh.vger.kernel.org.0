Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBBE565956
	for <lists+linux-sh@lfdr.de>; Mon,  4 Jul 2022 17:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbiGDPHA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 4 Jul 2022 11:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbiGDPGh (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 4 Jul 2022 11:06:37 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CB411A0E
        for <linux-sh@vger.kernel.org>; Mon,  4 Jul 2022 08:06:24 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id qa41-20020a17090786a900b00722f313a60eso2108323ejc.13
        for <linux-sh@vger.kernel.org>; Mon, 04 Jul 2022 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yKHd4+xECY7NKN85fGWY0KF6Qb94v9CyhlLOvS2S1lk=;
        b=Ph8b8+BRp8UF3q45WaVGDpzOGcKX1K7SLbLqBqrclyh0nxPSG/KuoHKe/VDxiTer8b
         IAi6O8suVd0rgt8XGC+GNaJU9hpUIaIuxsrPq4Ejzd12Sdz0m1067DxPyqs30B1zylVm
         dxRzGzK+3MBE0hpfoZCp4zDUAoyD6Cvs2Qttkwp4sLzEhVmC/Xoy66reRveUzPOZldla
         raHJWM4L2eR0mSPU8+xiOwXka2jQoK1EKz9G9ufnUNccA9gRdrgor5rE483oWbIB1+WE
         PcECJ6azBnTzgr4PZadkahxGdwjtpRSR1zK+pD/HQv9uiFgVEPVu0fgeg3AR4VP9ftti
         zlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yKHd4+xECY7NKN85fGWY0KF6Qb94v9CyhlLOvS2S1lk=;
        b=FlfI7F5vvm786im8UHh2GSQWgkto9m2SWwB5EPVbsorBUkidU+KcAfM9N+gj/MiF5H
         MxQE0STSPW+j3Zf9noP1JlvjV5n1PmycLDf/EUBSvPUHMhrjpWGiouKLXOA6BBkGIe4O
         inwL5iLhXC1QSUkN5H9DFF6wT8HVi1u7ofHaQfzKaBN1UZftppx4dM7RHqk2DxXygK5N
         7qyQyBteNORpUQEviVK/mvLSadJboOKfsXrOb/3y86/eocnGlAt8kuqNUJ240vxrZt1p
         qGWdbQNcdnXC5AKvh5ehk5dnHB2LufImWan/DwEsxUgaQc5fRqi5TF9ayhBsfY9K2+Yz
         D++w==
X-Gm-Message-State: AJIora8NEaWSSTZcaWLgDx7r76do1ffDfQQrPDjADhxoz6L/O3O2M8My
        cMHqdvwuOaW1rtHtvoqKLN8ifq44Pg==
X-Google-Smtp-Source: AGRyM1v1bp4fmM3Ia8wxOfKnNbYa+SkAtF2yk0BBky/nBRaoOYmthev0cidUeNONuJ9a0TQ32GuetMcAbg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a17:907:6ea7:b0:726:41de:78ac with SMTP id
 sh39-20020a1709076ea700b0072641de78acmr30061092ejc.452.1656947183301; Mon, 04
 Jul 2022 08:06:23 -0700 (PDT)
Date:   Mon,  4 Jul 2022 17:05:10 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-11-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Implement simple accessors to probe percpu-rwsem's locked state:
percpu_is_write_locked(), percpu_is_read_locked().

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
v2:
* New patch.
---
 include/linux/percpu-rwsem.h  | 6 ++++++
 kernel/locking/percpu-rwsem.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
index 5fda40f97fe9..36b942b67b7d 100644
--- a/include/linux/percpu-rwsem.h
+++ b/include/linux/percpu-rwsem.h
@@ -121,9 +121,15 @@ static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
 	preempt_enable();
 }
 
+extern bool percpu_is_read_locked(struct percpu_rw_semaphore *);
 extern void percpu_down_write(struct percpu_rw_semaphore *);
 extern void percpu_up_write(struct percpu_rw_semaphore *);
 
+static inline bool percpu_is_write_locked(struct percpu_rw_semaphore *sem)
+{
+	return atomic_read(&sem->block);
+}
+
 extern int __percpu_init_rwsem(struct percpu_rw_semaphore *,
 				const char *, struct lock_class_key *);
 
diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
index 5fe4c5495ba3..213d114fb025 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -192,6 +192,12 @@ EXPORT_SYMBOL_GPL(__percpu_down_read);
 	__sum;								\
 })
 
+bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
+{
+	return per_cpu_sum(*sem->read_count) != 0;
+}
+EXPORT_SYMBOL_GPL(percpu_is_read_locked);
+
 /*
  * Return true if the modular sum of the sem->read_count per-CPU variable is
  * zero.  If this sum is zero, then it is stable due to the fact that if any
-- 
2.37.0.rc0.161.g10f37bed90-goog

