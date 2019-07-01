Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE22F2B2CF
	for <lists+linux-sh@lfdr.de>; Mon, 27 May 2019 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfE0LMO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 May 2019 07:12:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35728 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbfE0LMO (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 27 May 2019 07:12:14 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CD8CF330259;
        Mon, 27 May 2019 11:12:13 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-89.ams2.redhat.com [10.36.117.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 54D6E19C7F;
        Mon, 27 May 2019 11:12:10 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-mm@kvack.org
Cc:     linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        akpm@linux-foundation.org, Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>,
        Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v3 01/11] mm/memory_hotplug: Simplify and fix check_hotplug_memory_range()
Date:   Mon, 27 May 2019 13:11:42 +0200
Message-Id: <20190527111152.16324-2-david@redhat.com>
In-Reply-To: <20190527111152.16324-1-david@redhat.com>
References: <20190527111152.16324-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 27 May 2019 11:12:14 +0000 (UTC)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

By converting start and size to page granularity, we actually ignore
unaligned parts within a page instead of properly bailing out with an
error.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Qian Cai <cai@lca.pw>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Mathieu Malaterre <malat@debian.org>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index e096c987d261..762887b2358b 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1051,16 +1051,11 @@ int try_online_node(int nid)
 
 static int check_hotplug_memory_range(u64 start, u64 size)
 {
-	unsigned long block_sz = memory_block_size_bytes();
-	u64 block_nr_pages = block_sz >> PAGE_SHIFT;
-	u64 nr_pages = size >> PAGE_SHIFT;
-	u64 start_pfn = PFN_DOWN(start);
-
 	/* memory range must be block size aligned */
-	if (!nr_pages || !IS_ALIGNED(start_pfn, block_nr_pages) ||
-	    !IS_ALIGNED(nr_pages, block_nr_pages)) {
+	if (!size || !IS_ALIGNED(start, memory_block_size_bytes()) ||
+	    !IS_ALIGNED(size, memory_block_size_bytes())) {
 		pr_err("Block size [%#lx] unaligned hotplug range: start %#llx, size %#llx",
-		       block_sz, start, size);
+		       memory_block_size_bytes(), start, size);
 		return -EINVAL;
 	}
 
-- 
2.20.1

