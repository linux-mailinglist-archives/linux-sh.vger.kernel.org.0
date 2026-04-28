Return-Path: <linux-sh+bounces-3797-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGLAF0Xi8GmoagEAu9opvQ
	(envelope-from <linux-sh+bounces-3797-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 18:37:25 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 057FC48916A
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 18:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CADE314FE0E
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2026 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9560143E4B4;
	Tue, 28 Apr 2026 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dbI+va5q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dva18meC"
X-Original-To: linux-sh@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491443DA23;
	Tue, 28 Apr 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393225; cv=none; b=Riwl7HRkBoB0vAGKv21F1eK+DFbvR87V2vbwG3BEWQYGxyfU0idTyjlmNbjp1MKu+5Wm5DgMfyob9pJXXXVv7TP+hWQ69l5ZhmYybqXrE8kWJIRf1YSzoBwOhz6IJKCZDF5fk1BJYMuSSyeoEuJIDuY8kmIIYTXQNsitP8a/j+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393225; c=relaxed/simple;
	bh=bPaWiAn/VzcYg4D3G1OsLP2wsUe8WrBXVHTDvL5VlQM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uX16AAxbZgVbAad67NWiD5Rqz5WgPmr+epI+OXB7GwCUSeaihFC5BzjDrJtxYgS2DAVQZ7tdRzM4ZR6X4jj29GXQSqHyorhAyi/RfsFhU+V43otaAkvFbRJ4YgNnGLQdr9BI7hYW2XO2OLDUEdfwnDvp/3TrXN/HTt4muON4IfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dbI+va5q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dva18meC; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 84D0DEC00BB;
	Tue, 28 Apr 2026 12:20:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 28 Apr 2026 12:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777393223;
	 x=1777479623; bh=ZoWzw8sGHPW65t724czwuKT2U6AD9EKwSQ9IBWSTpsw=; b=
	dbI+va5q4kvdRJxHBs+Wzt8QlrcIlLnrd/MBovHAcEQWt4227Dh/BlHQfsKwyevV
	vtg3OMi7BaRpke/LY8hTmBzsD4R0YMpPybgAK7378qgcwotJu6X8nr5KICtYmz0p
	1bxROjS0173+epF2EETknvgu92fManlC2Q5hFzxGsyxsK0xved79T23veFrqMKVf
	CkPGryFCOszjUOTIDzq843MILZ47EtF6faWGEG7WwOWFGVMGA+JhxcXUJfF2fcTT
	S1I6auD9muASNaGjKMogY8zyZ9DrwyLY05Updq0ZxGyzJse54lwt/6qNHGiqzRHX
	8asvPzRg/n7mhWG98XCSAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777393223; x=
	1777479623; bh=ZoWzw8sGHPW65t724czwuKT2U6AD9EKwSQ9IBWSTpsw=; b=d
	va18meCxnMdIOmlEJn1uAt4AGVOABB2CD0K3HLS9wmo9AIZSWGphX9raGJLuXkbH
	2eey93kv/Pi4iKNhhEgefnzc9yUPtN7cOcyyQoOHEbDNadGOto+S+ly1TOJdzI8Y
	Mui2V8vObIilD5ehK+wz5U+8XJOsuZ0FvRyvZTvv/opbEVyDbWFGj5wq3rcgLTfa
	+XybOf5BmWHfvzkHdYYvNTUSW6gnzIw0WtZlWZOLSj8ADCOZYARckifynYFVZtCW
	rfQm9hQG/x/nDCsm+CYtpmSwsP0q3XHj/9gjjAVj8b1XwZDoHYdGiQ8a4hg1Uak1
	PySh4yq7exeYLIliBB4xQ==
X-ME-Sender: <xms:R97waSjBfGB2WDO53ukBfn3VQtosoMxmH9zLzcjpjiLQEILNOPqe9Q>
    <xme:R97wad0BF8c_ge6uFSg6IM-u66fm2opiF781Q0_s0VE2kzUTxv4OvcBRSdCxe1AAs
    DOI9Ot75ZEIO1F6QgteQoMZLjDTGi7IpYy8d9thRD6NPUenf8zesxWV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtoheprg
    hrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghlihgrsheslhhisggtrdho
    rhhgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinh
    druggvpdhrtghpthhtohephihsrghtohesuhhsvghrshdrshhouhhrtggvfhhorhhgvgdr
    jhhppdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqshhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:R97wac3L6H-42Q3-WQv4rQVCZbKuDppB4PwnsBRbiZSdJolXgEG0Yw>
    <xmx:R97waRESHrn555t-BL4CHe6skCtBGxLH-t0EwDedV80aumjL4d-nKA>
    <xmx:R97wabiF82OzL-VHTpLq194qqxanI1K5XArB-LkX4LoJvTo1aKvX4Q>
    <xmx:R97waUA9Kw-3Vd43PCwL3AYLm1FxZkPZIuw7JvT64NXO4PgGKO-TjQ>
    <xmx:R97waUBkjfn5FP-xLN85guxxcgvJw08U383w-qyHyLmffsBZJgoKNOHZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 14334700069; Tue, 28 Apr 2026 12:20:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AuXWUXY87igk
Date: Tue, 28 Apr 2026 18:20:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <3529a6c7-401c-4ec3-a63c-5235416e52c5@app.fastmail.com>
In-Reply-To: 
 <716fb62be57fd01c68cfed9220da7ebddfa321ae.camel@physik.fu-berlin.de>
References: <20260428155528.3218943-1-arnd@kernel.org>
 <716fb62be57fd01c68cfed9220da7ebddfa321ae.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: select legacy gpiolib interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 057FC48916A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3797-lists,linux-sh=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim]

On Tue, Apr 28, 2026, at 18:08, John Paul Adrian Glaubitz wrote:
> On Tue, 2026-04-28 at 17:55 +0200, Arnd Bergmann wrote:

> Thanks, this looks reasonable from what I can see. Most boards require at least
> gpio_request() which is now guarded behind CONFIG_GPIOLIB_LEGACY.
>
> Does this maybe need a Fixes: tag to identify the commit which 
> introduced the new
> config option CONFIG_GPIOLIB_LEGACY?

At the moment, CONFIG_GPIOLIB_LEGACY is still enabled
unconditionally, the idea being to change it to default-off
after all known users select it. This won't be for at
least another merged window, so I think you can just merge
the patch now without any other dependencies, but we can
also merge it through the gpio tree at the time of that other
patch.

     Arnd

