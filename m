Return-Path: <linux-sh+bounces-3811-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEkRGMvb82lk8AEAu9opvQ
	(envelope-from <linux-sh+bounces-3811-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 00:46:35 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF54A8A49
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 00:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 501793007A63
	for <lists+linux-sh@lfdr.de>; Thu, 30 Apr 2026 22:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074A635979;
	Thu, 30 Apr 2026 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Yco2BCyK"
X-Original-To: linux-sh@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D49CA52
	for <linux-sh@vger.kernel.org>; Thu, 30 Apr 2026 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589189; cv=none; b=Snwsu/aOrcpAsEqAYaujj2t9fhiwDe28cdvX1xRe5VUZnVkrZvbyhdETGonR6UuuD1vzD3eQXcHYKHPQmWaN/Jw/OHZBGWk9tXtYOgipekE3ZxUtOYA3HxqQEcPJjwbtQY6TQX5+BKgPHv9gF7cQ85kgmGo2BHOyMEin/OJy7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589189; c=relaxed/simple;
	bh=zm6lBZc9QY45GOV2Uw0ePDVek7+xPGluPjqEtTv88KM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hVwb7D28OfxR7G0zwOhkSOx366KT18wjgVFITF+IBO9a4EOzGFJGQQH/zihoRm6Af/ubCSaoesyJTSR+d7Lc3SsgPPqN2w14bpLiKDIooE8zDWshX+BsD/0s2Fcth3swnBiKzCqG28uNDI/9kb8ODyBsZj6IblzOftyXkA3JvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Yco2BCyK; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=9mcU9zHkYJRAaNMjlFYWXzNt8ibmxBv1d53Cj82pKk0=; t=1777589187;
	x=1778193987; b=Yco2BCyKTRDNccFNHefCvFbE+WPple+cW9j7Q5ysjixjankMN4Gp5kEZ6hnxp
	WZdkvTbqQdTT4Qdh85fPiQKPHSC+8MHm5pvZKejs//BMTtZz88NwVBMmM940jVrbVDj241D+9d9Ua
	w+iF1fQiRLz79hyFjR/2hY1PfPpGSMIhDoAN0Xhsz1mL/2nfFYucFjUgKY+koVdGe7SqLmdFH1f60
	LYn4mvlhtV/9K5uDLb/EK7wNkypeFa2K9vu6bPfRtAGKcv7Le4pCMo6MGux7bSsTsGrrFsGAoXUU1
	4tLlMyGp/WyFnQoYcPyqQBOpqdZZbVv6LB+GQu8EarA/BhaYow==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wIa9D-00000000UiP-3k1x; Fri, 01 May 2026 00:46:19 +0200
Received: from p5dc559e1.dip0.t-ipconnect.de ([93.197.89.225] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wIa9D-000000007L5-2qQg; Fri, 01 May 2026 00:46:19 +0200
Message-ID: <e24b35682248a0e9b3f7592e5ba999ba387b740f.camel@physik.fu-berlin.de>
Subject: Re: Toybox make root no longer works as expected
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Rob Landley <rob@landley.net>
Cc: linux-sh <linux-sh@vger.kernel.org>, Geert Uytterhoeven
	 <geert+renesas@glider.be>
Date: Fri, 01 May 2026 00:46:18 +0200
In-Reply-To: <c1cbf376-9bd2-4c2b-aed4-e7c378ac7301@landley.net>
References: 
	<359d107fd9fe92a55e77be84c26d9ac86112fe13.camel@physik.fu-berlin.de>
	 <c1cbf376-9bd2-4c2b-aed4-e7c378ac7301@landley.net>
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
X-Rspamd-Queue-Id: 5EAF54A8A49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-3811-lists,linux-sh=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fu-berlin.de:dkim,physik.fu-berlin.de:mid,node54:email]

Hi Rob,

On Thu, 2026-04-30 at 15:10 -0500, Rob Landley wrote:
> On 4/29/26 02:46, John Paul Adrian Glaubitz wrote:
> > Hi Rob,
> >=20
> > I'm trying to build a new root image after updating Toybox but that no =
longer works:
> >=20
> > glaubitz@node54:/data/home/glaubitz/toybox> make root CROSS=3Dsh2eb-lin=
ux-muslfdpic- LINUX=3D/data/home/glaubitz/sh-linux
> > mkroot/mkroot.sh  -- LINUX=3D/data/home/glaubitz/sh-linux CROSS=3Dsh2eb=
-linux-muslfdpic-
> > No ccc symlink to compiler directory.
>=20
> You're using CROSS=3D with the CROSS_COMPILE=3D syntax. They mean differe=
nt=20
> things.
> (...)

Thanks for the elaborate explanation! I had found the mistake in the mean t=
ime. However,
I still can't build the kernel since GCC fails with an internal compiler er=
ror as mentioned
in my previous reply.

Could you maybe build an updated toolchain for sh2eb which is based on a mo=
re recent GCC
version?

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

