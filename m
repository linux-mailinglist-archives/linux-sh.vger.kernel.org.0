Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259FC57FDFE
	for <lists+linux-sh@lfdr.de>; Mon, 25 Jul 2022 13:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiGYLB2 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 25 Jul 2022 07:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbiGYLB1 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 25 Jul 2022 07:01:27 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760C9AE55
        for <linux-sh@vger.kernel.org>; Mon, 25 Jul 2022 04:01:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id k85so19348014ybk.7
        for <linux-sh@vger.kernel.org>; Mon, 25 Jul 2022 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hnm/5jPi/oqeCaQaqiY7o9Mgs5EnAdp5rIAWl4CX1kc=;
        b=E3q3Uy+KE30s3i9aCOl8AotGVDDShiXI7tWYkdizXOWArvf4tCCKrrqgQQ+YkeOGMm
         JDZXyDdGc/Uy1nkQfdfP8PF5dqX8nk6czkkh8l5sGQ583o9cap9IXxSoNArL0baijSwt
         zxeqokI9/BAh+Kpu6s6ZhCETT0Cktr5+QqYK8cEs+7TfRw5jw7YZ7zwqspzZo5C9BLvR
         5uISoADuepWhs+rjDzP1giy3xy79mqbzcC3qlpiBZ/VLbqFYtOecxkQkVGrV6aGMsObC
         ELKTuHvvUvXvFC6VwmucZ+kr2LAnyx0MLuRN/eCgrT7ajUJwPwKB1iGwhNyH/jqqBifR
         kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hnm/5jPi/oqeCaQaqiY7o9Mgs5EnAdp5rIAWl4CX1kc=;
        b=upzNolSEnfPTWPruEUKIy8vBZ5OIr9hihvqYbDvZpwkdlnVPbixjwR9J+czJEBs/UQ
         ioJxXYDOkXy4s6e5cJ7k12zxmEEGLWVyvn/oL22qTBhByYCfNImsKP49aQz8Vzpny4cQ
         JL7seJVvO2Zp9GyZ6m+JP2XN0G7XBBO5UjVX1g0Az4HgYy2IHfvFhLax7vqnhbJoy2wn
         g1ASAqvGjnik+LJ925wUrD8inTqnDR9Kqncd+BEVbnKCmZKY2Rwz73nGRIEpNp94IkvS
         cJIXdUPfx04rN586+eNFLV9M4Oev/eNGiT21E7m1blhQS23S8PwZ+dht73A7ir2YQob6
         S5LQ==
X-Gm-Message-State: AJIora8y9nsNVxqAZzA1Ioq57rt1AQ+yLVq8adLFNhWa483H8XLq6wX1
        0WfUPJaSoFVfgQz7DH6dS+q2qCYT1mA5Qzd1cEX41g==
X-Google-Smtp-Source: AGRyM1s4PTcghivRcD1z3aK99V0VtYiFFUccAGTBIJw4jlLGmDG/y/3ylLenSc8tzgZ6jqSK70Df541MERbbmnr4XaI=
X-Received: by 2002:a25:c602:0:b0:670:90ba:98fb with SMTP id
 k2-20020a25c602000000b0067090ba98fbmr8445943ybf.143.1658746885541; Mon, 25
 Jul 2022 04:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-2-elver@google.com>
 <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 25 Jul 2022 13:00:48 +0200
Message-ID: <CANpmjNMk+p1bAEKe6Em6n0_6_1O2Aco7g9v1hcVj54hKdGJ4ug@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org,
        x86@kernel.org, linux-sh@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>
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

On Thu, 21 Jul 2022 at 18:22, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Marco,
>
> [adding Will]
>
> On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> > Add KUnit test for hw_breakpoint constraints accounting, with various
> > interesting mixes of breakpoint targets (some care was taken to catch
> > interesting corner cases via bug-injection).
> >
> > The test cannot be built as a module because it requires access to
> > hw_breakpoint_slots(), which is not inlinable or exported on all
> > architectures.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> As mentioned on IRC, I'm seeing these tests fail on arm64 when applied atop
> v5.19-rc7:
>
> | TAP version 14
> | 1..1
> |     # Subtest: hw_breakpoint
> |     1..9
> |     ok 1 - test_one_cpu
> |     ok 2 - test_many_cpus
> |     # test_one_task_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 3 - test_one_task_on_all_cpus
> |     # test_two_tasks_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 4 - test_two_tasks_on_all_cpus
> |     # test_one_task_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 5 - test_one_task_on_one_cpu
> |     # test_one_task_mixed: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 6 - test_one_task_mixed
> |     # test_two_tasks_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 7 - test_two_tasks_on_one_cpu
> |     # test_two_tasks_on_one_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 8 - test_two_tasks_on_one_all_cpus
> |     # test_task_on_all_and_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 9 - test_task_on_all_and_one_cpu
> | # hw_breakpoint: pass:2 fail:7 skip:0 total:9
> | # Totals: pass:2 fail:7 skip:0 total:9
>
> ... which seems to be becasue arm64 currently forbids per-task
> breakpoints/watchpoints in hw_breakpoint_arch_parse(), where we have:
>
>         /*
>          * Disallow per-task kernel breakpoints since these would
>          * complicate the stepping code.
>          */
>         if (hw->ctrl.privilege == AARCH64_BREAKPOINT_EL1 && bp->hw.target)
>                 return -EINVAL;
>
> ... which has been the case since day one in commit:
>
>   478fcb2cdb2351dc ("arm64: Debugging support")
>
> I'm not immediately sure what would be necessary to support per-task kernel
> breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
> invasive.

Thanks for investigating - so the test is working as intended. ;-)

However it's a shame that arm64's support is limited. And what Will
said about possible removal/rework of arm64 hw_breakpoint support
doesn't sound too reassuring.

We will definitely want to revisit arm64's hw_breakpoint support in future.

Thanks,
-- Marco
