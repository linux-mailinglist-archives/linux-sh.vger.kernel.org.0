Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4146545B7F0
	for <lists+linux-sh@lfdr.de>; Wed, 24 Nov 2021 11:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhKXKEE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 24 Nov 2021 05:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240686AbhKXKED (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 24 Nov 2021 05:04:03 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3DCC061714
        for <linux-sh@vger.kernel.org>; Wed, 24 Nov 2021 02:00:54 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id o17so2106354qtk.1
        for <linux-sh@vger.kernel.org>; Wed, 24 Nov 2021 02:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iTip3zjoaCYhKmrHStlw/96GAieYO23jO54AgZhxXpQ=;
        b=XAB6o0iiekLaesOj6pa3ZhCRpY24snyaj6PrzZMbSXxyUpiI9ibbLCexIDQg+duaBt
         /DtNhPQtkaX0cv1WqdZbENlTNUv9wzLbXiB9RWo/cUAM3ZCRzAG5IEz6cnkgN+/mQ2bv
         mJNx7Ww6C42d7nY3g7L3zkYGX1MUyoIygsj91yGDAVGOKLvU38STZSQUmFyvgGl+LcQO
         NFQ/mbnXgG83sG3CJofvogej3iVMz6cuYsQMLstH216ptxf1/StcuHrR1RdJ1QNMy2DX
         h83BfZXr4et0PHmJVzZ0Zxu4QSM4QAzRYLvuI01/ECkillwvD+bBa3dFrkzTCRcoVzqx
         l/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iTip3zjoaCYhKmrHStlw/96GAieYO23jO54AgZhxXpQ=;
        b=A6BoI1QBPrYkJwmFxwp9NFRTjS+MtZxi2QiU+tygazjVpuUo9WqvppzuSnvZSWvJcs
         lBk1DhbCL9FLxnwURvvZhA3gVmzOYNo/obUdnLxqvwt0dPasmSuWLM3X7hfIsb0z1xTV
         KsGgvin1Qr0r/OYzKvQACC5AXO+dPjyd6rCyx1Z/deUbUgHacD9x9hndvBblHPONwOti
         4ExY9a0yEusKMF/T2dQZzruFizF+13erksniu3McDXfqk28ej5WnUIIswMg/h6uAtkFT
         6scWqlAI6nyyq9VEgRCArE5qM6HLGJNoomYIGizHiKUbNp/2eTJBxCZeYnUtuB8QV7SP
         ruzA==
X-Gm-Message-State: AOAM532E6/A+ZEGM75YIpWNQ1BxrOfckKOhI3wGXh+1Y6EM1GrXe69lI
        hhq/8fYJJ4F1zkfAw+bBRen34g==
X-Google-Smtp-Source: ABdhPJyopaP923RuI2NatMVDep88Hu69ElihFfj/a2EDSlHx3pxirUo8hwy1Xb4U0RR66Kc5jHS95Q==
X-Received: by 2002:ac8:5781:: with SMTP id v1mr5491171qta.254.1637748053362;
        Wed, 24 Nov 2021 02:00:53 -0800 (PST)
Received: from ?IPv6:2607:fb90:c301:886e:6680:99ff:fe6f:cb54? ([2607:fb90:c301:886e:6680:99ff:fe6f:cb54])
        by smtp.gmail.com with ESMTPSA id 16sm7966336qty.2.2021.11.24.02.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 02:00:52 -0800 (PST)
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
To:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <8767803d-57b9-698c-ca27-d47e7117758d@landley.net>
Date:   Wed, 24 Nov 2021 04:01:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 11/23/21 7:19 AM, Arnd Bergmann wrote:
> On Tue, Nov 23, 2021 at 12:38 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
>>
>> While building Linux next 20211123 tag for sh with gcc-11
>> following warnings / errors noticed.
> 
> Nothing in here looks like a recent regression from either the kernel
> or gcc-11.
> 
>> make --silent --keep-going --jobs=8
>> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=sh
>> CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
>> 'HOSTCC=sccache gcc'
>>   Generating include/generated/machtypes.h
>> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
> 
> These happen with any compiler version, someone needs to write the correct
> entry code for clone3 and hook up futex_waitv().

I did a naieve "add them both to the .tbl" patch and the result booted to a
shell prompt, but that doesn't mean much. What arch-specific entry code does
clone3 need here? The SYSCALL_DEFINE2(clone3) in kernel/fork.c seems reasonably
straightforward? (Unlike the #ifdef stack around the previous clone...)

>> include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements
> 
> These are old bugs, they show up in any kernel version with gcc-8 or higher.

I looked at trying to fix that but it seems to be a compiler bug. Gcc is warning
about an ? : else case that's dead code eliminated. It's already GOT a test
protecting it from being evaluated...

>> fs/mpage.c:336:1: warning: the frame size of 1092 bytes is larger than
> 
> I see these going back to gcc-6, it looks like this is caused by
> CONFIG_PAGE_SIZE_64KB.

In which case the stack size is going to be 64k as well?

>      Arnd

Rob
