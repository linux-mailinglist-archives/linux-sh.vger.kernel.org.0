Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1403F5B5D3
	for <lists+linux-sh@lfdr.de>; Mon,  1 Jul 2019 09:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfGAHnI (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 1 Jul 2019 03:43:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:50338 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726036AbfGAHnI (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 1 Jul 2019 03:43:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C7434AFFA;
        Mon,  1 Jul 2019 07:43:06 +0000 (UTC)
Date:   Mon, 1 Jul 2019 09:43:06 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Oscar Salvador <osalvador@suse.com>
Subject: Re: [PATCH v3 02/11] s390x/mm: Fail when an altmap is used for
 arch_add_memory()
Message-ID: <20190701074306.GC6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-3-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon 27-05-19 13:11:43, David Hildenbrand wrote:
> ZONE_DEVICE is not yet supported, fail if an altmap is passed, so we
> don't forget arch_add_memory()/arch_remove_memory() when unlocking
> support.

Why do we need this? Sure ZONE_DEVICE is not supported for s390 and so
might be the case for other arches which support hotplug. I do not see
much point in adding warning to each of them.

> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/s390/mm/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 14d1eae9fe43..d552e330fbcc 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -226,6 +226,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	unsigned long size_pages = PFN_DOWN(size);
>  	int rc;
>  
> +	if (WARN_ON_ONCE(restrictions->altmap))
> +		return -EINVAL;
> +
>  	rc = vmem_add_mapping(start, size);
>  	if (rc)
>  		return rc;
> -- 
> 2.20.1
> 

-- 
Michal Hocko
SUSE Labs
