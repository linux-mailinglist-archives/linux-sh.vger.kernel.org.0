Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0C2653DD6
	for <lists+linux-sh@lfdr.de>; Thu, 22 Dec 2022 11:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiLVKDD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 22 Dec 2022 05:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiLVKDB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 22 Dec 2022 05:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D0724083
        for <linux-sh@vger.kernel.org>; Thu, 22 Dec 2022 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671703334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o6jO/LCV2IF2UxvEuH5GPFWr6SJ3JZsJjPnFQmLY128=;
        b=VPSAzvZsd0VOW0Pl30eVauKyaeyjrHeZyCKLjc73aCE0sDFNugWd332Tf8Gnf2vM6ktSsq
        o4AXqF1IvloyT4WAPqILWIDn4nvNCDVbbf9ElBuTPa5ti0AU/YRO/UojBqvS08s5Y6pfM8
        3mkvIzE4KULEPGaldccqosp5ef/3JS4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-FG-_xJbYOfiWM1fRJ8a9dA-1; Thu, 22 Dec 2022 05:02:11 -0500
X-MC-Unique: FG-_xJbYOfiWM1fRJ8a9dA-1
Received: by mail-qk1-f197.google.com with SMTP id r6-20020a05620a298600b007025c3760d4so925720qkp.1
        for <linux-sh@vger.kernel.org>; Thu, 22 Dec 2022 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6jO/LCV2IF2UxvEuH5GPFWr6SJ3JZsJjPnFQmLY128=;
        b=QduAW+LNq0toLBtCQQU1fuUYXWCBSEK25UKJqPqIujPDsGMUz25q8+oWJrwO/o4pnM
         SKUlRdzFlKCgEc5rAcDjaeHWbqK0Smr7SdLRto/TA1f1eOXm9tKDe4iPSdAwq0ro4mPO
         bl/ro65yUhZvBzTWP9JsQ7CO/uptoGFxUE6j7G6R1WqosMjz+XWan7n/BT3zQ9odIGFU
         Kv+OXRzvoP0hIwobtuy8WHvxL9AR0QLMPKS06IcN5PF+8zKR50mrn9NGZrzM09PsWy7P
         2IZ3/PLPZ6KLbMhSmcm7PEMJ5q4ljAHDnkSEDJQm+bBZldZMUpMfDmlTMJFsw/MJ0GMf
         Xr+w==
X-Gm-Message-State: AFqh2krr6GlO/yOCKncy622Gcm6J9KJJ/+OJWLXMXPwvYe6DDSmmvkes
        ELjAknzgpwofi8sx2Bb4Ul2eM8tYrw4jOKb6c1Psh8Isabedom6N2kTJzWX1y46X9WxNmNPfGKa
        5gH16LS6RETsWJGM+0Tg=
X-Received: by 2002:a0c:c508:0:b0:4e5:a127:382f with SMTP id x8-20020a0cc508000000b004e5a127382fmr6466228qvi.48.1671703331047;
        Thu, 22 Dec 2022 02:02:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZnBvcAi4VqZ0nAfseRa5ZZncJObkgh59kN1yODkWBS5WICo+kLsdO+KK5pqcbrrZqdW1DHQ==
X-Received: by 2002:a0c:c508:0:b0:4e5:a127:382f with SMTP id x8-20020a0cc508000000b004e5a127382fmr6466171qvi.48.1671703330733;
        Thu, 22 Dec 2022 02:02:10 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-101-173.dyn.eolo.it. [146.241.101.173])
        by smtp.gmail.com with ESMTPSA id f1-20020a05620a408100b006cfc9846594sm4269qko.93.2022.12.22.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 02:02:10 -0800 (PST)
