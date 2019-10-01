Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3D0C37BE
	for <lists+linux-sh@lfdr.de>; Tue,  1 Oct 2019 16:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbfJAOlP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Oct 2019 10:41:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47832 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388938AbfJAOlP (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 1 Oct 2019 10:41:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 84E4E309B6C4;
        Tue,  1 Oct 2019 14:41:14 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B78395D9CC;
        Tue,  1 Oct 2019 14:41:11 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richardw.yang@linux.intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH v5 03/10] mm/memory_hotplug: Don't access uninitialized memmaps in shrink_pgdat_span()
Date:   Tue,  1 Oct 2019 16:40:04 +0200
Message-Id: <20191001144011.3801-4-david@redhat.com>
In-Reply-To: <20191001144011.3801-1-david@redhat.com>
References: <20191001144011.3801-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 01 Oct 2019 14:41:14 +0000 (UTC)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

We might use the nid of memmaps that were never initialized. For
example, if the memmap was poisoned, we will crash the kernel in
pfn_to_nid() right now. Let's use the calculated boundaries of the separate
zones instead. This now also avoids having to iterate over a whole bunch of
subsections again, after shrinking one zone.

Before commit d0dc12e86b31 ("mm/memory_hotplug: optimize memory
hotplug"), the memmap was initialized to 0 and the node was set to the
right value. After that commit, the node might be garbage.

We'll have to fix shrink_zone_span() next.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 72 ++++++++++-----------------------------------
 1 file changed, 15 insertions(+), 57 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 680b4b3e57d9..86b4dc18e831 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -436,67 +436,25 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
 	zone_span_writeunlock(zone);
 }
 
-static void shrink_pgdat_span(struct pglist_data *pgdat,
-			      unsigned long start_pfn, unsigned long end_pfn)
+static void update_pgdat_span(struct pglist_data *pgdat)
 {
-	unsigned long pgdat_start_pfn = pgdat->node_start_pfn;
-	unsigned long p = pgdat_end_pfn(pgdat); /* pgdat_end_pfn namespace clash */
-	unsigned long pgdat_end_pfn = p;
-	unsigned long pfn;
-	int nid = pgdat->node_id;
-
-	if (pgdat_start_pfn == start_pfn) {
-		/*
-		 * If the section is smallest section in the pgdat, it need
-		 * shrink pgdat->node_start_pfn and pgdat->node_spanned_pages.
-		 * In this case, we find second smallest valid mem_section
-		 * for shrinking zone.
-		 */
-		pfn = find_smallest_section_pfn(nid, NULL, end_pfn,
-						pgdat_end_pfn);
-		if (pfn) {
-			pgdat->node_start_pfn = pfn;
-			pgdat->node_spanned_pages = pgdat_end_pfn - pfn;
-		}
-	} else if (pgdat_end_pfn == end_pfn) {
-		/*
-		 * If the section is biggest section in the pgdat, it need
-		 * shrink pgdat->node_spanned_pages.
-		 * In this case, we find second biggest valid mem_section for
-		 * shrinking zone.
-		 */
-		pfn = find_biggest_section_pfn(nid, NULL, pgdat_start_pfn,
-					       start_pfn);
-		if (pfn)
-			pgdat->node_spanned_pages = pfn - pgdat_start_pfn + 1;
-	}
-
-	/*
-	 * If the section is not biggest or smallest mem_section in the pgdat,
-	 * it only creates a hole in the pgdat. So in this case, we need not
-	 * change the pgdat.
-	 * But perhaps, the pgdat has only hole data. Thus it check the pgdat
-	 * has only hole or not.
-	 */
-	pfn = pgdat_start_pfn;
-	for (; pfn < pgdat_end_pfn; pfn += PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_valid(pfn)))
-			continue;
-
-		if (pfn_to_nid(pfn) != nid)
-			continue;
+	unsigned long node_start_pfn = 0, node_end_pfn = 0;
+	struct zone *zone;
 
-		/* Skip range to be removed */
-		if (pfn >= start_pfn && pfn < end_pfn)
-			continue;
+	for (zone = pgdat->node_zones;
+	     zone < pgdat->node_zones + MAX_NR_ZONES; zone++) {
+		unsigned long zone_end_pfn = zone->zone_start_pfn +
+					     zone->spanned_pages;
 
-		/* If we find valid section, we have nothing to do */
-		return;
+		/* No need to lock the zones, they can't change. */
+		if (zone_end_pfn > node_end_pfn)
+			node_end_pfn = zone_end_pfn;
+		if (zone->zone_start_pfn < node_start_pfn)
+			node_start_pfn = zone->zone_start_pfn;
 	}
 
-	/* The pgdat has no valid section */
-	pgdat->node_start_pfn = 0;
-	pgdat->node_spanned_pages = 0;
+	pgdat->node_start_pfn = node_start_pfn;
+	pgdat->node_spanned_pages = node_end_pfn - node_start_pfn;
 }
 
 static void __remove_zone(struct zone *zone, unsigned long start_pfn,
@@ -507,7 +465,7 @@ static void __remove_zone(struct zone *zone, unsigned long start_pfn,
 
 	pgdat_resize_lock(zone->zone_pgdat, &flags);
 	shrink_zone_span(zone, start_pfn, start_pfn + nr_pages);
-	shrink_pgdat_span(pgdat, start_pfn, start_pfn + nr_pages);
+	update_pgdat_span(pgdat);
 	pgdat_resize_unlock(zone->zone_pgdat, &flags);
 }
 
-- 
2.21.0

