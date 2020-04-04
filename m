Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5552E19E1FD
	for <lists+linux-sh@lfdr.de>; Sat,  4 Apr 2020 02:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgDDAv1 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 3 Apr 2020 20:51:27 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:59592 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDDAv1 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 3 Apr 2020 20:51:27 -0400
Date:   Fri, 3 Apr 2020 20:51:25 -0400
From:   Rich Felker <dalias@libc.org>
To:     Rob Landley <rob@landley.net>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: v5.6 is still throwing a stack trace on boot.
Message-ID: <20200404005125.GF11469@brightrain.aerifal.cx>
References: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
 <20200404000730.GE11469@brightrain.aerifal.cx>
 <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Apr 03, 2020 at 07:28:27PM -0500, Rob Landley wrote:
> On 4/3/20 7:07 PM, Rich Felker wrote:
> > On Fri, Apr 03, 2020 at 06:49:00PM -0500, Rob Landley wrote:
> >> Run /init as init process
> >> ------------[ cut here ]------------
> >> WARNING: CPU: 0 PID: 1 at mm/slub.c:2468 ___slab_alloc.constprop.0+0x1f0/0x290
> >>
> >> CPU: 0 PID: 1 Comm: swapper Not tainted 5.6.0 #2
> >> PC is at ___slab_alloc.constprop.0+0x1f0/0x290
> >> PR is at __slab_alloc.constprop.0+0x2e/0x54
> >> PC  : 8c0a76c4 SP  : 8f829ea0 SR  : 400080f0
> >> TEA : c0001240
> >> R0  : 8c0a74d4 R1  : 00000100 R2  : 00000100 R3  : 00000000
> >> R4  : 8f8020a0 R5  : 00000dc0 R6  : 8c01d678 R7  : 8fff5180
> >> R8  : 8f8020a0 R9  : 8fff5180 R10 : 8c01d678 R11 : 80000000
> >> R12 : 00007fff R13 : 00000dc0 R14 : 8f8020a0
> >> MACH: 0000008b MACL: 0ae4849d GBR : 00000000 PR  : 8c0a7792
> >>
> >> Call trace:
> >>  [<(ptrval)>] mm_alloc+0xe/0x48
> >>  [<(ptrval)>] do_IRQ+0x0/0x50
> >>  [<(ptrval)>] __slab_alloc.constprop.0+0x2e/0x54
> >>  [<(ptrval)>] arch_local_irq_restore+0x0/0x24
> >>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
> >>  [<(ptrval)>] kmem_cache_alloc+0xd0/0x15c
> >>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
> >>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
> >>  [<(ptrval)>] memset+0x0/0x8c
> >>  [<(ptrval)>] __do_execve_file+0x22e/0x5d8
> >>  [<(ptrval)>] kmem_cache_alloc+0x0/0x15c
> >>  [<(ptrval)>] do_execve+0x16/0x24
> >>  [<(ptrval)>] arch_local_irq_restore+0x0/0x24
> >>  [<(ptrval)>] printk+0x0/0x24
> >>  [<(ptrval)>] kernel_init+0x34/0xe8
> >>  [<(ptrval)>] ret_from_kernel_thread+0xc/0x14
> >>  [<(ptrval)>] schedule_tail+0x0/0x5c
> >>  [<(ptrval)>] kernel_init+0x0/0xe8
> >>
> >> ---[ end trace 76213c1325250d90 ]---
> > 
> > Which hardware is this on? The qemu emulated board you're using?
> 
> Yes, qemu -M r2d. Built with attached miniconf, and run via:
> 
> qemu-system-sh4 -M r2d -serial null -serial mon:stdio -nographic -no-reboot \
>   -m 256 -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" -kernel zImage \
>   -initrd sh4.cpio.gz

OK. This is nbd, it's just some pedantry added in commit
128227e7fe4087b60f1bd31f762e61237eb23790. Essentially it's complaining
that something requested zero-filled slab memory when it's about to
run a constructor to fill in the memory. The backtrace is (as usual)
somewhat bogus looking and grep isn't helping me find where it's being
called from. I'll keep looking and see if I can track it down.

Rich
