Return-Path: <linux-sh+bounces-828-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CDF89E339
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92B728342C
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2FA153574;
	Tue,  9 Apr 2024 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dstp3FQ1"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B8130A72
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690645; cv=none; b=YHX/THBsfYi/Al+1kvDWk43JoRrnK6s+puLBBMm+n3HApYlCWNy7qhkdalQ5h5fA/tktgDYwZUyN1qpvRW1pVAPQsPITDNhI/HYDqIk36lTpCqGEyYN4o7Mmm/WM14X+E/AbQtWziPGW5EdEpsP1Pz21ZqDq+Tt7oTysTbZOvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690645; c=relaxed/simple;
	bh=C6vsGAS9Kt2C12HcsVEZN58MdmMVsleriWzOb3OfiVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaewxuLsP8fX0Ul6mMrGnHiFuDtoSPUSqXUTBbNEmZcPBSav1VZauYiJ5pB8X7WjcMF9vhMPEBMUprsv5f1sFbrYqBhl98eGXhI0DzE54oH5o+dxbfxAwguV7FCA07r/o399KaFNL9T7MqqT16X5Z4ynpwvZ98cV37D9sg3f0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dstp3FQ1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omUW48lRIosbAMPj8czTvBZpGDzoyoLuJmkkL5iPx/s=;
	b=dstp3FQ1sWNCEyXH2S4MQjcvVQKIWCf89tgb9LAZwvUrOjviv/U5D9mWn24o3Imvu1GcN8
	Avs5671HatQvuURjXs2QUjvUifNeXCEyg5a7smW/MAKESV5SHc7h57XkVLe3TbhpeV9+lk
	Kde5NcbWk81gEv3KPTpa2gv0hZmgqg8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-_0ZSgaEpNaK-itip1P_sGw-1; Tue,
 09 Apr 2024 15:24:01 -0400
X-MC-Unique: _0ZSgaEpNaK-itip1P_sGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE82338000A3;
	Tue,  9 Apr 2024 19:23:59 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8CB40AE78D;
	Tue,  9 Apr 2024 19:23:48 +0000 (UTC)
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
Subject: [PATCH v1 02/18] mm/rmap: always inline anon/file rmap duplication of a single PTE
Date: Tue,  9 Apr 2024 21:22:45 +0200
Message-ID: <20240409192301.907377-3-david@redhat.com>
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

As we grow the code, the compiler might make stupid decisions and
unnecessarily degrade fork() performance. Let's make sure to always inline
functions that operate on a single PTE so the compiler will always
optimize out the loop and avoid a function call.

This is a preparation for maintining a total mapcount for large folios.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/rmap.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 9bf9324214fc..9549d78928bb 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -347,8 +347,12 @@ static inline void folio_dup_file_rmap_ptes(struct folio *folio,
 {
 	__folio_dup_file_rmap(folio, page, nr_pages, RMAP_LEVEL_PTE);
 }
-#define folio_dup_file_rmap_pte(folio, page) \
-	folio_dup_file_rmap_ptes(folio, page, 1)
+
+static __always_inline void folio_dup_file_rmap_pte(struct folio *folio,
+		struct page *page)
+{
+	__folio_dup_file_rmap(folio, page, 1, RMAP_LEVEL_PTE);
+}
 
 /**
  * folio_dup_file_rmap_pmd - duplicate a PMD mapping of a page range of a folio
@@ -448,8 +452,13 @@ static inline int folio_try_dup_anon_rmap_ptes(struct folio *folio,
 	return __folio_try_dup_anon_rmap(folio, page, nr_pages, src_vma,
 					 RMAP_LEVEL_PTE);
 }
-#define folio_try_dup_anon_rmap_pte(folio, page, vma) \
-	folio_try_dup_anon_rmap_ptes(folio, page, 1, vma)
+
+static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
+		struct page *page, struct vm_area_struct *src_vma)
+{
+	return __folio_try_dup_anon_rmap(folio, page, 1, src_vma,
+					 RMAP_LEVEL_PTE);
+}
 
 /**
  * folio_try_dup_anon_rmap_pmd - try duplicating a PMD mapping of a page range
-- 
2.44.0


