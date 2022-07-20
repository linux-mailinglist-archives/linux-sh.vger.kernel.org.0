Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB7E57BA7D
	for <lists+linux-sh@lfdr.de>; Wed, 20 Jul 2022 17:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbiGTPge (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 20 Jul 2022 11:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiGTPgd (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 20 Jul 2022 11:36:33 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998F132442
        for <linux-sh@vger.kernel.org>; Wed, 20 Jul 2022 08:36:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so1532282wmo.0
        for <linux-sh@vger.kernel.org>; Wed, 20 Jul 2022 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFzxx0z8pNKG8GQJAfngz4sVC9qlk18q5vOjkBqe41U=;
        b=DYrPq68GLvItPSkdP1iRNBYH4r5u/VU/4hctkVb0AVbcaQWnJsmyhV+rknu569NDUk
         o7570gvxSR4qDT3uhb+ulSVY+WSiEdCJbZadpKchRpy6M635wQ9YE67mAnZUAWX1PnNI
         DjNpTzN0Y0TYNZC3PGOvGwGPqMFNmf4cPeuBrU+UtoTwmSoU4uFqkOb6Q23CbwC31DYm
         6Auh+eOKqXfChxALoWTNJB43P4J40PWWdA3VkjuZAUxIw8SVlAQTZTV1vhkY+PvURc4J
         UMWq3tKkmc5PYODk1J3VfQ1VSqbU6F5BnYiUhV36SYcKWKqn21Xj+zFl5lBXYXLRh/7e
         lihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFzxx0z8pNKG8GQJAfngz4sVC9qlk18q5vOjkBqe41U=;
        b=HnBhPA6t66jMdCWnsHQcFtG7xo1CZ5pfPey5sJa2Po+SRLcZRAbjFRZN0b0XoM8XGG
         A2rA2cR9THxQaPANnfwtmZGX0ylr3r9c/q9xsjF/QC3rvKjhQtDg8LSgglJ1kIW5Rz/s
         y1FwiomW3WxJ6gKZJIdSjmp84NTuB9jzqHZfZ36RBIp7p2EbJUuZfx7gpUleOyQuYy9N
         qsaN5B+SCyLGCYjrwteNUk2d75eLg2fxhVaBKpLG7oiQMeSyTzKg+v1Sew2Gm5/GwLgj
         ICsI4VD7oGCnSXKDgQhizNJ5pBihL3qYLlpBL+mTBo2t9lNwfzOkZiKYPlpvcdfUkyhq
         hUPA==
X-Gm-Message-State: AJIora91n1lvgV7HGoGB2HzpjnjyiZcswGv8H81IFaFqo05x4WeZC7ZT
        OiFEcn504Sm6vMp0jEKUQfSct3xkxNZCVRpzAxz9zQ==
X-Google-Smtp-Source: AGRyM1sLPBoh5pqmDtw4wPynZIZtaL2Bw4Asqc9TmCk9ZgFTDI88pTO3drYJSFHLXbjukiaxsv4+tBmZLSdj518/fak=
X-Received: by 2002:a05:600c:2854:b0:3a3:1551:d7d with SMTP id
 r20-20020a05600c285400b003a315510d7dmr4199687wmb.174.1658331391068; Wed, 20
 Jul 2022 08:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-11-elver@google.com>
In-Reply-To: <20220704150514.48816-11-elver@google.com>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 20 Jul 2022 08:36:18 -0700
Message-ID: <CAP-5=fX7DoS0eDk=FS14CRjU_UPinH2+0+uD1JPXFMtrb7o1eA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
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
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org,
        x86@kernel.org, linux-sh@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 4, 2022 at 8:07 AM Marco Elver <elver@google.com> wrote:
>
> Implement simple accessors to probe percpu-rwsem's locked state:
> percpu_is_write_locked(), percpu_is_read_locked().
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

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
