Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB82151786
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 10:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgBDJNS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 04:13:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:47520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgBDJNS (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 4 Feb 2020 04:13:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A8FB2B020;
        Tue,  4 Feb 2020 09:13:15 +0000 (UTC)
Date:   Tue, 4 Feb 2020 10:13:12 +0100
From:   Oscar Salvador <osalvador@suse.de>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200204091312.GC6494@linux>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-9-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Oct 06, 2019 at 10:56:44AM +0200, David Hildenbrand wrote:
> If we have holes, the holes will automatically get detected and removed
> once we remove the next bigger/smaller section. The extra checks can
> go.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Heh, I have been here before.
I have to confess that when I wrote my version of this I was not really 100%
about removing it, because hotplug was a sort of a "catchall" for all sort of weird
and corner-cases configurations, but thinking more about it, I cannot think of
any situation that would make this blow up.

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/memory_hotplug.c | 34 +++++++---------------------------
>  1 file changed, 7 insertions(+), 27 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index f294918f7211..8dafa1ba8d9f 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>  		if (pfn) {
>  			zone->zone_start_pfn = pfn;
>  			zone->spanned_pages = zone_end_pfn - pfn;
> +		} else {
> +			zone->zone_start_pfn = 0;
> +			zone->spanned_pages = 0;
>  		}
>  	} else if (zone_end_pfn == end_pfn) {
>  		/*
> @@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>  					       start_pfn);
>  		if (pfn)
>  			zone->spanned_pages = pfn - zone_start_pfn + 1;
> +		else {
> +			zone->zone_start_pfn = 0;
> +			zone->spanned_pages = 0;
> +		}
>  	}
> -
> -	/*
> -	 * The section is not biggest or smallest mem_section in the zone, it
> -	 * only creates a hole in the zone. So in this case, we need not
> -	 * change the zone. But perhaps, the zone has only hole data. Thus
> -	 * it check the zone has only hole or not.
> -	 */
> -	pfn = zone_start_pfn;
> -	for (; pfn < zone_end_pfn; pfn += PAGES_PER_SUBSECTION) {
> -		if (unlikely(!pfn_to_online_page(pfn)))
> -			continue;
> -
> -		if (page_zone(pfn_to_page(pfn)) != zone)
> -			continue;
> -
> -		/* Skip range to be removed */
> -		if (pfn >= start_pfn && pfn < end_pfn)
> -			continue;
> -
> -		/* If we find valid section, we have nothing to do */
> -		zone_span_writeunlock(zone);
> -		return;
> -	}
> -
> -	/* The zone has no valid section */
> -	zone->zone_start_pfn = 0;
> -	zone->spanned_pages = 0;
>  	zone_span_writeunlock(zone);
>  }
>  
> -- 
> 2.21.0
> 

-- 
Oscar Salvador
SUSE L3
