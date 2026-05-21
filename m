Return-Path: <linux-sh+bounces-3900-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA2MFRwKD2oHEgYAu9opvQ
	(envelope-from <linux-sh+bounces-3900-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Thu, 21 May 2026 15:35:24 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E10485A5FBA
	for <lists+linux-sh@lfdr.de>; Thu, 21 May 2026 15:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5873184E46
	for <lists+linux-sh@lfdr.de>; Thu, 21 May 2026 13:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B18C3EB80D;
	Thu, 21 May 2026 13:10:51 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455A53CE0A8
	for <linux-sh@vger.kernel.org>; Thu, 21 May 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.224.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369051; cv=none; b=Slf0UYBbYebUVTWFiqjJhES8Z1P5HbyF3hU6QXeJC5jWDNMpV+rRKGdjFAg26CNnrnkS30yKqpAZO+zF10s+qJI2DURDEdaN9qYzPlI5YQcUtmDWtpMNBkhFwZchyPnNcQFMU1yhQyVZ7xyHlvhMIf6BwyNuB7UCj28odvgZKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369051; c=relaxed/simple;
	bh=cAgWOltKleMCB5V/a2eK/27ZhEOliJOKDJGXOcZYd2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSPVOBXJikRWKcIpCs58DI1b269l4PyGU0WEjcPE05MWcZzBi75G0lXzxsi0bb9z/j+K+Yn4oBnPo88hfarEIDKJgxsAf6NN5ALwU7NsXixIFK+w8r16qdGx164+QU8FhII3whQpd79IxeAimBVoc9ytCZ3nN8HclJC3I1ibDgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org; spf=pass smtp.mailfrom=aerifal.cx; arc=none smtp.client-ip=104.156.224.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 21 May 2026 08:55:37 -0400
From: Rich Felker <dalias@libc.org>
To: Marco Elver <elver@google.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH] sh: Implement _THIS_IP_ using inline asm
Message-ID: <20260521125537.GA25906@brightrain.aerifal.cx>
References: <20260521123205.146268-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521123205.146268-1-elver@google.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[libc.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,brightrain.aerifal.cx:mid,gnu.org:url];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dalias@libc.org,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3900-lists,linux-sh=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: E10485A5FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 02:31:58PM +0200, Marco Elver wrote:
> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
> 
>         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> 
> In particular, the address of a label is only expected to be used with a
> computed goto.
> 
> While the generic version more or less works today, it is known to be
> brittle and may break with current and future optimizations. For
> example, Clang -O2 always returns 1 when this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> <linux/instruction_pointer.h>) using an architecture-specific inline asm
> version. Additionally, avoiding taking the address of a label prevents
> compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> BTI) under control-flow integrity schemes.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/sh/include/asm/linkage.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/sh/include/asm/linkage.h b/arch/sh/include/asm/linkage.h
> index 7c2fa27a43f8..af56b38b6001 100644
> --- a/arch/sh/include/asm/linkage.h
> +++ b/arch/sh/include/asm/linkage.h
> @@ -5,4 +5,6 @@
>  #define __ALIGN .balign 4
>  #define __ALIGN_STR ".balign 4"
>  
> +#define _THIS_IP_ ({ unsigned long __ip; asm volatile("mova 1f, %0\n1:" : "=z" (__ip)); __ip; })
> +
>  #endif
> -- 
> 2.54.0.746.g67dd491aae-goog

Does this need an alignment directive before the label? mova can only
emit 32-bit-aligned addresses, and I think the assembler will complain
(since you'll be getting the wrong result) if the address isn't
aligned.

Rich

