Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E71255F51
	for <lists+linux-sh@lfdr.de>; Fri, 28 Aug 2020 19:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgH1RDC (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Aug 2020 13:03:02 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:47716 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgH1RDB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Aug 2020 13:03:01 -0400
Date:   Fri, 28 Aug 2020 13:03:00 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 3/4] sh: Add SECCOMP_FILTER
Message-ID: <20200828170259.GZ3265@brightrain.aerifal.cx>
References: <20200722231322.419642-1-kernel@mkarcher.dialup.fu-berlin.de>
 <20200722231322.419642-3-kernel@mkarcher.dialup.fu-berlin.de>
 <20200828155024.GX3265@brightrain.aerifal.cx>
 <20200828163057.GY3265@brightrain.aerifal.cx>
 <82b625c2-23cb-69a4-7495-39427430c306@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82b625c2-23cb-69a4-7495-39427430c306@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Aug 28, 2020 at 06:38:09PM +0200, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> On 8/28/20 6:30 PM, Rich Felker wrote:
> > I'm about to test a patch along these lines and will report what I
> > find.
> 
> Let me know when you have something to test and I will test the patch as
> well, making sure we're not breaking seccomp again.

If you have a seccomp test setup, please try the following patch. I'm
not sure if the end result is entirely correct, but I believe it's
at least much closer to correct than the code was before or after
adding SECCOMP_FILTER.


diff --git a/arch/sh/kernel/entry-common.S b/arch/sh/kernel/entry-common.S
index ad963104d22d..0560a8054215 100644
--- a/arch/sh/kernel/entry-common.S
+++ b/arch/sh/kernel/entry-common.S
@@ -368,9 +368,6 @@ syscall_trace_entry:
 	mov.l	7f, r11		! Call do_syscall_trace_enter which notifies
 	jsr	@r11	    	! superior (will chomp R[0-7])
 	 nop
-	cmp/eq	#-1, r0
-	bt	syscall_exit
-	mov.l	r0, @(OFF_R0,r15)	! Save return value
 	!			Reload R0-R4 from kernel stack, where the
 	!   	    	    	parent may have modified them using
 	!   	    	    	ptrace(POKEUSR).  (Note that R0-R2 are
@@ -382,7 +379,7 @@ syscall_trace_entry:
 	mov.l	@(OFF_R5,r15), r5
 	mov.l	@(OFF_R6,r15), r6
 	mov.l	@(OFF_R7,r15), r7   ! arg3
-	mov.l	@(OFF_R3,r15), r3   ! syscall_nr
+	mov	r0, r3              ! syscall_nr, possibly changed to -1
 	!
 	mov.l	6f, r10			! Number of syscalls
 	cmp/hs	r10, r3
diff --git a/arch/sh/kernel/ptrace_32.c b/arch/sh/kernel/ptrace_32.c
index 25ccfbd02bfa..9e86cff041c7 100644
--- a/arch/sh/kernel/ptrace_32.c
+++ b/arch/sh/kernel/ptrace_32.c
@@ -503,7 +503,7 @@ asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
 	audit_syscall_entry(regs->regs[3], regs->regs[4], regs->regs[5],
 			    regs->regs[6], regs->regs[7]);
 
-	return ret ?: regs->regs[0];
+	return ret ?: regs->regs[3];
 }
 
 asmlinkage void do_syscall_trace_leave(struct pt_regs *regs)
