Return-Path: <linux-sh+bounces-3648-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCvUK3ub3GkxUAkAu9opvQ
	(envelope-from <linux-sh+bounces-3648-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2026 09:30:03 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1A3E83E5
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2026 09:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E55503001CD1
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2026 07:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86FA37DE8C;
	Mon, 13 Apr 2026 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="U1G4Tzkl"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86C62E975E
	for <linux-sh@vger.kernel.org>; Mon, 13 Apr 2026 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065387; cv=none; b=uBOjBehlPSJ1+LSZ2XfGZ9eSSz8vFnIT6dLVNBuR27hOiT3hwUYDWsgl0LqooOt+IFpgN7/RamtWV2RPjoAQql6pwi0UDlgySprEcE3HNsw2uVMktP98PUQD9sDuML9UncXUdRWpT2AzpJSqkzNrblM7cjeQax6xAIDew3BlCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065387; c=relaxed/simple;
	bh=gB5G1+RdTOzd/0swHLiEx0QiBBINmh9hL+HHLbt2BbI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5faJ6F1+GRy/XZ0+9jxRz8tXOh2fkStxal4ln4DXQTSipjS8BvJniAsFeSF1A1sWp6/W4SxiNUPrJ6imfoA2Unqg5RpUDmtnLDkMJiwKEppxnNt8wot7QRnPV3iHs7KWwECeo+hNbVObnXD6CyGncl8CvxhTl6wbBVv7bshQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=U1G4Tzkl; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=HG8xZOikE5wswKuWNX0ZhN/h9I3xfWt6DYNlMj8kLjI=; t=1776065384;
	x=1776670184; b=U1G4TzklW42VBIP+vs1Drf2Qj+jD6ZWui9a2XAngUSHMOBJ8WVVuN7nP9peHM
	rQ0ztegMfcnNe3znjkv22hm9llRpL6OvzyCJWm06Pa8BOyHISB9Kh4uTM/cRbaGmbMwwdAF2KnALk
	qhRToUz9VOLrbTX3nyz5+yQqLY971QpYrxUu/89jSDcyAVc+wNnuNdI3REy2IEM+PeoGMJTUuF3kU
	i+xf171bA0nndtRkNp66XesxOmD3KrjP2CXjYk2KULnRedsOCaeM0h+gw4fG3WEKfbEL7QwmrsHPK
	/GSy1bEMntgrdaodMPymvnG0S3ywOLDlVUTYEFSgMPQ+UBCOMA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wCBji-00000003irS-1fdb; Mon, 13 Apr 2026 09:29:34 +0200
Received: from dynamic-093-128-043-080.93.128.pool.telefonica.de ([93.128.43.80] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wCBji-00000001ADe-0kCJ; Mon, 13 Apr 2026 09:29:34 +0200
Message-ID: <d3af51074e76f051b72d59c1bc45ebe4eff3cb4e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] arch: sh: Include <linux/io.h> in dac.h
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, ysato@users.sourceforge.jp, 
	dalias@libc.org, lee@kernel.org, danielt@kernel.org, simona.vetter@ffwll.ch
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel test
 robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>
Date: Mon, 13 Apr 2026 09:29:33 +0200
In-Reply-To: <5ce643a9-59ec-480a-985e-764bf23e2485@suse.de>
References: <20251028170913.16711-1-tzimmermann@suse.de>
	 <e2c0c4686908f38858716a1dcf67df7de488fd33.camel@physik.fu-berlin.de>
	 <5ce643a9-59ec-480a-985e-764bf23e2485@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3648-lists,linux-sh=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,suse.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,fu-berlin.de:dkim,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 97C1A3E83E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

On Mon, 2026-04-13 at 08:59 +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 12.04.26 um 09:35 schrieb John Paul Adrian Glaubitz:
> > Hi Thomas,
> >=20
> > On Tue, 2025-10-28 at 18:07 +0100, Thomas Zimmermann wrote:
> > > Include <linux/io.h> to avoid depending on <linux/backlight.h> for
> > > including it. Declares __raw_readb() and __raw_writeb().
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-l=
kp@intel.com/
> > > Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in heade=
r file")
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Daniel Thompson <danielt@kernel.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > > This is fallout from a recent cleanup of the backlight header file. I=
 don't
> > > have the option of building or testing this change, though.
> > > ---
> > >   arch/sh/include/cpu-sh3/cpu/dac.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/sh/include/cpu-sh3/cpu/dac.h b/arch/sh/include/cpu-=
sh3/cpu/dac.h
> > > index fd02331608a8..323ec8570bcd 100644
> > > --- a/arch/sh/include/cpu-sh3/cpu/dac.h
> > > +++ b/arch/sh/include/cpu-sh3/cpu/dac.h
> > > @@ -2,6 +2,8 @@
> > >   #ifndef __ASM_CPU_SH3_DAC_H
> > >   #define __ASM_CPU_SH3_DAC_H
> > >  =20
> > > +#include <linux/io.h>
> > > +
> > >   /*
> > >    * Copyright (C) 2003  Andriy Skulysh
> > >    */
> > I'm just looking at this patch again and was wondering where <linux/bac=
klight.h> is
> > actually being pulled in on SH3. I assume this is somewhere on the driv=
er side, no?
>=20
> Oh well, it's been ages...
>=20
> I've been cleaning up the plenty of places that include <linux/fb.h> and=
=20
> <linux/backlight.h> unnecessarily. Besides the Fixes tag, presumably=20
> commit df1445598758 ("backlight: hp680_bl: Do not include <linux/fb.h>")=
=20
> is involved as well. The hp680_bl backlight driver got <linux/io.h> via=
=20
> <linux/fb.h> via <linux/backlight.h> before including <cpu/dac.h>. With=
=20
> fb.h gone from backlight.h gone,=C2=A0 dac.h should best include its=20
> dependencies. Hence the patch here.

Perfect, thanks for the quick explanation! I will pick up the patch then.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

