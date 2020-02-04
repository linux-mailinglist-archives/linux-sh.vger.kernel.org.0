Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE0E1517C6
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 10:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgBDJ02 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 04:26:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:55308 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgBDJ02 (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 4 Feb 2020 04:26:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 195CDAC2C;
        Tue,  4 Feb 2020 09:26:25 +0000 (UTC)
Date:   Tue, 4 Feb 2020 10:26:23 +0100
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
Subject: Re: [PATCH v6 09/10] mm/memory_hotplug: Drop local variables in
 shrink_zone_span()
Message-ID: <20200204092623.GD6494@linux>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-10-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Oct 06, 2019 at 10:56:45AM +0200, David Hildenbrand wrote:
> Get rid of the unnecessary local variables.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory_hotplug.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 8dafa1ba8d9f..843481bd507d 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -374,14 +374,11 @@ static unsigned long find_biggest_section_pfn(int nid, struct zone *zone,
>  static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>  			     unsigned long end_pfn)
>  {
> -	unsigned long zone_start_pfn = zone->zone_start_pfn;
> -	unsigned long z = zone_end_pfn(zone); /* zone_end_pfn namespace clash */
> -	unsigned long zone_end_pfn = z;
>  	unsigned long pfn;
>  	int nid = zone_to_nid(zone);

We could also remove the nid, right?
AFAICS, the nid is only used in find_{smallest/biggest}_section_pfn so we could
place there as well.

Anyway, nothing to nit-pick about:

Reviewed-by: Oscar Salvador <osalvador@suse.de>

>  
>  	zone_span_writelock(zone);
> -	if (zone_start_pfn == start_pfn) {
> +	if (zone->zone_start_pfn == start_pfn) {
>  		/*
>  		 * If the section is smallest section in the zone, it need
>  		 * shrink zone->zone_start_pfn and zone->zone_spanned_pages.
> @@ -389,25 +386,25 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>  		 * for shrinking zone.
>  		 */
>  		pfn = find_smallest_section_pfn(nid, zone, end_pfn,
> -						zone_end_pfn);
> +						zone_end_pfn(zone));
>  		if (pfn) {
> +			zone->spanned_pages = zone_end_pfn(zone) - pfn;
>  			zone->zone_start_pfn = pfn;
> -			zone->spanned_pages = zone_end_pfn - pfn;
>  		} else {
>  			zone->zone_start_pfn = 0;
>  			zone->spanned_pages = 0;
>  		}
> -	} else if (zone_end_pfn == end_pfn) {
> +	} else if (zone_end_pfn(zone) == end_pfn) {
>  		/*
>  		 * If the section is biggest section in the zone, it need
>  		 * shrink zone->spanned_pages.
>  		 * In this case, we find second biggest valid mem_section for
>  		 * shrinking zone.
>  		 */
> -		pfn = find_biggest_section_pfn(nid, zone, zone_start_pfn,
> +		pfn = find_biggest_section_pfn(nid, zone, zone->zone_start_pfn,
>  					       start_pfn);
>  		if (pfn)
> -			zone->spanned_pages = pfn - zone_start_pfn + 1;
> +			zone->spanned_pages = pfn - zone->zone_start_pfn + 1;
>  		else {
>  			zone->zone_start_pfn = 0;
>  			zone->spanned_pages = 0;
> -- 
> 2.21.0
> 

-- 
Oscar Salvador
SUSE L3
