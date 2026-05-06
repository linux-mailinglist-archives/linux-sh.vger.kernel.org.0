Return-Path: <linux-sh+bounces-3831-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHf2DF5L+2nWYwMAu9opvQ
	(envelope-from <linux-sh+bounces-3831-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Wed, 06 May 2026 16:08:30 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 309964DBBA5
	for <lists+linux-sh@lfdr.de>; Wed, 06 May 2026 16:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EBBE3046BA5
	for <lists+linux-sh@lfdr.de>; Wed,  6 May 2026 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C9F47ECF9;
	Wed,  6 May 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Jbv3dDuj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r8IDY158"
X-Original-To: linux-sh@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAF480336;
	Wed,  6 May 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076115; cv=none; b=nbpL1xu+m8u9iPf31eMdhsdFQkd65jAf50EJBjzcYbAEh7AzcavEOXYkhdyj/uVWN11Q8vRaqwxogGO4JJnBJx5VaHWWGt9Yzt/l14to2F5WegtJUY1fqYvUavMwQ5bLdYSqze1n5jUUb7+iM4i0R87w3HJA2s/oeL31baToWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076115; c=relaxed/simple;
	bh=vCDOuHN0VbpeqeqivYaNmH3+BwICfwmwRLFOopvKXgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YsuAxUywyCe+De2gSSaq4seR9yj2+FPgaCRwfKb0KubUP0sIthSyE8/g5E6HG7txz9ZvwrKy/k5Qsdc25Sw0f+4/MDsO1S507rsBzCRjP4qP0r0kpBMQKqtWWVjrIj9o2HS0zOHcwoUcBzXCRPD5MqBReiYqes/vAPP5dQn1+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Jbv3dDuj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r8IDY158; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778076111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCDOuHN0VbpeqeqivYaNmH3+BwICfwmwRLFOopvKXgU=;
	b=Jbv3dDujweydGixa27kIjzqk96eBm9i/H8DzjzQCGI8vQKe35Fh2K50j33k/Y9DsZYCu3v
	GzI6Xw6yL7TM8XROt9nL/0I4ZPdeh22dQzFUvv0e7b+eHkgvTI/kecu7Sp4UGNGCv1gSgT
	MY/IXsEhZPiWezO7Z2kacg2XEuf7CGw3d71DnaxjdISBWntNpkmR0ELvQ0gJZJhI5qEZF7
	Fu3YvL36sWnSgnSYW+9+22p9i3J5YWA4epDgQ7FTMIxdz351H3+rwiq0VMQjtFZq5U5mLY
	He5kB5zPL/fZyrwRuPzN6GXIyBeEvE0iDWffeqYMAILMN/B2H+igjmpWXW0LIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778076111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCDOuHN0VbpeqeqivYaNmH3+BwICfwmwRLFOopvKXgU=;
	b=r8IDY1580Ia7PoItLV6xucM4HLAKleb+E4XVrPqYvOQfsOID9O5dxujM1gd0Hy+E9Pa/zw
	lWDKd0qzhKKkZJDQ==
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Remove plat_sci_port.flags
In-Reply-To: <20260506124643.128021-1-geert+renesas@glider.be>
References: <20260506124643.128021-1-geert+renesas@glider.be>
Date: Wed, 06 May 2026 16:07:51 +0206
Message-ID: <87pl388wmo.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 309964DBBA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3831-lists,linux-sh=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-sh@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

On 2026-05-06, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> The last setter of p->flags was removed in commit 37744feebc086908
> ("sh: remove sh5 support") in v5.8.
>
> Link: https://lore.kernel.org/CAMuHMdXs94k3-7YD-yO7p2=+u8waYGAz8mpP5LDbMf3szt4V-w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Aside from manually inspecting possible users, I also checked using a
coccinelle script.

Reviewed-by: John Ogness <john.ogness@linutronix.de>

===== BEGIN flags.cocci =====
// SPDX-License-Identifier: GPL-2.0-only
// Options: --all-includes

virtual patch

@r1@
struct plat_sci_port *U;
@@

- U->flags
+ FLAGS_USER

@r2@
struct plat_sci_port U;
@@

- U.flags
+ FLAGS_USER

@r3@
identifier U;
expression E;
@@

static struct plat_sci_port U = {
- .flags = E
+ FLAGS_USER
};
===== END flags.cocci =====

