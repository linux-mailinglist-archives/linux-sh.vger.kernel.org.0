Return-Path: <linux-sh+bounces-829-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F989E342
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A98F1C2131E
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B67157490;
	Tue,  9 Apr 2024 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHSftwi9"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F70157A65
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690653; cv=none; b=H47LaGvMVW6U739JEyLLWN4rfPP5lcEx3dgUwLqWqzKXf2jUynMyepeYz+TniSI3Vd4BI5CIkrYrjXr3cR4JF8usqzBXGd/XtqxZBLxUID6vigB9I7Tka4+vASS3LTtgy3NZb3cdLWLCRUmK6cSEYPgfpDkPBMBTFh2WO2j2Vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690653; c=relaxed/simple;
	bh=er1avreit/gXVooPI/0puJF4i4dYhIIHJ1VQBTIYsoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9yTZV+znAKjpZvdOH6cIFDTtpgoj6DNU4hqkEV2m65OyycmI0r2clegSY50kDx8yx1ApoADTMf5HtVqdGwfdSa9WTST2pQgWJ7Qr0jsyuiIOQy6TEMeNysJB/wHeG3QMmcuR2eZ/IKZRMJjeXjRkufZcJqtRytJfMG01nlPaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHSftwi9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xg0rO/waZOgQmZDoxFOYF0uFGKk6lZboizK7nff+LmE=;
	b=ZHSftwi9tCSU7OBRmZHYJZjWPiIa/XFj1ekDyCpXL9raHOq9vjrbW6k1uAmRWtNEziwYj9
	aCt6T7+JFAmv1WjzsON1vrPF3RB7THcPhOyjrHRhviz/BlGnJYhiio2JBLKhwGHVSBHdSB
	V6JjMlwXcKiKetLstEUBnBQcXI9Y5n4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-RAOsmv4mOp6g3iCo6gpvAQ-1; Tue, 09 Apr 2024 15:24:06 -0400
X-MC-Unique: RAOsmv4mOp6g3iCo6gpvAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D511887313;
	Tue,  9 Apr 2024 19:23:48 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD4540AE783;
	Tue,  9 Apr 2024 19:23:32 +0000 (UTC)
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
Subject: [PATCH v1 01/18] mm: allow for detecting underflows with page_mapcount() again
Date: Tue,  9 Apr 2024 21:22:44 +0200
Message-ID: <20240409192301.907377-2-david@redhat.com>
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

Commit 53277bcf126d ("mm: support page_mapcount() on page_has_type()
pages") made it impossible to detect mapcount underflows by treating
any negative raw mapcount value as a mapcount of 0.

We perform such underflow checks in zap_present_folio_ptes() and
zap_huge_pmd(), which would currently no longer trigger.

Let's check against PAGE_MAPCOUNT_RESERVE instead by using
page_type_has_type(), like page_has_type() would, so we can still catch
some underflows.

Fixes: 53277bcf126d ("mm: support page_mapcount() on page_has_type() pages")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef34cf54c14f..0fb8a40f82dd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1229,11 +1229,10 @@ static inline void page_mapcount_reset(struct page *page)
  */
 static inline int page_mapcount(struct page *page)
 {
-	int mapcount = atomic_read(&page->_mapcount) + 1;
+	int mapcount = atomic_read(&page->_mapcount);
 
 	/* Handle page_has_type() pages */
-	if (mapcount < 0)
-		mapcount = 0;
+	mapcount = page_type_has_type(mapcount) ? 0 : mapcount + 1;
 	if (unlikely(PageCompound(page)))
 		mapcount += folio_entire_mapcount(page_folio(page));
 
-- 
2.44.0


