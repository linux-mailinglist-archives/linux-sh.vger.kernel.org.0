Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312EC24E22E
	for <lists+linux-sh@lfdr.de>; Fri, 21 Aug 2020 22:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgHUUhS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 21 Aug 2020 16:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgHUUhP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 21 Aug 2020 16:37:15 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6818DC061573
        for <linux-sh@vger.kernel.org>; Fri, 21 Aug 2020 13:37:15 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id c4so2573844otf.12
        for <linux-sh@vger.kernel.org>; Fri, 21 Aug 2020 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLmJ3U6Y1V47ky0u7UIT9Bp/3K/axxp84OaDHBKXjMg=;
        b=X0Urd4i9AII4SboIHyhtSJP8Pv5N1sDXg/5QhVXiJRhpiqfjIaqVwX7CCmrCFYssxZ
         MDLKy9dHJ8TaiyW+5p4ngGjAhC6Js4pmhTxJ41DybLkBRbfROjIobYgHUaoEhODK4o2M
         aNyF12kboDo0gS+h1XoIKqNqNBKJme01J4TdH2bfLzhlnUXHJFqBuKZqTWL9gjzUQwvq
         P9pxvCe2a3s/Dqx/2Y+sKZgPJA+xFp9pIX2gtTUE2TyXzUu5mpAFW3+ZBHfu8awzHMwS
         5DU776CPfUwIZ/lUPTnhvnSfKpbJLLsidSGuhDxEVeWkz/2/BwwADapdHolPwyG45B7b
         h0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLmJ3U6Y1V47ky0u7UIT9Bp/3K/axxp84OaDHBKXjMg=;
        b=VAKT4JPIKKE6xj+kSAvXticXWs8hqiqkHpz4TyUxfMC7PIestnhTYsYEFPkg9D0lxO
         I7MakXLvQMF2A5bl8C80lLcgGbFrNMB8GPHVZ4UOKwMTKuLdFOIq4xcG7lbP2o7nEW4G
         2R8B8frcoYhII7BPZNA4Cr06Amn9WTAQXAfxZL9WGRusAVOWK7xAR6xUH0PLtTEKR1lx
         9HNMY5ClSflGx3PJGwh2N/UgErhYLNlXGmvWDRKOWEbYOMqjQgPHalNH+XUSUVOsNLCD
         5JTbhBLygqCo5tU0BtLoHO1qjuJaMHXWL9KwhzxvwTmanMpVrOMKNfM1MIJI6LzLuMKl
         UxlA==
X-Gm-Message-State: AOAM532O9ZvyvCe/XVe4cq0bBBUfABGUQowMAkisRz+1vKlSY5U6UltW
        tWGbsGMP14PyJFJYgXvbL0K3bQ==
X-Google-Smtp-Source: ABdhPJxsY8a1cQhP6uBtLh6Zep09PGaR76/YmHvTri5/7y+e304kB6xA9y1fpSiet0VLPylF3mbSdQ==
X-Received: by 2002:a9d:7405:: with SMTP id n5mr3291655otk.286.1598042234490;
        Fri, 21 Aug 2020 13:37:14 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id l128sm507646oib.4.2020.08.21.13.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 13:37:13 -0700 (PDT)
Subject: Re: [PATCH 1/1] sh: add support for cmpxchg on u8 and u16 pointers
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Liam Beguin <liambeguin@gmail.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <CAMuHMdVYeAqLHuW2fjQk7HQbnGJhY7YJcksMddn_6Cp61cd-AQ@mail.gmail.com>
 <C510813DTTYI.1PZXLO9Y2FRLM@atris>
 <CAMuHMdWAeccfEbZ=7MFgR=2SyC_1zRNGXG5G6VL5qY=d0HW37A@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <d78cbae7-30c1-245a-84f6-8f1518d99340@landley.net>
Date:   Fri, 21 Aug 2020 15:46:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWAeccfEbZ=7MFgR=2SyC_1zRNGXG5G6VL5qY=d0HW37A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 8/19/20 8:50 AM, Geert Uytterhoeven wrote:
> Hi Liam,
> 
> On Wed, Aug 19, 2020 at 3:34 PM Liam Beguin <liambeguin@gmail.com> wrote:
>> On Wed Aug 19, 2020 at 5:09 AM EDT, Geert Uytterhoeven wrote:
>>> On Wed, Aug 19, 2020 at 5:07 AM Liam Beguin <liambeguin@gmail.com>
>>> wrote:
>>>> The kernel test bot reported[1] that using set_mask_bits on a u8 causes
>>>> the following issue on SuperH:
>>>>
>>>>     >> ERROR: modpost: "__cmpxchg_called_with_bad_pointer" [drivers/phy/ti/phy-tusb1210.ko] undefined!
>>>>
>>>> Add support for cmpxchg on u8 and u16 pointers.
>>>>
>>>> [1] https://lore.kernel.org/patchwork/patch/1288894/#1485536
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
>>>> ---
>>>>
>>>> Hi,
>>>>
>>>> This was reported by the kernel test bot on an architecture I can't
>>>> really test on. I was only able to make sure the build succeeds, but
>>>> nothing more.
>>>> This patch is based on the __cmpxchg_u32 impletmentation and seems
>>>> incomplete based on the different cmpxchg headers I can find.
>>>
>>> Indeed. This version is suitable for non-SMP machines only.
>>> BTW, it looks like this version can be replaced by the one in
>>> asm-generic?
>>>
>>
>> Thanks for your feedback I'll have a look at the asm-generic functions
>> and try to use those instead.

Does using the asm-generic one automatically use the architecture version for
j-core? (Technically we're compare-and-swap rather than cmpxchg but eh, close
enough: CAS.L Rm, Rn, @R0 opcode 0010-nnnn-mmmm-0011, based on the IBM 360
instruction. Not sure how the #include plumbing winds up selecting the version
here, if there's an extra thing we have to do we should do it.)

>> Okay, I'll look into that. Would you recommend a good way to test these
>> changes?
> 
> That's gonna be harder, I'm afraid.
> Who has suitable hardware?

Define suitable? (Not familiar with testbot? In addition to a raspberry pi form
factor j-core board that runs off my laptop's usb power pretty much with me at
all times, I have a johnson controls sh4 board in a box, a little blue board
that runs an st kernel fork in the same box, and an sh2 board from the dawn of
time in another box. I generally use the j-core board as my hardware and
regression test sh4 on qemu unless I'm checking a specific hardware thing.)

Rob
