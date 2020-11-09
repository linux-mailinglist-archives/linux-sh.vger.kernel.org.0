Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F372ABF65
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 16:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbgKIPGA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 10:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731686AbgKIPEa (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 10:04:30 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801F2C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 07:04:30 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so8434429pfn.0
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 07:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jjNiEe+7IwA3/1780gCxWUM93smcxoBgrJjiyuw7VzY=;
        b=fwUpxIW99dLd3ve+VF3T81/CRRkijH9BF1I7J0n2UWPm+LQLcJG7QpbPRqiWCk3RsO
         fIDQ8CEGkmXskSw/5frHZLswz+gjKGcpkinoh4B2GBCbGQRMTO2cH1tCZaCThSbSMODf
         U+imaJQTtZPhkT3xh3876I78/97L/NOcbPMC+0RutcMpdc9JCnr6/+EuukTybYEKlaw2
         Cyx5691wFsZ4KDUWDyHZYN8JO3GVM03/Gi0M18P0H280nTlpSutYkT3XRw2B0p2uVrGP
         uAGxvoRoSMw//EHzpNBEIUht9+8AxV2ZFqtT5G4L/FCAnraWDZwya8eMxFjLx39BbEis
         e6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jjNiEe+7IwA3/1780gCxWUM93smcxoBgrJjiyuw7VzY=;
        b=d6Hme+bjVDNfufbqrsfbQ9I9I30uuh1MSdD1kB/Jcu/q2VVMGv8XJ2JAsEN5kbBRA8
         BfRFActX0i4qTowBxTB7Divf0LippoKL+HjfrbRNH0ze7fuH/OUc33dPrbO5xfX8JGA/
         WCMZdmYmxoBusQiJmwyPStQkLAhcuGpv+yqktsiQM+FX0AtCmjA3mx2agQEhbetWDthF
         pt9wkNn3XN17Ue0E5eYt7XM5XDf751Uv9qBsihqgyrL3+1th9KBOKC+W0GhFo15+w+pN
         Q4q08PZVbigGuwblOdr4iMACPDPut3Ks/Q1eqP+1xaS8v6PLIE8ChduV4saSTtgksdSw
         YKxw==
X-Gm-Message-State: AOAM533njCDoEPZBJZUspu+D6y6FyQeQ34uByUBqnfS7NZbjitNBGu84
        0l5z3Mlf5Nbwubf3ZOG1DSDVlJAtwVapFgV0
X-Google-Smtp-Source: ABdhPJwnzC+NpIjYe16+TU4WGxO1VtP3Zwwbl7qgmfOtEqQMZ7m6cnSvYOFSNB5Zp3bfqcIa3KlaOw==
X-Received: by 2002:a17:90a:cb93:: with SMTP id a19mr12958585pju.99.1604934270011;
        Mon, 09 Nov 2020 07:04:30 -0800 (PST)
Received: from [192.168.8.125] (mo49-107-36-253.air.mopera.net. [49.107.36.253])
        by smtp.gmail.com with ESMTPSA id u10sm11509326pfn.101.2020.11.09.07.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 07:04:29 -0800 (PST)
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
From:   Rob Landley <rob@landley.net>
Message-ID: <32d222bd-34e8-e1aa-9e17-3835039d277b@landley.net>
Date:   Mon, 9 Nov 2020 09:15:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f6914e11-5d7c-576f-4797-83f7294722aa@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 11/9/20 8:14 AM, Jens Axboe wrote:
> On 11/9/20 1:15 AM, Rob Landley wrote:
>> On 11/5/20 11:15 AM, Jens Axboe wrote:
>>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>>> Hi Jens!
>>>>
>>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>>> Gentle nudge on this one.
>>>>
>>>> I can build- and boot-test on SH and IA64.
>>>
>>> That'd be great, thanks!
>>>
>>>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
>>>
>>> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.
>>
>> It breaks my ARCH=sh j2_defconfig build:
>>
>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>> arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
>> function)
>>
>> Admittedly I'm testing a stack of 6 other patches at the same time:
>>
>> [PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
>> [PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
>> [PATCH] sh: remove CONFIG_IDE from most defconfig.eml
>> [PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
>> [PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
>> [PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml
>>
>> But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.
> 
> Yeah that's my fault, this one should be a lot better...

arch/sh/kernel/signal_32.c: In function 'do_signal':
arch/sh/kernel/signal_32.c:471:3: error: implicit declaration of function
'tracehook_notify_signal'; did you mean 'tracehook_notify_resume'?
[-Werror=implicit-function-declaration]

Keep 'em coming...

Rob
