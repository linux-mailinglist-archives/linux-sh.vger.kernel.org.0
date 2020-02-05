Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F75D153BA4
	for <lists+linux-sh@lfdr.de>; Thu,  6 Feb 2020 00:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgBEXIl (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 5 Feb 2020 18:08:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37522 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727389AbgBEXIl (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 5 Feb 2020 18:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580944119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=29ZTjJBKR+L3bx4WS0f/voo5oahzOM1U9ASFLBeMp4o=;
        b=Pl0KRFDSx1dq1MP/a+/jSZatwh26VOo2MB3Mxqb/OuWkthSMm1qe06pj/nYQF8FhcrWa5I
        Jvil4MojRAcYbBa7zapCWp36wClx0FDseA3Z4hFXJULpetvpJi2rrUXfGpzgq9U/qvMZV3
        X6UoRSMQNP8OgZQdnJjy08ScYEj5LvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-aW0bz0YAODSSJOPBtHmibQ-1; Wed, 05 Feb 2020 18:08:35 -0500
X-MC-Unique: aW0bz0YAODSSJOPBtHmibQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44D17800D54;
        Wed,  5 Feb 2020 23:08:33 +0000 (UTC)
Received: from localhost (ovpn-12-19.pek2.redhat.com [10.72.12.19])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id ABEAA8DC12;
        Wed,  5 Feb 2020 23:08:29 +0000 (UTC)
Date:   Thu, 6 Feb 2020 07:08:26 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Wei Yang <richardw.yang@linux.intel.com>
Cc:     David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205230826.GF8965@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200205095924.GC24162@richard>
 <20200205144811.GF26758@MiWiFi-R3L-srv>
 <20200205225633.GA28446@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205225633.GA28446@richard>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 02/06/20 at 06:56am, Wei Yang wrote:
> On Wed, Feb 05, 2020 at 10:48:11PM +0800, Baoquan He wrote:
> >Hi Wei Yang,
> >
> >On 02/05/20 at 05:59pm, Wei Yang wrote:
> >> >diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >> >index f294918f7211..8dafa1ba8d9f 100644
> >> >--- a/mm/memory_hotplug.c
> >> >+++ b/mm/memory_hotplug.c
> >> >@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >> > 		if (pfn) {
> >> > 			zone->zone_start_pfn = pfn;
> >> > 			zone->spanned_pages = zone_end_pfn - pfn;
> >> >+		} else {
> >> >+			zone->zone_start_pfn = 0;
> >> >+			zone->spanned_pages = 0;
> >> > 		}
> >> > 	} else if (zone_end_pfn == end_pfn) {
> >> > 		/*
> >> >@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >> > 					       start_pfn);
> >> > 		if (pfn)
> >> > 			zone->spanned_pages = pfn - zone_start_pfn + 1;
> >> >+		else {
> >> >+			zone->zone_start_pfn = 0;
> >> >+			zone->spanned_pages = 0;
> >> >+		}
> >> > 	}
> >> 
> >> If it is me, I would like to take out these two similar logic out.
> >
> >I also like this style. 
> >> 
> >> For example:
> >> 
> >> 	if () {
> >> 	} else if () {
> >> 	} else {
> >> 		goto out;
> >Here the last else is unnecessary, right?
> >
> 
> I am afraid not.
> 
> If the range is not the first or last, we would leave pfn not initialized.

Ah, you are right. I forgot that one. Then pfn can be assigned the
zone_start_pfn as the old code. Then the following logic is the same
as the original code, find_smallest_section_pfn()/find_biggest_section_pfn() 
have done the iteration the old for loop was doing.

	unsigned long pfn = zone_start_pfn;	
	if () {
	} else if () {
	} 

	/* The zone has no valid section */
	if (!pfn) {
        	zone->zone_start_pfn = 0;
        	zone->spanned_pages = 0;
	}

