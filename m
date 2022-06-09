Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A631F544CA5
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jun 2022 14:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245524AbiFIMxP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Jun 2022 08:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243525AbiFIMxO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Jun 2022 08:53:14 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5438012E80E
        for <linux-sh@vger.kernel.org>; Thu,  9 Jun 2022 05:53:11 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k19so32269998wrd.8
        for <linux-sh@vger.kernel.org>; Thu, 09 Jun 2022 05:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xsbD60qIHanlKuWKt+8TLbFkRT3oM/UNVHEodPGa7yk=;
        b=ogxQx9/A77IYQ/hkeDboJ31yIL2cjqX5j2tbjDpVF4T49J/STcN+TRwFrbHQjaoMLW
         ltWumxcgf2zS7G8Iw/ewsvUxc82h2ycTigV0zuzXwhTU2elDIsRMAkDYai2dVUqTJUfc
         V1l9p6AukaGvIR5nKfcLtG14Z2ISv9bBnT1QGsjiRphpW/rB5Dbc4XiC83J+5uvQ0D60
         RmKk/IUExDhpBPums6vI4w70UYQV+ou+WFx8y5AKBEPLkAOR/Y+pxn+FKKmg43coSSP0
         G9KpfHlnEJXtzStO/xypwKyMezq47b0UB6XNhOwP6YtMg59SqonDYWpPvpaI2WNG2HUq
         kqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xsbD60qIHanlKuWKt+8TLbFkRT3oM/UNVHEodPGa7yk=;
        b=pEisANPsOFtLddIIWkECyI3svtbD0tD9x/K2Jlt3ZSdlomHQx+7WF/Z8PAKNtIC42T
         OFcSIezGWPS8FopJimfgg5eYF+vAzprPalNC+r6kyqjQ9A6lnBCJHBSJlWtv85a0yJvp
         /bTkX36+pRXeWLEAyuIQbMsZkx/D9HQnra2JpypyUQCz0PTIAIy54k1exnkhx4KXOXY0
         gOS9UV+ks/Lkki5qSe4nBwGNl8MpDxN2JaC3vbeSp+uCoIWhkXhx283/la6J/Kst3+JZ
         pYixgXAkOvSgBcXwfIrgzcMy6MvcoRH+jYDubvDJEDTzxHPPO6Jd7maqcbh2jMKL01x1
         b0RA==
X-Gm-Message-State: AOAM530BxTxmDUtyMPYo7kF5WNbUGF7uRHL8l7BVP7lh9U6V+H8B5n6n
        t/0XF4dYIFYUGjDxClHEjSqEpA==
X-Google-Smtp-Source: ABdhPJyJUVWiu56wlkL1GRUdrN5r0Z2qCI6oeCaAM64dh4ZzAFCXGHnDJ6WcKQ7t2Jmgwe09MkROHA==
X-Received: by 2002:a5d:6c62:0:b0:218:3e13:4b17 with SMTP id r2-20020a5d6c62000000b002183e134b17mr20790347wrz.673.1654779189454;
        Thu, 09 Jun 2022 05:53:09 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:dcf:e5ba:10a5:1ea5])
        by smtp.gmail.com with ESMTPSA id v190-20020a1cacc7000000b003975c7058bfsm27801688wme.12.2022.06.09.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:53:08 -0700 (PDT)
Date:   Thu, 9 Jun 2022 14:53:02 +0200
From:   Marco Elver <elver@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
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
Subject: Re: [PATCH 1/8] perf/hw_breakpoint: Optimize list of per-task
 breakpoints
Message-ID: <YqHtLvdLvdM5Lmdh@elver.google.com>
References: <20220609113046.780504-1-elver@google.com>
 <20220609113046.780504-2-elver@google.com>
 <CACT4Y+ZfjLCj=wvPFhyUQLwxmcOXuK9G_a53SB=-niySExQdew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZfjLCj=wvPFhyUQLwxmcOXuK9G_a53SB=-niySExQdew@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
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

On Thu, Jun 09, 2022 at 02:30PM +0200, Dmitry Vyukov wrote:
[...]
> > +       rcu_read_lock();
> 
> Why do we need rcu_read_lock() here?
> The patch does not change anything with respect to locking, so all
> accesses to the container should still be protected by nr_bp_mutex.
> Similarly for the rcu variant of for_each below.
[...]
> > +       head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
> > +       if (!head)
> > +               goto out;
> > +
> > +       rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {

It's part of rhashtable's interface requirements:

	/**
	 * rhltable_lookup - search hash list table
	 * @hlt:	hash table
	 * @key:	the pointer to the key
	 * @params:	hash table parameters
	 *
	 * Computes the hash value for the key and traverses the bucket chain looking
	 * for a entry with an identical key.  All matching entries are returned
	 * in a list.
	 *
	 * This must only be called under the RCU read lock.
	 *
	 * Returns the list of entries that match the given key.
	 */

Beyond that, even though there might not appear to be any concurrent
rhashtable modifications, it'll be allowed in patch 6/8. Furthermore,
rhashtable actually does concurrent background compactions since I
selected 'automatic_shrinking = true' (so we don't leak tons of memory
after starting and killing those 1000s of tasks) -- there's this
call_rcu() in lib/rhashtable.c that looks like that's when it's used.
This work is done in a deferred work by rht_deferred_worker().
