Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A98473A422
	for <lists+linux-sh@lfdr.de>; Thu, 22 Jun 2023 17:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjFVPCw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 22 Jun 2023 11:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjFVPCu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 22 Jun 2023 11:02:50 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBDB1FEF
        for <linux-sh@vger.kernel.org>; Thu, 22 Jun 2023 08:02:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b51780bed0so56459415ad.3
        for <linux-sh@vger.kernel.org>; Thu, 22 Jun 2023 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687446130; x=1690038130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faWv91VP2z/YbKZA+qDwvC+H5Ebg0LphINaB6C6XGBI=;
        b=mt+u4MU2N69BdCB48EipZPFZvxxegmfx/OHOcyc/fM4PZHcrYAkSQWkcdFUsmp5rNU
         a6j2G9cgP05nAPrTpXTrKstR8E5BoO42DmiP6/AZUuIG/6/BBMLFuw5aAo/SAHPeZdEg
         DNvDehDx9+J7nZG9sBU7G6/wpPi2vu+msKWiZ8QFox3/ruMzFIOZCnfnj843xufxdgu9
         MeGUmiA7Z/dRVBK3NdT9B4ymhpM9c0qpwKNXpegEvvYhn5T1kxweIZjlNE+fattEVIvn
         jG1RiXKH3SvzlebwvUPYmft34NdlnUAiikYo4SRSggxh+pPF10pxJtEKozp+lS8TepIG
         aHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446130; x=1690038130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faWv91VP2z/YbKZA+qDwvC+H5Ebg0LphINaB6C6XGBI=;
        b=QPENZiP1OlPsdVA6PO9CSFgZmnfmAkoojcHO//gi056wT9ZEA1Y0zLZxEuHK+8sqmP
         Jd+vzw2v+A9eEA3JL7fZwJC63B0qw1ifmnjJ56XcXNVUt3VDhx3pEXUzs4FqFywqufS1
         SyW4du08OyN1Ct/IHAU5bGoIhbVNgVF4a8f92FR4qWZ3Szg17y+cJtc32d82QoswDpeC
         c4W91+b6Cy/pyp5USfGgermOzmFH8ovnYTEUQsvYCjO936zDoM6FQbj8taGK19QCVt24
         qN4kMb9x2E4ycSrDAt4e9yYqCeOJ7/aOy13JfHzywUDPPJGUWzmX1iRRvq3cVVFMbzbE
         QL/w==
X-Gm-Message-State: AC+VfDxRNRfib5KJrwg1+fuXNCJZHrSopVxjqKuZBPajwb8SwiCrdkb7
        iCjPNzlafaW2I6cbnpVxCt0QIA==
X-Google-Smtp-Source: ACHHUZ7sxI2/l9NYWY43UXjLd7//zIrvDML1M6VqO+WFrtnEGO/KRuc42ZZ7KlADjiu835vi4h/IOA==
X-Received: by 2002:a17:902:f7c6:b0:1ae:14d:8d0a with SMTP id h6-20020a170902f7c600b001ae014d8d0amr15965819plw.29.1687446130063;
        Thu, 22 Jun 2023 08:02:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z7-20020a170902708700b001b3dada0e78sm5466709plk.258.2023.06.22.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:02:09 -0700 (PDT)
Date:   Thu, 22 Jun 2023 08:02:09 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 08:01:29 PDT (-0700)
Subject:     Re: [PATCH 11/14] init: consolidate prototypes in linux/init.h
In-Reply-To: <20230517131102.934196-12-arnd@kernel.org>
CC:     akpm@linux-foundation.org, linux-mm@kvack.org,
        Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, monstr@monstr.eu,
        tsbogend@alpha.franken.de, deller@gmx.de, mpe@ellerman.id.au,
        hca@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com,
        x86@kernel.org, rafael@kernel.org, paul@paul-moore.com,
        eparis@redhat.com, dennis@kernel.org, tj@kernel.org, cl@linux.com,
        pavel@ucw.cz, peterz@infradead.org, longman@redhat.com,
        boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, audit@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     arnd@kernel.org
Message-ID: <mhng-eb6e6d97-fe40-4755-9be5-eb75a690d88c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 17 May 2023 06:10:59 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The init/main.c file contains some extern declarations for functions
> defined in architecture code, and it defines some other functions that
> are called from architecture code with a custom prototype. Both of those
> result in warnings with 'make W=1':
>
> init/calibrate.c:261:37: error: no previous prototype for 'calibrate_delay_is_known' [-Werror=missing-prototypes]
> init/main.c:790:20: error: no previous prototype for 'mem_encrypt_init' [-Werror=missing-prototypes]
> init/main.c:792:20: error: no previous prototype for 'poking_init' [-Werror=missing-prototypes]
> arch/arm64/kernel/irq.c:122:13: error: no previous prototype for 'init_IRQ' [-Werror=missing-prototypes]
> arch/arm64/kernel/time.c:55:13: error: no previous prototype for 'time_init' [-Werror=missing-prototypes]
> arch/x86/kernel/process.c:935:13: error: no previous prototype for 'arch_post_acpi_subsys_init' [-Werror=missing-prototypes]
> init/calibrate.c:261:37: error: no previous prototype for 'calibrate_delay_is_known' [-Werror=missing-prototypes]
> kernel/fork.c:991:20: error: no previous prototype for 'arch_task_cache_init' [-Werror=missing-prototypes]
>
> Add prototypes for all of these in include/linux/init.h or another
> appropriate header, and remove the duplicate declarations from
> architecture specific code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/include/asm/irq.h          |  1 -
>  arch/microblaze/include/asm/setup.h |  2 --
>  arch/mips/include/asm/irq.h         |  1 -
>  arch/parisc/kernel/smp.c            |  1 -
>  arch/powerpc/include/asm/irq.h      |  1 -
>  arch/riscv/include/asm/irq.h        |  2 --
>  arch/riscv/include/asm/timex.h      |  2 --
>  arch/s390/kernel/entry.h            |  2 --
>  arch/sh/include/asm/irq.h           |  1 -
>  arch/sh/include/asm/rtc.h           |  2 --
>  arch/sparc/include/asm/irq_32.h     |  1 -
>  arch/sparc/include/asm/irq_64.h     |  1 -
>  arch/sparc/include/asm/timer_64.h   |  1 -
>  arch/sparc/kernel/kernel.h          |  4 ----
>  arch/x86/include/asm/irq.h          |  2 --
>  arch/x86/include/asm/mem_encrypt.h  |  3 ---
>  arch/x86/include/asm/time.h         |  1 -
>  arch/x86/include/asm/tsc.h          |  1 -
>  include/linux/acpi.h                |  3 ++-
>  include/linux/delay.h               |  1 +
>  include/linux/init.h                | 20 ++++++++++++++++++++
>  init/main.c                         | 18 ------------------
>  22 files changed, 23 insertions(+), 48 deletions(-)

...

> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 43b9ebfbd943..8e10a94430a2 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -16,6 +16,4 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
>
>  struct fwnode_handle *riscv_get_intc_hwnode(void);
>
> -extern void __init init_IRQ(void);
> -
>  #endif /* _ASM_RISCV_IRQ_H */
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index d6a7428f6248..a06697846e69 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -88,6 +88,4 @@ static inline int read_current_timer(unsigned long *timer_val)
>  	return 0;
>  }
>
> -extern void time_init(void);
> -
>  #endif /* _ASM_RISCV_TIMEX_H */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!


