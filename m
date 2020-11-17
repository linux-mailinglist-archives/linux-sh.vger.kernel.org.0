Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880212B683A
	for <lists+linux-sh@lfdr.de>; Tue, 17 Nov 2020 16:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgKQPGc (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Nov 2020 10:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbgKQPGc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Nov 2020 10:06:32 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1F1C0613CF
        for <linux-sh@vger.kernel.org>; Tue, 17 Nov 2020 07:06:32 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id u21so21413854iol.12
        for <linux-sh@vger.kernel.org>; Tue, 17 Nov 2020 07:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mAedU4t44s+CgP7BWSKOczJQUzvXruGZmgIhbIOpNbA=;
        b=VOazJTnJQnHbzHw9PfPr9ptrTuUKYf/vg1fMVeue5DXCKQXTXhFmLvhRHEP9bRk1rC
         e+r1gYJ1S/TGJB7IrOUZuvjRMmBItOyL6BgnugpIKbtOiWVhe32VuTPmkeAQcB79/sNB
         EYGHM9csH0IJD5KmV710TtfhBr70OK59w31LbikcKUg8JX6ounM06l37Z4GaYmO0qXYB
         pVJLX6T5I64mZj2Od+vxLoPWfhXcdiqWnJnXmMLpW9Q0gtN4BAPCx6xhkgiwsyh5am+c
         V1WcZ9hnlvNNl0XB8tvRWL56B1mvvJaa+Qnc2uZpcr0K6AoY/l/LgefVgQCKOH7rk8R5
         emeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mAedU4t44s+CgP7BWSKOczJQUzvXruGZmgIhbIOpNbA=;
        b=E1JEM9d4yEAyIvkZD+2cldaNJX3HEIxkSZCJ14S/hUydNrkUtXLO7pB5IO4aUHlSov
         D+Vod3rzChkCThsQrQ4DLhHmZGq2byISXsQLXUv5Dl9OcASGLAOylqARXeRUvRXpnT3U
         NwxF9rZmAC7t76w5LxksE23epor7v+yjVwcqmPeDS6FwKX41LFAzbboeKaHYP2ECSV+E
         H78hLadqnIcMNWNr2fMon9ghZrv91pFl155VcaIk4L2cynB/dYXRYOofxwgnEIhZgN8D
         u6R5MgIWIVR9vbiE5C7piwlrFknQ3bQcfRc3rhRKNTVVq+Z9iXVXZHRCuG+WT1nOH47N
         CMPg==
X-Gm-Message-State: AOAM531c0LYO8RRNQAPoKlBmEisprZUbym0IUllcwIP9LVaFApcyNAXG
        ct94rJQEzuPQjKbwJsAYs6byag==
X-Google-Smtp-Source: ABdhPJzZBbOlgwAgjosKHLJqLPpaKwqacd3HcBX36A+/NFjfZbtDM4IU1Jwlottzqx/pawn08DcD8g==
X-Received: by 2002:a02:6a59:: with SMTP id m25mr4023124jaf.132.1605625591794;
        Tue, 17 Nov 2020 07:06:31 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id j12sm10717065iow.27.2020.11.17.07.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 07:06:31 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
 <47f79645-53b7-b11c-167a-f5721b53df02@physik.fu-berlin.de>
 <9d9acec6-1e8c-2d68-5dfa-d58c11cf5cc4@kernel.dk>
 <070780c4-445e-6373-c8f4-1c72d0f3b4e0@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <1047f3e5-4599-c34f-3176-9f41d2e1246b@kernel.dk>
Date:   Tue, 17 Nov 2020 08:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <070780c4-445e-6373-c8f4-1c72d0f3b4e0@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/16/20 10:26 PM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 11/9/20 3:14 PM, Jens Axboe wrote:
>>> Sorry for the delay. I'm busy at the moment and my SH board is currently
>>> building the Perl 5.32 package for Debian. Will try to test your patches
>>> by tomorrow, also ia64.
>>
>> Thanks, both would be appreciated! Just CC'ed you on the updated patch
>> for sh.
> 
> Is this still relevant for testing? I'm ready to test now, much later than
> I thought, sorry.
> 
> I'm going to build Linus' latest kernel for my SH and IA64 machines now
> and then I can test additional patches on top of it.

Thanks, would definitely still appreciate testing. You can just run
linux-next if you want, it's got everything in there. Or apply the
separate patches to -git, either approach is fine.

-- 
Jens Axboe

