Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB43D5E19
	for <lists+linux-sh@lfdr.de>; Mon, 14 Oct 2019 11:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730656AbfJNJGA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 14 Oct 2019 05:06:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45300 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730605AbfJNJGA (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 14 Oct 2019 05:06:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 962863082E42;
        Mon, 14 Oct 2019 09:05:59 +0000 (UTC)
Received: from [10.36.117.10] (ovpn-117-10.ams2.redhat.com [10.36.117.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C47860BE2;
        Mon, 14 Oct 2019 09:05:55 +0000 (UTC)
Subject: Re: [PATCH v6 01/10] mm/memunmap: Don't access uninitialized memmap
 in memunmap_pages()
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Logan Gunthorpe <logang@deltatee.com>,
        Ira Weiny <ira.weiny@intel.com>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-2-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c528655a-7050-506b-c9bb-632dfde6c209@redhat.com>
Date:   Mon, 14 Oct 2019 11:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191006085646.5768-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 14 Oct 2019 09:06:00 +0000 (UTC)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 06.10.19 10:56, David Hildenbrand wrote:
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> 
> With an altmap, the memmap falling into the reserved altmap space are
> not initialized and, therefore, contain a garbage NID and a garbage
> zone. Make sure to read the NID/zone from a memmap that was initialzed.
> 
> This fixes a kernel crash that is observed when destroying a namespace:
> 
> [   81.356173] kernel BUG at include/linux/mm.h:1107!
> cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
>      pc: c0000000004b9728: memunmap_pages+0x238/0x340
>      lr: c0000000004b9724: memunmap_pages+0x234/0x340
> ...
>      pid   = 3669, comm = ndctl
> kernel BUG at include/linux/mm.h:1107!
> [c000000274087ba0] c0000000009e3500 devm_action_release+0x30/0x50
> [c000000274087bc0] c0000000009e4758 release_nodes+0x268/0x2d0
> [c000000274087c30] c0000000009dd144 device_release_driver_internal+0x174/0x240
> [c000000274087c70] c0000000009d9dfc unbind_store+0x13c/0x190
> [c000000274087cb0] c0000000009d8a24 drv_attr_store+0x44/0x60
> [c000000274087cd0] c0000000005a7470 sysfs_kf_write+0x70/0xa0
> [c000000274087d10] c0000000005a5cac kernfs_fop_write+0x1ac/0x290
> [c000000274087d60] c0000000004be45c __vfs_write+0x3c/0x70
> [c000000274087d80] c0000000004c26e4 vfs_write+0xe4/0x200
> [c000000274087dd0] c0000000004c2a6c ksys_write+0x7c/0x140
> [c000000274087e20] c00000000000bbd0 system_call+0x5c/0x68
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> [ minimze code changes, rephrase description ]
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/memremap.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 557e53c6fb46..8c2fb44c3b4d 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -123,6 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
>   void memunmap_pages(struct dev_pagemap *pgmap)
>   {
>   	struct resource *res = &pgmap->res;
> +	struct page *first_page;
>   	unsigned long pfn;
>   	int nid;
>   
> @@ -131,14 +132,16 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>   		put_page(pfn_to_page(pfn));
>   	dev_pagemap_cleanup(pgmap);
>   
> +	/* make sure to access a memmap that was actually initialized */
> +	first_page = pfn_to_page(pfn_first(pgmap));
> +
>   	/* pages are dead and unused, undo the arch mapping */
> -	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
> +	nid = page_to_nid(first_page);
>   
>   	mem_hotplug_begin();
>   	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
> -		pfn = PHYS_PFN(res->start);
> -		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
> -				 PHYS_PFN(resource_size(res)), NULL);
> +		__remove_pages(page_zone(first_page), PHYS_PFN(res->start),
> +			       PHYS_PFN(resource_size(res)), NULL);
>   	} else {
>   		arch_remove_memory(nid, res->start, resource_size(res),
>   				pgmap_altmap(pgmap));
> 

@Andrew, can you add

Fixes: 2c2a5af6fed2 ("mm, memory_hotplug: add nid parameter to 
arch_remove_memory")

(which basically introduced the nid = page_to_nid(first_page))

The "page_zone(pfn_to_page(pfn)" was introduced by 69324b8f4833 ("mm, 
devm_memremap_pages: add MEMORY_DEVICE_PRIVATE support"), however, I 
think we will never have driver reserved memory with 
MEMORY_DEVICE_PRIVATE (no altmap AFAIKS).

Also, I think

Cc: stable@vger.kernel.org # v5.0+

makes sense.

-- 

Thanks,

David / dhildenb
