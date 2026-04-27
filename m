Return-Path: <linux-sh+bounces-3736-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOGoOehL72kEAAEAu9opvQ
	(envelope-from <linux-sh+bounces-3736-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 13:43:36 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE8471E72
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 13:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0DCB3002921
	for <lists+linux-sh@lfdr.de>; Mon, 27 Apr 2026 11:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BE530FC2E;
	Mon, 27 Apr 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyvO8iCy"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67830F548;
	Mon, 27 Apr 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290206; cv=none; b=jSSF3QTG5TFOhlsqhvDET4bE5+QqkARlV95/cIXAPLWMhmxIW6uvU/U2oiVrYl4qwVmjf2+vBNhe4gFKzi6fwCOEDvJBOV2wIokPYESF8dNHocDUTLWM1ZE50sIW4d+soMJj/3zNhhDckl9D0M4ApT8duCQfFiTxL3J2XsMRGxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290206; c=relaxed/simple;
	bh=uDBjCE9uwaCanxz5E5CzypxBYKKLu044ftwopYhbNFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tpB2h/p7XxRXggrG4kHuwx/L4fwwgm9aZEro/aIiUtkoRy1KLY89fpEv3ZXF1zpqGay8idiEXkGto0I5uPDnbB4PtWiQBz0N1b4wCgomI7rOkqUqNqrJ9RE0C3c07syUEe3w8aXiBwIvgxCmc2a7MsP5kHTi7/LW2Rt/8I0OXNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyvO8iCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF83C19425;
	Mon, 27 Apr 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777290206;
	bh=uDBjCE9uwaCanxz5E5CzypxBYKKLu044ftwopYhbNFU=;
	h=From:Subject:Date:To:Cc:From;
	b=FyvO8iCy6U0CdSl4voD74NGPdf54CApAviztNsWG3LeztA9BljDb2zyoewVjhaSDO
	 dHcIp6qb4pKZlD/tOulDBgZrSVPB0/TmQWLv2XVGxJVBJRgvrmbjZO+xgCJdzdswcw
	 7AuSXWBhSyQpTDgLGIlCjsLv6Q/2HYNI7BXaZBg2qdegmxtt/bdb0LCrk7sFZAJcTm
	 26/jSP6STtn26qBhsDnRl6Wk057bbopoyAUgGD/fxNSl0pUISvMf7U4UjR9ejul7p2
	 rvLtw3V7wX2vWB3fNgckE4q0JJ2QLgIAKb1e4jfD0JsSKI8K0vqCh9QMdg+BnLu7Pv
	 bTSWlUgYXopkw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/3] mm: remove page_mapped()
Date: Mon, 27 Apr 2026 13:43:13 +0200
Message-Id: <20260427-page_mapped-v1-0-e89c3592c74c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFL72kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMj3YLE9NT43MSCgtQU3UQTy0QLS6O0RBNjIyWgjoKi1LTMCrBp0bG
 1tQAYfElxXQAAAA==
To: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-mm@kvack.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: E8BE8471E72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[users.sourceforge.jp,libc.org,physik.fu-berlin.de,kernel.org,iogearbox.net,linux.dev,gmail.com,linux-foundation.org,google.com,suse.com,surriel.com,infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3736-lists,linux-sh=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linux-sh@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

While preparing my slides for an LSF/MM talk, I realized that I did not
yet remove page_mapped().

So let's do that. In the BPF arena code it's unclear which memdesc we
would want to allocate in the future: certainly something with a
refcount, but likely none with a mapcount. So let's just rely on
the page refcount instead to decide whether we want to try zapping the
page from user page tables.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (3):
      sh: use folio_mapped() instead of page_mapped() in sh4_flush_cache_page()
      bpf: arena: use page_ref_count() instead of page_mapped() in arena_free_pages()
      mm: remove page_mapped()

 arch/sh/mm/cache-sh4.c |  2 +-
 include/linux/mm.h     | 10 ----------
 kernel/bpf/arena.c     |  2 +-
 mm/memory.c            |  2 +-
 mm/rmap.c              |  8 ++++----
 5 files changed, 7 insertions(+), 17 deletions(-)

---

base-commit: a2ddbfd1af0f54ea84bf17f0400088815d012e8d

change-id: 20260422-page_mapped-a49a892fa432

--

Cheers,

David


