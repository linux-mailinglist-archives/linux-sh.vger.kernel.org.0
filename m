Return-Path: <linux-sh+bounces-843-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3689E38D
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072351C209C9
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693A71586FD;
	Tue,  9 Apr 2024 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAds3u2Q"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79C1586ED
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690813; cv=none; b=IEdWYhe1rYxgPvW1twgT+7srQEIK5o7PvD5c1BzA0dsqKJlXi3yiHrBLdx0/XcXZm2B0xDMj/3ClZLW+hfuIdc9cv06eyJuegmyzaS20ihdyPp1APmhfVdFxbXeER/JaI2IbuoT9WmpLLU4DbMZwPbu5AefPX+MvLXUu4F34uds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690813; c=relaxed/simple;
	bh=a+SVwgdqFyED+L8M3oTlZBiNzAQkOllWBVsreg72suk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5D70gOIOzfdcsFLdZA4d0uOE4j0XhLVV08yoLDPyx28evZntv9kGR6ozV0lWHKyTjYmcUv0zBLoWJLU11tUgN8QjXu0lNIQHOwBrxCGkf3QABLpJ4S9KbpmRYWsReEqOBD9EBVGpEl5ghkkQwTLp55iuLwRlC9h7JZNc0yu0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAds3u2Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFT5r3M4f3jd1xpIDzMU21YnNFkRRFHEv0eJ+fAnhKQ=;
	b=RAds3u2Qi6xWzMvEsqwjt1Lja1wcKCIl88vmfvw5okv0emn/gCeTzZVSSEPY2Hy3DacYCS
	LskPB1TeK/HbmCruiZg6AyzyvsW78HxlAV0e6ofecgtGkFnH+sP5Z1pyCwA7fUwHsz/v7d
	0pC4VJAbd/B7nj3ME00eOKW53A/S50k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-WsCdNN_cNKiuXalsvr_glg-1; Tue, 09 Apr 2024 15:26:44 -0400
X-MC-Unique: WsCdNN_cNKiuXalsvr_glg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89ACA811001;
	Tue,  9 Apr 2024 19:26:40 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA6940B4979;
	Tue,  9 Apr 2024 19:26:28 +0000 (UTC)
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
Subject: [PATCH v1 16/18] xtensa/mm: convert check_tlb_entry() to sanity check folios
Date: Tue,  9 Apr 2024 21:22:59 +0200
Message-ID: <20240409192301.907377-17-david@redhat.com>
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
absolutely necessary. So let's convert check_tlb_entry() to perform
sanity checks on folios instead of pages.

This essentially already happened: page_count() is mapped to
folio_ref_count(), and page_mapped() to folio_mapped() internally.
However, we would have printed the page_mapount(), which
does not really match what page_mapped() would have checked.

Let's simply print the folio mapcount to avoid using page_mapcount(). For
small folios there is no change.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/xtensa/mm/tlb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 4f974b74883c..d8b60d6e50a8 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -256,12 +256,13 @@ static int check_tlb_entry(unsigned w, unsigned e, bool dtlb)
 					dtlb ? 'D' : 'I', w, e, r0, r1, pte);
 			if (pte == 0 || !pte_present(__pte(pte))) {
 				struct page *p = pfn_to_page(r1 >> PAGE_SHIFT);
-				pr_err("page refcount: %d, mapcount: %d\n",
-						page_count(p),
-						page_mapcount(p));
-				if (!page_count(p))
+				struct folio *f = page_folio(p);
+
+				pr_err("folio refcount: %d, mapcount: %d\n",
+					folio_ref_count(f), folio_mapcount(f));
+				if (!folio_ref_count(f))
 					rc |= TLB_INSANE;
-				else if (page_mapcount(p))
+				else if (folio_mapped(f))
 					rc |= TLB_SUSPICIOUS;
 			} else {
 				rc |= TLB_INSANE;
-- 
2.44.0