Message-ID: <8d91ab13f56e88af0f6133130808f9623b3adb2e.camel@redhat.com>
Subject: Re: [PATCH] treewide: Convert del_timer*() to timer_shutdown*()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anna-Maria Gleixner <anna-maria@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Julia Lawall <Julia.Lawall@inria.fr>, linux-sh@vger.kernel.org,
        cgroups@vger.kernel.org, linux-block@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-scsi@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-ext4@vger.kernel.org,
        linux-nilfs@vger.kernel.org, bridge@lists.linux-foundation.org,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        lvs-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Date:   Thu, 22 Dec 2022 11:02:01 +0100
In-Reply-To: <20221220134519.3dd1318b@gandalf.local.home>
References: <20221220134519.3dd1318b@gandalf.local.home>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 2022-12-20 at 13:45 -0500, Steven Rostedt wrote:
> [
>   Linus,
> 
>     I ran the script against your latest master branch:
>     commit b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> 
>     As the timer_shutdown*() code is now in your tree, I figured
>     we can start doing the conversions. At least add the trivial ones
>     now as Thomas suggested that this gets applied at the end of the
>     merge window, to avoid conflicts with linux-next during the
>     development cycle. I can wait to Friday to run it again, and
>     resubmit.
> 
>     What is the best way to handle this?
> ]
> 
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Due to several bugs caused by timers being re-armed after they are
> shutdown and just before they are freed, a new state of timers was added
> called "shutdown". After a timer is set to this state, then it can no
> longer be re-armed.
> 
> The following script was run to find all the trivial locations where
> del_timer() or del_timer_sync() is called in the same function that the
> object holding the timer is freed. It also ignores any locations where the
> timer->function is modified between the del_timer*() and the free(), as
> that is not considered a "trivial" case.
> 
> This was created by using a coccinelle script and the following commands:
> 
>  $ cat timer.cocci
> @@
> expression ptr, slab;
> identifier timer, rfield;
> @@
> (
> -       del_timer(&ptr->timer);
> +       timer_shutdown(&ptr->timer);
> > 
> -       del_timer_sync(&ptr->timer);
> +       timer_shutdown_sync(&ptr->timer);
> )
>   ... when strict
>       when != ptr->timer
> (
>         kfree_rcu(ptr, rfield);
> > 
>         kmem_cache_free(slab, ptr);
> > 
>         kfree(ptr);
> )
> 
>  $ spatch timer.cocci . > /tmp/t.patch
>  $ patch -p1 < /tmp/t.patch
> 
> Link: https://lore.kernel.org/lkml/20221123201306.823305113@linutronix.de/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

For the networking bits:

>  drivers/net/ethernet/intel/i40e/i40e_main.c      |  6 +++---
>  drivers/net/ethernet/marvell/sky2.c              |  2 +-
>  drivers/net/ethernet/sun/sunvnet.c               |  2 +-
>  drivers/net/usb/sierra_net.c                     |  2 +-
>  net/802/garp.c                                   |  2 +-
>  net/802/mrp.c                                    |  4 ++--
>  net/bridge/br_multicast.c                        |  8 ++++----
>  net/bridge/br_multicast_eht.c                    |  4 ++--
>  net/core/gen_estimator.c                         |  2 +-
>  net/ipv4/ipmr.c                                  |  2 +-
>  net/ipv6/ip6mr.c                                 |  2 +-
>  net/mac80211/mesh_pathtbl.c                      |  2 +-
>  net/netfilter/ipset/ip_set_list_set.c            |  2 +-
>  net/netfilter/ipvs/ip_vs_lblc.c                  |  2 +-
>  net/netfilter/ipvs/ip_vs_lblcr.c                 |  2 +-
>  net/netfilter/xt_IDLETIMER.c                     |  4 ++--
>  net/netfilter/xt_LED.c                           |  2 +-
>  net/sched/cls_flow.c                             |  2 +-
>  net/sunrpc/svc.c                                 |  2 +-
>  net/tipc/discover.c                              |  2 +-
>  net/tipc/monitor.c                               |  2 +-

Acked-by: Paolo Abeni <pabeni@redhat.com>

