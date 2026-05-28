Return-Path: <linux-sh+bounces-3930-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APyZHsjWF2rASggAu9opvQ
	(envelope-from <linux-sh+bounces-3930-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Thu, 28 May 2026 07:46:48 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9F5ED01D
	for <lists+linux-sh@lfdr.de>; Thu, 28 May 2026 07:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3A1F3006229
	for <lists+linux-sh@lfdr.de>; Thu, 28 May 2026 05:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A8F315D35;
	Thu, 28 May 2026 05:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USTJwMyG"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B7830C343;
	Thu, 28 May 2026 05:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947175; cv=none; b=L5llf3POBQ688GN2N5aRmquPpjxMXTcvNZnPBokvZv/Moan/JMxR09aZS785+f8lugZ7PHvTo2XW1uxOKrg9g+gDG9drV4HnDLNqZMpEU/a9qB/YvrdFMgeIixYV+lHzdqKBZ1P9B/DAUWA3QNvV7Rxz2ceGvNncPvELOK8DXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947175; c=relaxed/simple;
	bh=YEAnjREgSBvkEnKUajxohN8jGA14KxuWFr7Z0nCeVjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oec5nBqp8vdrS3OXL7VjvfOkg/dQJIJFTilXMlvPFZGTusqBDzsTp9aao3UnPZDwpOp9G6gwMCg83nU+f7Fsk8SZVWlB+NapH4DfqscpZ+ShhhGwZ1uCvX0nk2GAI5K0/dYvRMFZFbsMo6HvyOyvhZSe5mWNR1qHSjAuzPjakz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USTJwMyG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA4C1F000E9;
	Thu, 28 May 2026 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779947174;
	bh=95SOoqGn6jyE0UfkDK15/NBpH9CmgAfhjJteJqSZdCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USTJwMyGvWXoMbf/S3Hkuw/RAJZlgHz1wf6Rv3/jmc2THf0cyKGDOtGKt9FmAlIO2
	 bEzFbeCt0rnDn/8rlPAlmhLya/lie2fE7s0Ml45wXgkLiE48k3nYrM5tUD//wtZoUe
	 Or1W+w7erYiqub4kaHP0qkQb3RECfdmHprx1Vj3YKxor8X2FJMM9b4kv+OtRUUTLhY
	 dmdFE+f1EYTQmxHd5kFze5j7kVMcZ/PDIzwqvicbpyNpYnweMPLgb8vUH92a7Ecsu/
	 AQ6G7A7Ro/8u63LF4IMK8XJnfB3/MXr6DrdO23eJ8HfBnbe96tH4zBoN13i1Sk2LFH
	 iU1t+RcUX53pg==
Date: Thu, 28 May 2026 08:46:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v6 13/15] sh: cast away constness from the zero page when
 flushing it from the cache
Message-ID: <ahfWnLIwZXJvbvNg@kernel.org>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526175846.2694125-30-ardb+git@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-3930-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-sh@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh,git];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sourceforge.jp:email,libc.org:email,fu-berlin.de:email]
X-Rspamd-Queue-Id: 80C9F5ED01D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 07:59:00PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> SH performs cache maintenance on the zero page during boot, presumably
> to ensure that any clearing of BSS that has occurred at startup is
> visible to other CPUs and DMA devices.

It flushes the cache there because before 6215d9f4470f ("arch, mm:
consolidate empty_zero_page") empty_zero_page used was for boot parameters
at the very early boot.

I removed memset(empty_zero_page, 0, PAGE_SIZE) that was a line above but
missed the cache flush. 

This whole "clear zero-page" can be removed IMO.
 
> The __flush_wback_region() function takes a void* argument, which is
> conceptually sound, but given that empty_zero_page[] must never be
> modified, it is being repainted as const, making it incompatible with a
> void* formal parameter.
> 
> Given the above, and the fact that __flush_wback_region() is in fact a
> function pointer variable with multiple implementations, take the easy
> way out, and cast away the constness in this particular invocation.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/sh/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 4e40d5e96be9..acbb481cdbfe 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -332,7 +332,7 @@ void __init mem_init(void)
>  	cpu_cache_init();
>  
>  	/* clear the zero-page */
> -	__flush_wback_region(empty_zero_page, PAGE_SIZE);
> +	__flush_wback_region((void *)empty_zero_page, PAGE_SIZE);
>  
>  	vsyscall_init();
>  
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

-- 
Sincerely yours,
Mike.

