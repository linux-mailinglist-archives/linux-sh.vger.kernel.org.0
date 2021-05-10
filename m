Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2E637989B
	for <lists+linux-sh@lfdr.de>; Mon, 10 May 2021 22:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhEJU4X (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 10 May 2021 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbhEJU4W (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 10 May 2021 16:56:22 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08B0C061574
        for <linux-sh@vger.kernel.org>; Mon, 10 May 2021 13:55:15 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i81so17063449oif.6
        for <linux-sh@vger.kernel.org>; Mon, 10 May 2021 13:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9u1bWm+wMG0wleduKDsfRD/ISspIfmoacCqdbEduS70=;
        b=07VWv3bG3mqPHl9O5DXepUYWpD3EvEfNY28LK1KB/UH2Kwt0GjhNrqdbJkHRvWPjJM
         hWx4RDSwmmwIS/oBRuTkVfA+khJ21cY7Cult/tXugu2B9aa1P2q8WsPpePMq5r6cy1PB
         yIsSaO6Deosd2gedOK7qUjMnGDR3Z1Ull7qY/0vGXgPfqoT1Few0vCD9k1rqzfpX6Ymq
         E9MCLGiKtTflzLg1xHy6+tRe8QXRyxfKg7nmGmA6sLOCp383eEOk625RCGdh4k5MI0Gv
         N9UrdmdmlwtsB78O0Z/6LtER9DuDgzBGsRiWATjw85lGWG8M3N9C63eoOkpshD22lxeU
         Zwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9u1bWm+wMG0wleduKDsfRD/ISspIfmoacCqdbEduS70=;
        b=uOkGr+c1CrnZrtXmTiaQPlbTcLBYGKtd7WH7+AZqAH3Hm8lK6AZQDzOECNHPpANt4H
         0TTwSiQIW8Ew8tOJsR+ZU0VjPfHa/lBDdA9htqPvt3x1142Ce3fA0ngaBLQIIixmnBGG
         bEWZ8dQ6pvBjdBt2/EIOGK8xD8egmxaFoBE1rWHX6d71u1UN908QZEt4mqQiRyyt0krL
         f0G8psDFTU9MRFPSwFNP/L2FfE6rGBt1XN3Z79/gMyWnxix8i5gOlPTZ+ZldW75f9LyL
         gVzoXsz195qsEMjlWx5ekIlB3HkrRQkwI+je+CSxRdKH90DfKiR4slCo7nKnnpnPZ13x
         e9oA==
X-Gm-Message-State: AOAM5322ZuflqSf8yit02+nS1jzABLa21k0R8+pQ5KoqIK/T3/xp4YZ/
        M1v8mjwnSFhJ4zcefUrYked9cg==
X-Google-Smtp-Source: ABdhPJyTPwx7ky+oR8zThuZFUp77XsFOUzbz1Vb//R9BLsN8RXAAbggqn6oYnI1nsj+RrSN84lWqbQ==
X-Received: by 2002:aca:5b86:: with SMTP id p128mr19761737oib.127.1620680115142;
        Mon, 10 May 2021 13:55:15 -0700 (PDT)
Received: from [192.168.86.122] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id c65sm2799334oia.47.2021.05.10.13.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 13:55:14 -0700 (PDT)
Subject: Re: [RFC 03/12] sh: remove unaligned access for sh4a
To:     Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210507220813.365382-1-arnd@kernel.org>
 <20210507220813.365382-4-arnd@kernel.org>
From:   Rob Landley <rob@landley.net>
Message-ID: <1b1d34a8-d170-7287-1c99-40d2af83d1b9@landley.net>
Date:   Mon, 10 May 2021 16:11:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210507220813.365382-4-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 5/7/21 5:07 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unlike every other architecture, sh4a uses an inline asm implementation
> for get_unaligned(). I have shown that this produces better object
> code than the asm-generic version. However, there are very few users of
> arch/sh/ overall, and most of those seem to use sh4 rather than sh4a CPU

Hitachi's sh4, sh3, and sh2 are all out of patent, and have been cloned as open
hardware. (Modulo the sh4 clone uses a different mmu design, but lots of
regression testing gets done against qemu-system-sh4 and sh4 hardware using the
original mmu.) Plus superh was the bestselling CPU architecture in the world for
3 years back in the 1990s, and there's a remaining userbase from that.

sh5 and the "a" designs like sh4a were created by renesas after hitachi spun off
the IP to them, and are not out of patent. I do not have access to an sh4a test
system.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/sh/include/asm/unaligned-sh4a.h | 199 ---------------------------
>  arch/sh/include/asm/unaligned.h      |  13 --

All I can test is that it didn't cause regressions on my sh4 and j-core systems,
which it (unsurprisingly) did not.

Acked-by: Rob Landley <rob@landley.net>

Rob
