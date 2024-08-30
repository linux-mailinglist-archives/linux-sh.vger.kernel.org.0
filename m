Return-Path: <linux-sh+bounces-1548-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9C96548F
	for <lists+linux-sh@lfdr.de>; Fri, 30 Aug 2024 03:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8515A1C225B7
	for <lists+linux-sh@lfdr.de>; Fri, 30 Aug 2024 01:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99C0364D6;
	Fri, 30 Aug 2024 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YFJUp2F7"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEB46B8
	for <linux-sh@vger.kernel.org>; Fri, 30 Aug 2024 01:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980610; cv=none; b=c8xisyI78He0Pacrg7GP83/WYduzKMJjyl4iOz4jY+FG7akPKFAKpCDs+SX30mgKU5x8Ww+tDaPUiV8h4aoTc68gW7k70lf5lTKLWcpBv42Zpn62ALmkU9q+UezcYVo32S/dbmzWjb8S6yepvLrr0jbFNa/Bv/rtPdemiPBAInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980610; c=relaxed/simple;
	bh=O19E6wddJJJyBiqtf0WyxrT1W9vHMvm3yZWRAq+bKOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPWinoYrBFTYVLW5ormbt77/PzDBs9qeqGigkT6H7m5weI8ogDhEiq7C2lPgyedMoMyT9ZSEnyDnH6oeOMF0D+8rnPQZyViuTLAzbDLWCuuuhlwb/qNW8L99d3jANxGVvEGDxk6ApsCS1/lS+ESZvcaGS3xgViYgz4ieTbITjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YFJUp2F7; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5da686531d3so830553eaf.3
        for <linux-sh@vger.kernel.org>; Thu, 29 Aug 2024 18:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980608; x=1725585408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=YFJUp2F7VZKkmuKY3JFZJ9ib01B4eGtOnBH7NzUpM8FGDoYAIq63n/VcUc6QexoBKK
         rd/zwXru8JGrpEFTxV/3nUfh+4F45yJbFaSVm8u1TrVGIchZ/6nqXpmjzvSLcd5ctPWw
         XyAVcuc2x+spsX1R2M2IATWuqgMRbUJG9Qqcr0URqg9uEqBpbqTglUByOkeElFeJBdbr
         JiabxBaBHPWacTqLnk9RC42y1ng5KI1V72chSZr/LzHpBJOUCN1fLjOYAFmIMu3uWLDJ
         MiTsh4VZ3jbMU8LfIuE8H2RLpnKvbeZ6yOo151vjnEhyZddNfqeTvaNkpsknRFQk06nT
         wU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980608; x=1725585408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=F56aHUU0TukZrZ/qAUDpcqTjI/jC3mtsa0sulbGIZ1zrdURCdjLVnWnZFhvtoyVYXB
         UBzLHiaXMyR6Zz7QYeh6Pls7CrUM+5kqwAHui/mDP7pKgPAxCYLajMEsWGRHiaoLtU/K
         gY3Zb3QpEJgaOwid/A4un+DoTRHAOREbWZt4PNwYpxbi2BQ2dFWXXP6T6tZ95eiOvJeh
         /jOQK7MHHTpJ7j1S/slny+FfDr9NCZln5SAbhG97m5zZ5MwdObkNghVZ7eiFZu7U2xDd
         jKEI8eSDGaO2su3AuJ3dqqsHgpnEyk/ovhLH3QHmKieWJtlV0aiUUt9QwZR7hDOLGHpB
         DwFw==
X-Forwarded-Encrypted: i=1; AJvYcCU554HrosFMLvXhUKGzcKH7KYw7o/+SdGBhPrDwKngVVq1l6pqv3bww3DM9m6waLBImhVKkiSQM9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7B1FKKIVD4bo+pJ9C+L/mtJlvZL7kJ8ZGKvavKnYZRAvwwWaR
	azricg5i10nHq9LUAYC8vn/8px8EgbCnEQy2rnxDK4HL8Rv7ViLsRgAaH2NXwzA=
X-Google-Smtp-Source: AGHT+IH958S4ePdwDnUiHubyspadJoOLZkUZCeioopGjkAA0KkZUXlfkSz3mG+kkmopghBfnyH6A6g==
X-Received: by 2002:a05:6358:2803:b0:1ac:f109:e248 with SMTP id e5c5f4694b2df-1b603c00435mr551866655d.2.1724980607523;
        Thu, 29 Aug 2024 18:16:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5961sm1734132b3a.63.2024.08.29.18.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:16:46 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:16:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/4] mm: Add MAP_BELOW_HINT
Message-ID: <ZtEdevUWzplteQWv@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
 <87mskvenum.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mskvenum.fsf@mail.lhotse>

On Thu, Aug 29, 2024 at 06:26:41PM +1000, Michael Ellerman wrote:
> Charlie Jenkins <charlie@rivosinc.com> writes:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> >
> > To make this behavior explicit and more versatile across all
> > architectures, define a mmap flag that allows users to define an
> > arbitrary upper limit on addresses returned by mmap.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/uapi/asm-generic/mman-common.h       | 1 +
> >  tools/include/uapi/asm-generic/mman-common.h | 1 +
>   
> You're not meant to update the headers in tools/ directly. There's a
> mail somewhere from acme somewhere describing the proper process, but
> the tldr is leave it up to him.

Oh okay, thank you.

> 
> > diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> > index 6ce1f1ceb432..03ac13d9aa37 100644
> > --- a/include/uapi/asm-generic/mman-common.h
> > +++ b/include/uapi/asm-generic/mman-common.h
> > @@ -32,6 +32,7 @@
> >  
> >  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
> >  					 * uninitialized */
> > +#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
> 
> IMHO the API would be clearer if this actually forced the address to be
> below the hint. That's what the flag name implies after all.
> 
> It would also mean the application doesn't need to take into account the
> length of the mapping when passing the hint.
> 
> cheers

That's a good point. The reason I did it this way was to allow mmap the
possibility of returning the same address as the hint. If it must be
strictly less than the hint then the hint address can never be returned.
Maybe that doesn't matter though.

- Charlie


