Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696691E9518
	for <lists+linux-sh@lfdr.de>; Sun, 31 May 2020 05:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgEaDUO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 30 May 2020 23:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729376AbgEaDUO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 30 May 2020 23:20:14 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF45C08C5C9
        for <linux-sh@vger.kernel.org>; Sat, 30 May 2020 20:20:14 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id b3so6129919oib.13
        for <linux-sh@vger.kernel.org>; Sat, 30 May 2020 20:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T2glAOlAKwhTJJy3Njt3T/kQb6uZUYcPmREW3W4vi6M=;
        b=LGMEouz2AnUbZKSZ7erMsRtjxiXNYTm5NVKB11O27ougZ4BuIEvrL9qVPjG8gxPsGE
         1FAOkTnW/E8Jf/TmcFEAi+v0zYWroZtlCulYyG71LiF8BjWAPHDc1MHd1mp8MY9kUw+K
         4JyQQcwsT9BRDjlhMNyaVf7f9i71SYmiNwiQ1yAad1UM2MI5KPU6xtv6vwwOvZnRCZD1
         f3pu3kFmsdQnptYoiOenGCBGP0U3ICBWaUnxfVGPddgYrrzaFnwYPt3pGWjwpBajR5/F
         fEbba+l2wC/QC5sdaUz5pBZfOP2GpvWWvbiohXz6x6rIwEImJ4yhhhfl/yEjY88TvSh7
         gHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T2glAOlAKwhTJJy3Njt3T/kQb6uZUYcPmREW3W4vi6M=;
        b=McJDzwsrAi2L6wUNindurYd0VhBbXYnU+p9R1xq4P8bZ9mBhgrdgmtqXvTwePaL6T2
         1uV/V0sT3t4ikuBHstav7EwGGtZjTxdDDKytRLrVMCE0w2vdXQhHdovimEf53ptyibai
         hiWyuuUcWYn5U3cq+FfaPLrNoPcCkgs2IuNarbv3o6Ngm8Et22oQpzuSvklK9DGu3+14
         4i1eoykl/g6oYZ2Oeku04TPWeFwf6tcCMocWqxlbQKZsa6ECmkY+FH+PAiIxs8VvGBXm
         wvrj1YOJGmOSMIa3kjOG0QHeC2RlI51nL5pq0GVRcM71aJyflssBqQjdbPjvOy6fr259
         Ej0Q==
X-Gm-Message-State: AOAM532LYAuw5oB7qhkmj7dtWxzubbEIhsDZKW4dZivAYMHftE7QdRYm
        qXddniB1AqikJNYKdwAO6sge9IhEvDM=
X-Google-Smtp-Source: ABdhPJyVcFIJHSpynVepN7pTeGO7XGs6EwMphPOIpAoJMXbRZJlydcgNGHVzSOW18R3fNiKY2eSPGQ==
X-Received: by 2002:a05:6808:29a:: with SMTP id z26mr10451218oic.28.1590895213261;
        Sat, 30 May 2020 20:20:13 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id 10sm1232329otq.52.2020.05.30.20.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2020 20:20:12 -0700 (PDT)
Subject: Re: [GIT PULL] sh: remove sh5 support
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Rich Felker <dalias@libc.org>,
        Christoph Hellwig <hch@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20200424221948.1120587-1-arnd@arndb.de>
 <20200507143552.GA28683@infradead.org> <20200528054600.GA29717@infradead.org>
 <20200528161416.GY1079@brightrain.aerifal.cx>
 <20200529143059.GA25475@infradead.org>
 <20200529175335.GK1079@brightrain.aerifal.cx>
 <e86e1d78-9597-811a-da0e-42a910b0c9fe@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <8b4ff7fe-c10c-fc8e-72bc-88ef69bdb2b4@landley.net>
Date:   Sat, 30 May 2020 22:20:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e86e1d78-9597-811a-da0e-42a910b0c9fe@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 5/30/20 3:08 AM, John Paul Adrian Glaubitz wrote:
> On 5/29/20 7:53 PM, Rich Felker wrote:
>> Frustratingly, I _still_ don't have an official tree on kernel.org for
>> the purpose of being the canonical place for linux-next to pull from,
>> due to policies around pgp keys and nobody following up on signing
>> mine. This is all really silly since there are ridiculously many
>> independent channels I could cryptographically validate identity
>> through with vanishing probability that they're all compromised. For
>> the time being I'll reactivate my repo on git.musl-libc.org.
> 
> May I suggest to pick up these patches, for example? There might be
> more I missed, but getting these merged should already help a lot with
> the clean-up of arch/sh.

Does that include the 2 fixes to build with current binutils I made puppy eyes
about last -rc7 (in march)?

https://marc.info/?l=linux-sh&m=158544749818664&w=2

Rob
