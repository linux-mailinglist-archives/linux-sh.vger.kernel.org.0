Return-Path: <linux-sh+bounces-3711-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM8sK7Iz6mkCwwIAu9opvQ
	(envelope-from <linux-sh+bounces-3711-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Thu, 23 Apr 2026 16:58:58 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A01453FD5
	for <lists+linux-sh@lfdr.de>; Thu, 23 Apr 2026 16:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F4C63017242
	for <lists+linux-sh@lfdr.de>; Thu, 23 Apr 2026 14:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6358F32692B;
	Thu, 23 Apr 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="grJ4XTFk"
X-Original-To: linux-sh@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC62222CC;
	Thu, 23 Apr 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956287; cv=none; b=cJfVqtI/KvJ68D6RwjQik1hQx1xhXWzRZ2ARQiSJzdWBwU05aeqJQgdVjvXiNI17Icuni1ERN3gXhLuAWX4OTZFY0K3G68brkf/yEqVBHN1XSubKGq1P0Eb1nTjSIHoeVkOGrnmrtGWidCn389/kvtMWSfFC8dyRjbBn5LBMF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956287; c=relaxed/simple;
	bh=IHN068CgpuQMMzCWxJhv3EPO4opZ9mkJtDUoyjSbtR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejO+oYkeKbi0hoUD85G07ErXCS8ucnd5x798Os0q8diJBjAqah055k+trvl2upagJ6INCsLeL5YF1daP4Xf38R/RCi1bKjUFdCyiBYGsCRfmbkolBdJKKQnjnLXS6am8E4zIjLU4s3eHs/SiDSBAxrKWlNDZX1bKXNNmTx1iCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=grJ4XTFk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V2+fKH8cfcnGaIWyfr1LOPlVfwYoDzH/Ub08ksZxm2Q=; b=grJ4XTFknIX2ExW4F9BdSIB3XW
	Dku5Rn+0mC3JTd2W7uBxu6X5lblhC12/EOtpAvgU6XerJ91UIC1E0eNaWWfujjaZzb4lVlLRE6GgQ
	5NTagWAYlBUcnKtlyOAQJTcb/pwppTKy8+y0YvWN5nsrcQpmRIALKodsDoKpoz/92IIi+rfSUEzzy
	Lg822GbzrjHkwuygnWO24+cZEHQwZuUfHY3hhg1UWfUf36B3Ywa4D+QgptCdx/7MSdr/GpVJr4Yrk
	QUOKwXfE30KQA0zfH4XsQ4SYM0EM49cYCwmhotwubMuC5CMh/S9iXrD3UeKMCnO4ev535khgLXnGn
	bKni/MGQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvV9-0000000Dd2X-2dWA;
	Thu, 23 Apr 2026 14:57:59 +0000
Date: Thu, 23 Apr 2026 15:57:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sh: cache: remove unused but set variables in
 sh4_flush_cache_range
Message-ID: <aeozdx1V_A1vkWzY@casper.infradead.org>
References: <20260423145301.245374-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423145301.245374-4-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3711-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-sh@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,casper.infradead.org:mid]
X-Rspamd-Queue-Id: 71A01453FD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 04:53:01PM +0200, Thorsten Blum wrote:
> Remove 'start' and 'end' to avoid two "variable set but not used"
> warnings triggered by -Wunused-but-set-variable.

Looks like the actual uses of them were removed in 654d364e26c7.  2009!

