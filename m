Return-Path: <linux-sh+bounces-3815-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MnuCMLx9Gl+FwIAu9opvQ
	(envelope-from <linux-sh+bounces-3815-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 20:32:34 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 180CE4AED8B
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 20:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7761E3006213
	for <lists+linux-sh@lfdr.de>; Fri,  1 May 2026 18:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFAA1DF980;
	Fri,  1 May 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="g4t39wc4"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F41A0712
	for <linux-sh@vger.kernel.org>; Fri,  1 May 2026 18:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777660348; cv=none; b=hERg6Lze8PiiThf5gUW3READI4/TVGOGYfljcI0pLGHpAKlZULvCZaXc3v//53hY0vjKHdNyXZ8v0KJPEpsNnKBjxcDbWKaMajZjleRXTUuNUOjp4X8US2aw+d8x2tWX8KI8enPnGFhPGVUEyuV2wWCxHwhj6SKrmLJmg7M9g3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777660348; c=relaxed/simple;
	bh=kMXzkK7OLNdtzvsOHdkmPIA6lXUjB2AgpqUNSt9YNM4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=teIq2tnZHjuYMq/7MyjEDMBgi8kRAB3tFnlVaHa490yEgMfts+YpbJ3glKlRSOdQ6hc/p8QgSF93ttYl1D8wQYBF4UliEw9lPLCemuVi1PP42M3mjDdfRi3EAQxSoU/o2qrQEaxogNHnXH1urw6XwQEukCDycHtCx9LPfM42Miw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=g4t39wc4; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+HmaYznaHd2Bjj/BanBFkIfC027xxvAsHo3zLIbd8DI=; t=1777660346;
	x=1778265146; b=g4t39wc42IJoCBoSp0U0Qn7RU9Y7FWD7AsyUrDyj/GmM6A7bytJpVU7qRexpF
	zUt/En8pd2hqkkjRHX2tQ2zmWu4acQ2Qs8sSnsub7xQ099Qk9SUP2BPnXvegFQoBSR/dhFVRzG2J7
	Q4Gr8ZheWOclcIaIqa2ZFrcbChghfg9IkvsE3GnSP+i7gw3/gtSaEwMVza9oMu9vxM0FbonSLWt6J
	wiigFihWpOJj7xE+lpIzbXwfKqmmGPMWy7bSd6hJnetzx7yGgG06b5NxBnvSjtnvuejvOo1L0tWMz
	tEJj7efY+epOkt7CqECMLGDUn4Rb2/7/y1NO3/KrbqwfHcsHog==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wIsf1-00000001TOa-3DJj; Fri, 01 May 2026 20:32:23 +0200
Received: from p5dc559e1.dip0.t-ipconnect.de ([93.197.89.225] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wIsf1-00000002m6r-2K7t; Fri, 01 May 2026 20:32:23 +0200
Message-ID: <84b1391eb542b5cd6bcbecdfbc63124187265402.camel@physik.fu-berlin.de>
Subject: Re: Toybox make root no longer works as expected
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Rob Landley <rob@landley.net>, "D. Jeff Dionne" <djeffdionne@gmail.com>
Cc: linux-sh <linux-sh@vger.kernel.org>, Geert Uytterhoeven
	 <geert+renesas@glider.be>, "D. Jeff Dionne" <jeff@coresemi.io>
Date: Fri, 01 May 2026 20:32:23 +0200
In-Reply-To: <acc36891-6148-429c-aa99-3cf7c6681d6f@landley.net>
References: 
	<359d107fd9fe92a55e77be84c26d9ac86112fe13.camel@physik.fu-berlin.de>
	 <71c6a925c748fb3c9c2af30362387f0e562c0f6f.camel@physik.fu-berlin.de>
	 <55D40750-934F-4F70-A19C-11DC5F97A389@gmail.com>
	 <15ca13ffdfa494b4d774f75d3daaee2ac7a8c93f.camel@physik.fu-berlin.de>
	 <acc36891-6148-429c-aa99-3cf7c6681d6f@landley.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Rspamd-Queue-Id: 180CE4AED8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3815-lists,linux-sh=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[landley.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[landley.net:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,physik.fu-berlin.de:mid]

On Fri, 2026-05-01 at 13:20 -0500, Rob Landley wrote:
> On 4/30/26 02:17, John Paul Adrian Glaubitz wrote:
> > I can give it a try. Would be good if Rob could publish a recent versio=
n of the toolchain.
>=20
> It's just=20
> https://codeberg.org/landley/toybox/src/branch/master/scripts/mcm-buildal=
l.sh=20
> invoking https://github.com/richfelker/musl-cross-make as described in=
=20
> https://landley.net/toybox/faq.html#cross2

What about the patches for J2 support? And can it work with a GCC git tree =
like [1]?

Adrian

> [1] https://github.com/olegendo/gcc/tree/devel/sh-lra

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

