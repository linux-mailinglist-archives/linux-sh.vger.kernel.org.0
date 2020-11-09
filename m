Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF272AB217
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 09:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgKIIET (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 03:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIIET (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 03:04:19 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAC0C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 00:04:18 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id b12so4341690plr.4
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LQ0unshn/kGVhfHK4X51JGfyh/PQ24r/l4kI8/vv+p8=;
        b=tGNPVd4PoVOrLynWPwte8LSub9ddSXZ5pVOqU4tHAaNvEKdaadwd8AnPssiQs51Zpu
         2FyRqL17wSm2kJhAKMZH56CVK+n31a8RyhRv+841QysbISJXnIdd+Z/DMEHRhaB/uZaV
         gvmYDIHvifeoh9BMg7nPotmw3Sa6764Oi386dACsH9pXRQHpQmj4AV6vDWudb2hwCu7x
         zrNqCu61t71sXJlrC3kpbUtVhyXSYuEDBVoAKO6YFrjSvDx7+GoiyH0keOONRtX2OczV
         dr+hHEYB0PIXjjgxC8EppKJ/Ks60B2Ia78rgqhtD71Mkgy95Jj2Xd01vTRLECttpNWsp
         jJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LQ0unshn/kGVhfHK4X51JGfyh/PQ24r/l4kI8/vv+p8=;
        b=U0Dz/d9fUcy3fjHm0ox9JRZHXOYDuJeQxFmt7r8oh8Uz0fCnrBwj3zP5TBJgkYJ2gz
         XdB18FTnowaABRhYip7Nk++IBuG+z3F4ZErIN4HlInmBHpdlLFAIvtXN/2iw0P7A6O5q
         LiK89aJEYy+90c0IVaSEpuUj6y+b0VujTae0zHJcRLzXaJCRGYbqXlldTdjFWKVHI5hQ
         qKvHmiI6Jn5HPvLNFHKVZN/JUFphaIHPOABsKvl19rETtplzlrzffgD25j9kTlrbpO55
         cie4VogL+dJLYbApEhcEIDtsljZKahQEuHSoNFK6n4qetkc0MHMO/Ng3V+IOZJmWXN2e
         2yQw==
X-Gm-Message-State: AOAM5333MXajW9QiMYIVWOIwg5HlbJ7FvXgclPZv4B/VqAP8PgloOQaT
        OEdRfyLfH3gfVb0eOi3wkGOWtqt8UDJpZV2b
X-Google-Smtp-Source: ABdhPJwS18uugEXvj2WJyCi7sNyKO/Ir4J636bJS+6rzn/e3h1lh0CCS1Vm9IH0wMhD5FtnfB64Pog==
X-Received: by 2002:a17:902:b688:b029:d6:ad52:ffab with SMTP id c8-20020a170902b688b02900d6ad52ffabmr1015399pls.61.1604909058303;
        Mon, 09 Nov 2020 00:04:18 -0800 (PST)
Received: from [192.168.11.16] (softbank126112255110.biz.bbtec.net. [126.112.255.110])
        by smtp.gmail.com with ESMTPSA id gk22sm7061959pjb.39.2020.11.09.00.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 00:04:17 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org, Rich Felker <dalias@libc.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
From:   Rob Landley <rob@landley.net>
Message-ID: <526461bb-4cb0-a5cc-b933-2d7b2a37bd5d@landley.net>
Date:   Mon, 9 Nov 2020 02:15:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/5/20 11:15 AM, Jens Axboe wrote:
> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>> Hi Jens!
>>
>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>> Gentle nudge on this one.
>>
>> I can build- and boot-test on SH and IA64.
> 
> That'd be great, thanks!
> 
>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
> 
> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.

It breaks my ARCH=sh j2_defconfig build:

arch/sh/kernel/signal_32.c: In function 'do_signal':
arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
function)

Admittedly I'm testing a stack of 6 other patches at the same time:

[PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
[PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
[PATCH] sh: remove CONFIG_IDE from most defconfig.eml
[PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
[PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
[PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml

But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.

Rob
