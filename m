Return-Path: <linux-sh+bounces-3793-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLn1JjS98Gl0YAEAu9opvQ
	(envelope-from <linux-sh+bounces-3793-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 15:59:16 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F194866FA
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 15:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC5B312C007
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66591481FAC;
	Tue, 28 Apr 2026 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="D+FruIVr"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194D481FA0;
	Tue, 28 Apr 2026 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382427; cv=none; b=dYszXwF+jSeyBrhtHvXo1xf5Br6dtUp27hX4PBshHB3mfP3wTwR+o9r8WS3rsto0JQqc5YPdLp55khO0agUPao9jQGjEOkBqfM8D9dbLXCaEtqWK1pkZLURBCPRw2qCbfjFDE1qC9frvsbS044j5pIGQWkT9ghtpNwh1dXxtnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382427; c=relaxed/simple;
	bh=6ol5vy4hcvgrIUJ0zqwn5cKkOK46qS5c+o/MUuug9as=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gpZExWHKQylFzfX8+QY/u5y5SSAzE03+S4bzRBSBZZsVALP87WZY9xzcgGSK24l8hXPWGi0VVFhyPOCAqIFOiJjzUJBulQlj0k5J+tUyhTAKexRzXGCeoATytxcCjI7xfZrbM3KkcckVt3s9ifq9Wrqc3PJBA3DlZCEDvaKK4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=D+FruIVr; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=2KmjgVvdn3LpMzlD0f2Z/GtEfrC6TcMYo615/ZaSxvo=; t=1777382425;
	x=1777987225; b=D+FruIVrvtirxWA/0gGSBBOmqf112EKQLOah8FIFotgXqlULImOrkYmolDjY+
	djsf1T7S+ZkkRs/wUk4y384Cpzd4LSuMAqfckyGms3+AMRqhxbG7Q7zOtqE5TAMai6GkNYK+RWNx6
	4ZDgu2GM7DjKO21vGoGTOPBuDLvjqB1Lw6zmfDKpacVcIFuEjB/aoSV1j5xpj/C6wS8nYNtFH2vgq
	qI9SFKWQDPf16cWwAc7FbR5oVjr8a9e7kEZYZZvdfqHrs2b6TStuledK/vsxqc72apxFeIGL4rXej
	dRXIagx/dQ/8/zS/42o6G+oIX2MrWa5hOC/NRrxycU6wI7HqRw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wHiMQ-00000002GzR-1FRT; Tue, 28 Apr 2026 15:20:22 +0200
Received: from p5dc559e1.dip0.t-ipconnect.de ([93.197.89.225] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wHiMQ-00000001BCU-0EyM; Tue, 28 Apr 2026 15:20:22 +0200
Message-ID: <99cdbec216d678e714ae14024e62d9ffcbab6d90.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: fix fallout from ZERO_PAGE consolidation
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Rich Felker <dalias@libc.org>, Thomas
 Wei?schuh <thomas.weissschuh@linutronix.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, 	linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Tue, 28 Apr 2026 15:20:21 +0200
In-Reply-To: <20260428055535.0daa3699bb6ff62f03ff1edb@linux-foundation.org>
References: <20260417103208.1217010-1-rppt@kernel.org>
		<30ff5e1e6c0c3d4e0fb3b6f36a5372ed6bf45d19.camel@physik.fu-berlin.de>
		<ef7d133aabff5ce58a91f0274f3ed05947c8aa48.camel@physik.fu-berlin.de>
		<aeNeKYwMJA3JXO8d@kernel.org>
		<92295dd525d946777e84269cff6e9a3f2f585286.camel@physik.fu-berlin.de>
	 <20260428055535.0daa3699bb6ff62f03ff1edb@linux-foundation.org>
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
X-Rspamd-Queue-Id: 19F194866FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3793-lists,linux-sh=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fu-berlin.de:dkim,fu-berlin.de:email,physik.fu-berlin.de:mid]

On Tue, 2026-04-28 at 05:55 -0700, Andrew Morton wrote:
> On Sat, 18 Apr 2026 13:26:50 +0200 John Paul Adrian Glaubitz <glaubitz@ph=
ysik.fu-berlin.de> wrote:
>=20
> > > > I just realized that this patch actually depends on 6215d9f4470f ("=
arch, mm:
> > > > consolidate empty_zero_page"), so I cannot take it directly into my=
 tree now.
> > > >=20
> > > > Shall we wait for v7.0-rc1 then, so I can pick it up as a regressio=
n fix?
> > > =20
> > > Or we can ask Andrew to pick it via mm tree.
> >=20
> > Let me take it for v7.0-rc2, so I can take more time for testing the pa=
tch.
>=20
> I put a copy of this into mm.git, so it goes into linux-next.

Erhm, I wanted to merge it myself being the SH maintainer.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

