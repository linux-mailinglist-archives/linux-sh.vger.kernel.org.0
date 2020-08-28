Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F8B255E32
	for <lists+linux-sh@lfdr.de>; Fri, 28 Aug 2020 17:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgH1Pu2 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Aug 2020 11:50:28 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:47680 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgH1Pu0 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Aug 2020 11:50:26 -0400
Date:   Fri, 28 Aug 2020 11:50:25 -0400
From:   Rich Felker <dalias@libc.org>
To:     Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 3/4] sh: Add SECCOMP_FILTER
Message-ID: <20200828155024.GX3265@brightrain.aerifal.cx>
References: <20200722231322.419642-1-kernel@mkarcher.dialup.fu-berlin.de>
 <20200722231322.419642-3-kernel@mkarcher.dialup.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722231322.419642-3-kernel@mkarcher.dialup.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Jul 23, 2020 at 01:13:21AM +0200, Michael Karcher wrote:
> Port sh to use the new SECCOMP_FILTER code.
> 
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
> ---
>  arch/sh/Kconfig                               | 1 +
>  arch/sh/kernel/entry-common.S                 | 2 ++
>  arch/sh/kernel/ptrace_32.c                    | 5 +++--
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 8 +++++++-
>  4 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 32d959849df9..10b510c16841 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -27,6 +27,7 @@ config SUPERH
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GUP_GET_PTE_LOW_HIGH if X2TLB
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_DEBUG_BUGVERBOSE
> diff --git a/arch/sh/kernel/entry-common.S b/arch/sh/kernel/entry-common.S
> index c4d88d61890d..ad963104d22d 100644
> --- a/arch/sh/kernel/entry-common.S
> +++ b/arch/sh/kernel/entry-common.S
> @@ -368,6 +368,8 @@ syscall_trace_entry:
>  	mov.l	7f, r11		! Call do_syscall_trace_enter which notifies
>  	jsr	@r11	    	! superior (will chomp R[0-7])
>  	 nop
> +	cmp/eq	#-1, r0
> +	bt	syscall_exit
>  	mov.l	r0, @(OFF_R0,r15)	! Save return value
>  	!			Reload R0-R4 from kernel stack, where the
>  	!   	    	    	parent may have modified them using
> diff --git a/arch/sh/kernel/ptrace_32.c b/arch/sh/kernel/ptrace_32.c
> index 64bfb714943e..25ccfbd02bfa 100644
> --- a/arch/sh/kernel/ptrace_32.c
> +++ b/arch/sh/kernel/ptrace_32.c
> @@ -485,8 +485,6 @@ asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
>  {
>  	long ret = 0;
>  
> -	secure_computing_strict(regs->regs[0]);
> -
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
>  	    tracehook_report_syscall_entry(regs))
>  		/*
> @@ -496,6 +494,9 @@ asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
>  		 */
>  		ret = -1L;
>  
> +	if (secure_computing() == -1)
> +		return -1;
> +
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->regs[0]);
>  

This patch broke strace - it spews out bogus syscalls and gets the
tracee hung. I suspect the last hunk is wrong and breaks all
non-seccomp tracing. I'll follow up with further analysis and possibly
a fix if you don't find one sooner.

Rich
