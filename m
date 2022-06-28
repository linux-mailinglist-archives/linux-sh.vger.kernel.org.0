Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E88755E72F
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jun 2022 18:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347106AbiF1OpA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Jun 2022 10:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347102AbiF1Oo5 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 28 Jun 2022 10:44:57 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AED2CDDF
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 07:44:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id n15so15179324ljg.8
        for <linux-sh@vger.kernel.org>; Tue, 28 Jun 2022 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYNtEachczg7r/XXNrPpniIU6MTplkzQm/H7US5uhak=;
        b=ht86O9eM8J4P2PZl+KtFbHC+gZPW6NGiN4v8P9Rgy3+MOPpO2yYFyJgHvaOmDgiNgH
         /p5vSOz3x44RtyJLVLOWXHtd4RctYsU5AD77eH1lLYGzoJq1nXE6Wn1aS/nh9PsIqaSM
         SgZX0tkOqwnEOJQZtltTQjauhUHkZ+y8964HnCXWW/ZxxVAcJz9JkVyoEfND2Y4j0TCl
         jjtAfvyG4Y9kaCrb3/mP1aNnKNJTlHOByqk1r/9LFGYSktJmBW9fDRNUyV5C47qOh4LU
         EP1xu8f//aX5sdjOiopNc8mHWVwa45OZNsR0Yrue3dH93LCUvFB7lshaMpzR2gSAsFYP
         pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYNtEachczg7r/XXNrPpniIU6MTplkzQm/H7US5uhak=;
        b=MDfGoWWYYBl+pM2kq0WSZQ30rkR+w7CGew5HStLyjWUhhzAbEdMLjTaTCtykg82knY
         U2EeWHrYdBiFvounPrm49ARPSFW9KX9sIBGsBUr3CizusCAHmnU1UkmYfaAsqsd5aAAs
         Lk1ukMEy+DJCBAB5kIzFhvOw4teGooPVwSIY8+zJzzRkFcjPSylywYJZcEXVZvtuTbJb
         8cyOL/1+ZIhRLYfOm6KteeCZ0FeRIPcxI7+iLmIc4XEPCIcET/ReDwwVVQzv2Bs8kzTT
         xkn8KEY9wkZIZOYYSFFdqVSHZ1OjiPzKyYLHKVKpj6vUp1P0TIBWScv0QoDK9aNLYv33
         hQPg==
X-Gm-Message-State: AJIora+8j7mo6MznNjxHrE9wcMCcUtKewkyn9P5S8xInVolO9lu+pEVl
        076U2tfxY9Hf77b4Z9K7FxcvSSaTSf+V/QoRg02z7w==
X-Google-Smtp-Source: AGRyM1vkmnuA2FUnqSW9JeJGsv4yNApnR2Dfl5iKx6TmhoRHbVhtZKhKo6yaFA07EoXj3LStjfnAsF7IPGkdhQBdH38=
X-Received: by 2002:a2e:8ec9:0:b0:25a:754d:db39 with SMTP id
 e9-20020a2e8ec9000000b0025a754ddb39mr9908848ljl.4.1656427492555; Tue, 28 Jun
 2022 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-10-elver@google.com>
In-Reply-To: <20220628095833.2579903-10-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 28 Jun 2022 16:44:41 +0200
Message-ID: <CACT4Y+bzcWQUspDws-rKJNcOxceg-XOQzunuwsQBuPH5KMqJXA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
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
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org,
        x86@kernel.org, linux-sh@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
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

On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
>
> Implement simple accessors to probe percpu-rwsem's locked state:
> percpu_is_write_locked(), percpu_is_read_locked().
>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> v2:
> * New patch.
> ---
>  include/linux/percpu-rwsem.h  | 6 ++++++
>  kernel/locking/percpu-rwsem.c | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
> index 5fda40f97fe9..36b942b67b7d 100644
> --- a/include/linux/percpu-rwsem.h
> +++ b/include/linux/percpu-rwsem.h
> @@ -121,9 +121,15 @@ static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
>         preempt_enable();
>  }
>
> +extern bool percpu_is_read_locked(struct percpu_rw_semaphore *);
>  extern void percpu_down_write(struct percpu_rw_semaphore *);
>  extern void percpu_up_write(struct percpu_rw_semaphore *);
>
> +static inline bool percpu_is_write_locked(struct percpu_rw_semaphore *sem)
> +{
> +       return atomic_read(&sem->block);
> +}
> +
>  extern int __percpu_init_rwsem(struct percpu_rw_semaphore *,
>                                 const char *, struct lock_class_key *);
>
> diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
> index 5fe4c5495ba3..213d114fb025 100644
> --- a/kernel/locking/percpu-rwsem.c
> +++ b/kernel/locking/percpu-rwsem.c
> @@ -192,6 +192,12 @@ EXPORT_SYMBOL_GPL(__percpu_down_read);
>         __sum;                                                          \
>  })
>
> +bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
> +{
> +       return per_cpu_sum(*sem->read_count) != 0;
> +}
> +EXPORT_SYMBOL_GPL(percpu_is_read_locked);
> +
>  /*
>   * Return true if the modular sum of the sem->read_count per-CPU variable is
>   * zero.  If this sum is zero, then it is stable due to the fact that if any
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
