Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F4462DDF1
	for <lists+linux-sh@lfdr.de>; Thu, 17 Nov 2022 15:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239779AbiKQOZK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 17 Nov 2022 09:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbiKQOZH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 17 Nov 2022 09:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E427720A
        for <linux-sh@vger.kernel.org>; Thu, 17 Nov 2022 06:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668695043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ero3Dop74ZUrxw/cst3yMxEJhDrRdAAQvlUsX3escHg=;
        b=KgjWlvtCKJUHs+tKAAL/SCLIigkCVUC7V242kw6Lq8Z3W//ZjUhguA8g/h8LwqO7AAsS8R
        /8xe45O5qev6v8hLRYmygDKTB2aEyPX/5PHpx/wk7Gn1MaMQ8JOZNkSOnlNuY2Q4IYVsp8
        iT09hQDK5hg5e1ej3uuQVSaPknxhZaw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-X0QYv02qOW6smlN9Y4o6gg-1; Thu, 17 Nov 2022 09:24:01 -0500
X-MC-Unique: X0QYv02qOW6smlN9Y4o6gg-1
Received: by mail-wm1-f70.google.com with SMTP id h9-20020a1c2109000000b003cfd37aec58so717546wmh.1
        for <linux-sh@vger.kernel.org>; Thu, 17 Nov 2022 06:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ero3Dop74ZUrxw/cst3yMxEJhDrRdAAQvlUsX3escHg=;
        b=ECFZ1O44yJW7c/QbiEj7/HWKX09UwJRhzCYQlyja478n8qQCBOxrRYjpKr5jy3t+6/
         XxZGW6q56s/MD8lQarvVsX0+D0notdLsXMoGSbZ7w00tKcO0hoqq1luS6ERkoK51tDoK
         qWeczB/0xaFzSsvXzaXLB45QncDG1dV7Y2kwhFTpSWNz8DQXI9a8bWdGrjw57F9KmB3y
         qORNIDp7y6pvlNc5YDDC3/vVAJFTJsASkzKeQEy5N8Stb+SPeHlnwcdWpo8PAggL+YMw
         ugmhZtFFtWFgFGmOWIbwTX3z6zJi/fGrxDx+DBn5bYAu/apSerq4+z8MN/ODfJEiV4+B
         Th/Q==
X-Gm-Message-State: ANoB5pl67bbI8l1JQ9xZvp6JE8X7F5PJ/DeP75gGV/ydT2g0ekD662CX
        sTVZLfeFZiRmK9cIies72wbrbvGXistE/eyaw8JfFtPyU+Fv4gLSFkju+i/aX1dpuPJ3fTHqegE
        9bhu4X1bTWIoAiazfY0E=
X-Received: by 2002:a5d:58fb:0:b0:236:74c5:1b2d with SMTP id f27-20020a5d58fb000000b0023674c51b2dmr1616732wrd.14.1668695040746;
        Thu, 17 Nov 2022 06:24:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7dCrVGloFO6BdNbsi4gADz4iCuS/nJ5b5vEmtvQw4WeirpWLMINwzrWmZ6QxU1sPuLDe40QQ==
X-Received: by 2002:a5d:58fb:0:b0:236:74c5:1b2d with SMTP id f27-20020a5d58fb000000b0023674c51b2dmr1616704wrd.14.1668695040586;
        Thu, 17 Nov 2022 06:24:00 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id t11-20020adff60b000000b0022e035a4e93sm1096445wrp.87.2022.11.17.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:23:59 -0800 (PST)
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
Subject: Re: [RFC PATCH v2 4/8] smp: Trace IPIs sent via
 arch_send_call_function_ipi_mask()
In-Reply-To: <Y3X5/65o8127DgZl@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-3-vschneid@redhat.com>
 <Y3X5/65o8127DgZl@hirez.programming.kicks-ass.net>
Date:   Thu, 17 Nov 2022 14:23:55 +0000
Message-ID: <xhsmhk03ty804.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 17/11/22 10:08, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:32PM +0000, Valentin Schneider wrote:
>> This simply wraps around the arch function and prepends it with a
>> tracepoint, similar to send_call_function_single_ipi().
>>
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> ---
>>  kernel/smp.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index e2ca1e2f31274..c4d561cf50d45 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -160,6 +160,13 @@ void __init call_function_init(void)
>>      smpcfd_prepare_cpu(smp_processor_id());
>>  }
>>
>> +static inline void
>
> Given the use of _RET_IP_, I would strongly recommend you use
> __always_inline.
>

Noted, thanks

>> +send_call_function_ipi_mask(const struct cpumask *mask)
>> +{
>> +	trace_ipi_send_cpumask(mask, _RET_IP_, func);
>
> What's func?
>

A rebase fail... That's only plugged in later.

>> +	arch_send_call_function_ipi_mask(mask);
>> +}

