Return-Path: <linux-sh+bounces-832-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CA89E34D
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F4C1F22A4E
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DDC157480;
	Tue,  9 Apr 2024 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GfPa8UX1"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1E15746F
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690679; cv=none; b=VfWVq87iOgWhs9+qC1mmDmovhEGzd9clr6fWEo18pElU14vGC0PVWAP4oTqQTRZ+umdqZ4IV7O1uCZ7gHtDaG46A17pp1RE3u53SHfRjatV9PWdj8jA58ToIngAOd20TtH2YUlVJFLtQXxbmo5h4gwN72wy8/XobvGSLwhEu0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690679; c=relaxed/simple;
	bh=6G3a0Az5RUxYjW0MeAONrOSx900CkrCCjkjSacXNONc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/gQnkFHyQuOOc0eVgxyc4YFPRtUzvPuCYSwZjlN6xx6w8tAo5NHyXi3SzDtYOhpKnkpYcXiWgOZnbdC7x1079TAjLVu5byhJO3h8B5YY+tDXoms09pAgzfxN68OMKvUMi9/k/g3WGWW8154IDqS87nvEr4YZlBnyubMAEA+kys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GfPa8UX1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uy2oRB9rRnFFfSxz/BmLFL5vpaMUgfQlIINZ/k73n3E=;
	b=GfPa8UX1OGKMUKG9GkEXccQPJABLAaFSB1QsAO73OQf0LhDzmHBktRXSn4oLFRE4snXvM1
	0DuWoWvjAJatUIITGUuzA3kVE/GibK9fGDsqAwK4LkNqkg086GqNOo3YmWX8emvXzTSJdZ
	YcT/bpq9KpRiZjxDydD9eleZ/91ALx4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-y1kOx-irPBuEYteLZHDYxQ-1; Tue,
 09 Apr 2024 15:24:35 -0400
X-MC-Unique: y1kOx-irPBuEYteLZHDYxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8046C380009F;
	Tue,  9 Apr 2024 19:24:33 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1167E40B4979;
	Tue,  9 Apr 2024 19:24:22 +0000 (UTC)
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
Subject: [PATCH v1 05/18] mm: improve folio_likely_mapped_shared() using the mapcount of large folios
Date: Tue,  9 Apr 2024 21:22:48 +0200
Message-ID: <20240409192301.907377-6-david@redhat.com>
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

We can now read the mapcount of large folios very efficiently. Use it to
improve our handling of partially-mappable folios, falling back
to making a guess only in case the folio is not "obviously mapped shared".

We can now better detect partially-mappable folios where the first page is
not mapped as "mapped shared", reducing "false negatives"; but false
negatives are still possible.

While at it, fixup a wrong comment (false positive vs. false negative)
for KSM folios.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1862a216af15..daf687f0e8e5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2183,7 +2183,7 @@ static inline size_t folio_size(struct folio *folio)
  *       indicate "mapped shared" (false positive) when two VMAs in the same MM
  *       cover the same file range.
  *    #. For (small) KSM folios, the return value can wrongly indicate "mapped
- *       shared" (false negative), when the folio is mapped multiple times into
+ *       shared" (false positive), when the folio is mapped multiple times into
  *       the same MM.
  *
  * Further, this function only considers current page table mappings that
@@ -2200,7 +2200,22 @@ static inline size_t folio_size(struct folio *folio)
  */
 static inline bool folio_likely_mapped_shared(struct folio *folio)
 {
-	return page_mapcount(folio_page(folio, 0)) > 1;
+	int mapcount = folio_mapcount(folio);
+
+	/* Only partially-mappable folios require more care. */
+	if (!folio_test_large(folio) || unlikely(folio_test_hugetlb(folio)))
+		return mapcount > 1;
+
+	/* A single mapping implies "mapped exclusively". */
+	if (mapcount <= 1)
+		return false;
+
+	/* If any page is mapped more than once we treat it "mapped shared". */
+	if (folio_entire_mapcount(folio) || mapcount > folio_nr_pages(folio))
+		return true;
+
+	/* Let's guess based on the first subpage. */
+	return atomic_read(&folio->_mapcount) > 0;
 }
 
 #ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
-- 
2.44.0


