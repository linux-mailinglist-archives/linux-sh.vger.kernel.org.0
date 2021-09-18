Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4B04103A8
	for <lists+linux-sh@lfdr.de>; Sat, 18 Sep 2021 06:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhIREqu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Sep 2021 00:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235196AbhIREqs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Sep 2021 00:46:48 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4F4C061574
        for <linux-sh@vger.kernel.org>; Fri, 17 Sep 2021 21:45:25 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id z1so14795488ioh.7
        for <linux-sh@vger.kernel.org>; Fri, 17 Sep 2021 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E/k4MobbQgGNtvZR4TjCYawGzj3FUF53rKMsP/MQt4Q=;
        b=yIkPDK+VvPdH1WKvOFD2cBZXQhOGRsfXqgQe2peTqtmATkyYNClhf2xR2OGrN6dTGq
         u8PP4w2G/2TYZjnpVEX+E99H6AH9YhrjSOuI/ZMeELt6xNrEdKSBCuCNuTZdqp7zQLiE
         4yxSBy017PKKotxMTfPZW1pnqPCCv32Sna8YlhuDGSSeHIo/HthxJjsWUlXkyEF1rtNR
         /mJ6J4yP/vZfdMijokjt/HxMg/kUKgFAHyYU0Wh0Uq+rWJNrrSBR/sg3Bl8Kjfrbi8FJ
         UJtJeyUYomceFhqbFfrqqGlfkdJCVeJAIMlwXzfgLtwm6Hb+zcZowZEe0ON6kKeV3Dm4
         LnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E/k4MobbQgGNtvZR4TjCYawGzj3FUF53rKMsP/MQt4Q=;
        b=cUhnRdZjSt9y8ucQJVsljac70E3LdSTSda90YVNvMxMEwlH5gTpYKXvSv6t1vnKqBe
         UZL29Fhy9KcZiwrMc+P87BWwyQq9h2r8R8PNk2y5gfIxyIChZycfL3Yf837dKAjrbfD6
         6nG8NewUpgnR7MRUn5A4qow0pckWRT7kId2kxVB49qta9Vz4jv5zhd9ox2Lorfw0YPbz
         z2U8oF1fV7yNuyuFsgQ9kAd66wm3/zOegHj3GjYnnlzlYVmgWqgryDZSpsW1rdeosmt7
         t8wAbG0g0A9CcXJBkpr6a2ZygZeyS4KRCmZFb4F90/x76UkIpGov0l3GiqNR9FtlXLfe
         xkag==
X-Gm-Message-State: AOAM532huyyMBALv2I5Z0gFNp9h6/pWBdLbTubhmKk+KiePE/Q7fV6n1
        U3dn9HL/RhtPeAb67WT4f9hzKlFMT9wXDVq+
X-Google-Smtp-Source: ABdhPJx/X6gkduBDeTl27aqeg+7qBgOW4K3Y43eBOCx3snN9Wb5v5Jq2Oj7aVMf1Z0mfAd9xO3ckgg==
X-Received: by 2002:a02:1081:: with SMTP id 123mr11295517jay.83.1631940325084;
        Fri, 17 Sep 2021 21:45:25 -0700 (PDT)
Received: from [192.168.5.221] ([172.58.143.2])
        by smtp.gmail.com with ESMTPSA id r13sm4771231ilb.39.2021.09.17.21.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 21:45:24 -0700 (PDT)
Subject: Re: [PATCH] sh: pgtable-3level: Fix cast to pointer from integer of
 different size
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <2c2eef3c9a2f57e5609100a4864715ccf253d30f.1631713483.git.geert+renesas@glider.be>
 <1acace03-4273-a5ad-50b4-5ab8e3baa551@landley.net>
 <CAMuHMdUYUbjPSitt3wTi-YY5CEKwDJNJKPp9Pbfewm7B0CXP2A@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <f83c84d1-27d7-978f-4a3a-0c1f5a97c24f@landley.net>
Date:   Sat, 18 Sep 2021 00:04:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUYUbjPSitt3wTi-YY5CEKwDJNJKPp9Pbfewm7B0CXP2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 9/17/21 4:21 AM, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Fri, Sep 17, 2021 at 3:12 AM Rob Landley <rob@landley.net> wrote:
>> On 9/15/21 8:50 AM, Geert Uytterhoeven wrote:
>> >     arch/sh/include/asm/pgtable-3level.h:37:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>> ...
>> > The truncation to "unsigned long" has been there since forever, so
>> > probably it still works fine ;-)
>>
>> 1) Linux is LP64 so sizeof(long) and sizeof(pointer) always match, so it's not
>> truncating.
>>
>> 2) The sh5 only ever shipped evaluation units, it never had a production run,
>> and we haven't implemented j64 yet, so all superh targets are currently 32 bit.
>> (I.E. it's complaining about _expanding_ the pointer, which shouldn't be a
>> problem as long as endianness is respected.)
> 
> The build error is for 32-bit.

I know. I'm just saying your fix doesn't seem wrong. (Personally I would have
just cast once to (void *) and let C not being C++ do the right thing, but eh...)

Not sure I understand the point of the original code though. Under what
conditions do you want 64 bit page tables on a 32 bit system? (Some PAE variant?)

> If CONFIG_X2TLB=y, pgd_t.pgd is "unsigned long long", i.e. 64-bit, so
> casting it to a pointer needs an intermediate cast to "unsigned long".
> See arch/sh/include/asm/page.h:

I can't find a user of it. None of the existing defconfigs select this option:

  $ grep -r X2TLB arch/sh/configs

And it's weird in other ways, like 8k page size. (Why...?)

Google finds sh-x2 mentioned in Renesas' sh4a debugger docs, but I've never
played with the renesas "a" variants. The stuff I'm familiar with is all
following up on what Hitachi did, not Renesas.

*shrug* You fix looks good enough to me.

Acked-by: Rob Landley <rob@landley.net>

Rob
