Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BD6099C2
	for <lists+linux-sh@lfdr.de>; Mon, 24 Oct 2022 07:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiJXFZS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 24 Oct 2022 01:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiJXFZQ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 24 Oct 2022 01:25:16 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EE732A99
        for <linux-sh@vger.kernel.org>; Sun, 23 Oct 2022 22:25:14 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id y16so3912730wrt.12
        for <linux-sh@vger.kernel.org>; Sun, 23 Oct 2022 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=sGYDK7eIYH5PqH/5Acy0XyaEjCscnyemwFKPlv0plAI4IwAFCznfoGKOXs1a7qYDrr
         ly2ism/XDhfqN7P+LUkOQ+8zw1DW3s9014bL3MpmA/VeepyZ997065xLFYnKak1tqGkq
         FoBa0umV34QeH83RdEplTs4i5Q4cLt0MSci1zU3y4K+5MRKk5kvOo6/OmTyP65vvmeaX
         Q5fVy3H/6NpDIslefYS/jRvBlP4GCt+4AychccYkqmARW0YsM+HURsaQVLlgY4KIgMaO
         8B0U5afdOstZ9Xnrvl2gDFtoZcogvKS6fdmiHd2ZOE5f9wxSOHws4RH0J6kyMAnRSo9m
         cgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=14JDsXqWmHbTkCQYJHjJ0MSHYwu+pJXn8FnI/lZ8eqJPtTVcO4b98fnY3YT8pe6dIQ
         vAI6uKx/NwNQ5N0+iBvy0/fYSM4VTpBB6fm+YdpIVf9ihbsMpuX6z+LJihMSiDt1fz1j
         4ftLcQ+iWTAVbP2EJkxzMrBGnx60K4YH5PL0MK5Gyg4wS0DL5cXnFi7yoDGKK7U3v0gL
         uVjgtrnyHXep83lfCWveGOd+cBeq25UhVfGcq47Scru+pTjzdRGpsLHs78QElIvjvfEV
         08jjuEvv2zkq+dJbUM5dknjt+WYoUfiSUB+3Sw+MQTUrx1kN0GYI+jDpB79/VTttHJrl
         UR6Q==
X-Gm-Message-State: ACrzQf1L2sBA3cgIe0Eu5khmUFNVmOf+LKLu71LUSTRu6DA4MyF9CbJz
        hyM1wDA8hc2kHQWFgjuD3pxobQ==
X-Google-Smtp-Source: AMsMyM6QxHnKrRaxO/sgu91YoPZwLII9g5woi4tdrjAvc7GmkjpM0AXJ+q3phtLN49229n5kcuKDXw==
X-Received: by 2002:adf:e196:0:b0:236:740f:f234 with SMTP id az22-20020adfe196000000b00236740ff234mr996926wrb.518.1666589113331;
        Sun, 23 Oct 2022 22:25:13 -0700 (PDT)
Received: from [10.50.0.10] (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003c6f27d275dsm7317108wmq.33.2022.10.23.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:25:12 -0700 (PDT)
Message-ID: <5f4b9276-92bf-2e04-8a42-8f416526b3a6@linaro.org>
Date:   Mon, 24 Oct 2022 07:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/2] stackprotector: move CANARY_MASK and
 get_random_canary() into stackprotector.h
Content-Language: en-US
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org
References: <20221023203208.118919-1-Jason@zx2c4.com>
 <20221023203208.118919-2-Jason@zx2c4.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221023203208.118919-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 23/10/22 22:32, Jason A. Donenfeld wrote:
> This has nothing to do with random.c and everything to do with stack
> protectors. Yes, it uses randomness. But many things use randomness.
> random.h and random.c are concerned with the generation of randomness,
> not with each and every use. So move this function into the more
> specific stackprotector.h file where it belongs.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   arch/x86/kernel/cpu/common.c   |  2 +-
>   arch/x86/kernel/setup_percpu.c |  2 +-
>   arch/x86/kernel/smpboot.c      |  2 +-
>   arch/x86/xen/enlighten_pv.c    |  2 +-
>   include/linux/random.h         | 19 -------------------
>   include/linux/stackprotector.h | 19 +++++++++++++++++++
>   kernel/fork.c                  |  2 +-
>   7 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

