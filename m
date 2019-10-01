Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6711EC37C5
	for <lists+linux-sh@lfdr.de>; Tue,  1 Oct 2019 16:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389238AbfJAOlS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Oct 2019 10:41:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55784 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbfJAOlS (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 1 Oct 2019 10:41:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 813722EF16A;
        Tue,  1 Oct 2019 14:41:17 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D83F15D9C9;
        Tue,  1 Oct 2019 14:41:14 +0000 (UTC)
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
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH v5 04/10] mm/memory_hotplug: Don't access uninitialized memmaps in shrink_zone_span()
Date:   Tue,  1 Oct 2019 16:40:05 +0200
Message-Id: <20191001144011.3801-5-david@redhat.com>
In-Reply-To: <20191001144011.3801-1-david@redhat.com>
References: <20191001144011.3801-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 01 Oct 2019 14:41:17 +0000 (UTC)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Let's limit shrinking to !ZONE_DEVICE so we can fix the current code. We
should never try to touch the memmap of offline sections where we could
have uninitialized memmaps and could trigger BUGs when calling
page_to_nid() on poisoned pages.

There is no reliable way to distinguish an uninitialized memmap from an
initialized memmap that belongs to ZONE_DEVICE, as we don't have
anything like SECTION_IS_ONLINE we can use similar to
pfn_to_online_section() for !ZONE_DEVICE memory. E.g.,
set_zone_contiguous() similarly relies on pfn_to_online_section() and
will therefore never set a ZONE_DEVICE zone consecutive. Stopping to
shrink the ZONE_DEVICE therefore results in no observable changes,
besides /proc/zoneinfo indicating different boundaries - something we
can totally live with.

Before commit d0dc12e86b31 ("mm/memory_hotplug: optimize memory
hotplug"), the memmap was initialized with 0 and the node with the
right value. So the zone might be wrong but not garbage. After that
commit, both the zone and the node will be garbage when touching
uninitialized memmaps.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 86b4dc18e831..afed8331332b 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -331,7 +331,7 @@ static unsigned long find_smallest_section_pfn(int nid, struct zone *zone,
 				     unsigned long end_pfn)
 {
 	for (; start_pfn < end_pfn; start_pfn += PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_valid(start_pfn)))
+		if (unlikely(!pfn_to_online_page(start_pfn)))
 			continue;
 
 		if (unlikely(pfn_to_nid(start_pfn) != nid))
@@ -356,7 +356,7 @@ static unsigned long find_biggest_section_pfn(int nid, struct zone *zone,
 	/* pfn is the end pfn of a memory section. */
 	pfn = end_pfn - 1;
 	for (; pfn >= start_pfn; pfn -= PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_valid(pfn)))
+		if (unlikely(!pfn_to_online_page(pfn)))
 			continue;
 
 		if (unlikely(pfn_to_nid(pfn) != nid))
@@ -415,7 +415,7 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
 	 */
 	pfn = zone_start_pfn;
 	for (; pfn < zone_end_pfn; pfn += PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_valid(pfn)))
+		if (unlikely(!pfn_to_online_page(pfn)))
 			continue;
 
 		if (page_zone(pfn_to_page(pfn)) != zone)
@@ -463,6 +463,14 @@ static void __remove_zone(struct zone *zone, unsigned long start_pfn,
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	unsigned long flags;
 
+	/*
+	 * Zone shrinking code cannot properly deal with ZONE_DEVICE. So
+	 * we will not try to shrink the zones - which is okay as
+	 * set_zone_contiguous() cannot deal with ZONE_DEVICE either way.
+	 */
+	if (zone_idx(zone) == ZONE_DEVICE)
+		return;
+
 	pgdat_resize_lock(zone->zone_pgdat, &flags);
 	shrink_zone_span(zone, start_pfn, start_pfn + nr_pages);
 	update_pgdat_span(pgdat);
-- 
2.21.0

