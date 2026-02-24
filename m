Return-Path: <linux-sh+bounces-3376-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG68HHrHnWk8SAQAu9opvQ
	(envelope-from <linux-sh+bounces-3376-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Tue, 24 Feb 2026 16:44:58 +0100
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC321893B4
	for <lists+linux-sh@lfdr.de>; Tue, 24 Feb 2026 16:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C6931C0A37
	for <lists+linux-sh@lfdr.de>; Tue, 24 Feb 2026 15:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96533644CC;
	Tue, 24 Feb 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Hu7c3DZ+"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A822292B4B;
	Tue, 24 Feb 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947617; cv=none; b=gHNQeG77cnX9YykWQu2QQZs4Jz7HW+007g/K6lQWHGw12BYZ3YhECskEE0xdYgZlDoK/COkMZ4V3ekYzCqCSxP4iTrc/7MtaHdg7AShyijGdZtDJphkp4yivtNkjM9JplIzNsohwLaToKTXvl4V7Rrx32ElZZ8wVrga60xKRb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947617; c=relaxed/simple;
	bh=srk0uTNaaacQz2nu1j3DQaF6E0wsSw5ZNBNzz1ikkeE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ERfYycHiXbFuP7zGXN3+cTXySVu8mOMXHoHO1A89vSsOeho9TDJRXkvZsM3hI+wfIX5yxxV+papCQmbHNZtjA35eF2kGCZvMNOY1fu5XuTNo0JE6ImoCGQgb1UPMlTEUkjV82XbWRO39gBWi2om68GZcHJ4aEJRl3ipujsxqQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Hu7c3DZ+; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=LceCOnYlHuu8mShQ6WRwYJwmoSi3gbgKh1LyplWGMrY=; t=1771947614;
	x=1772552414; b=Hu7c3DZ+1NB1+5jFfuOAtos4rGtgPpVx2wGNgZZGBOyb9FIpyJic9jxMB2Qcu
	nDWOL16tZH7Tg2jA/7BenEg+7kftV3X/DNd2PcelMB/RyvGLtIMKI96/k4pKmEE73QS4loadaGd9v
	0xThht/3VgHgjdGz48LPC1nKxv+9zmYWiQXJo/ObzouYGIzl/aVAbtWhpUnIWNur1Sa7NGG6W0LDS
	feSu8MrGp6SY4Qe0028XjRLFmKiHJrifEumaB2H+z/RM68qCLo18NmrPhWpsNVkikUdwMy9FmNFYD
	lhV35vy6uQphJB4vsLEq/JyQ6JhcD7nUuzfzPpKt5pP91nJu9A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vuuW8-00000002yig-0acq; Tue, 24 Feb 2026 16:40:08 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vuuW7-00000003dhS-3ZC7; Tue, 24 Feb 2026 16:40:08 +0100
Message-ID: <9668ee6dd3e3de7a230893a8cc734de25a517e68.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2] sh: remove CONFIG_VSYSCALL reference from UAPI
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 24 Feb 2026 16:40:06 +0100
In-Reply-To: <20260224-uapi-sh-at-sysinfo-ehdr-v2-1-b309fe77ca04@linutronix.de>
References: 
	<20260224-uapi-sh-at-sysinfo-ehdr-v2-1-b309fe77ca04@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-3376-lists,linux-sh=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABC321893B4
X-Rspamd-Action: no action

Hi Thomas,

On Tue, 2026-02-24 at 16:35 +0100, Thomas Wei=C3=9Fschuh wrote:
> AT_SYSINFO_EHDR defines the auxvector index representing the vDSO
> entrypoint. Its value or presence does not depend on whether a vDSO
> is actually provided by the kernel.
>=20
> The definition of AT_SYSINFO_EHDR was gated between CONFIG_VSYSCALL to
> avoid a default gate VMA to be created. However that default gate VMA
> was removed entirely in commit a6c19dfe3994
> ("arm64,ia64,ppc,s390,sh,tile,um,x86,mm: remove default gate area").
>=20
> Remove the now unnecessary conditional.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Rebase on v7.0-rc1
> - Flesh out commit message
> - Link to v1: https://lore.kernel.org/r/20260112-uapi-sh-at-sysinfo-ehdr-=
v1-1-b01dfe98a66a@linutronix.de
> ---
>  arch/sh/include/uapi/asm/auxvec.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/arch/sh/include/uapi/asm/auxvec.h b/arch/sh/include/uapi/asm=
/auxvec.h
> index 8eb47ede7193..63fcc39e2c6a 100644
> --- a/arch/sh/include/uapi/asm/auxvec.h
> +++ b/arch/sh/include/uapi/asm/auxvec.h
> @@ -13,14 +13,10 @@
>   */
>  #define AT_FPUCW		18	/* Used FPU control word.  */
> =20
> -#if defined(CONFIG_VSYSCALL) || !defined(__KERNEL__)
>  /*
> - * Only define this in the vsyscall case, the entry point to
> - * the vsyscall page gets placed here. The kernel will attempt
> - * to build a gate VMA we don't care about otherwise..
> + * The entry point to the vsyscall page gets placed here.
>   */
>  #define AT_SYSINFO_EHDR		33
> -#endif
> =20
>  /*
>   * More complete cache descriptions than AT_[DIU]CACHEBSIZE.  If the
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260112-uapi-sh-at-sysinfo-ehdr-f26a12ec5940
>=20
> Best regards,

Looks good to me. I'll pick it up later this week. There are a number of pa=
tches
that have accumulated over the past months since I got too busy to work on =
sh-linux.

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

