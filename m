Return-Path: <linux-sh+bounces-6-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681C7F291F
	for <lists+linux-sh@lfdr.de>; Tue, 21 Nov 2023 10:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AE071F24C8B
	for <lists+linux-sh@lfdr.de>; Tue, 21 Nov 2023 09:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE383C06E;
	Tue, 21 Nov 2023 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="ZM9BUGKh"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C4791
	for <linux-sh@vger.kernel.org>; Tue, 21 Nov 2023 01:43:57 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so4699134a12.0
        for <linux-sh@vger.kernel.org>; Tue, 21 Nov 2023 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700559837; x=1701164637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=ZM9BUGKhdZSiK9qSY+BRxnJvVs1TrFMGKlkSalxOYVhyIEoM9/kCkBWGGXg3OHv2K1
         tzWrXbJinR5deBn2P/EN3S+6ll72ULDUty2DBc5jNYIAncsSvExgJCD7vI6X6O6amUPU
         P+b7lSrzrGIn26cfpBRXTEd0Q4/ddyXc0SxicqWu7CL4lS5bNufi12+ZhaFS0hD3mtd0
         4XupWXqEmMyKFOJ1z8zCOyZHPorAvUvyIavcJg2WNPM8Hppfu4FvCc04wDxRMX4PYFgJ
         EZ9/2mCPfw2zM1KKT289uuMKSQfMR50Z126z3/A7P3DpZ0S06KSeG/j3B4fdTg6gkjcf
         jalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700559837; x=1701164637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=si3hF/WkqIXiGJqy8RjDKEVM2pAjzEhsCB2K4DHvP+pUCQfJaKVfdeuwH+CwtTQ/+8
         rDwUyi/Prv3+JJudrkCJji1qhlaeGBr4qEmTuub31AjtTcMtWDQXCw5Rb+D5kKRwHuWJ
         vwJbR9CkVd6iyG5ottf2XATlDN8r7vwOlzxCLmrw/G/OlQ3fFCNYQqLLJuqDuz0OLLW3
         4R0hrqUK9iIj4CdudZyaIQvdvxeslfWAGK+IMWOhs/WpHyPxdJMnh4EwsBqrIheYN6q3
         yjii04csoaWyGdYXgNaQQ7aiKoDYgaKDa/0Dz2rOUzTLbAuvcbys0YHf7WSSPR42kKAf
         9ukA==
X-Gm-Message-State: AOJu0YxL67Aa4cLPKmzPkJvt/BW0ZLB+DS+YO2k3AgZQdnn7KlTwHRxt
	QidfvfiuLeRTChbjc+N3sM0kVOIgfc0DjjtN+T30Cw==
X-Google-Smtp-Source: AGHT+IEcUNpIPdW1r2zWS/VP7g/MssGikpOuJYLZxDVK+bKJDUZATHNuI3hhP6xrYrzf7teMAwRZk2h/7jc/ROLL0jw=
X-Received: by 2002:a17:90b:4d0a:b0:283:2d65:f231 with SMTP id
 mw10-20020a17090b4d0a00b002832d65f231mr3047813pjb.22.1700559836764; Tue, 21
 Nov 2023 01:43:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
In-Reply-To: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 21 Nov 2023 09:43:45 +0000
Message-ID: <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>, eric_devolder@yahoo.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	dave.hansen@linux.intel.com, x86@kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com, 
	juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk, 
	linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 7:53=E2=80=AFAM Ignat Korchagin <ignat@cloudflare.c=
om> wrote:
>
> On Tue, Nov 21, 2023 at 1:50=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote=
:
> >
> > Eric DeVolder's Oracle mail address is not available anymore, add his
> > current mail address he told me.
>
> Thank you!
>
> > On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > > Good day!
> > >
> > > We have recently started to evaluate Linux 6.6 and noticed that we
> > > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > > enabled. It seems to be related to commit 89cde455 ("kexec:
> > > consolidate kexec and crash options into kernel/Kconfig.kexec"), wher=
e
> > > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> > >
> > > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> > > with enforced signature check to support the kernel crash dumping
> > > functionality and would like to keep CONFIG_KEXEC disabled for
> > > security reasons [1].
> > >
> > > I was reading the long commit message, but the reason for adding
> > > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> > > believe from the implementation perspective CONFIG_KEXEC_FILE should
> > > suffice here (as we successfully used it for crashdumps on Linux 6.1)=
.
> > >
> > > Is there a reason for adding this dependency or is it just an
> > > oversight? Would some solution of requiring either CONFIG_KEXEC or
> > > CONFIG_KEXEC_FILE work here?
> >
> > I searched the patch history, found Eric didn't add the dependency on
> > CONFIG_KEXEC at the beginning. Later a linux-next building failure with
> > randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> > CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency for
> > CRASH_DUMP. Please see below link for more details:
> >
> > https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle=
.com/T/#u
>
> Thank you for digging this up. However I'm still confused, because
> this is exactly how we configure Linux 6.1 (although we do have
> CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
> we did not investigate this issue properly.

I did some preliminary investigation for this. If I patch out the
dependency on CONFIG_KEXEC the kernel builds just fine for x86
(without CONFIG_CRASH_HOTPLUG - which is probably another issue) - so
this was the previous behaviour. I can see that the reported error is
for arm architecture and was able to reproduce it with a simple cross
compiler in Debian. However, I think it is still somehow related to
this patchset as the previous kernels (up to 6.5) build fine with just
CONFIG_CRASH_DUMP and without CONFIG_KEXEC for arm as well. So even
for arm it was introduced in 6.6.

> > And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> > CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> > cpu/memory hotplug hapened.
>
> This still feels like a regression to me: any crash dump support
> should be independent of KEXEC syscalls being present. While probably
> the common case (including us) that the crashing kernel and recovery
> kernel are the same, they don't have to be. We need kexec syscall in
> the crashing kernel, but crashdump support in the recovery kernel (but
> the recovery kernel not having the kexec syscalls should be totally
> fine). If we do require some code definitions from kexec - at most we
> should put them under CONFIG_KEXEC_CORE.
>
> > Thanks
> > Baoquan
> >

Ignat

