Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1985A42DC
	for <lists+linux-sh@lfdr.de>; Mon, 29 Aug 2022 08:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiH2GBk (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 29 Aug 2022 02:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiH2GBi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 29 Aug 2022 02:01:38 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFA527B29
        for <linux-sh@vger.kernel.org>; Sun, 28 Aug 2022 23:01:37 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-33dba2693d0so169998307b3.12
        for <linux-sh@vger.kernel.org>; Sun, 28 Aug 2022 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GcD+HCTsL9PhfIoNQS6OfBy4IaHMHLVbPkWLbk6HzGE=;
        b=XY395wkduWKer9JhMF4//DaIUGT8Tpq+rJg8KPi7+iDqC3nEL76fphCBKa0TADUs5Y
         Pe+d0UGynDBtTe1J4PaLOJkDrEoC6fKoRDinEw6wRmRJHf6OGEM8g/81+ISe+2YWe4/f
         1FWlDKRedxpgzo/cXaHo7N0rN/NxKV13AkVrqJheYKc921pnefWieUUjI0/9PMLyrkYF
         +54ESHy7T0wT56qYZ/EujWYUASmbOawas8ItKc1fhdlWD/UOebAoskL9awaewc41GQKB
         hW7U8lvsupulNrvPERA4OlUGCBbSW501Y9m1mOYt4Krbsw3K+dGc1Ps8S/bVkskF8+pe
         c50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GcD+HCTsL9PhfIoNQS6OfBy4IaHMHLVbPkWLbk6HzGE=;
        b=0rT8N7G7lPGVL2i7U/qhP31v3XIsF4T0jyvG8dUrQzUwKmZoZ99l9FOXVmBgEzeulS
         UsPPrsUlrTFQyVnMPKSgSyBTiremiYCS+w/SpVlLXruA5u1OyXGv/8audEd7MQUCDdTb
         KpxNRbBNvWZHNumdtrSYej2IsTFZbdXcC5WybXzM92sV2LpLg9rFhyZI0xx151ctLG4b
         jNiyGf9aRYsFvdDCJMZojcabuwwdtcxR+CgFJERuNLzKYxbT55OsuGRYVAh9PrmFtN0J
         ys+80KkmzsVGth2VhkLj5Uz7f/EjiXl9gu7aJzgSBxBPs1mPfl3ocPM+h6+/ELZLBrPv
         Dg5Q==
X-Gm-Message-State: ACgBeo3kOFwLmQmxxJkTqiYknd4ZCC260nIuQ8JVO8G9Qtr0zjHP0ot9
        bnwqJq6BV7088RTctpjGj0UIitE9U1JTg6XSf0M61g==
X-Google-Smtp-Source: AA6agR4OkRBDBHVTlnL+FH4iL1r8QAUgTcU+5pqwP3zJY+yINE0mXfWAktGCQb8zpFBt1Kxb6U4Hazqq5HVKOejO/UE=
X-Received: by 2002:a0d:ea49:0:b0:33d:bce7:25c2 with SMTP id
 t70-20020a0dea49000000b0033dbce725c2mr8651338ywe.267.1661752896882; Sun, 28
 Aug 2022 23:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-11-elver@google.com>
 <YvzjeEHYX9d5dhAt@worktop.programming.kicks-ass.net>
In-Reply-To: <YvzjeEHYX9d5dhAt@worktop.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Mon, 29 Aug 2022 08:00:00 +0200
Message-ID: <CANpmjNPSOnMN3Fc4yxoArTytQcW4n6sPCN-LnisTn58xLU=4HA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
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
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 17 Aug 2022 at 14:48, Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Jul 04, 2022 at 05:05:10PM +0200, Marco Elver wrote:
> > +bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
> > +{
> > +     return per_cpu_sum(*sem->read_count) != 0;
> > +}
> > +EXPORT_SYMBOL_GPL(percpu_is_read_locked);
>
> I don't think this is correct; read_count can have spurious increments.
>
> If we look at __percpu_down_read_trylock(), it does roughly something
> like this:
>
>         this_cpu_inc(*sem->read_count);
>         smp_mb();
>         if (!sem->block)
>                 return true;
>         this_cpu_dec(*sem->read_count);
>         return false;
>
> So percpu_is_read_locked() needs to ensure the read_count is non-zero
> *and* that block is not set.

I shall go and fix. v4 incoming (if more comments before that, please shout).

> That said; I really dislike the whole _is_locked family with a passion.
> Let me try and figure out what you need this for.

As in the other email, it's for the dbg_*() functions for kgdb's
benefit (avoiding deadlock if kgdb wants a breakpoint, while we're in
the process of handing out a breakpoint elsewhere and have the locks
taken).

Thanks,
-- Marco
