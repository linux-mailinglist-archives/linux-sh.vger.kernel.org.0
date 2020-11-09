Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3BB2AC0DF
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 17:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgKIQ3a (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 11:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgKIQ3a (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 11:29:30 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A665C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 08:29:30 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id k21so10390948ioa.9
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lPd1qsM6q9qgaYIsrvlamG13f862AoOizeH3WW4pluc=;
        b=eEpFQQELRdJqKJV4+rH0K6useJMdbjG8stxAYLLInJK8IuO9wrTdQVGaIeNDhdIN4J
         jheNhuoUCyPrF56y6WI0X3y6bGq86fCE9K6qvLGHrAhRrMkx1e0FVjOw1y/IvSnBV9MN
         yV93XNW+6hMKX+Uml5RB7wqCP+cHE06ORYMtI1pCWQSNVmilPx6J5bjiBKCVpC65ohGR
         nSYyR4rBVqPXOg80OYRA0O58ch4BNigWDI0aHJDgiYSo710u5WwrJk/WSfuE2Uri80Xe
         cJ3m50EvSxp6AKxEnPlh528sMfrGSRT9S09CWWhtLoZJ9HVyi+M8y+1crBACzFd6LC2b
         HUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lPd1qsM6q9qgaYIsrvlamG13f862AoOizeH3WW4pluc=;
        b=MfEs6bwouplE2O0c8QoH8K23Ap7a4GrEiBQ9jphM0QJf0EzwdHOh6rRsVGiDRN77s7
         oz/sY8YkNdOygYKH7kkHWVZFjo8P6NtaNRTcskVAOGCGEKKOY5mEfg3VojZizrx68xaN
         SWZ9MO0ZY6ZL0lCU6gNXwCktoiSs0bvc+0OJpd/IVCNJ6cAcJ3i3nGURlbBkRzS4rheA
         /5jc4S7xrn25IdSITgDsSmGwhcGWHt31B5ki32dorwVzSOASrVJYBIa0+EBTfyKdGNwk
         a2zgdetgnJ9B4oHLT1T+PVzC3+7cv+yzzM4w70pdWTjlD1r5U+LJSyFM+glb/F5pxRmX
         XyaA==
X-Gm-Message-State: AOAM531rjsKPdCzjJmajO7xqxZrYZkMJtc5wiafGgeVQuLAnaqzWg2Ge
        g5tc/mEVJY7PNKy8Ioeyl2j0UGr1gM8Bdg==
X-Google-Smtp-Source: ABdhPJxv467vgJ747JwkGGv3vcbD7ZbB1T5/y+f/Fz31EKHs/zQBeBPByHKjJsmtdWAgxs2XSMVq+A==
X-Received: by 2002:a6b:b3d6:: with SMTP id c205mr10802440iof.68.1604939369393;
        Mon, 09 Nov 2020 08:29:29 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id m7sm1479466iln.16.2020.11.09.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 08:29:28 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org, Rich Felker <dalias@libc.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
 <526461bb-4cb0-a5cc-b933-2d7b2a37bd5d@landley.net>
 <f6914e11-5d7c-576f-4797-83f7294722aa@kernel.dk>
 <32d222bd-34e8-e1aa-9e17-3835039d277b@landley.net>
 <66582445-4ec9-86d0-e286-8e21590f608a@kernel.dk>
 <d0ed6336-e6a9-32d0-4970-09e811c97519@landley.net>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <1222fc17-dc3b-5def-e9c1-743b2436d6d7@kernel.dk>
Date:   Mon, 9 Nov 2020 09:29:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0ed6336-e6a9-32d0-4970-09e811c97519@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 9:34 AM, Rob Landley wrote:
> On 11/9/20 9:10 AM, Jens Axboe wrote:
>> On 11/9/20 8:15 AM, Rob Landley wrote:
>>>
>>>
>>> On 11/9/20 8:14 AM, Jens Axboe wrote:
>>>> On 11/9/20 1:15 AM, Rob Landley wrote:
>>>>> On 11/5/20 11:15 AM, Jens Axboe wrote:
>>>>>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>>>>>> Hi Jens!
>>>>>>>
>>>>>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>>>>>> Gentle nudge on this one.
>>>>>>>
>>>>>>> I can build- and boot-test on SH and IA64.
>>>>>>
>>>>>> That'd be great, thanks!
>>>>>>
>>>>>>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
>>>>>>
>>>>>> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.
>>>>>
>>>>> It breaks my ARCH=sh j2_defconfig build:
>>>>>
>>>>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>>>>> arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
>>>>> function)
>>>>>
>>>>> Admittedly I'm testing a stack of 6 other patches at the same time:
>>>>>
>>>>> [PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
>>>>> [PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
>>>>> [PATCH] sh: remove CONFIG_IDE from most defconfig.eml
>>>>> [PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
>>>>> [PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
>>>>> [PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml
>>>>>
>>>>> But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.
>>>>
>>>> Yeah that's my fault, this one should be a lot better...
>>>
>>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>>> arch/sh/kernel/signal_32.c:471:3: error: implicit declaration of function
>>> 'tracehook_notify_signal'; did you mean 'tracehook_notify_resume'?
>>> [-Werror=implicit-function-declaration]
>>>
>>> Keep 'em coming...
>>
>> Gah, it was still using the old style. This one should work and be correct,
>> promise, double checked :-)
> 
> This one compiled fine. What does it do? (I ask having read
> https://lwn.net/Articles/835340/ and come out none the wiser.)

The motivation is in another patch:

https://git.kernel.dk/cgit/linux-block/commit/?h=tif-task_work&id=fdb5f027ce662d1e10d8d16793b1f588b8543277

Basically it decouples TWA_SIGNAL task_work from actual signals, since
they contend on the sighand lock, particularly for threads. Hence the
goal is to get all archs supporting TIF_NOTIFY_SIGNAL, so we can use
that for TWA_SIGNAL.

The patches are done such that the signal handling core still handles
running the task_work, but if invoked without TIF_SIGPENDING, we don't
do actual signal delivery, just the syscall restart part.

> I can try it on hardware in the morning, it's 1am in this time zone...

Thanks, that'd be great! It really should be a no-op, as you can see
from the final patch, it's just masking in an extra flag for when to
call get_signal(). At least it should've been, if I hadn't neglected
to properly updated the 'sh' patch for the cleaner setup...

-- 
Jens Axboe

