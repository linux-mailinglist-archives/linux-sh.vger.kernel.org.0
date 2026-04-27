Return-Path: <linux-sh+bounces-3747-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJaiKBZb72llAgEAu9opvQ
	(envelope-from <linux-sh+bounces-3747-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:48:22 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB69472BA2
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A67C3008A6F
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0743B95E3;
	Mon, 27 Apr 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FHOQ++Ro"
X-Original-To: linux-sh@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C13B7B99;
	Mon, 27 Apr 2026 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293848; cv=none; b=uJwy8SCL4PFsrXalZHYp85s0wvmcA/x7J/P/d97UGWy38YFsuiGyD36sEb7hM623S4C9q/qzuW9BCL8mCfCby7amgTeEziOP/m/1lulYTXkb3JAt+kzBYeZxITHz0sbFgawAg45ZolIepcfD7QiexvRjiibI4FIlx76trIKB6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293848; c=relaxed/simple;
	bh=JPEWG16UazYAazgItSDKJV9SoILqjtWjRLFcoiGscBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDKlbmC5ZnvfrqqlHuqBScACAOWqKfq0Q8N10LzpoOBC9RSogfdZN+8mDIo/Z3O4FfzylBoCypcDMfPmNTS2BcdPdppaG7WgadoJ2KAv8kowNTd0NPEKkY5yAUB0/Dswhv6BhvgaiQGEpS26FG0JXHAQe99Qx6B1KdR9uzB3l+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FHOQ++Ro; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=955jjZIxxknUeB2SbfK/z9zTb80A5dO8nDIswaatI7I=; b=FHOQ++Ro1OPIzCJ30X8QNrYF38
	tMokfVlKhhdHPbCY//yhDqo2LA9mFuikUTYQiZIGrfdYmgCeNPzkiL3j5rLOxr7pUnUz4vO8kMgLo
	rFlvAC52/rSCZ0WJi0lY6UKhCej8De7n6TA3Ubki7YFE+1jvm27DLy3Var7+eRjPePFHG+o5fUUNh
	fQl0NgeqRWAzfBdlUD9QR60VnOz9F0BvfePjGkpv8UjKNfyGegHPlNNf134WsKnqPCDYNptDG8Jr3
	6y4bmkqSJkrPvaI08VjtenYYHLeIUvAzOnO5qY6jMm8y3lfc8V30goLH85UgmbvC7vPRi4gOd5wFA
	UZtRrLXA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLJV-000000024bu-1l1Y;
	Mon, 27 Apr 2026 12:43:49 +0000
Date: Mon, 27 Apr 2026 13:43:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	"Liam R. Howlett" <liam@infradead.org>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/3] sh: use folio_mapped() instead of page_mapped() in
 sh4_flush_cache_page()
Message-ID: <ae9aBZOcg_Gc7PH2@casper.infradead.org>
References: <20260427-page_mapped-v1-0-e89c3592c74c@kernel.org>
 <20260427-page_mapped-v1-1-e89c3592c74c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-page_mapped-v1-1-e89c3592c74c@kernel.org>
X-Rspamd-Queue-Id: 0AB69472BA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3747-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[users.sourceforge.jp,libc.org,physik.fu-berlin.de,kernel.org,iogearbox.net,linux.dev,gmail.com,linux-foundation.org,google.com,suse.com,surriel.com,infradead.org,vger.kernel.org,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-sh@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-sh];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:email]

On Mon, Apr 27, 2026 at 01:43:14PM +0200, David Hildenbrand (Arm) wrote:
> We already have the folio in our hands, so let's just use
> folio_mapped().
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks; that was an oversight on my part.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

