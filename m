Return-Path: <linux-sh+bounces-839-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F589E373
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C2032844DE
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC004157E70;
	Tue,  9 Apr 2024 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJ/B/XP3"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E5157E7B
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690762; cv=none; b=K4zU0MSLvoMwtCKEhnrgmyAIF8L6VKdPSzbRszL0A87vPkwjy92HM3rgmwc8Qf1qfeZ4qkO0vCAJqq404uhwjdBulGQsifd6AxuNRkJvAr9LLSXLJLjHa9kT9mQwon9O/4WQePZJcGr7irn5EFl1neaSh1ElkqIMKRAqOY3G+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690762; c=relaxed/simple;
	bh=B9VW3LrHsx1zgfIxNNfkZUFwrAR512abN6D1CTPxM7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaPsR/JYkxG//CgvQhU8LoO43FNYsFuexZO2cyGrFWHcInvyvJSEaSCaFbmOjqH1lKf1r9xcsrUl+eHz84EpbuPrl2xnFpUruAIWu1kK/KWLwd3FDy0bsImzBqdyA8rFZAE/o5FaLAfc+pU0pgWEJUoI+lIHMopFSQZMpjxM4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJ/B/XP3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oja6emUhi7xfrQgd9sof78Ea2rpQTjm332kNskpFfoE=;
	b=NJ/B/XP3COVCpKvC1knjuut7NMF+3WV481uJFdHoqWl568jyCpFNgMtFRt5xvnbOqUI1I6
	Wl/NjRpH2gdfJ12Dt5FO8RkqOsSWbzj7HezzQn+5e5J41UTXPIM1QnJ5WOyrbIhFtouUQ5
	EDZF2H40S6x9hBj+Im6ZHNPfZHWoml0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-euyj5-iiOp6e2NecV838wQ-1; Tue, 09 Apr 2024 15:25:57 -0400
X-MC-Unique: euyj5-iiOp6e2NecV838wQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 262C9800198;
	Tue,  9 Apr 2024 19:25:56 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B6EB40B497D;
	Tue,  9 Apr 2024 19:25:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yin Fengwei <fengwei.yin@intel.com>,
	Yang Shi <shy828301@gmail.com>,
	Zi Yan <ziy@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Hugh Dickins <hughd@google.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Richard Chang <richardycc@google.com>
Subject: [PATCH v1 12/18] sh/mm/cache: use folio_mapped() in copy_from_user_page()
Date: Tue,  9 Apr 2024 21:22:55 +0200
Message-ID: <20240409192301.907377-13-david@redhat.com>
In-Reply-To: <20240409192301.907377-1-david@redhat.com>
References: <20240409192301.907377-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

We want to limit the use of page_mapcount() to the places where it is
absolutely necessary.

We're already using folio_mapped in copy_user_highpage() and
copy_to_user_page() for a similar purpose so ... let's also simply use
it for copy_from_user_page().

There is no change for small folios. Likely we won't stumble over many
large folios on sh in that code either way.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/sh/mm/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/mm/cache.c b/arch/sh/mm/cache.c
index 9bcaa5619eab..d8be352e14d2 100644
--- a/arch/sh/mm/cache.c
+++ b/arch/sh/mm/cache.c
@@ -84,7 +84,7 @@ void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
 {
 	struct folio *folio = page_folio(page);
 
-	if (boot_cpu_data.dcache.n_aliases && page_mapcount(page) &&
+	if (boot_cpu_data.dcache.n_aliases && folio_mapped(folio) &&
 	    test_bit(PG_dcache_clean, &folio->flags)) {
 		void *vfrom = kmap_coherent(page, vaddr) + (vaddr & ~PAGE_MASK);
 		memcpy(dst, vfrom, len);
-- 
2.44.0


