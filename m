Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD943BB87
	for <lists+linux-sh@lfdr.de>; Tue, 26 Oct 2021 22:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239170AbhJZU3I (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 26 Oct 2021 16:29:08 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:39554 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239167AbhJZU2z (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 26 Oct 2021 16:28:55 -0400
Date:   Tue, 26 Oct 2021 16:26:27 -0400
From:   Rich Felker <dalias@libc.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
Message-ID: <20211026202625.GU7074@brightrain.aerifal.cx>
References: <20211026100432.1730393-1-arnd@kernel.org>
 <20211026100432.1730393-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Oct 26, 2021 at 12:03:48PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/Kconfig              |  1 -
>  arch/arm/Kconfig              |  1 -
>  arch/arm64/Kconfig            |  1 -
>  arch/csky/Kconfig             |  1 -
>  arch/m68k/Kconfig             |  1 -
>  arch/riscv/Kconfig            |  1 -
>  arch/s390/Kconfig             |  1 -
>  arch/sh/Kconfig               |  1 -
>  arch/um/Kconfig               |  1 -
>  arch/um/kernel/skas/uaccess.c |  1 -
>  arch/xtensa/Kconfig           |  1 -
>  init/Kconfig                  |  8 --------
>  kernel/futex/core.c           | 35 -----------------------------------
>  kernel/futex/futex.h          |  6 ------
>  kernel/futex/syscalls.c       | 22 ----------------------
>  15 files changed, 82 deletions(-)

Acked-by: Rich Felker <dalias@libc.org>

