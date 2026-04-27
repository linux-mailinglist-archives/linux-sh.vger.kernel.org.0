Return-Path: <linux-sh+bounces-3745-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI16MNFY72n5AQEAu9opvQ
	(envelope-from <linux-sh+bounces-3745-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:38:41 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA04729B6
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EAD6304412C
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 12:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1311A3B8BBF;
	Mon, 27 Apr 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V4CIzrmN"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F01384250
	for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293280; cv=none; b=WrXuykIXc/j2LtMKqg+dOxSch5mJ7e8aTjEHkQ9jlL0BP7IVRb7cohuopSlBRYJTpY0A/CSrU/Xu1AsI91bN3D0AbtwBhqT5CAKurh8xhfveGEAMX6jVOPB3tgiyQxvAt4x6sR3qdsQHarDkVvnGainQHJ7RAOKYI4LBLT0tspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293280; c=relaxed/simple;
	bh=jCxkAOBQczVa5vCrereqaQuzkFeKTL+bu3gajaEh6CA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tzrI4gnk1cmANA91cTjGfxFD/gND15Ohi4aFp1byRmjT/0UbAVV9DLjCbbQ24fuveVCg6007aPxshGmaZyg6aGHyuxaeIPkNQmRX6I4JIXQlBC+EWQEds4i/c82yx/T7ts5eHRsrUvh/SYUb3xlkuQ6TTSSYvWA3YNP/Z1Eif/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V4CIzrmN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C000A1A3442;
	Mon, 27 Apr 2026 12:34:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D1BD600D1;
	Mon, 27 Apr 2026 12:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D3D51072806A;
	Mon, 27 Apr 2026 14:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777293276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jCxkAOBQczVa5vCrereqaQuzkFeKTL+bu3gajaEh6CA=;
	b=V4CIzrmN9pFd3j7SEkG9OFQ0vIpI09scTnbE9VSkmXByNjy7mXrFik0BSx5UXrJ5fnhSeU
	AXEhperFc3JOfVThM7o2HmQNv8MR3RNYBeVUFvMU0ElcjaiQSVMIOL5kWbeIEnh4LCqGhx
	TGT44OnV7YPYydcpkYYmjQb/SNbWH2p3uHNKdp/qRd1fZO3FidxKdtAZNtfihIBakYQR5g
	bgM53ehi+L4dJrfhVCfueIu6VupSTc78y3Mo8ToYmLCJNPL4RnO1BwO9wgMtM5E6soy78v
	fFedLg2p/9TK/WIjX8UYfLT+vcrXvGm8r002oBHjTK61COZFFh8X7MldxqiLdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-sh@vger.kernel.org,  linux-kernel@vger.kernel.org,  Rich Felker
 <dalias@libc.org>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v2 2/3] mtd: maps: vmu-flash: fix fault in unaligned fixup
In-Reply-To: <20260427114750.2480900-3-fuchsfl@gmail.com> (Florian Fuchs's
	message of "Mon, 27 Apr 2026 13:47:49 +0200")
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
	<20260427114750.2480900-3-fuchsfl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 14:34:35 +0200
Message-ID: <874ikwintw.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 19AA04729B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3745-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]

On 27/04/2026 at 13:47:49 +02, Florian Fuchs <fuchsfl@gmail.com> wrote:

> Use kzalloc_obj() / kzalloc_objs() to allocate the memcard structs,
> instead of kmalloc_obj() / kmalloc_objs() to prevent access to
> uninitialized data.
>
> Fixes runtime error: Fault in unaligned fixup: 0000 [#1] at
> mtd_get_fact_prot_info.

Shall this patch receive a Fixes tag if it actually fixes runtime
behaviour?

Also, please add the 'Cc: stable' line in your fixes.

Thanks,
Miqu=C3=A8l

