Return-Path: <linux-sh+bounces-3830-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOqQG3g6+2nUXwMAu9opvQ
	(envelope-from <linux-sh+bounces-3830-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Wed, 06 May 2026 14:56:24 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCA4DA96C
	for <lists+linux-sh@lfdr.de>; Wed, 06 May 2026 14:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 929173019FD7
	for <lists+linux-sh@lfdr.de>; Wed,  6 May 2026 12:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93273346AC5;
	Wed,  6 May 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SS1PUsVc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x9T0iMOL"
X-Original-To: linux-sh@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAC3FD15D;
	Wed,  6 May 2026 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071985; cv=none; b=rDjszQ5sEkD1IKVoWGdlgm5Zza16egEb//jRdvs74sL9FbKCDNY3paMIaI+06zRdz5tHlFWs0BU4ymFz66guCAVPiqlNP41wLulkZ2KAW51VyHsSW32mlaKIWgLyf6SEXaq4koiLRMZgLg0ZC3W7w6Q66R9cEp7iw2NFS78d2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071985; c=relaxed/simple;
	bh=kFdIo2yceDKKWc68tIdBEDyOSlP1LCVFUR9NEBAtZ2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mtv66769VDqlXRBI8dPQt+sdMmDQdi0Yw5wul0xwTD4sKe4V75CnD7gE5yZ3FemC8clqrJLPpB3VucqdA0O9qKxH2OJnUvds6Ot5CUPgxc6A0DerfN7/YNM/fKxaFuz21lLX1xc2KEGDJAHlVshPtdgaZ0jAzgYkuJe4jdsuEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SS1PUsVc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x9T0iMOL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778071982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h+e8e50ivN9zmjgr8sswp0AWEkvSV2AwY271zvCJvUE=;
	b=SS1PUsVcnB+GSWnXUYOENaytOjwZJEtoROJTG9x3GiSTI/d/NA2VKsL1MkJHVCuR6HBG65
	fDZhrMymJME7MUrp9WIW9V3vJJU3qhh3xNYicegrRi798BWu2DhTeInxEIIM+1Tb3D8fn+
	isQakkzAksteGKVcCQBZPSDVY3WMxZO0ySLCnrajGOO6xMlpLJUxC2cI4LcZD+EyZL8nzU
	BUXiJgFaHmtWIJUk9b6gf4xk/NS9CR6C62YiIgDI10dG5MmWOXQQRr/4FDNNnmLpkcbE7l
	wIYq/tpXkwjgayncDaz4LCjlOdb82EPUjCIX3h3PxwLS/LbK9Ss02ulx28ZfQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778071982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h+e8e50ivN9zmjgr8sswp0AWEkvSV2AwY271zvCJvUE=;
	b=x9T0iMOL65MQAkogthF+CfBXBo9tef+uhwneEN3qo4Yx6gaXwjyodIKaH7SlTSoUflrq4C
	7knW7S0hiUWdnNBw==
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, linux-serial@vger.kernel.org, Linux-sh
 list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH tty v4 3/6] serial: sh-sci: Avoid deprecated UPF_CONS_FLOW
In-Reply-To: <CAMuHMdXs94k3-7YD-yO7p2=+u8waYGAz8mpP5LDbMf3szt4V-w@mail.gmail.com>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
 <20260506121606.5805-4-john.ogness@linutronix.de>
 <CAMuHMdXs94k3-7YD-yO7p2=+u8waYGAz8mpP5LDbMf3szt4V-w@mail.gmail.com>
Date: Wed, 06 May 2026 14:59:02 +0206
Message-ID: <87v7d08ztd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: E9FCA4DA96C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3830-lists,linux-sh=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:dkim,jogness.linutronix.de:mid]

Hi Geert,

On 2026-05-06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3369,9 +3369,12 @@ static int sci_init_single(struct platform_device *dev,
>>         }
>>
>>         port->type              = SCI_PUBLIC_PORT_ID(p->type);
>> -       port->flags             = UPF_FIXED_PORT | UPF_BOOT_AUTOCONF | p->flags;
>> +       port->flags             = UPF_FIXED_PORT | UPF_BOOT_AUTOCONF |
>> +                                 (p->flags & ~UPF_CONS_FLOW);
>
> This seems over-cautious to me.
> The last setter of p->flags was removed in commit 37744feebc086908
> ("sh: remove sh5 support") in v5.8.  No platform data ever set the
> UPF_CONS_FLOW flag before.  I would rather remove plat_sci_port.flags
> and this "| p->flags", so we don't have to care about UPF_CONS_FLOW
> in this driver at all.

If there is a v5, I will drop this patch. If v4 is acceptable, the
maintainer can just drop this patch.

I will leave the plat_sci_port.flags removal as an excercise for the sh
folks.

Thanks for your feedback.

John

