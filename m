Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A512A8345
	for <lists+linux-sh@lfdr.de>; Thu,  5 Nov 2020 17:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgKEQRr (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Nov 2020 11:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgKEQRr (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Nov 2020 11:17:47 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC080C0613CF
        for <linux-sh@vger.kernel.org>; Thu,  5 Nov 2020 08:17:46 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id z2so1853121ilh.11
        for <linux-sh@vger.kernel.org>; Thu, 05 Nov 2020 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hzJchBawwKs0R5GZhadS52B4wMScxxYwAQWNPv3FuZw=;
        b=U1bKg+O+tpLaKz+8hDhHIz2TCfcE1g7C5JCYcx1jzg6kXQ+UhJY6gPMv7t7+AupIpF
         dh4SpC4TVhJIvIAzZR0jPi+WhsgJlKVwhvexXUSjfuOiwj5SxnuNjWH/x8BNLpMRUfXf
         EGAwNstzRGni5o1NixO95OdiWMVJjb2iiT8rbAzMf+XlIUoKqXUBc4TWbIOZP+g3BQCp
         /kXriHuF4+LAvX+ySRSH6pntFFyhLLzckQEsAnj10s9NYAgW6e2mEczk+PNqqcY1KmyA
         Nofe54rCMfNQb3qOKhbjiArdRAeun7hKyXqQgdlhIJk3H4Bc91ny4UZWOfzthtFJABVQ
         XVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hzJchBawwKs0R5GZhadS52B4wMScxxYwAQWNPv3FuZw=;
        b=jVEar/1r9bKfBv7PAEwgJg0gP7tVmgpWP1JEWTwe5ObzI+aTIAh6d6Mm8zxE7PQ66w
         Kx5BrEq6yXaaYC/Ao6z1Ay274tHSmsgOlz1pcJ+VeJyK+IGJaaoPlPJcV6ozHiwAtl2W
         nhMFCOYlPMUhnL39r4fQh9P999WilBHM18gT1723pfG2bPxrEKe6O7xTxJUZSPAx9VUS
         jKxvam/Fq+eSZzk336DcbK1O/AxwpNW1agVeLAaH2kTz+ZG5P6ltMSn/yaSp78+G+BGj
         2BKX0xQ8iOso8GXv6Ml5bUETV87UQqKJC+sc/pJU9wUSWpgUqUSx5g4n8HR9Kl5QQFen
         lNqQ==
X-Gm-Message-State: AOAM530K6T78Z3hJZ152zuQg69zqwXmUuRB50ym/or8hjGL0jPYxm3E1
        B5EM87P9FeS9lYFpx2f4Iez5zvUi1GA0Jg==
X-Google-Smtp-Source: ABdhPJxGiznbdWV+sv6zr1hzVir0OP22xYfnwnkjR8USJTBDtZT0E6SPd6O9HbzbOE0W6U6uU/LuiA==
X-Received: by 2002:a05:6e02:cb4:: with SMTP id 20mr2566410ilg.176.1604593065851;
        Thu, 05 Nov 2020 08:17:45 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id r12sm1380305ilm.28.2020.11.05.08.17.45
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 08:17:45 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-sh@vger.kernel.org
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
Message-ID: <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
Date:   Thu, 5 Nov 2020 09:17:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Gentle nudge on this one.

On 10/29/20 10:21 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for sh.
> 
> Cc: linux-sh@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/sh/include/asm/thread_info.h | 4 +++-
>  arch/sh/kernel/signal_32.c        | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
> index 243ea5150aa0..598d0184ffea 100644
> --- a/arch/sh/include/asm/thread_info.h
> +++ b/arch/sh/include/asm/thread_info.h
> @@ -105,6 +105,7 @@ extern void init_thread_xstate(void);
>  #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
>  #define TIF_SIGPENDING		1	/* signal pending */
>  #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
> +#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
>  #define TIF_SINGLESTEP		4	/* singlestepping active */
>  #define TIF_SYSCALL_AUDIT	5	/* syscall auditing active */
>  #define TIF_SECCOMP		6	/* secure computing */
> @@ -116,6 +117,7 @@ extern void init_thread_xstate(void);
>  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
> +#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
>  #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
>  #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
> @@ -132,7 +134,7 @@ extern void init_thread_xstate(void);
>  #define _TIF_ALLWORK_MASK	(_TIF_SYSCALL_TRACE | _TIF_SIGPENDING      | \
>  				 _TIF_NEED_RESCHED  | _TIF_SYSCALL_AUDIT   | \
>  				 _TIF_SINGLESTEP    | _TIF_NOTIFY_RESUME   | \
> -				 _TIF_SYSCALL_TRACEPOINT)
> +				 _TIF_SYSCALL_TRACEPOINT | _TIF_NOTIFY_SIGNAL)
>  
>  /* work to do on interrupt/exception return */
>  #define _TIF_WORK_MASK		(_TIF_ALLWORK_MASK & ~(_TIF_SYSCALL_TRACE | \
> diff --git a/arch/sh/kernel/signal_32.c b/arch/sh/kernel/signal_32.c
> index 1add47fd31f6..8cfae5a75edb 100644
> --- a/arch/sh/kernel/signal_32.c
> +++ b/arch/sh/kernel/signal_32.c
> @@ -466,7 +466,10 @@ static void do_signal(struct pt_regs *regs, unsigned int save_r0)
>  	if (!user_mode(regs))
>  		return;
>  
> -	if (get_signal(&ksig)) {
> +	if (ti_work & _TIF_NOTIFY_SIGNAL)
> +		tracehook_notify_signal();
> +
> +	if ((ti_work & _TIF_SIGPENDING) && get_signal(&ksig)) {
>  		handle_syscall_restart(save_r0, regs, &ksig.ka.sa);
>  
>  		/* Whee!  Actually deliver the signal.  */
> @@ -499,7 +502,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, unsigned int save_r0,
>  				 unsigned long thread_info_flags)
>  {
>  	/* deal with pending signal delivery */
> -	if (thread_info_flags & _TIF_SIGPENDING)
> +	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>  		do_signal(regs, save_r0);
>  
>  	if (thread_info_flags & _TIF_NOTIFY_RESUME)
> 


-- 
Jens Axboe

