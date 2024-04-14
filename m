Return-Path: <linux-sh+bounces-834-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12089E357
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A2C1F23671
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4C3157E82;
	Tue,  9 Apr 2024 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMv8hHMn"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1221157492
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690703; cv=none; b=fgSJAqmaJeeQs+Hb87eKPUiHZCAyTAYik6/U1FzKDUHEwD9SabRr8Ns1fSIRBFCwqsAuiosIoVh83VhDJBdfNqd2NhiQoxhlfa1l31d0dt2tCp69Gv1ge0DIC7NYoID8BXF2yZyL1kbrhhfAUO7dgFB56A4Vlh5XtWe/QTkKqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690703; c=relaxed/simple;
	bh=FAIHwezgBzib8qVcIz1KMdTokmMBm7CLgJNhlG06JSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaXpSTOyPWcemGLrzh35gkto9YZNubMsFkiiZOMnF+C8l/z9GQMyNzv51EPaL2Bfnn5ntxPfhBeLZeEQ4U5IM0Cow/dNKuxHgZXpmOtJg73y/FPreFh5/VRkT6hvtA2A7WBuz7uGdpZWXvrY9BAIlMdNglQMrYDqJERyUZC+H/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMv8hHMn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rnCGH1F82LpMt5YjVvPZTK3t5BGo8uUqDhbNYCO1mM=;
	b=GMv8hHMn1W3FAXy/lgTzPdQYYF7jxjOFZeNAyRciLfSbRBeie4usGSbUP21rPbyQUuFJ8K
	MdgGBZCKvt0pt/ffa/Z4+B1Jk9/9hozT0+AHhfGWQDZNnxEECZrqVtRpeWunFbzE4lFsCD
	kz1RoVXUYu5auSPSDHTgnb4twZ5FwxE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-HVcby02FNvy6GQIyoWw54g-1; Tue,
 09 Apr 2024 15:24:57 -0400
X-MC-Unique: HVcby02FNvy6GQIyoWw54g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D86429AA392;
	Tue,  9 Apr 2024 19:24:56 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A40740B497A;
	Tue,  9 Apr 2024 19:24:42 +0000 (UTC)
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
Subject: [PATCH v1 07/18] mm/memory: use folio_mapcount() in zap_present_folio_ptes()
Date: Tue,  9 Apr 2024 21:22:50 +0200
Message-ID: <20240409192301.907377-8-david@redhat.com>
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
absolutely necessary. In zap_present_folio_ptes(), let's simply check
the folio mapcount(). If there is some issue, it will underflow at some
point either way when unmapping.

As indicated already in commit 10ebac4f95e7 ("mm/memory: optimize unmap/zap
with PTE-mapped THP"), we already documented "If we ever have a cheap
folio_mapcount(), we might just want to check for underflows there.".

There is no change for small folios. For large folios, we'll now catch
more underflows when batch-unmapping, because instead of only testing
the mapcount of the first subpage, we'll test if the folio mapcount
underflows.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 78422d1c7381..178492efb4af 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1502,8 +1502,7 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 	if (!delay_rmap) {
 		folio_remove_rmap_ptes(folio, page, nr, vma);
 
-		/* Only sanity-check the first page in a batch. */
-		if (unlikely(page_mapcount(page) < 0))
+		if (unlikely(folio_mapcount(folio) < 0))
 			print_bad_pte(vma, addr, ptent, page);
 	}
 
-- 
2.44.0


