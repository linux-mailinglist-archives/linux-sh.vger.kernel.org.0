Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB528544CFC
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239764AbiFINF4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 09:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238980AbiFINFz (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 09:05:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D0431354
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 06:05:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y32so37883900lfa.6
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOQI9nYJjsWx7RUNIP4XR5dRmZHTAqrUHXmWvjF6nBY=;
        b=X7FFvILgfoQbhrO16Zdxh9SVLvxEy8XxHsClf1zUJteoAVjCcWwi/RF6y3u4H8+0Za
         DHpnXD3XLZWCkSwQbpXBQuWjcZs+yIeVMe/o8FcP4I4JeO5gvOU627r0k+g9afDZ6ix/
         1OxHn/GxfQ5hBL1SVgRI/msxQdAL2zBCOWjMRgPzbk2JC+M8drt0uevaSbVbi8y1jM2g
         DLcEKYb2VV4E95XAjOqt8+Sed/XY6Ou2af/ft2KCmmolakWr/jMd0CE4Z/9vm4z2B59u
         FW7KmqiYXblPyAIdl+FYoOBANpgcqMqQw7CzXhxATrZLUL0VrGGWg8vcNA+fFnoLlJ9M
         H42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOQI9nYJjsWx7RUNIP4XR5dRmZHTAqrUHXmWvjF6nBY=;
        b=pFRPP//w2y/Fq7POHUT7NSCy9cNdRuVz7sBtKKkR1GXLOnG9BsxMT2oyIuzNXGvvuo
         OfVEcUp9k4LGuJKiZQyHDWIg/8x0PIJ5+1liRFzCmnwZm0nDXH7rji59U5KNSs34Jih5
         mb9q87j7FT2rWy+7aHhmFy/utChDso6NVGrLI3zE+JeK79zBPPKoTNJ9Tk1hQRV1boAj
         HQA//EQxgCkXanr2F9qpKae2H3L8hZfdgYjsn2pELaztChDH/wPSB98BNOOrUfAwfDAg
         LN0YjsmvcfXF/nfveSPtS6sNcRVGWnKQai/PFxRV3lIElnOU/6hDIHnPgqWMsWGyCz1u
         VSdg==
X-Gm-Message-State: AOAM531iTwBSVAqwI2bUMCT7AI0AcrDbpJ1Cr82JQdmO+bhXqCL7S+tq
        XageLVeTsoR5IkX6CQWNf8o51tb56R5oJOe+ym74Yw==
X-Google-Smtp-Source: ABdhPJxkLn5hvttF5zsF9zgm1UVZ5x24Zl1UOxfqmTsWE0EAiXcf3Tk1+ZeyugTCS9QDYWM3Dh9NWewl2HiF59iUyg8=
X-Received: by 2002:ac2:4f11:0:b0:479:3554:79d with SMTP id
 k17-20020ac24f11000000b004793554079dmr15389711lfr.417.1654779952199; Thu, 09
 Jun 2022 06:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113046.780504-1-elver@google.com> <20220609113046.780504-2-elver@google.com>
 <CACT4Y+ZfjLCj=wvPFhyUQLwxmcOXuK9G_a53SB=-niySExQdew@mail.gmail.com> <YqHtLvdLvdM5Lmdh@elver.google.com>
In-Reply-To: <YqHtLvdLvdM5Lmdh@elver.google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 9 Jun 2022 15:05:40 +0200
Message-ID: <CACT4Y+YWrzpdTnbcvhBb3GfZ-0GmCZuvErFZbh5abNHAV+7WZQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] perf/hw_breakpoint: Optimize list of per-task breakpoints
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

On Thu, 9 Jun 2022 at 14:53, Marco Elver <elver@google.com> wrote:
>
> On Thu, Jun 09, 2022 at 02:30PM +0200, Dmitry Vyukov wrote:
> [...]
> > > +       rcu_read_lock();
> >
> > Why do we need rcu_read_lock() here?
> > The patch does not change anything with respect to locking, so all
> > accesses to the container should still be protected by nr_bp_mutex.
> > Similarly for the rcu variant of for_each below.
> [...]
> > > +       head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
> > > +       if (!head)
> > > +               goto out;
> > > +
> > > +       rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {
>
> It's part of rhashtable's interface requirements:
>
>         /**
>          * rhltable_lookup - search hash list table
>          * @hlt:        hash table
>          * @key:        the pointer to the key
>          * @params:     hash table parameters
>          *
>          * Computes the hash value for the key and traverses the bucket chain looking
>          * for a entry with an identical key.  All matching entries are returned
>          * in a list.
>          *
>          * This must only be called under the RCU read lock.
>          *
>          * Returns the list of entries that match the given key.
>          */
>
> Beyond that, even though there might not appear to be any concurrent
> rhashtable modifications, it'll be allowed in patch 6/8. Furthermore,
> rhashtable actually does concurrent background compactions since I
> selected 'automatic_shrinking = true' (so we don't leak tons of memory
> after starting and killing those 1000s of tasks) -- there's this
> call_rcu() in lib/rhashtable.c that looks like that's when it's used.
> This work is done in a deferred work by rht_deferred_worker().


I see. Thanks.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
