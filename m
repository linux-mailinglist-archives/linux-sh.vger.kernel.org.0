Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368806C4A41
	for <lists+linux-sh@lfdr.de>; Wed, 22 Mar 2023 13:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCVMVa (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 22 Mar 2023 08:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCVMV0 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 22 Mar 2023 08:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E54026BE
        for <linux-sh@vger.kernel.org>; Wed, 22 Mar 2023 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679487639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hPXFCTl8qif3OA4s3YNypS2WhS0XvH7qdHBOusQ/gQI=;
        b=YAxhCDZ7zuff0hxJriNCNI/IHuGCMIdwBOFuOdkHHnOpSK8kx1wNrtrQnimQqVxX18OEVn
        hHNX7pyphAS80AO4UCkgsin+W4N44mod4q/vUa+//8FXNgbvdzTBzaD3oa75FTmdLQOXoK
        D3sBMytS7XCmW2Ir7b/wRWhGMui8ov4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-fS2l8FKTNLWAMWgqEDyjQw-1; Wed, 22 Mar 2023 08:20:36 -0400
X-MC-Unique: fS2l8FKTNLWAMWgqEDyjQw-1
Received: by mail-qt1-f197.google.com with SMTP id l2-20020ac87242000000b003bfecc6d046so10777413qtp.17
        for <linux-sh@vger.kernel.org>; Wed, 22 Mar 2023 05:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487636;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPXFCTl8qif3OA4s3YNypS2WhS0XvH7qdHBOusQ/gQI=;
        b=naz9sFk+AHfmrCXs6QCn12AMCdFJ5H6zQBnyTqyBLODFBZIkXe4PjkLphP958tfvYW
         7yZJIWk4gBd9USLG8nn+ZwSm47OIlx+SrF1IFAe1GkcFdtEyGEs0GRDKXVelkLjxfsvO
         jbZZmRWRqAYExpfIERalb62961KgaZLEeVucbQrE8FNUbxXrpdIsdz55qlMjOnr4nxSs
         3WtPJv0Vjin4ryPdHfzqzp1b0knAAYOG4DB518c2JTQKEdxW4LVuUyDx7I8h5jjLUbSv
         PPegNAYb8SPr0I/0MfH9E+4Bv27qJAFOFIdpWO60bVCih5W9H6RHGzpcLOc5y6lDDk+7
         UnVg==
X-Gm-Message-State: AO0yUKWtrj0A4/uxB7w2jR46aDvgbY2QLY2GQlupbqsICmt1HUuaqzl2
        hX9xXcmw/OpKbAxirB0RFt/MZqFFcTkTcFfMt6Ma+KyTuhkoNL5o8mrf2LHmFmXEvDWs8XTQkor
        V3C7cQpb1qTcmrBAtBEE=
X-Received: by 2002:a05:6214:e6e:b0:5c5:95db:858a with SMTP id jz14-20020a0562140e6e00b005c595db858amr5249089qvb.31.1679487636122;
        Wed, 22 Mar 2023 05:20:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set+c4qgqaBQUslatTuVuP/CBQYeSmWHcWFFuVnFTR+yoMggQM+H4NTuj8PmuW7zmUDZ2oj+NWg==
X-Received: by 2002:a05:6214:e6e:b0:5c5:95db:858a with SMTP id jz14-20020a0562140e6e00b005c595db858amr5249039qvb.31.1679487635822;
        Wed, 22 Mar 2023 05:20:35 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id d185-20020a37b4c2000000b007425ef4cbc2sm11175799qkf.100.2023.03.22.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:20:35 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
Date:   Wed, 22 Mar 2023 12:20:28 +0000
Message-ID: <xhsmhmt45c703.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 22/03/23 10:53, Peter Zijlstra wrote:
> On Tue, Mar 07, 2023 at 02:35:58PM +0000, Valentin Schneider wrote:
>
>> @@ -477,6 +490,25 @@ static __always_inline void csd_unlock(struct __call_single_data *csd)
>>      smp_store_release(&csd->node.u_flags, 0);
>>  }
>>
>> +static __always_inline void
>> +raw_smp_call_single_queue(int cpu, struct llist_node *node, smp_call_func_t func)
>> +{
>> +	/*
>> +	 * The list addition should be visible to the target CPU when it pops
>> +	 * the head of the list to pull the entry off it in the IPI handler
>> +	 * because of normal cache coherency rules implied by the underlying
>> +	 * llist ops.
>> +	 *
>> +	 * If IPIs can go out of order to the cache coherency protocol
>> +	 * in an architecture, sufficient synchronisation should be added
>> +	 * to arch code to make it appear to obey cache coherency WRT
>> +	 * locking and barrier primitives. Generic code isn't really
>> +	 * equipped to do the right thing...
>> +	 */
>> +	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
>> +		send_call_function_single_ipi(cpu, func);
>> +}
>> +
>>  static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
>>
>>  void __smp_call_single_queue(int cpu, struct llist_node *node)
>> @@ -493,21 +525,25 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
>>              }
>>      }
>>  #endif
>>      /*
>> +	 * We have to check the type of the CSD before queueing it, because
>> +	 * once queued it can have its flags cleared by
>> +	 *   flush_smp_call_function_queue()
>> +	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
>> +	 * executes migration_cpu_stop() on the remote CPU).
>>       */
>> +	if (trace_ipi_send_cpumask_enabled()) {
>> +		call_single_data_t *csd;
>> +		smp_call_func_t func;
>> +
>> +		csd = container_of(node, call_single_data_t, node.llist);
>> +		func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
>> +			sched_ttwu_pending : csd->func;
>> +
>> +		raw_smp_call_single_queue(cpu, node, func);
>> +	} else {
>> +		raw_smp_call_single_queue(cpu, node, NULL);
>> +	}
>>  }
>
> Hurmph... so we only really consume @func when we IPI. Would it not be
> more useful to trace this thing for *every* csd enqeued?

It's true that any CSD enqueued on that CPU's call_single_queue in the
[first CSD llist_add()'ed, IPI IRQ hits] timeframe is a potential source of
interference.

However, can we be sure that first CSD isn't an indirect cause for the
following ones? say the target CPU exits RCU EQS due to the IPI, there's a
bit of time before it gets to flush_smp_call_function_queue() where some other CSD
could be enqueued *because* of that change in state.

I couldn't find a easy example of that, I might be biased as this is where
I'd like to go wrt IPI'ing isolated CPUs in usermode. But regardless, when
correlating an IPI IRQ with its source, we'd always have to look at the
first CSD in that CSD stack.

