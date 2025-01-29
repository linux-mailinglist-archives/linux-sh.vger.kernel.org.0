Return-Path: <linux-sh+bounces-2358-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EBEA22448
	for <lists+linux-sh@lfdr.de>; Wed, 29 Jan 2025 19:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083C93A531A
	for <lists+linux-sh@lfdr.de>; Wed, 29 Jan 2025 18:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D881E0DE3;
	Wed, 29 Jan 2025 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GisjZwU+"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20EC14F9FF
	for <linux-sh@vger.kernel.org>; Wed, 29 Jan 2025 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176777; cv=none; b=rEnwo2xuYriH0+qqPpVu1Q3WLKLU+qCd/iHZzxTufj4kJ1yUzyT+ojfWSCm9KkNOaHHHWsy8cXhoaX/Cs9DHij3Ee0rEajK5ZW8uuCg1fpxqgZQx81PMx0K+1K81aFoKfR62l6Y8FsjeU/8yQrC2n+GhJITkx+9mRlr5Qh3ugms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176777; c=relaxed/simple;
	bh=kXUWf4bzCULNMipXU787lKMp83ROSa9zL6s2oSKQfIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RstrAczXv8dgGugWwI51oTKMPmuwLAAD0qLZRYrHGKyc+knjwFMYlY/felPSbhxgDa2YFc5DyULIhx+jv8EjpZnmU+8NjGd/f9QtOY7qjbAH698kWgVmpc4A9PP/Wvj2uHHtTsgSQNTf4GXLeNX22KjFsdc75yvEUb4rYvMaaPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GisjZwU+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738176774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlOChQEKTp5JX+pbfAOT77vMe8ez+6+Y0ab8kJl+7mw=;
	b=GisjZwU+iP78I/4GywL0DefoiIF+Af28TMeHOn8inVnETs7ou+HLo2u/4focwqHzKjaL3t
	uTWIQxt3VWQKiPFLU/2vPI+Eq2fhN1cItlTMpLR2x/eEo4+n9L40rCUmRsV568M4RW4ijW
	CPLnHtc1rGicTSukV7L12GHUEAF+M+8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47--D-VqdZWMCuKFM53jcF7wQ-1; Wed,
 29 Jan 2025 13:52:52 -0500
X-MC-Unique: -D-VqdZWMCuKFM53jcF7wQ-1
X-Mimecast-MFC-AGG-ID: -D-VqdZWMCuKFM53jcF7wQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 396CC19560BA;
	Wed, 29 Jan 2025 18:52:48 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.29])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3326919560AA;
	Wed, 29 Jan 2025 18:52:16 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Jan 2025 19:52:21 +0100 (CET)
Date: Wed, 29 Jan 2025 19:51:49 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Alexey Gladkov <legion@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <20250129185149.GA25901@redhat.com>
References: <20250128091445.GA8257@strace.io>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128091445.GA8257@strace.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 01/28, Dmitry V. Levin wrote:
>
>     * ptrace: Add explicit padding to the end of struct ptrace_syscall_info,
>       simplify obtaining of user ptrace_syscall_info,
>       do not introduce PTRACE_SYSCALL_INFO_SIZE_VER0
>     * ptrace: Change the return type of ptrace_set_syscall_info_* functions
>       from "unsigned long" to "int"
>     * ptrace: Add -ERANGE check to ptrace_set_syscall_info_exit,
>       add comments to -ERANGE checks
>     * ptrace: Update comments about supported syscall stops
>     * selftests: Extend set_syscall_info test, fix for mips n32

Again, I can't review 1-3, I know nothing about the non-x86 architectures.

As for 4-6, feel free to add

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


