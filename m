Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90FB544AEE
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 13:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244689AbiFILrY (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 07:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244644AbiFILrK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 07:47:10 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4B2E4437
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 04:45:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j20so2214728ljg.8
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SgEKCxAtx5GHqR+44FfrWhhi7CpRDkMPbE0Ct/xZup4=;
        b=Wn59IozK5z/jpjt8Q+UhuuKvGQXTYML6Wz855bP4DgDOntSmeYZtPzJNKtrlHwfvHf
         ApbXtCwKfeZ9hkhsu/hkSYT0kDL5vYvror1qbKdxxG0eCculn2KC1zsnYdh5Z3OJJXaJ
         5NaEzVt8ZA9DzqbThmfpCgKCv6J/qg9D1M7wTBZXgSSz2qD3+FK0XuiNELILE5TU27LI
         YLCa4egi9+BCmGd8KGu3bd37kTQfiL8IbIqhCIAXJpOwFaoJ9PTvisfnBF+H1VDtVFno
         R6GtChMm1zuBAx0vTWGYEU/bAmM0fIwyOLHfidKpaC8t20PfA6rVFqFtlM7yyE0bCNxG
         aWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SgEKCxAtx5GHqR+44FfrWhhi7CpRDkMPbE0Ct/xZup4=;
        b=AFoCS7r3y/F5I0k7MpXYBCMw6P7JuUT1BFF1vNGyhpnpQk0w8eC4wuVQzWidODhypX
         CxYK9WUu5zVdcBTDlXflNcHNhhbhs5aEnLERU9D3DxXjAw7utXXJau9IV+8JRgDg/tIS
         DGso6FBU2uEbjPa/QiCjC85YxwrHAElWe3n7vr3C6X57b6/leFvozoUlv71OIHB8lBeS
         oHw/ytOmEcYJYrSeq1v6TFztj0jE/oCzuljeTjyWUDg8hxcwjSWQJXBwXiIcEOr+bjnd
         BsgPqIiNZpeUFiTB9LwRpXTzsD8FlgHAB6TXTXIwjuq7wlZW/crYrKZybspzGJv6RBDu
         N15g==
X-Gm-Message-State: AOAM530te66W53WcVC0dTpCcxJ29erRz01zo9XMrjpocfnHUx2DkvnPR
        UP/v6BNjUa8LgSJamwtUlFBMNnyRVq7Pmv9JlFSEgQ==
X-Google-Smtp-Source: ABdhPJzc//2SRPZwIQ355J74Z4MT+McfEWqwj7F8FfClJc+91CoVx7/ooPiEOeCc/G2KtXyyeT2PvA9UqQV4rHuXqnA=
X-Received: by 2002:a2e:b0fc:0:b0:255:6f92:f9d4 with SMTP id
 h28-20020a2eb0fc000000b002556f92f9d4mr21861715ljl.92.1654775137344; Thu, 09
 Jun 2022 04:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113046.780504-1-elver@google.com> <20220609113046.780504-3-elver@google.com>
In-Reply-To: <20220609113046.780504-3-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 9 Jun 2022 13:45:25 +0200
Message-ID: <CACT4Y+ZM3yYYeOGBNEA8+FzjjfMcR-TiENjmCB8Dq-KSPvOWyg@mail.gmail.com>
Subject: Re: [PATCH 2/8] perf/hw_breakpoint: Mark data __ro_after_init
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, 9 Jun 2022 at 13:31, Marco Elver <elver@google.com> wrote:
>
> Mark read-only data after initialization as __ro_after_init.
>
> While we are here, turn 'constraints_initialized' into a bool.
>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/events/hw_breakpoint.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 25c94c6e918d..1f718745d569 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -47,7 +47,7 @@ struct bp_cpuinfo {
>  };
>
>  static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
> -static int nr_slots[TYPE_MAX];
> +static int nr_slots[TYPE_MAX] __ro_after_init;
>
>  static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
>  {
> @@ -63,7 +63,7 @@ static const struct rhashtable_params task_bps_ht_params = {
>         .automatic_shrinking = true,
>  };
>
> -static int constraints_initialized;
> +static bool constraints_initialized __ro_after_init;
>
>  /* Gather the number of total pinned and un-pinned bp in a cpuset */
>  struct bp_busy_slots {
> @@ -711,7 +711,7 @@ int __init init_hw_breakpoint(void)
>         if (ret)
>                 goto err;
>
> -       constraints_initialized = 1;
> +       constraints_initialized = true;
>
>         perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
>
> --
> 2.36.1.255.ge46751e96f-goog
>
