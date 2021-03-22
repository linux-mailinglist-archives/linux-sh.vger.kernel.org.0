Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5841343BD9
	for <lists+linux-sh@lfdr.de>; Mon, 22 Mar 2021 09:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCVIfR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 22 Mar 2021 04:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhCVIex (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 22 Mar 2021 04:34:53 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CE7C061574
        for <linux-sh@vger.kernel.org>; Mon, 22 Mar 2021 01:34:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id hq27so19787020ejc.9
        for <linux-sh@vger.kernel.org>; Mon, 22 Mar 2021 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BBF8DIkoQQBUBd0KpgS6B4Sfzebh5T00LVb2n/RkXjU=;
        b=DG3sytqOl9JAsShSSpGYHMmpeKDr/QvaT+FUc4L/et+jBGldZEkDRV5MmGFeOJUIRk
         XVEuW1Ms1HGUAi1eUXKCEOAKb++Xth1RGm2ZPdTn7GKRz8YIVbVkzjbxZag55s3O+Wht
         524nBj05bnQGW5VEgMfvtHVNwKJnbQNiEpSNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BBF8DIkoQQBUBd0KpgS6B4Sfzebh5T00LVb2n/RkXjU=;
        b=RKwlHUHdeoply8DKzYGVW327YxqD3d5Ko54koL0NlOx9aSiInpxlKGy2ehs6kBjkL8
         xs3rs0LJKWMQzPuu7k3hTZ8GJGVV6wd1B908LFd1/aiuhDhlkQzP1j6AcTtbWeyKz30y
         dgzDvbddfsxPBqcpB3zzbQ+19a6zjXrueysoaO1m5sfJn78nqoZ4nqokElfRTrTvCoiZ
         owY5ni0ccl02jckMoSsMhe5Ki6hXfjEx+ZcRjdCbz7DBdmiWM8aM1R4TI1fg3p34DZ5I
         R68VnSF2jZB+1pe04mejJbNWlgoIi9nsrdtxGto8qSyBn1vQBXNhK1Awd42ZWkHj7DhU
         qFvg==
X-Gm-Message-State: AOAM533slhzAX0NqNze4nP58B1Z3zOb7j5KgJMteijQJyBd2Tyat8y69
        90Z3otNjTPculNqamIeTsq1YlQ==
X-Google-Smtp-Source: ABdhPJwyTEl4Fnp8uqqgeSJXZsxHuLMe2rbTMi/8LPgpGvZiqZBjIMfQj0VdA7vl6TX3TRGENrg4xw==
X-Received: by 2002:a17:906:3b41:: with SMTP id h1mr17454517ejf.506.1616402091330;
        Mon, 22 Mar 2021 01:34:51 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id u13sm9444384ejn.59.2021.03.22.01.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 01:34:50 -0700 (PDT)
Subject: Re: [PATCH 06/12] tools: sync small_const_nbits() macro with the
 kernel
To:     Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-arch@vger.kernel.org,
        linux-sh@vger.kernel.org, Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210321215457.588554-1-yury.norov@gmail.com>
 <20210321215457.588554-7-yury.norov@gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <ef470d38-073d-2c6c-f9f8-909689a52212@rasmusvillemoes.dk>
Date:   Mon, 22 Mar 2021 09:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210321215457.588554-7-yury.norov@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 21/03/2021 22.54, Yury Norov wrote:
> Move the macro from tools/include/asm-generic/bitsperlong.h
> to tools/include/linux/bitmap.h

The patch does it the other way around :)

> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  tools/include/asm-generic/bitsperlong.h | 3 +++
>  tools/include/linux/bitmap.h            | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
> index 8f2283052333..f530da2506cc 100644
> --- a/tools/include/asm-generic/bitsperlong.h
> +++ b/tools/include/asm-generic/bitsperlong.h
> @@ -18,4 +18,7 @@
>  #define BITS_PER_LONG_LONG 64
>  #endif
>  
> +#define small_const_nbits(nbits) \
> +	(__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG)
> +

Well, the movement is consistent with the kernel, but shouldn't the
definition also be updated to exclude constant-zero-size? It's not that
they exist or ever have, in tools/ or kernel proper, but just if some
day some oddball CONFIG_ combination ends up creating such a beast, I'd
rather not have code like

+	if (small_const_nbits(size)) {
+		unsigned long val = *addr & GENMASK(size - 1, 0);

blow up at run-time.

Other than that (and the above commit log typo), consider the series

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
