Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405C8544B69
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 14:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245198AbiFIMMM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 08:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245190AbiFIMMK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 08:12:10 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F39D39692
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 05:12:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m25so22597999lji.11
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXw13yRcDqKg7DkQzKXd5XjAMX2OrZDRyub1ykACt1g=;
        b=D1YG4fyBMLzw7CC8HQorpN8OFNz8j2bz3qofrcxkXIsR19mFcZ5OVwQG5GUG9HDYGS
         uT0omxtCTcNmNSOfEze6kJldYk3TwIvgrhrtYqB+hK4zXtTQGBYshKLk6VIJHTjOuJSI
         eUPdNR3sPRrfz4ntxM/BOpxFPKbhRzi71YegdxJ5vwjOjBJ3EGdpNLjVDba0uDk2R4/w
         nQ7h95UKqYcRRoiKVgmPqJwWZTjr9KUZtpQe/imrHLqtoGqljilfstE4T95+haFW2lJV
         l48QhhnXNm/cDeS7aBqMT78GkaViMkX1xhereecBtwvtvtCFzv29GoCwmuxqsZz/Bu7o
         Lo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXw13yRcDqKg7DkQzKXd5XjAMX2OrZDRyub1ykACt1g=;
        b=22drunrzgf6CWXBGAFXHDXFs2/uBfnZr/kTcFSCSoUeoaKo96w7EhQfVXZSGwhZXlq
         9KF6AsUeDBKOufrhnRHJkPqDu7ngH0A+hZFBDjLqPjFg5mCTkiNIhJEctL9z7jGriAsG
         mLONMYKGc4+1vK5nYK941NNjVc55UoNnf3rh9qBDGGF5HtB8zO3yHvw0K1Ce6OPCXbjp
         H5VKF/a7xa6jwlI/wnViC6ZysI/+KepHRwAsTaJAtf1QI4tm8pohqPFEtoeEBqlyyMt8
         tmX9WRhgLunhwjF8+vo1Pe2hpQbJFc3IMiyBivHydxIftKKvKtfnjvHSsFnjt5zfzTGo
         Ts1w==
X-Gm-Message-State: AOAM530U4qXAffv+nZd8OGF9rTd9p9Xl2oN8HnXklyasBKDCk74ABIWd
        /DNj/KZjuqQYFrLL+YzjYbtYTj+qbfvxq09gAQRc+g==
X-Google-Smtp-Source: ABdhPJxJ4izu58DhbEtg4OrWQvnTYYPgbq9RLUiwaniYQjI0bAhPx2mFu7QEXKdjXwlZI6w8YmygwxydJ+D2zeVv8So=
X-Received: by 2002:a05:651c:1988:b0:255:b2ef:6a5b with SMTP id
 bx8-20020a05651c198800b00255b2ef6a5bmr6789351ljb.465.1654776722133; Thu, 09
 Jun 2022 05:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113046.780504-1-elver@google.com> <20220609113046.780504-9-elver@google.com>
In-Reply-To: <20220609113046.780504-9-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 9 Jun 2022 14:11:50 +0200
Message-ID: <CACT4Y+ZFO8F6KzZTuCiDNn4PjSjT3VcFD7dC0Chg9RM9c7bbUg@mail.gmail.com>
Subject: Re: [PATCH 8/8] perf/hw_breakpoint: Clean up headers
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

On Thu, 9 Jun 2022 at 13:31, Marco Elver <elver@google.com> wrote:
>
> Clean up headers:
>
>  - Remove unused <linux/kallsyms.h>
>
>  - Remove unused <linux/kprobes.h>
>
>  - Remove unused <linux/module.h>
>
>  - Remove unused <linux/smp.h>
>
>  - Add <linux/export.h> for EXPORT_SYMBOL_GPL().
>
>  - Sort alphabetically.
>
>  - Move <linux/hw_breakpoint.h> to top to test it compiles on its own.
>
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/events/hw_breakpoint.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 3b33a4075104..e9aa7f2c031a 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -17,26 +17,24 @@
>   * This file contains the arch-independent routines.
>   */
>
> +#include <linux/hw_breakpoint.h>
> +
>  #include <linux/atomic.h>
> +#include <linux/bug.h>
> +#include <linux/cpu.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/kallsyms.h>
> -#include <linux/notifier.h>
> -#include <linux/kprobes.h>
>  #include <linux/kdebug.h>
>  #include <linux/kernel.h>
> -#include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/percpu.h>
> +#include <linux/rhashtable.h>
>  #include <linux/sched.h>
> -#include <linux/spinlock.h>
> -#include <linux/init.h>
>  #include <linux/slab.h>
> -#include <linux/rhashtable.h>
> -#include <linux/cpu.h>
> -#include <linux/smp.h>
> -#include <linux/bug.h>
> +#include <linux/spinlock.h>
>
> -#include <linux/hw_breakpoint.h>
>  /*
>   * Constraints data
>   */
> --
> 2.36.1.255.ge46751e96f-goog
>
