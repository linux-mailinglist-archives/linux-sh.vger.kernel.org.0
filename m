Return-Path: <linux-sh+bounces-840-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22F89E379
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 21:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 681B1284955
	for <lists+linux-sh@lfdr.de>; Tue,  9 Apr 2024 19:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73267157A67;
	Tue,  9 Apr 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hy2jgp6a"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E8157E77
	for <linux-sh@vger.kernel.org>; Tue,  9 Apr 2024 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690775; cv=none; b=FV3V2MllQXlYkmJHkS3us6GsMHH3giznMtE/byYXIPpqvPu/9AijNn67wenMABO9K4XINoy1PfWQSZQ9545fL3CNjv+plkFShRyWcFPGUQNSDeJdAHhQMK/8R7A/t5YiJnisrQqToIWWUeyZ9hm+jHYzZt1bxpAvhZ/2XTIgWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690775; c=relaxed/simple;
	bh=omqhDgTrChEETgeMiUUkVBBhOlzU6W6WQjgKatIId+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OD4MOD4WbmksD95Fg86C4gyxkIN2rdU/VAIN8x3XZLuIIOIWlyqSNiwqBaeqHjFvrkc1d5VWODgAjE4M0NAjWfSKZQYpt6LMAJNgiHYFNdZw7Bjciyem0PFinif+Y1sakTH3CUIdQIkRhUIRztzh92Tx4UHMoMy0BzSM1pB2HpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hy2jgp6a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z56f15PtBl+UvHHvSB3Qx1+Za4NemO81qqaBL/Rijfc=;
	b=Hy2jgp6a9WdBLZx94x/do/sXJcDdjtSmkgjijMm0Dt9pBRzLptKfB57QuYJWVyIkz2JBPY
	uoxrgBWxk4JGa/ImnXDq13F/vxBx7QhL/24pOL0gWI7pcL7mkFfPFUgBeUicsFL+77xuDC
	qdVqsreswdNdm33KiSUe89WsK9yk/SU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-Ea0Nh1k0ME2JTUIPiSiprg-1; Tue,
 09 Apr 2024 15:26:09 -0400
X-MC-Unique: Ea0Nh1k0ME2JTUIPiSiprg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DD5B3C3D0CD;
	Tue,  9 Apr 2024 19:26:08 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0B440C6DAE;
	Tue,  9 Apr 2024 19:25:56 +0000 (UTC)
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
Subject: [PATCH v1 13/18] mm/filemap: use folio_mapcount() in filemap_unaccount_folio()
Date: Tue,  9 Apr 2024 21:22:56 +0200
Message-ID: <20240409192301.907377-14-david@redhat.com>
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

Let's use folio_mapcount() instead of filemap_unaccount_folio().

No functional change intended, because we're only dealing with small
folios.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/filemap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index c668e11cd6ef..d4aa82ad5b59 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -168,7 +168,7 @@ static void filemap_unaccount_folio(struct address_space *mapping,
 		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
 
 		if (mapping_exiting(mapping) && !folio_test_large(folio)) {
-			int mapcount = page_mapcount(&folio->page);
+			int mapcount = folio_mapcount(folio);
 
 			if (folio_ref_count(folio) >= mapcount + 2) {
 				/*
-- 
2.44.0


