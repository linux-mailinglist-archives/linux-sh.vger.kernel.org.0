Return-Path: <linux-sh+bounces-3746-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBgoHRZY72n5AQEAu9opvQ
	(envelope-from <linux-sh+bounces-3746-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:35:34 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE04472926
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27E3B3001F98
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 12:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C046A3B52EE;
	Mon, 27 Apr 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ghOXWGou"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D143603EF
	for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2026 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293328; cv=none; b=DA95vYfvZ3WQAuVL8nSftSc1uY46UydAB1IODYBnpUjqBmbKUpaoSLG4iiwwyD5qoU15QdbygzFFy9UNr1UbbhPALUVpWbn0SwxXg15clsTeEcqUMvVHBgwvNwFmCs34LEmMs7wXWyiC3n6qFmfB/IP3CN07zACWZupU8fTFfg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293328; c=relaxed/simple;
	bh=uKFfXQaezyTz26nsftWjY8Ac+CXjHCjEYGqkt7gYjo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wt73Qizoo0dRuNrXdz4li9pkt3k8ukcjt4Z9s+dAnSS6NjOv4n9cHkLwXuJOFhsLSJuUlEOzppqAYSepiHefbOJT8DuKDCapQfLtTztZf1u5B4uAsKw5PJxo7gVkd9JuyDUnif6EjPpiJrftcIDeMPX4pztNVut4wsNMyWlgBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ghOXWGou; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 080264E42B34;
	Mon, 27 Apr 2026 12:35:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D41F5600D1;
	Mon, 27 Apr 2026 12:35:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A8D0107281E7;
	Mon, 27 Apr 2026 14:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777293325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uKFfXQaezyTz26nsftWjY8Ac+CXjHCjEYGqkt7gYjo0=;
	b=ghOXWGounxDetPhdU7XY9YNSDqNYMiii5lomtJUfnC/ed5CDqeMiIzGysSvLvemgn5Sk7v
	JFfAtexSdyRdebFrAe3+yN4dG/asDlmPaxSu/BYoBRlSRiKY7ciRiAbVt19gfTbscAeM56
	C2fu5xLIKeOlYDpRcb2qwVeQsQR5vk/OiZTlFPm3sk0O3nMSyrmCXB1tFavEoMsdczBtle
	Fov73CytapRE1ofZZq6mrBnu6RQ2s0L3gZ4S0phBYu+znYd+vUxMkoEdWwIPJtL12Fqog1
	jco7PQtWLho06274sENNyStVGGST+DAmNjyVWPrbaEjbka46RmcWgF3f+Katew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-sh@vger.kernel.org,  linux-kernel@vger.kernel.org,  Rich Felker
 <dalias@libc.org>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v2 3/3] mtd: maps: vmu-flash: Fix NULL pointer
 dereference in initialization
In-Reply-To: <20260427114750.2480900-4-fuchsfl@gmail.com> (Florian Fuchs's
	message of "Mon, 27 Apr 2026 13:47:50 +0200")
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
	<20260427114750.2480900-4-fuchsfl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 14:35:25 +0200
Message-ID: <87y0i8h982.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 6EE04472926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3746-lists,linux-sh=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]

On 27/04/2026 at 13:47:50 +02, Florian Fuchs <fuchsfl@gmail.com> wrote:

> The mtd_info contains a struct device, which must be linked to its
> parent. Without this, the initialization of the MTD fails with a NULL
> pointer dereference.
>
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---

For how long as this been broken? Is it really used?

Anyway, also here you will need to Cc stable and add a fixes tag.

Thanks,
Miqu=C3=A8l

