Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931F92ABE4F
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 15:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgKIOO1 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 09:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730204AbgKIOO1 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 09:14:27 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3009C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 06:14:26 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id s10so9926662ioe.1
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 06:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UZC4hrOtfkTcv0UvkDY810492SZaLE24k/Cz3myr5rI=;
        b=HiXCi7NrND7hs3hOMvLEttGylcp3MxyNq/cViEHEav1uKIt9mloivw2EP5e6dk1eDx
         nRLKWPT3Bam08oUUzwgTDzV2R4oDDigcQDVsKLL8hoXRu5PeMJegMH5XSx72dqor7Ira
         Jbs3JP3a1gnGJhzf4EKpp4K3KmHNN4D+/zeZ/dVME/V70lO1jlyoo07hhOtuApV5Rr2j
         NUQ5Qo8uhIZMm+WkzZfvJTfzOXzKBWKk5bELvL9qpH9I9lAiU9wxTSkci3nXd7ah/HY+
         n/m0mIjz/xmktn1TiDs/h2oDVn3Lu32/Box5KMVEGUMf1HtwGKsYv10qZUFW6hARCbkC
         YWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UZC4hrOtfkTcv0UvkDY810492SZaLE24k/Cz3myr5rI=;
        b=UeLF4Zeb/ur9zb8Nxewo5c6na+fJVUJe3x03UV0UegYfU/X9tIsZPQibInz0bCJ+ut
         RGkWXsQ6WHusWlVIfMtqtcT3S9FyS6ElZO8DN1eOaFLFdQp8kWdYOlR8N4nYHoT+83yU
         MBVnwWq/OFfhQyi8RvDYstJKs8b7YcUnzCQdeow2KtBMgStoReQb9dg9blhwzPzg0w+q
         hKfXrdUOwJPbWAb7VLeeSuSKCHt/J4XZ7mhCFObmwL9TLtkxTDWpa3cEambJXz1qQgtO
         Fpb5FN9EDZhJPEGsL6GOBATqVxGEKCBugMBtLQp09+BLj2WuTrtOX1mvBQ6d0jU1hNDE
         ZclA==
X-Gm-Message-State: AOAM533EeHFtctElVam5eeaOFN2W3BgnjGDvG5kuIb4gOvtX7dWnasa/
        4NRgD9l4Gynk8a84yVN3VT4q/g==
X-Google-Smtp-Source: ABdhPJwOgVsxmqOREBFweXxgNKZnV7J6dkTkcqG/oUmQFg8RlMj8KUa/Lhf2TjH70oBw8FATYFiIpA==
X-Received: by 2002:a02:3842:: with SMTP id v2mr10857956jae.50.1604931266172;
        Mon, 09 Nov 2020 06:14:26 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e12sm6872951ilq.65.2020.11.09.06.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:14:25 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
 <47f79645-53b7-b11c-167a-f5721b53df02@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9d9acec6-1e8c-2d68-5dfa-d58c11cf5cc4@kernel.dk>
Date:   Mon, 9 Nov 2020 07:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47f79645-53b7-b11c-167a-f5721b53df02@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 3:59 AM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 11/5/20 6:15 PM, Jens Axboe wrote:
>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>> Hi Jens!
>>>
>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>> Gentle nudge on this one.
>>>
>>> I can build- and boot-test on SH and IA64.
>>
>> That'd be great, thanks!
> 
> Sorry for the delay. I'm busy at the moment and my SH board is currently
> building the Perl 5.32 package for Debian. Will try to test your patches
> by tomorrow, also ia64.

Thanks, both would be appreciated! Just CC'ed you on the updated patch
for sh.

-- 
Jens Axboe

