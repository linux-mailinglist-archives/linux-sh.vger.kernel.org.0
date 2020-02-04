Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B56151C25
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 15:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgBDOZb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 09:25:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21070 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727316AbgBDOZa (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Feb 2020 09:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580826329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ut05QA9J5WKSRE8iQ2AH3oPYzXnHzXfW9BoUs/aT13g=;
        b=Gi6TRcavw2Fg1v0Dl9ywaBbmd6j0lZ/sEAG+gdvUEfxI8ic60fV6znpt6pPAnSkQBuheB+
        z0fCyUpEFrRlvPM75XUlCPpZLvLXzSxidhqIzHsGCB0c9uE34p6ZpA0jcNh5TTdwKFq8f0
        47GlQzt5xLn4UnZ29f7pR/P6lwX6/ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-0pa_ZXTfPAGteHs5vWnWkg-1; Tue, 04 Feb 2020 09:25:25 -0500
X-MC-Unique: 0pa_ZXTfPAGteHs5vWnWkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08C18010E6;
        Tue,  4 Feb 2020 14:25:22 +0000 (UTC)
Received: from localhost (ovpn-13-129.pek2.redhat.com [10.72.13.129])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC6085785;
        Tue,  4 Feb 2020 14:25:19 +0000 (UTC)
Date:   Tue, 4 Feb 2020 22:25:16 +0800
From:   Baoquan He <bhe@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200204142516.GD26758@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-9-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 10/06/19 at 10:56am, David Hildenbrand wrote:
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

Thinking in which case (zone_start_pfn != start_pfn) and it comes here.

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
> 

