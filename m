Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B852ABE4E
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 15:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbgKIOOD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 09:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730558AbgKIOOD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 09:14:03 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFB3C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 06:14:02 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id x7so8403938ili.5
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 06:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LJv1qCp6DHiJAyQwf2Ja3I4oIJZg5pWMR7R6RtfsKIE=;
        b=WVQ/lBAYEKOvbE7AKj+oe127xRq+8HfthRG2qqsOqK5EcwM7D3ZZ50YPCTfK35l+OK
         Ivz6FzTAOsPYqgr8ILPoSj/tVHmM7oxCHpw/YXdVxKcT4Tw9+iGt0RWWHTVCJAEJIfHO
         wDPV/rOQ4jGVSUhC+rx3NiJsjk48dYgR0UTthHlrQZaDJHiCcJdkeT9NNola0QS50Mse
         Myd0lrLhJxnJG+fY2W+3izQYkO2hGT0XaiqarAOIgTg3CN0R3HDc3k3enqb8jnwNqdYX
         IU5miaA1hYASU9RPHtyn9lSQhRfeGOwoD3BkkXwc2VJw8Twf2vtY77016Jxw9f7zDsf3
         Qf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LJv1qCp6DHiJAyQwf2Ja3I4oIJZg5pWMR7R6RtfsKIE=;
        b=l7jy4qYVAGCBpCg98yy9wWuWOVahz6vCM65gSe/Ze3do3mxU6xfM8dWQdScMRdBgiA
         f0bTkFJxeYqHZt318v69/V8WcBRCJlMNWeO/zycmyyOaJmJhIeYNEfTks04e6Osy2LYn
         5VllfL7zy94IiepjgPuTnsvrdSCQD1cr18ffweYJWlocys5X5io5aaFQ+VmjvHc9QV2d
         1Cpx6iKTo6MXlC1UyjaTVHIRw90NEUesFoJHw46NId2exVm6e4ZS8bwOtVuNstQXYB/K
         IUqTI4UgA707mkdde2k5puHCHJh2DuoP5a16g+ZttrILVMceUj+R0JyTG40oCupelQ/r
         o1cg==
X-Gm-Message-State: AOAM5307aT1V10HoMQ7rI5OAKgWVyhTy2UVBOy1AfpFZ3N5r9TC6Qy8i
        mgaBa92lep546vhv1M+vdG7WjbndA7fOyw==
X-Google-Smtp-Source: ABdhPJw2R8Va6u+B69CxtYt6lihS+wbg60U2slgmBY8JMmpC/J3xkAwu0rlj/suiSMyjxIteK/ih/g==
X-Received: by 2002:a92:d489:: with SMTP id p9mr6939928ilg.123.1604931241238;
        Mon, 09 Nov 2020 06:14:01 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id n4sm5923791iox.6.2020.11.09.06.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:14:00 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org, Rich Felker <dalias@libc.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
 <526461bb-4cb0-a5cc-b933-2d7b2a37bd5d@landley.net>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f6914e11-5d7c-576f-4797-83f7294722aa@kernel.dk>
Date:   Mon, 9 Nov 2020 07:14:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <526461bb-4cb0-a5cc-b933-2d7b2a37bd5d@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 1:15 AM, Rob Landley wrote:
> On 11/5/20 11:15 AM, Jens Axboe wrote:
>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>> Hi Jens!
>>>
>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>> Gentle nudge on this one.
>>>
>>> I can build- and boot-test on SH and IA64.
>>
>> That'd be great, thanks!
>>
>>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
>>
>> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.
> 
> It breaks my ARCH=sh j2_defconfig build:
> 
> arch/sh/kernel/signal_32.c: In function 'do_signal':
> arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
> function)
> 
> Admittedly I'm testing a stack of 6 other patches at the same time:
> 
> [PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
> [PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
> [PATCH] sh: remove CONFIG_IDE from most defconfig.eml
> [PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
> [PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
> [PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml
> 
> But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.

Yeah that's my fault, this one should be a lot better...


commit de2791b15d47a56854054da71064b9634896728b
Author: Jens Axboe <axboe@kernel.dk>
Date:   Fri Oct 9 15:36:35 2020 -0600

    sh: add support for TIF_NOTIFY_SIGNAL
    
    Wire up TIF_NOTIFY_SIGNAL handling for sh.
    
    Cc: linux-sh@vger.kernel.org
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
index 243ea5150aa0..598d0184ffea 100644
--- a/arch/sh/include/asm/thread_info.h
+++ b/arch/sh/include/asm/thread_info.h
@@ -105,6 +105,7 @@ extern void init_thread_xstate(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
+#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
 #define TIF_SINGLESTEP		4	/* singlestepping active */
 #define TIF_SYSCALL_AUDIT	5	/* syscall auditing active */
 #define TIF_SECCOMP		6	/* secure computing */
@@ -116,6 +117,7 @@ extern void init_thread_xstate(void);
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
 #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
@@ -132,7 +134,7 @@ extern void init_thread_xstate(void);
 #define _TIF_ALLWORK_MASK	(_TIF_SYSCALL_TRACE | _TIF_SIGPENDING      | \
 				 _TIF_NEED_RESCHED  | _TIF_SYSCALL_AUDIT   | \
 				 _TIF_SINGLESTEP    | _TIF_NOTIFY_RESUME   | \
-				 _TIF_SYSCALL_TRACEPOINT)
+				 _TIF_SYSCALL_TRACEPOINT | _TIF_NOTIFY_SIGNAL)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_ALLWORK_MASK & ~(_TIF_SYSCALL_TRACE | \
diff --git a/arch/sh/kernel/signal_32.c b/arch/sh/kernel/signal_32.c
index 1add47fd31f6..e78d3e10a203 100644
--- a/arch/sh/kernel/signal_32.c
+++ b/arch/sh/kernel/signal_32.c
@@ -453,7 +453,8 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs, unsigned int save_r0)
  * the kernel can handle, and then we build all the user-level signal handling
  * stack-frames in one go after that.
  */
-static void do_signal(struct pt_regs *regs, unsigned int save_r0)
+static void do_signal(struct pt_regs *regs, unsigned int save_r0,
+		      unsigned long ti_work)
 {
 	struct ksignal ksig;
 
@@ -466,7 +467,10 @@ static void do_signal(struct pt_regs *regs, unsigned int save_r0)
 	if (!user_mode(regs))
 		return;
 
-	if (get_signal(&ksig)) {
+	if (ti_work & _TIF_NOTIFY_SIGNAL)
+		tracehook_notify_signal();
+
+	if ((ti_work & _TIF_SIGPENDING) && get_signal(&ksig)) {
 		handle_syscall_restart(save_r0, regs, &ksig.ka.sa);
 
 		/* Whee!  Actually deliver the signal.  */
@@ -499,8 +503,8 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, unsigned int save_r0,
 				 unsigned long thread_info_flags)
 {
 	/* deal with pending signal delivery */
-	if (thread_info_flags & _TIF_SIGPENDING)
-		do_signal(regs, save_r0);
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
+		do_signal(regs, save_r0, thread_info_flags);
 
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);

-- 
Jens Axboe

