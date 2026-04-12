Return-Path: <linux-sh+bounces-3646-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDbaCmpL22mG/ggAu9opvQ
	(envelope-from <linux-sh+bounces-3646-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Sun, 12 Apr 2026 09:36:10 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CF3E3065
	for <lists+linux-sh@lfdr.de>; Sun, 12 Apr 2026 09:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09D24300B530
	for <lists+linux-sh@lfdr.de>; Sun, 12 Apr 2026 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0B8285041;
	Sun, 12 Apr 2026 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="YPlSqAJL"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB415C613
	for <linux-sh@vger.kernel.org>; Sun, 12 Apr 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775979363; cv=none; b=h6Q6vUOYVXOFdGjis7iT0mdWPogqf7Xi3WDH0/PeEJ+ngv1b3H9Yj7Vxd+b1UGX4gzOVdQBYeMWxP6wIRG99zpclgPlPgW1ccOZgRWB2QkHkI9f0jzsD+tfKTXgZOVH+WDYa3LegO8Q2BQqPGXC6OVcLkFIaBRC8BiOLg0uzVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775979363; c=relaxed/simple;
	bh=40IWb5YeQqRcoYMMKu61JIfakze95fiUynt8zg9YWYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVn7/lvLK8Bk1Ukemsji0GMXIwangc141Q7vcAxYuerG/0h/p5Ey1O6oIc8FOSaD4k7vo/L3V/5ipR3Xajrz8xQV67yWg5jweAw46kCPUxafOISVVpnSLAdba7Nd+PIz+cXSdIfC55/vgbC4tFYMm9rYQ50uTzXlwlX/YcJYuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=YPlSqAJL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=rCaJARKuSHV6Wf+a3VuN+78c7JCL984SGCykXFzZQcs=; t=1775979362;
	x=1776584162; b=YPlSqAJLy1L9kXy5qn7QRsdUU7hNv+hH3JUOxh+WWPhBePyb3Kcc2Ef9bvkbP
	ZrHbZfhjRXdVLmdv0nL5eb01AqLlFhypud8ss5p1OLLxMy3uIssNsKrRlj6FoO85UX0xsfN+hR24Q
	ns62uAouu+GP7HidoGdOOg0FltF4/qB0/9ND4cdpbf323Ek5xYSPfuzsoeiaAHyp50Js8XNRk1pe2
	OAvltPvCX8aVjI4ixWcy6Z5ipu5bhOnpnXxyOPD45/SsdajbIO23sVNhEWoQEDce5pmX/dcoLCVGH
	ax1/lJwNarfn0ZOVnZNH9aHmQStNOWMjpcZxW3EC86wbK+RA1A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wBpMM-00000002RpE-3s0w; Sun, 12 Apr 2026 09:35:58 +0200
Received: from dynamic-077-183-202-106.77.183.pool.telefonica.de ([77.183.202.106] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wBpMM-00000001dYV-2v5W; Sun, 12 Apr 2026 09:35:58 +0200
Message-ID: <e2c0c4686908f38858716a1dcf67df7de488fd33.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] arch: sh: Include <linux/io.h> in dac.h
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, ysato@users.sourceforge.jp, 
	dalias@libc.org, lee@kernel.org, danielt@kernel.org, simona.vetter@ffwll.ch
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel test
 robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>
Date: Sun, 12 Apr 2026 09:35:57 +0200
In-Reply-To: <20251028170913.16711-1-tzimmermann@suse.de>
References: <20251028170913.16711-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-3646-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,intel.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 217CF3E3065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

On Tue, 2025-10-28 at 18:07 +0100, Thomas Zimmermann wrote:
> Include <linux/io.h> to avoid depending on <linux/backlight.h> for
> including it. Declares __raw_readb() and __raw_writeb().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@i=
ntel.com/
> Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header fi=
le")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
> This is fallout from a recent cleanup of the backlight header file. I don=
't
> have the option of building or testing this change, though.
> ---
>  arch/sh/include/cpu-sh3/cpu/dac.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/sh/include/cpu-sh3/cpu/dac.h b/arch/sh/include/cpu-sh3/=
cpu/dac.h
> index fd02331608a8..323ec8570bcd 100644
> --- a/arch/sh/include/cpu-sh3/cpu/dac.h
> +++ b/arch/sh/include/cpu-sh3/cpu/dac.h
> @@ -2,6 +2,8 @@
>  #ifndef __ASM_CPU_SH3_DAC_H
>  #define __ASM_CPU_SH3_DAC_H
> =20
> +#include <linux/io.h>
> +
>  /*
>   * Copyright (C) 2003  Andriy Skulysh
>   */

I'm just looking at this patch again and was wondering where <linux/backlig=
ht.h> is
actually being pulled in on SH3. I assume this is somewhere on the driver s=
ide, no?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

