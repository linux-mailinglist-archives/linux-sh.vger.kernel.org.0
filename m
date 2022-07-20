Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C0257BAC2
	for <lists+linux-sh@lfdr.de>; Wed, 20 Jul 2022 17:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiGTPrX (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 20 Jul 2022 11:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiGTPrX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 20 Jul 2022 11:47:23 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7B71D323
        for <linux-sh@vger.kernel.org>; Wed, 20 Jul 2022 08:47:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1533131wmb.5
        for <linux-sh@vger.kernel.org>; Wed, 20 Jul 2022 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWnAaZCfU7C7OmxHqnYWgl+iLsNs720nTVq22EtgHY0=;
        b=sIAZtEguKhFTVPEcL45Kz2Y7TjZTXwniuvUqVOFt6zTUcFdJADS0J8AqBdnyMplZjY
         exEHIpC5cGIigKdZRLIrpUGSld8LfBC+X94IatTDzW+dLDf1k6TIHWW6ATZVIngS1Oos
         nXNorTzk3OQ+4Bw6EpGvQnLBrkMxd5it3oR2PPezjhMG5Q19ijxeGtIEqA74Qr5sjlGW
         N88s/rNDien3FWAJVSLrlCkT2frzA2AlziXYuogGSjxppzEPV90/SDc6MNYJGwkKv/to
         DVOUTZLRibFdeN8jUFaxX1PaFm9GcCgplfvOEKFNijKoimUdpo/tP/OlK08U7ey7KuN7
         RXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWnAaZCfU7C7OmxHqnYWgl+iLsNs720nTVq22EtgHY0=;
        b=PNY2/ycCi9yJZpOCKIhQQgbkXGlpE2aointMb2dDfOD//JWUcDzPuZRwWz1DP+Y1Il
         ypC8VDKz2djowN9WAsNeEhnKCY8n57pR9wfIBWNRSeWIXK9hErqtMNGEG39RVvM7gvAr
         l581VaV6nN+AMaSY+3FqORhEikwSbPXow1pG46K044VWzl4P4ogiqX0MLJ+jxqwwWmJM
         MKjuCd6EQX1TBdR3M2FyeRF8tUlbpcK9GQxI/WhcfJP0SxEKffswhC+2YfXLy/WkQ6ee
         cTjkVVZdN0/p2/RvgIfJo2AtSGGdbl/aEGrJC88RwaYr3czIiWOdqkzkPXPvF3DENOdH
         zJZA==
X-Gm-Message-State: AJIora80N3Ydbh4hlu7uBxxHd0UMJT/7vM9/8DNBJYdhfLM4bI1IzT/9
        vL/zSALVwrOG6wvRdk+wRKUzJc0UNBOH8yFcVQhywg==
X-Google-Smtp-Source: AGRyM1uVihkw2Sdalue9OE0oAHLSWWUsyLw0DH9Y+XMIaKbggZq5DpgzwDU0hZoWHWE5Iq2mk7j/ulCfYP4kQSqFlzU=
X-Received: by 2002:a7b:ce13:0:b0:3a3:102c:23d3 with SMTP id
 m19-20020a7bce13000000b003a3102c23d3mr4391193wmc.67.1658332040566; Wed, 20
 Jul 2022 08:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
In-Reply-To: <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 20 Jul 2022 08:47:08 -0700
Message-ID: <CAP-5=fXgYWuHKkfAxxTeAzTuq7PLwMd6UvBu+J+6tnqHwraSCA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] perf/hw_breakpoint: Optimize for thousands of tasks
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Jul 12, 2022 at 6:41 AM Marco Elver <elver@google.com> wrote:
>
> On Mon, 4 Jul 2022 at 17:05, Marco Elver <elver@google.com> wrote:
> >
> > The hw_breakpoint subsystem's code has seen little change in over 10
> > years. In that time, systems with >100s of CPUs have become common,
> > along with improvements to the perf subsystem: using breakpoints on
> > thousands of concurrent tasks should be a supported usecase.
> [...]
> > Marco Elver (14):
> >   perf/hw_breakpoint: Add KUnit test for constraints accounting
> >   perf/hw_breakpoint: Provide hw_breakpoint_is_used() and use in test
> >   perf/hw_breakpoint: Clean up headers
> >   perf/hw_breakpoint: Optimize list of per-task breakpoints
> >   perf/hw_breakpoint: Mark data __ro_after_init
> >   perf/hw_breakpoint: Optimize constant number of breakpoint slots
> >   perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
> >   perf/hw_breakpoint: Remove useless code related to flexible
> >     breakpoints
> >   powerpc/hw_breakpoint: Avoid relying on caller synchronization
> >   locking/percpu-rwsem: Add percpu_is_write_locked() and
> >     percpu_is_read_locked()
> >   perf/hw_breakpoint: Reduce contention with large number of tasks
> >   perf/hw_breakpoint: Introduce bp_slots_histogram
> >   perf/hw_breakpoint: Optimize max_bp_pinned_slots() for CPU-independent
> >     task targets
> >   perf/hw_breakpoint: Optimize toggle_bp_slot() for CPU-independent task
> >     targets
> [...]
>
> This is ready from our side, and given the silence, assume it's ready
> to pick up and/or have a maintainer take a look. Since this is mostly
> kernel/events, would -tip/perf/core be appropriate?

These are awesome improvements, I've added my acked-by to every
change. I hope we can pull these changes, as you say, into tip.git
perf/core and get them into 5.20.

Thanks,
Ian

> Thanks,
> -- Marco
