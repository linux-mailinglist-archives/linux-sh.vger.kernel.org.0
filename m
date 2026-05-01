Return-Path: <linux-sh+bounces-3816-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIUnN1X49GnkGQIAu9opvQ
	(envelope-from <linux-sh+bounces-3816-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 21:00:37 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E04AEFEC
	for <lists+linux-sh@lfdr.de>; Fri, 01 May 2026 21:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E43A7300D702
	for <lists+linux-sh@lfdr.de>; Fri,  1 May 2026 19:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BCB35BDCE;
	Fri,  1 May 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="AGl9EZ8K"
X-Original-To: linux-sh@vger.kernel.org
Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93735E952
	for <linux-sh@vger.kernel.org>; Fri,  1 May 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662034; cv=pass; b=LD5XnZ9YODj5BjVi4OdB+aAbbGyqvX8LEqEmBZCWSWakC5N4OdnRRSDRCFev5wWYk0eZDyh+4WYBNhzbGn/8Zngt67/RquY3W9/3veiwQ7FhahIuwu5wo7lsXhuYaVtCaOVTWkNQVKSj6PyPjzR+3THVlO4ki+XZjPKFKR6Y3F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662034; c=relaxed/simple;
	bh=M+bvaUi3NqDZkbjZTuHh0BxvT9o4bHzpPlPzCR7NNzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFaGfIQoFA2FdNvJdvQXPSDv+OMv6ayyB+lxyVB5OPDVY/yq6ZLlpsWrU54UGsEU53kFUEQVq7JScm9FmdwQqzim+YBymrw1IM2ngevJWMdLzM7zf0mb9TRn9RFzWlxcRbcPFZI/fSKKZhRAjnZryBY0dUQXltgNZldkH+jdYYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=AGl9EZ8K; arc=pass smtp.client-ip=23.83.223.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2F6708C1A74;
	Fri, 01 May 2026 18:20:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a255.dreamhost.com (100-96-24-249.trex-nlb.outbound.svc.cluster.local [100.96.24.249])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id CE0D98C1A30;
	Fri, 01 May 2026 18:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777659653;
	b=vjz8hCXrRok0Sj1nQPrBi97WFmGEG1ad2lcfgd7VOPQHI+U4iB9xUNFwJZbcpgcnx4nKTJ
	9PxsZq6ODRYXk8VhESKebcDR/NFbENNEbeDUZC+EcZ/XXnGvrfl7i2RVQrX+EtAP0vz2pE
	uGkiymiXnz5+7X4UOZCVEw0UyFB1kuH8DCIMV3RcFH9HnMhLme6mK7+K7AXJ6kAhdEXTOp
	vkyuMmj872rvqIOUr6Pw1NRHIKpCrh3ipanPl2bZpJNH9vG4nVLuRokZXJ1KALad+/bHrb
	MeM+RmgFu/+8vbClaGV2Oe5tCUj6nouL8dOkHiQ6zd7mL32ZmWi5cjsM3DTQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777659653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=C/HQXVk6WYOkUtBBcigaUkxhFNkFwcOXDZXBikpgQ98=;
	b=DFunxgizjkFhL4f2wetUxqKrEkrjCfhktokpRYhKiTDy0pvDIje+2Eicj6EpvXL6JpfOZR
	PCdl9Qdg1kqrPLyu+kbsVEZE2I1q6BlKh/5FCImSL5HqsXQX7kgi0nxwf1Sm+dYAPQ/eZE
	LBJtHcb4NqX3UEp0EHLMCMktrWMYk+vGH897K9DQNnkFRsauTtxXgyqr2WJP0IPKl3XWft
	5REQ7e61sYNY+Mqt+yuW6pLYJ2TsTAHossNrH+o5XYM6cK3bQCxNLvpTL4VE1o+U50qRsr
	G/544q9AN4qqAAOIn+ypWN+MWcpokS5Oa/BLXU1nGaykhyBEVWTkN4lrsQHnjA==
ARC-Authentication-Results: i=1;
	rspamd-7766795c76-g79vs;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Abaft-Chief: 2f2d52bb4e211414_1777659654070_1116986102
X-MC-Loop-Signature: 1777659654070:1487649388
X-MC-Ingress-Time: 1777659654068
Received: from pdx1-sub0-mail-a255.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.24.249 (trex/7.1.5);
	Fri, 01 May 2026 18:20:54 +0000
Received: from [192.168.14.157] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a255.dreamhost.com (Postfix) with ESMTPSA id 4g6fVY30lbz1070;
	Fri,  1 May 2026 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1777659653;
	bh=C/HQXVk6WYOkUtBBcigaUkxhFNkFwcOXDZXBikpgQ98=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=AGl9EZ8Ke0YjwFlmX/sUFIuLnFF0yVX495847bLJ+sgWO18gQTyZoQ3W5CAIYrENS
	 mOdGq/JrqSTnexU1aaC86n6tPpQ/H+AF/vCU+flboP7svTmAlpv899jXuAlG/2b/fY
	 MhAujqAkKe7QudBzkj0wJeLlDOiff+dak1UCpqjydWvfvRcIolJEcwJA/QN9Av+RgE
	 LkNCWmzU9nM0jfTAez5LG1aypt/6LWt1ztwSwi6LlJjKDOmN9SCkCBxiUJDa46GbVv
	 csKgKYrzcxuml7W0DKmpSbhpeeWiT0sCLzRT6wvnAYYqCDXCTXMtGbaSEegjAkXSfu
	 oq3tM7h2VyEnQ==
Message-ID: <acc36891-6148-429c-aa99-3cf7c6681d6f@landley.net>
Date: Fri, 1 May 2026 13:20:52 -0500
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toybox make root no longer works as expected
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "D. Jeff Dionne" <djeffdionne@gmail.com>
Cc: linux-sh <linux-sh@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "D. Jeff Dionne" <jeff@coresemi.io>
References: <359d107fd9fe92a55e77be84c26d9ac86112fe13.camel@physik.fu-berlin.de>
 <71c6a925c748fb3c9c2af30362387f0e562c0f6f.camel@physik.fu-berlin.de>
 <55D40750-934F-4F70-A19C-11DC5F97A389@gmail.com>
 <15ca13ffdfa494b4d774f75d3daaee2ac7a8c93f.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <15ca13ffdfa494b4d774f75d3daaee2ac7a8c93f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 016E04AEFEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[landley.net:s=dreamhost];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3816-lists,linux-sh=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codeberg.org:url];
	DMARC_NA(0.00)[landley.net];
	FREEMAIL_TO(0.00)[physik.fu-berlin.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[landley.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob@landley.net,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 02:17, John Paul Adrian Glaubitz wrote:
> I can give it a try. Would be good if Rob could publish a recent version of the toolchain.

It's just 
https://codeberg.org/landley/toybox/src/branch/master/scripts/mcm-buildall.sh 
invoking https://github.com/richfelker/musl-cross-make as described in 
https://landley.net/toybox/faq.html#cross2

I meant to switch to a more Linux From Scratch style toolchain build, 
but I've been a bit off my game ever since the oldest president ever 
(who had replaced the oldest president ever) decided to run for a second 
term after campaigning on doing one term only. I've found the 
foreseeable consequences distracting and stressful.

Rob

