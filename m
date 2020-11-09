Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B438C2AC0BA
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 17:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgKIQX7 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 11:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbgKIQX7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 11:23:59 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D95C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 08:23:58 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id k7so4975085plk.3
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7ZEQHnvp6HWmYSv7bb0UAVEO/4WgzjW5MEaJETSm8L8=;
        b=R+gcyFPtn6H1+Pi/drrChVTQgZLHiC8QqihXnF9+2TAWjvITeByEdBIXCkBXipxTTq
         JUp0d5g0mROaD7qX6XSx3Y8IP1oqb5YpZj+d6s0fTENBRmI8u3V1SnrkWaVIDKkMT4VJ
         Ewa9BNuMsaGz9hm8sM5Y2CT/bj7nwCCL8tzvg0lb/iQ3jpOLpPb6lP1YkZDs2qPRI67x
         lNl71QNpyZYMGc5T/Jp8900b/aDt5NdHhjBlgGOkTEu26AIn0Ka2FZ2Z1vL417SaE/3b
         vUPnP4zzRnFH1/DBSflZqibHfF0MTnqkIhagPhUIRIgZa+pFRaH6JmBXssbGXMheZjsX
         oHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7ZEQHnvp6HWmYSv7bb0UAVEO/4WgzjW5MEaJETSm8L8=;
        b=ijndBxIC5I/D5Vo7jL+NKaWDjwpYM9NAoSzx1LUY7FlGDLXzAfJKOLP26u1zyeMgeM
         k+XrXMLLsj7VLni3RnFx0jI1qmYKj+aJBNfjI4qsH6g4tcMB4p7oTfZVDwPePMRg/T2A
         eGKOtljxJWe0sBj7+UFApz+d/orGFbOrHFxzH7KqCJPdFS5F8UuWkUnyk/r+AbgTnlIP
         FskzCgCV0CKb8OeDpdKjwYSgD6bauDu1shMr/pZlEiD1wDWj7NAgTvefvzBlj+xu5WGk
         HMeQ4SElcze1VTPkia0prFs3SMJf6kHSAivZxdygAewLKqYlrWKoPpkrSEdeldjSAajn
         eotQ==
X-Gm-Message-State: AOAM5312u7apeGWDSCf+BKfZFc6EVBru2pPvdoBNBsGM57JLemyjsgMw
        N9Rbfyt3VSfReKMVAlhqG2HF4UPWDKUqzQ==
X-Google-Smtp-Source: ABdhPJy5y7fnMMOMVgfELxqz2UrFu4W+WjeGL5BjreXH/pvRxKqDphsvl/YoHlXAyIwmn09HVH8x/w==
X-Received: by 2002:a17:902:a5c7:b029:d6:d4db:8279 with SMTP id t7-20020a170902a5c7b02900d6d4db8279mr13414253plq.14.1604939038469;
        Mon, 09 Nov 2020 08:23:58 -0800 (PST)
Received: from [192.168.8.125] (mo49-107-36-253.air.mopera.net. [49.107.36.253])
        by smtp.gmail.com with ESMTPSA id m10sm11867576pjr.3.2020.11.09.08.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 08:23:57 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>,
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
From:   Rob Landley <rob@landley.net>
Message-ID: <d0ed6336-e6a9-32d0-4970-09e811c97519@landley.net>
Date:   Mon, 9 Nov 2020 10:34:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <66582445-4ec9-86d0-e286-8e21590f608a@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 9:10 AM, Jens Axboe wrote:
> On 11/9/20 8:15 AM, Rob Landley wrote:
>>
>>
>> On 11/9/20 8:14 AM, Jens Axboe wrote:
>>> On 11/9/20 1:15 AM, Rob Landley wrote:
>>>> On 11/5/20 11:15 AM, Jens Axboe wrote:
>>>>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>>>>> Hi Jens!
>>>>>>
>>>>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>>>>> Gentle nudge on this one.
>>>>>>
>>>>>> I can build- and boot-test on SH and IA64.
>>>>>
>>>>> That'd be great, thanks!
>>>>>
>>>>>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
>>>>>
>>>>> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.
>>>>
>>>> It breaks my ARCH=sh j2_defconfig build:
>>>>
>>>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>>>> arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
>>>> function)
>>>>
>>>> Admittedly I'm testing a stack of 6 other patches at the same time:
>>>>
>>>> [PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
>>>> [PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
>>>> [PATCH] sh: remove CONFIG_IDE from most defconfig.eml
>>>> [PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
>>>> [PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
>>>> [PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml
>>>>
>>>> But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.
>>>
>>> Yeah that's my fault, this one should be a lot better...
>>
>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>> arch/sh/kernel/signal_32.c:471:3: error: implicit declaration of function
>> 'tracehook_notify_signal'; did you mean 'tracehook_notify_resume'?
>> [-Werror=implicit-function-declaration]
>>
>> Keep 'em coming...
> 
> Gah, it was still using the old style. This one should work and be correct,
> promise, double checked :-)

This one compiled fine. What does it do? (I ask having read
https://lwn.net/Articles/835340/ and come out none the wiser.)

I can try it on hardware in the morning, it's 1am in this time zone...

Rob
