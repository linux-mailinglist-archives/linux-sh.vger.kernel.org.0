Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F0173D498
	for <lists+linux-sh@lfdr.de>; Sun, 25 Jun 2023 23:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjFYVbd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 25 Jun 2023 17:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjFYVbc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 25 Jun 2023 17:31:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D9618F
        for <linux-sh@vger.kernel.org>; Sun, 25 Jun 2023 14:31:30 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso909113e87.3
        for <linux-sh@vger.kernel.org>; Sun, 25 Jun 2023 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728689; x=1690320689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+vBar4+CLR6TDQyNZjkELXTZBE9ucLGNyisqXCBp0c=;
        b=XnMKcu+DvVFFbNAPJoejCymxEHLsfGVjBJp8rhLjxmEH5gQg7SJJcO+T4kI0Y1n4Ly
         DU29CCkOZ/qBV0orbhS7JzmbJXaqo7Kep/2Spa7d6DqMEFuDUS20nY9chPmUXmfx6ijH
         bh4MfJ8MZYSx7pyFUNPBY0+iI64YBhhpgwD/ABzWgORbM9LN+uhFFyqfaiD1n34x9Ct3
         2u5frIDAbQ+p9EBcGuQhbG6YAZsfEv2Ltf472clzoj6EWWRIM30CfCXqEheLJd3209C9
         nE86N9MZS8o7KuH/5kcFzTTMO8SsyMKe732GFM2hHEok7qTCkimlzvoxg+LY/lDe0AxU
         GNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728689; x=1690320689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+vBar4+CLR6TDQyNZjkELXTZBE9ucLGNyisqXCBp0c=;
        b=fYxvTUBl/lGbKHFHiqHDLegtPpXgNj5kZvubEIJKk7jYMfdE29lMcDi1ilsuvpb8Yl
         FSGCuHclxoKbOO1ZGCRxenE55uH7nl7WfUGVoVNibQLrVz/3zSO4Ut3omU1u9PKMP2Fp
         /DyHU657Cujq9EwgpUils4C4nLrppiUnwbP9mj1lu2rDNycrp4+DRUGJgoFSAwqz0rbk
         BjgXnW14RN/tqTOwuaPWuviSlxaIbFncl2H6VV8eNNrhNQA9/ezxzJfrd7irGumf5Z1Y
         geop9+mwFORk2go88ZqKOW4x51QMXfs/c503CwV2r/nLTdma0KO/xvCqv3DDrPq2kmHs
         gn5A==
X-Gm-Message-State: AC+VfDyyOS/TKuLsLd2Lw/ovXeVwlKiZOjnzr5IgC72mrZJF4XsSJ8DQ
        kWGzxMbXzuPA77w0GFELrRvD8g==
X-Google-Smtp-Source: ACHHUZ4ueF7pB37Kjx3og+hVW79MU4Pnt3oR5acFEBC4M80kOtrhpKljcmf7bk4yPZDdm8+PgN44JQ==
X-Received: by 2002:a05:6512:10ca:b0:4f9:6b64:9a36 with SMTP id k10-20020a05651210ca00b004f96b649a36mr6138182lfg.62.1687728689066;
        Sun, 25 Jun 2023 14:31:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm8710877wmq.4.2023.06.25.14.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:31:28 -0700 (PDT)
Message-ID: <3849d2e3-43d7-4059-aead-fd78ded3b475@linaro.org>
Date:   Sun, 25 Jun 2023 23:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 11/17] init: Remove check_bugs() leftovers
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.553215951@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.553215951@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 14/6/23 01:39, Thomas Gleixner wrote:
> Everything is converted over to arch_cpu_finalize_init(). Remove the
> check_bugs() leftovers including the empty stubs in asm-generic, alpha,
> parisc, powerpc and xtensa.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Chris Zankel <chris@zankel.net>
> ---
>   arch/alpha/include/asm/bugs.h   |   20 --------------------
>   arch/parisc/include/asm/bugs.h  |   20 --------------------
>   arch/powerpc/include/asm/bugs.h |   15 ---------------
>   arch/xtensa/include/asm/bugs.h  |   18 ------------------
>   include/asm-generic/bugs.h      |   11 -----------
>   init/main.c                     |    5 -----
>   6 files changed, 89 deletions(-)

Yay!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

