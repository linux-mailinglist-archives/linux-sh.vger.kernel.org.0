Return-Path: <linux-sh+bounces-2481-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CAA50040
	for <lists+linux-sh@lfdr.de>; Wed,  5 Mar 2025 14:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91A03A3BFF
	for <lists+linux-sh@lfdr.de>; Wed,  5 Mar 2025 13:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D9324A050;
	Wed,  5 Mar 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQnGzWp1"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DFE24BC05
	for <linux-sh@vger.kernel.org>; Wed,  5 Mar 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180361; cv=none; b=aqsQ0W2RBfKTVkLhCvTA2iqgnMFrDpBlrGNpbzW3jzzzi7Q6EkyqPCkforQqlrEaI2VeP7/YdGjqjXJqUD/w3+koh7ynBtfEJrq61GOqvpCMjA1rC7ELlPgJ4R8tlfqkoIE4crvwoW23VvSbNHVuG1BvfyD662EtXTldCdLDovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180361; c=relaxed/simple;
	bh=niOkZ3yknjy6O15SgZEu1bTRkBCDN86QkzY45J5nUU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPY9N4XtNzh7UgsHN/NLgFG0EVRX8ZG6KaSUCdpkLLL8D/eiGUmvFm5gl6jUblTuEyxOxGqqPA+TgvyndugQRX9e6/PV1FboC4O8gBYeoAwwizyZ4Tw+6+xzC5WHwXeu6Rm9p3tLmUXnTyaQDNi+aXO8XhPdLDCGgAj80nfXrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQnGzWp1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-474e1b8c935so265271cf.0
        for <linux-sh@vger.kernel.org>; Wed, 05 Mar 2025 05:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741180358; x=1741785158; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOdrgfnKDo0adnIeWCzGbGdt+czcdG3OGWY151PLQj4=;
        b=bQnGzWp1S5Lnz9b7S+X9iWyT1enphmYxyeyJwj5VVMYJnObuLGzhvMkG9uBL3XQ78b
         Zo3JrmBI4ko2x+OO+iOQpQBqfBgjcS472wlJfVY900sBa3almRwnfbIdcWBcdXKwsieo
         7k0oWhWF732whbIyH4GNsIMNo9o7b80aqltg+jU0O65LkiOSm3+oSVpH3YoRptaQnRij
         NWBaZfEqos2npnT6v52bnbTpKCy19r6KPYKzleLdok7ZrEkR9SnnqDT5T6ABVfKQ+2Iz
         NKN7Fajx9PPEYnKJdu5XQV9dDUNkJGUpIwD5ACAowRHjrTqUH64V59DpzL+Y1S7JzlY8
         4rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180358; x=1741785158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOdrgfnKDo0adnIeWCzGbGdt+czcdG3OGWY151PLQj4=;
        b=Fg5GviIUBq5Hgkf9X4Rz4/BJcsmlV77Fwh/rC4j7BoDeAvIe9qm0t10n3CEFV03wPt
         Iz5XEMB5MVzZddAlcjUzNcUEludA6mrpxVk3qCJ0lGjOcakueTyEYjwpy7KesKnDn4/g
         oZPg6MnNockA3THgbVsxaM+BzzS/bZeOUdpuRA+d0Ox3b5ZRL3ra+0HVPQqQp/1j50Pd
         KCSaY1s15EMxSvCeKGO8TCpE2maK43z+8n7nP4pJt2fTQz/loMrtNA/DdKTuYUTpf5jH
         nly6IMXyoOB4vqzVBaiH/PFKyAgOtjHGFbzsyO4odY0SXWYs7Yh6zTTh/fWnTpzgWlcg
         0xlw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4JMbnhMQBXtpZBfxqBHpnPdjsG3uh7jEVLdHTBUAMWTvZsr12WKlbJvNaXpn6lYfuourSmoKXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSEtdqgH1s68fz3+xyeXv5jDNtE8fCx2SM9g9mTZwKZv0rZ0c
	Rjy8H60HRoAzq9AiWPK6sgeOpyOxW73RUpyz4489mrk8UY1zVqdGvCXqqxwOWsc5YpAtiF8aAcl
	fTFJLltZQHh1Qs3zR3/yE07Ii+yvluI+yP2bn
X-Gm-Gg: ASbGncufwLsjNNUoqAsTTpD69mb08JplpWKOuCi0ItIukgEiEdDMWgLihqyhoKtWDEY
	DN7ee4K/LzNRQhhUtTvm+KfIdnNa5FkhfLvqkBVGMH660DtLWuFuiiVNdDvm4G4TIxvtraMwxlA
	hoY7agOXCeXzQfO36cDUc9+C+3nHHoVahd/HNuUNl66VEaclFeua6C8+0s
