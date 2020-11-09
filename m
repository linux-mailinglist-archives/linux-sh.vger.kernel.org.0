Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8BF2ABF74
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 16:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbgKIPLM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 10:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKIPKp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 10:10:45 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60C3C0613CF
        for <linux-sh@vger.kernel.org>; Mon,  9 Nov 2020 07:10:43 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id r12so10125892iot.4
        for <linux-sh@vger.kernel.org>; Mon, 09 Nov 2020 07:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t13+i9nHSaKDzXTkUXUi4Cp0hKFxKQCQheLsBlOVsic=;
        b=HLdpxFmxI+PRJ11o+9Xv3x1vkvn99AWR87qfuiXUn/Bk1Z9PVJPbuFN0uUO5GoHG5d
         Jcv036Srkn0PSPsvtn0fP97VjBNMHpfGpY052EBtny2fl5jMXX1JmG3bBFG8wxRyr5U/
         tpBdDQjwcwDPgTg3FD7PLhbpPEFxWy20RdlEj7JrEChJOFB2kRlSdejEH5dKvXYGJjeE
         FIIwcT0E4JOXTLYCFToo2INDTjZqg1fmLKBUGJ2NtBd1uFrzB4BhkreipuaJ+mKaAPc9
         9oF5tafGDtnukuAqmVtxGUiyJQ5UaC7VhfSUH73RSJLcosFgiGOkx/KhDbLROhX7nw9s
         gT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t13+i9nHSaKDzXTkUXUi4Cp0hKFxKQCQheLsBlOVsic=;
        b=VG8lTkErSahYmx2ggx52odNg4Bn6E+7QA2sxPQ0zkj2iFa9ySaFjBxJBY252Un8ukT
         QwkY6E0NC7Rffwz6mqz+LnU+mXWY00L4MgkBcoCellUSp1u3o1X12i6m+6B+6vAIC39t
         mQNKvbxFbAaOy5yC+g009ZS9aO+3yyq7S50yCkSOE72VuQgWppeKn6Kc+jVujhxh7vKu
         ujc0XIapECdujVmqCb2Rtfi16SS8kqWbZtzxKqe5TEB1wYPnvmHcnPqnzkFKFu6BPv5y
         LHQU4Cy1UFa4o4J81s9NaHMhBkemc+iL9/N9LrKgH+PnNLlt3/k4cfZZpE+zrgR8KNeX
         WVGQ==
X-Gm-Message-State: AOAM533rzC9BpQmOHBrMgRb6DEdsaml1bf2caF/e6sDn9Q81p0aOr1Hw
        e8y8fgFrqxWARCQOl3RBHKk5v1ZvzeJkvg==
X-Google-Smtp-Source: ABdhPJxBqDu4P0BHy9FfJn9dGDsSSF8ZnbOJz9hf7R7yB0ts1IlOTqnIf7D0uZcl5oZ2gaulf/LLNg==
X-Received: by 2002:a02:c956:: with SMTP id u22mr10902067jao.135.1604934643084;
        Mon, 09 Nov 2020 07:10:43 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 186sm7435903ile.4.2020.11.09.07.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 07:10:42 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org, Rich Felker <dalias@libc.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
 <526461bb-4cb0-a5cc-b933-2d7b2a37bd5d@landley.net>
 <f6914e11-5d7c-576f-4797-83f7294722aa@kernel.dk>
 <32d222bd-34e8-e1aa-9e17-3835039d277b@landley.net>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <66582445-4ec9-86d0-e286-8e21590f608a@kernel.dk>
Date:   Mon, 9 Nov 2020 08:10:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <32d222bd-34e8-e1aa-9e17-3835039d277b@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 8:15 AM, Rob Landley wrote:
> 
> 
> On 11/9/20 8:14 AM, Jens Axboe wrote:
>> On 11/9/20 1:15 AM, Rob Landley wrote:
>>> On 11/5/20 11:15 AM, Jens Axboe wrote:
>>>> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>>>>> Hi Jens!
>>>>>
>>>>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>>>>> Gentle nudge on this one.
>>>>>
>>>>> I can build- and boot-test on SH and IA64.
>>>>
>>>> That'd be great, thanks!
>>>>
>>>>> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.
>>>>
>>>> Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.
>>>
>>> It breaks my ARCH=sh j2_defconfig build:
>>>
>>> arch/sh/kernel/signal_32.c: In function 'do_signal':
>>> arch/sh/kernel/signal_32.c:469:6: error: 'ti_work' undeclared (first use in this
>>> function)
>>>
>>> Admittedly I'm testing a stack of 6 other patches at the same time:
>>>
>>> [PATCH -next v2] sh: intc: Convert to DEFINE_SHOW_ATTRIBUTE.eml
>>> [PATCH] sh: dma: fix kconfig dependency for G2_DMA.eml
>>> [PATCH] sh: remove CONFIG_IDE from most defconfig.eml
>>> [PATCH] sh: Remove unused HAVE_COPY_THREAD_TLS macro.eml
>>> [PATCH v1] sh: Drop ARCH_NR_GPIOS definition.eml
>>> [PATCH v2 RESEND +TRIVIAL] arch_sh: hyphenate Non-Uniform in Kconfig prompt.eml
>>>
>>> But this is the one I need to revert to get 5.10-rc3 to build, the rest compile.
>>
>> Yeah that's my fault, this one should be a lot better...
> 
> arch/sh/kernel/signal_32.c: In function 'do_signal':
> arch/sh/kernel/signal_32.c:471:3: error: implicit declaration of function
> 'tracehook_notify_signal'; did you mean 'tracehook_notify_resume'?
> [-Werror=implicit-function-declaration]
> 
> Keep 'em coming...

Gah, it was still using the old style. This one should work and be correct,
promise, double checked :-)


commit 748887e0b8e7557d79a04e0f8e930027770d7b28
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
index 1add47fd31f6..dd3092911efa 100644
--- a/arch/sh/kernel/signal_32.c
+++ b/arch/sh/kernel/signal_32.c
@@ -499,7 +499,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, unsigned int save_r0,
 				 unsigned long thread_info_flags)
 {
 	/* deal with pending signal delivery */
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs, save_r0);
 
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)

-- 
Jens Axboe

