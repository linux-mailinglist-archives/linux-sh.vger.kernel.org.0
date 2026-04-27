Return-Path: <linux-sh+bounces-3753-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHp8E5l672kmBwEAu9opvQ
	(envelope-from <linux-sh+bounces-3753-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 17:02:49 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D3474D32
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 17:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D8793012251
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 14:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F453B9DA8;
	Mon, 27 Apr 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DOppvcSt"
X-Original-To: linux-sh@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C844C29B77C;
	Mon, 27 Apr 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301974; cv=none; b=Ize3sGry68VdDwOTU1BhfuzRzwXOrd6nIwcBirhIEYko2gq/zKlsec1x04Xjk/xkiUJgNN4OLay2DhjASxXpvn4Qnpf7Srjgi6t6UIwq2hcD7FOA9U9zGcVIvFgXJztSCXHrDQTORboYGhdDnPOu6u4/W8+Vyt65B3oxEW1c4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301974; c=relaxed/simple;
	bh=ROFIUFumhXvq/yUk4p9Xluj4RcIGcs6oavh2jWkshVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3Fg9XjQMAs8Y2leq0dDeweq0SbRI+5d7scApqWh3Dfb9sxTTfxPulhZonWKPkbefCSqvgJBakyzUqt4Zn+qqi5bMioF1/pQpnrQUjOaf79QgB+heIoXhNggSTAVXVrG3OIcpXbycviax0DcpPvJe/qWG3OiW9WwM7j6YeFbaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DOppvcSt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LnSYo4u0L2Q6YEjx0+dHXcL7aARLporXLzc/o3YTey4=; b=DOppvcStsIhCJdrfUDmQHbkpCJ
	vxt0xZj3PArO+3swzACOj4C6ddv3xiAtzOO4ch4r7SyyXSWN1W7zY5CUtupWFw0m2E2SbGXzE+kZ3
	yL2OlsnQgQi15x+WC/xPVcoEDOgM08hL1VxXOyuf84KNTxkTz3HU8LvfQEvD9/Axy6xc1UA4i1h+j
	EzXXiz/ixQIzlFf4xixGXeiavCpXi+uXv6CgT2bV/+hduPx/4EH6OEt8iWXDy9eC6arzbycDw5yLw
	pgudYhnMvaduKk82qPgPyzSo6SxXaG+M5YErrZcBE84J2+4uQ2ZXnY7v91KeC2VFFzgoqPLv8OTRh
	wChocelQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNQa-00000002Eyk-3fVi;
	Mon, 27 Apr 2026 14:59:16 +0000
Date: Mon, 27 Apr 2026 15:59:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	"Liam R. Howlett" <liam@infradead.org>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 3/3] mm: remove page_mapped()
Message-ID: <ae95xHobKZ1MpmVG@casper.infradead.org>
References: <20260427-page_mapped-v1-0-e89c3592c74c@kernel.org>
 <20260427-page_mapped-v1-3-e89c3592c74c@kernel.org>
 <20260427062137.48739e6fa6e550f1f0e8ff48@linux-foundation.org>
 <06218a87-8346-40b4-adf4-dc494b5f1293@kernel.org>
 <ae91ogo90bSDFNPC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae91ogo90bSDFNPC@gmail.com>
X-Rspamd-Queue-Id: A84D3474D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3753-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,iogearbox.net,linux.dev,gmail.com,google.com,suse.com,surriel.com,infradead.org,vger.kernel.org,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-sh@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-sh];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,casper.infradead.org:mid]

On Mon, Apr 27, 2026 at 07:42:46AM -0700, Breno Leitao wrote:
> > > @@ -1353,7 +1353,7 @@ static bool panic_on_unrecoverable_mf(un
> > >  		cpu_relax();
> > >  		return page_count(p) == 0 &&
> > >  		       !PageLRU(p) &&
> > > -		       !page_mapped(p) &&
> > > +		       !folio_mapped(page_folio(p)) &&
> > >  		       !page_folio(p)->mapping &&
> > 
> > If we have a folio, we should really lookup the folio once. Not 4 times.
> 
> Why 4 times?

Because there are page_folio() calls hidden in PageLRU, page_mapped()
and page_count().

> > Breno's patch likely needs some love. :)
> 
> Would something like the following give it all the love in the world?
> 
>  folio = page_folio(p);
>  return page_count(p) == 0 &&
>         !PageLRU(p) &&
>         !folio_mapped(folio) &&
>         !folio->mapping &&
>         !is_free_buddy_page(p);

No.  You need to immerse yourself more deeply in the folio transition
;-)