X-Google-Smtp-Source: AGHT+IFIn6b7M1PNu9NZZ9KBzOuRO4deZPOixhL9M73rMvQkDHUtfUtYPha+8DdwHlmaLHcT+urAybKKpNAnQK1YFdU=
X-Received: by 2002:a05:622a:110b:b0:471:f560:27dc with SMTP id
 d75a77b69052e-4750cae2127mr2406081cf.27.1741180357471; Wed, 05 Mar 2025
 05:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com> <Z8K2B3WJoICVbDj3@kernel.org>
In-Reply-To: <Z8K2B3WJoICVbDj3@kernel.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 5 Mar 2025 14:12:25 +0100
X-Gm-Features: AQ5f1JrEWoe__i5J-gwzMxiuWZ9pJYk4XLPMWAQuPYUSu5vOhjZQNejm22RSyYE
Message-ID: <CA+i-1C06Sunj0BmFON=MbWBK6ZDt_=K4P3BHChRBYyxXqEkQ2g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 02/29] x86: Create CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
To: Mike Rapoport <rppt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 01, 2025 at 09:23:51AM +0200, Mike Rapoport wrote:
> Hi Brendan,
>
> On Fri, Jan 10, 2025 at 06:40:28PM +0000, Brendan Jackman wrote:
> > Currently a nop config. Keeping as a separate commit for easy review of
> > the boring bits. Later commits will use and enable this new config.
> >
> > This config is only added for non-UML x86_64 as other architectures do
> > not yet have pending implementations. It also has somewhat artificial
> > dependencies on !PARAVIRT and !KASAN which are explained in the Kconfig
> > file.
> >
> > Co-developed-by: Junaid Shahid <junaids@google.com>
> > Signed-off-by: Junaid Shahid <junaids@google.com>
> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > ---
> >  arch/alpha/include/asm/Kbuild      |  1 +
> >  arch/arc/include/asm/Kbuild        |  1 +
> >  arch/arm/include/asm/Kbuild        |  1 +
> >  arch/arm64/include/asm/Kbuild      |  1 +
> >  arch/csky/include/asm/Kbuild       |  1 +
> >  arch/hexagon/include/asm/Kbuild    |  1 +
> >  arch/loongarch/include/asm/Kbuild  |  3 +++
> >  arch/m68k/include/asm/Kbuild       |  1 +
> >  arch/microblaze/include/asm/Kbuild |  1 +
> >  arch/mips/include/asm/Kbuild       |  1 +
> >  arch/nios2/include/asm/Kbuild      |  1 +
> >  arch/openrisc/include/asm/Kbuild   |  1 +
> >  arch/parisc/include/asm/Kbuild     |  1 +
> >  arch/powerpc/include/asm/Kbuild    |  1 +
> >  arch/riscv/include/asm/Kbuild      |  1 +
> >  arch/s390/include/asm/Kbuild       |  1 +
> >  arch/sh/include/asm/Kbuild         |  1 +
> >  arch/sparc/include/asm/Kbuild      |  1 +
> >  arch/um/include/asm/Kbuild         |  2 +-
> >  arch/x86/Kconfig                   | 14 ++++++++++++++
> >  arch/xtensa/include/asm/Kbuild     |  1 +
> >  include/asm-generic/asi.h          |  5 +++++
> >  22 files changed, 41 insertions(+), 1 deletion(-)
>
> I don't think this all is needed. You can put asi.h with stubs used outside
> of arch/x86 in include/linux and save you the hassle of updating every
> architecture.

...

> If you expect other architectures might implement ASI the config would better
> fit into init/Kconfig or mm/Kconfig and in arch/x86/Kconfig will define
> ARCH_HAS_MITIGATION_ADDRESS_SPACE_ISOLATION.

...

> > +++ b/include/asm-generic/asi.h
> > @@ -0,0 +1,5 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_GENERIC_ASI_H
> > +#define __ASM_GENERIC_ASI_H
> > +
> > +#endif
>
> IMHO it should be include/linux/asi.h, with something like
>
> #infdef __LINUX_ASI_H
> #define __LINUX_ASI_H
>
> #ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
>
> #include <asm/asi.h>
>
> #else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
>
> /* stubs for functions used outside arch/ */
>
> #endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
>
> #endif /* __LINUX_ASI_H */

Thanks Mike! That does indeed look way tidier. I'll try to adopt it.

