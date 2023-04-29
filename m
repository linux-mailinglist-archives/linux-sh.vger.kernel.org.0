Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A32936F2644
	for <lists+linux-sh@lfdr.de>; Sat, 29 Apr 2023 22:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjD2UOd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 29 Apr 2023 16:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjD2UO3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 29 Apr 2023 16:14:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DED1A8
        for <linux-sh@vger.kernel.org>; Sat, 29 Apr 2023 13:14:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a92369761cso8794005ad.3
        for <linux-sh@vger.kernel.org>; Sat, 29 Apr 2023 13:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682799264; x=1685391264;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvNXrGU7f9AyBgQxPAxIH8w5LQ2sGDY5VhYCeQmIsvg=;
        b=ztXNyujPGJ3TImj9rkWYO2n2FifWKitTQShNykqcCXMnlMDmDVUdGDZxkkAjoc2LxT
         wjlkNuWu5MpGZ0hx2IY/BfGicm00cVl+x8sMPYhvJYOTMhGVFNRcq+t2+IhK1Zbg1HBm
         TwPyb5IfXHXgdYm4kQQJO8mCutMWnoA0MAQG1HObQV2DkWdvKA82EPwFFy15NEoVvzDJ
         YaFLlQv2/hnRBo+Kg2l+LFcBMREq5GVfs5levwZlW+i9w9qFVpvKUrXtIKJRJqUd1KUC
         DRDHp5Z7Fs9kgbXLfeVSACxaLJ8vDKqbLXNf+pwsIg4BCZFLNo8FmqNy+hScbEds+O2l
         SL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682799264; x=1685391264;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvNXrGU7f9AyBgQxPAxIH8w5LQ2sGDY5VhYCeQmIsvg=;
        b=fiEYKSPu6QjrtLFP1hvpebcNdG5o4Op8ShCUOXp+Zd7uo45rWCutw5lJzoSnbcb6zA
         HpieyfNWDVKuxTkf/mr5hzv/Ldt8xM6Dca3Kx45hdUY7vJxPqQVTGauJ5PnwH4DHR3a2
         AODT7C4/mqNf3Kew4ChW1H4eX9x83032iFz6ix3YjShASxmwi55/2xzoD9NsTasSPoKb
         dT9CDBgTcA0R5Utgg7Pbk6pi3B4GmJVn+AY2HWyvO1GlnZFsuidP+omi5e5CtIsLmNAl
         LY6XLZr1Hs7zXTk1TpEjT2OsVXGl6HnzWDJ87XNzMMOoEGTq+TDb+UQG339Wjh2xvLc2
         yxNQ==
X-Gm-Message-State: AC+VfDz0RNTcQ89lGIWgqO2OlAjQu90arD7+Q6gN9xPTWmoprf6lQ0Aa
        ztDJz73m6slAuktoK4B49n88XQ==
X-Google-Smtp-Source: ACHHUZ7pgoIToYashe1bFzQ1hUq7/0xuSIbhdV55MwhX+AUZI7FSn+oK96sUBgsJukxkcTmiriVdYg==
X-Received: by 2002:a17:902:ef45:b0:1a6:dd9a:62c5 with SMTP id e5-20020a170902ef4500b001a6dd9a62c5mr8875345plx.10.1682799264493;
        Sat, 29 Apr 2023 13:14:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902740200b001a4f7325466sm15179442pll.276.2023.04.29.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 13:14:23 -0700 (PDT)
Date:   Sat, 29 Apr 2023 13:14:23 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 13:14:07 PDT (-0700)
Subject:     Re: [PATCH] Remove HAVE_VIRT_CPU_ACCOUNTING_GEN option
In-Reply-To: <20230429063348.125544-1-npiggin@gmail.com>
CC:     Arnd Bergmann <arnd@arndb.de>, npiggin@gmail.com,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgupta@kernel.org, linux-snps-arc@lists.infradead.org,
        bcain@quicinc.com, linux-hexagon@vger.kernel.org,
        chenhuacai@kernel.org, loongarch@lists.linux.dev,
        geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        monstr@monstr.eu, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, dinguyen@kernel.org,
        jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
        shorne@gmail.com, linux-openrisc@vger.kernel.org,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        linux-parisc@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, linux-sh@vger.kernel.org,
        davem@davemloft.net, sparclinux@vger.kernel.org, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        linux-um@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, khilman@baylibre.com, frederic@kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     npiggin@gmail.com
Message-ID: <mhng-7ec0443b-2201-41b7-996c-78c3a61f0230@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, 28 Apr 2023 23:33:48 PDT (-0700), npiggin@gmail.com wrote:
> This option was created in commit 554b0004d0ec4 ("vtime: Add
> HAVE_VIRT_CPU_ACCOUNTING_GEN Kconfig") for architectures to indicate
> they support the 64-bit cputime_t required for VIRT_CPU_ACCOUNTING_GEN.
>
> The cputime_t type has since been removed, so this doesn't have any
> meaning. Remove it.
>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: linux-hexagon@vger.kernel.org
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: linux-openrisc@vger.kernel.org
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-um@lists.infradead.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Hi,
>
> Could we tidy this? I don't know what tree it can go in, timers,
> sched, asm-generic, probably doesn't matter.
>
> The only thing this actually does is gate VIRT_CPU_ACCOUNTING_GEN and
> NO_HZ_FULL so if your arch has some other issue that requires this
> then the documentation needs to change. Any concerns from the archs?
> I.e., 32-bit that does *not* define HAVE_VIRT_CPU_ACCOUNTING_GEN
> which looks to be:
>
> arc
> hexagon
> loongarch 32-bit with SMP
> m68k
> microblaze
> mips 32-bit with SMP
> nios2
> openrisc
> parisc 32-bit
> riscv 32-bit

Nothing's jumping out, though I haven't tested this yet so I'm not 100%.  
I assume this isn't aimed for this merge window, given the timing?  
Probably best to give this sort of thing time to bake in linux-next, but 
I doubt anyone is even paying attention to rv32/NO_HZ_FULL so no big 
deal either way on my end.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

> sh
> sparc 32-bit
> um 32-bit
> x86 32-bit
>
> Thanks,
> Nick
