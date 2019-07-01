Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E95A5B72E
	for <lists+linux-sh@lfdr.de>; Mon,  1 Jul 2019 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfGAIvs (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 1 Jul 2019 04:51:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:41720 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbfGAIvs (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 1 Jul 2019 04:51:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6455EAD23;
        Mon,  1 Jul 2019 08:51:45 +0000 (UTC)
Date:   Mon, 1 Jul 2019 10:51:44 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Oscar Salvador <osalvador@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 10/11] mm/memory_hotplug: Make
 unregister_memory_block_under_nodes() never fail
Message-ID: <20190701085144.GJ6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-11-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon 27-05-19 13:11:51, David Hildenbrand wrote:
> We really don't want anything during memory hotunplug to fail.
> We always pass a valid memory block device, that check can go. Avoid
> allocating memory and eventually failing. As we are always called under
> lock, we can use a static piece of memory. This avoids having to put
> the structure onto the stack, having to guess about the stack size
> of callers.
> 
> Patch inspired by a patch from Oscar Salvador.
> 
> In the future, there might be no need to iterate over nodes at all.
> mem->nid should tell us exactly what to remove. Memory block devices
> with mixed nodes (added during boot) should properly fenced off and never
> removed.

Yeah, we do not allow to offline multi zone (node) ranges so the current
code seems to be over engineered.

Anyway, I am wondering why do we have to strictly check for already
removed nodes links. Is the sysfs code going to complain we we try to
remove again?
 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Anyway
Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  drivers/base/node.c  | 18 +++++-------------
>  include/linux/node.h |  5 ++---
>  2 files changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 04fdfa99b8bc..9be88fd05147 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -803,20 +803,14 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
>  
>  /*
>   * Unregister memory block device under all nodes that it spans.
> + * Has to be called with mem_sysfs_mutex held (due to unlinked_nodes).
>   */
> -int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> +void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  {
> -	NODEMASK_ALLOC(nodemask_t, unlinked_nodes, GFP_KERNEL);
>  	unsigned long pfn, sect_start_pfn, sect_end_pfn;
> +	static nodemask_t unlinked_nodes;
>  
> -	if (!mem_blk) {
> -		NODEMASK_FREE(unlinked_nodes);
> -		return -EFAULT;
> -	}
> -	if (!unlinked_nodes)
> -		return -ENOMEM;
> -	nodes_clear(*unlinked_nodes);
> -
> +	nodes_clear(unlinked_nodes);
>  	sect_start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
>  	sect_end_pfn = section_nr_to_pfn(mem_blk->end_section_nr);
>  	for (pfn = sect_start_pfn; pfn <= sect_end_pfn; pfn++) {
> @@ -827,15 +821,13 @@ int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  			continue;
>  		if (!node_online(nid))
>  			continue;
> -		if (node_test_and_set(nid, *unlinked_nodes))
> +		if (node_test_and_set(nid, unlinked_nodes))
>  			continue;
>  		sysfs_remove_link(&node_devices[nid]->dev.kobj,
>  			 kobject_name(&mem_blk->dev.kobj));
>  		sysfs_remove_link(&mem_blk->dev.kobj,
>  			 kobject_name(&node_devices[nid]->dev.kobj));
>  	}
> -	NODEMASK_FREE(unlinked_nodes);
> -	return 0;
>  }
>  
>  int link_mem_sections(int nid, unsigned long start_pfn, unsigned long end_pfn)
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 02a29e71b175..548c226966a2 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -139,7 +139,7 @@ extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
>  extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
>  extern int register_mem_sect_under_node(struct memory_block *mem_blk,
>  						void *arg);
> -extern int unregister_memory_block_under_nodes(struct memory_block *mem_blk);
> +extern void unregister_memory_block_under_nodes(struct memory_block *mem_blk);
>  
>  extern int register_memory_node_under_compute_node(unsigned int mem_nid,
>  						   unsigned int cpu_nid,
> @@ -175,9 +175,8 @@ static inline int register_mem_sect_under_node(struct memory_block *mem_blk,
>  {
>  	return 0;
>  }
> -static inline int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> +static inline void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  {
> -	return 0;
>  }
>  
>  static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
> -- 
> 2.20.1

-- 
Michal Hocko
SUSE Labs
