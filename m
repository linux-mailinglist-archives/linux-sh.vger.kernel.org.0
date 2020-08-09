Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BDF23FFF4
	for <lists+linux-sh@lfdr.de>; Sun,  9 Aug 2020 22:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgHIU07 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 9 Aug 2020 16:26:59 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37163 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbgHIU06 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 9 Aug 2020 16:26:58 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1k4ruC-000JvM-Cl; Sun, 09 Aug 2020 22:26:56 +0200
Received: from p57bd93c4.dip0.t-ipconnect.de ([87.189.147.196] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.93)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1k4ruC-0040QF-63; Sun, 09 Aug 2020 22:26:56 +0200
Subject: Re: [regression fix] Re: "sh: convert to ->regset_get()" breaks
 linux-sh build
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <9c2d391c-6463-398e-95a1-8f238d739340@physik.fu-berlin.de>
 <20200809161438.GZ1236603@ZenIV.linux.org.uk>
 <20200809174508.GA3026725@ZenIV.linux.org.uk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Message-ID: <8b71cdde-ad2a-e770-b2db-c0b5950994f8@physik.fu-berlin.de>
Date:   Sun, 9 Aug 2020 22:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200809174508.GA3026725@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.147.196
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Al!

On 8/9/20 7:45 PM, Al Viro wrote:
> On Sun, Aug 09, 2020 at 05:14:38PM +0100, Al Viro wrote:
> 
>> What the... oh, I see.
>>
>> Commit in the regset followup series has fixed that, with bisect hazard unnoticed.
>> And since only the followups have not gone in, bisect hazard has turned into
>> a mainline breakage ;/
>>
>> Sorry about that.  FWIW, the commit in question is this; all per-architecture
>> parts in it are mutually independent, but I'll probably just send this one
>> to Linus - no point splitting it up.
> 
> FWIW, there are several ways to handle that.  One is to pull vfs.git#fixes -
> that's the first commit of #regset.followups.  Another is to cherry-pick
> the same.  And the minimal fix would be the subset of that commit as below.
> Linus, what would you prefer?
> 
> sh: kill unused dump_fpu() instance
> 
> dead code now that fdpic has switched to regset coredumps.
>  
> Fixes: 3399d90ce63e "sh: convert to ->regset_get()"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
> diff --git a/arch/sh/include/asm/fpu.h b/arch/sh/include/asm/fpu.h
> index 43cfaf929aa7..04584be8986c 100644
> --- a/arch/sh/include/asm/fpu.h
> +++ b/arch/sh/include/asm/fpu.h
> @@ -37,11 +37,6 @@ struct user_regset;
>  extern int do_fpu_inst(unsigned short, struct pt_regs *);
>  extern int init_fpu(struct task_struct *);
>  
> -extern int fpregs_get(struct task_struct *target,
> -		      const struct user_regset *regset,
> -		      unsigned int pos, unsigned int count,
> -		      void *kbuf, void __user *ubuf);
> -
>  static inline void __unlazy_fpu(struct task_struct *tsk, struct pt_regs *regs)
>  {
>  	if (task_thread_info(tsk)->status & TS_USEDFPU) {
> diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
> index 6ab397bc47ed..7a59a63560c5 100644
> --- a/arch/sh/kernel/process_32.c
> +++ b/arch/sh/kernel/process_32.c
> @@ -93,24 +93,6 @@ void release_thread(struct task_struct *dead_task)
>  	/* do nothing */
>  }
>  
> -/* Fill in the fpu structure for a core dump.. */
> -int dump_fpu(struct pt_regs *regs, elf_fpregset_t *fpu)
> -{
> -	int fpvalid = 0;
> -
> -#if defined(CONFIG_SH_FPU)
> -	struct task_struct *tsk = current;
> -
> -	fpvalid = !!tsk_used_math(tsk);
> -	if (fpvalid)
> -		fpvalid = !fpregs_get(tsk, NULL,
> -				      (struct membuf){fpu, sizeof(*fpu)});
> -#endif
> -
> -	return fpvalid;
> -}
> -EXPORT_SYMBOL(dump_fpu);
> -
>  asmlinkage void ret_from_fork(void);
>  asmlinkage void ret_from_kernel_thread(void);
>  
> diff --git a/arch/sh/kernel/ptrace_32.c b/arch/sh/kernel/ptrace_32.c
> index 5c93bdb6c41a..609b7c917e6e 100644
> --- a/arch/sh/kernel/ptrace_32.c
> +++ b/arch/sh/kernel/ptrace_32.c
> @@ -165,7 +165,7 @@ static int genregs_set(struct task_struct *target,
>  }
>  
>  #ifdef CONFIG_SH_FPU
> -int fpregs_get(struct task_struct *target,
> +static int fpregs_get(struct task_struct *target,
>  	       const struct user_regset *regset,
>  	       struct membuf to)
>  {
> 

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

This fixes the linux-next build on SH for me and also produces a bootable kernel image
which boots without any issues on my SH7785LCR.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
