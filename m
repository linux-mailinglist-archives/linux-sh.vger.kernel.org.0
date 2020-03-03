Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795CB177316
	for <lists+linux-sh@lfdr.de>; Tue,  3 Mar 2020 10:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgCCJuh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 3 Mar 2020 04:50:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55635 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgCCJug (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 3 Mar 2020 04:50:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id 6so2320926wmi.5;
        Tue, 03 Mar 2020 01:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gN6xkBDxnfuze0g0pEotYsP0NnucUUMr4XIfi1Oy8Wk=;
        b=OXgxokB9yK1RcQ1f2PdZuQ5P3FcQIFsu61Sd8sxcX9v2pbA4PJDusZiewouh7eiGDm
         Z/pb4ey7/Ov7UnQcvaF8/5BVCMXyWMRXlDrLHN/Qi4XMTFE4AIK/sYxYO8JF3DUoodbY
         TDOuQzmXTqrVYpmQLQpQkleZNZIXXhg4YKYVj4afVzxm4SWNUCDJZelK3JxXGpPfjyI8
         UKjiQTNcjaDUyFxaxlVOdPxbcmjNufnobqR3IMVDHg+Hay5h/+/sqo++wbJzjX2HIZl1
         aI/22hz4qMLbYUXPJTNoUFvpUD7MI8FpD0YGRYH55Jbc/gXSMDRP5ZH0XCQlrV1YknRV
         UA/A==
X-Gm-Message-State: ANhLgQ1v8U2Caa+n+G+fU7sJFkxZ5GSawIBdlgzok+EbFM/wuxMY8Vi7
        ruXxnIqhNV0W0Fs0gG0lTtw=
X-Google-Smtp-Source: ADFU+vswAK2OmrLCkV6CaWZA8/Bb3zF3GN9Am30laiCBHy4k0h8NO05XmpdtouHwrxHDBBEXEarMeg==
X-Received: by 2002:a05:600c:20c6:: with SMTP id y6mr3510617wmm.95.1583229033340;
        Tue, 03 Mar 2020 01:50:33 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id o9sm34194646wrw.20.2020.03.03.01.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 01:50:32 -0800 (PST)
Date:   Tue, 3 Mar 2020 10:50:32 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        Dan Williams <dan.j.williams@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Badger <ebadger@gigaio.com>
Subject: Re: [PATCH v3 2/7] mm/memory_hotplug: Rename mhp_restrictions to
 mhp_params
Message-ID: <20200303095032.GF4380@dhcp22.suse.cz>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-3-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221182503.28317-3-logang@deltatee.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri 21-02-20 11:24:58, Logan Gunthorpe wrote:
> The mhp_restrictions struct really doesn't specify anything resembling
> a restriction anymore so rename it to be mhp_params as it is a list
> of extended parameters.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  arch/arm64/mm/mmu.c            |  4 ++--
>  arch/ia64/mm/init.c            |  4 ++--
>  arch/powerpc/mm/mem.c          |  4 ++--
>  arch/s390/mm/init.c            |  6 +++---
>  arch/sh/mm/init.c              |  4 ++--
>  arch/x86/mm/init_32.c          |  4 ++--
>  arch/x86/mm/init_64.c          |  8 ++++----
>  include/linux/memory_hotplug.h | 16 ++++++++--------
>  mm/memory_hotplug.c            |  8 ++++----
>  mm/memremap.c                  |  8 ++++----
>  10 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 128f70852bf3..ee37bca8aba8 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1050,7 +1050,7 @@ int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	int flags = 0;
>  
> @@ -1063,7 +1063,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	memblock_clear_nomap(start, size);
>  
>  	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
> -			   restrictions);
> +			   params);
>  }
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index b01d68a2d5d9..97bbc23ea1e3 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -670,13 +670,13 @@ mem_init (void)
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  	int ret;
>  
> -	ret = __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
>  	if (ret)
>  		printk("%s: Problem encountered in __add_pages() as ret=%d\n",
>  		       __func__,  ret);
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ef7b1119b2e2..b4bece53bec0 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -128,7 +128,7 @@ static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
>  }
>  
>  int __ref arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +			  struct mhp_params *params)
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> @@ -144,7 +144,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>  		return -EFAULT;
>  	}
>  
> -	return __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	return __add_pages(nid, start_pfn, nr_pages, params);
>  }
>  
>  void __ref arch_remove_memory(int nid, u64 start, u64 size,
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index ac44bd76db4b..e9e4a7abd0cc 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -268,20 +268,20 @@ device_initcall(s390_cma_mem_init);
>  #endif /* CONFIG_CMA */
>  
>  int arch_add_memory(int nid, u64 start, u64 size,
> -		struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	unsigned long start_pfn = PFN_DOWN(start);
>  	unsigned long size_pages = PFN_DOWN(size);
>  	int rc;
>  
> -	if (WARN_ON_ONCE(restrictions->altmap))
> +	if (WARN_ON_ONCE(params->altmap))
>  		return -EINVAL;
>  
>  	rc = vmem_add_mapping(start, size);
>  	if (rc)
>  		return rc;
>  
> -	rc = __add_pages(nid, start_pfn, size_pages, restrictions);
> +	rc = __add_pages(nid, start_pfn, size_pages, params);
>  	if (rc)
>  		vmem_remove_mapping(start, size);
>  	return rc;
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index d1b1ff2be17a..e5114c053364 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -406,14 +406,14 @@ void __init mem_init(void)
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	unsigned long start_pfn = PFN_DOWN(start);
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  	int ret;
>  
>  	/* We only have ZONE_NORMAL, so this is easy.. */
> -	ret = __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
>  	if (unlikely(ret))
>  		printk("%s: Failed, __add_pages() == %d\n", __func__, ret);
>  
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 23df4885bbed..3ec3dac7c268 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -853,12 +853,12 @@ void __init mem_init(void)
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  
> -	return __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	return __add_pages(nid, start_pfn, nr_pages, params);
>  }
>  
>  void arch_remove_memory(int nid, u64 start, u64 size,
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index abbdecb75fad..87977a8bfbbf 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -844,11 +844,11 @@ static void update_end_of_memory_vars(u64 start, u64 size)
>  }
>  
>  int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> -				struct mhp_restrictions *restrictions)
> +	      struct mhp_params *params)
>  {
>  	int ret;
>  
> -	ret = __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
>  	WARN_ON_ONCE(ret);
>  
>  	/* update max_pfn, max_low_pfn and high_memory */
> @@ -859,14 +859,14 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>  }
>  
>  int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions)
> +		    struct mhp_params *params)
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  
>  	init_memory_mapping(start, start + size);
>  
> -	return add_pages(nid, start_pfn, nr_pages, restrictions);
> +	return add_pages(nid, start_pfn, nr_pages, params);
>  }
>  
>  #define PAGE_INUSE 0xFD
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 69ff3037528d..c5df1b3dada0 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -54,10 +54,10 @@ enum {
>  };
>  
>  /*
> - * Restrictions for the memory hotplug:
> - * altmap: alternative allocator for memmap array
> + * Extended parameters for memory hotplug:
> + * altmap: alternative allocator for memmap array (optional)
>   */
> -struct mhp_restrictions {
> +struct mhp_params {
>  	struct vmem_altmap *altmap;
>  };
>  
> @@ -108,7 +108,7 @@ extern int restore_online_page_callback(online_page_callback_t callback);
>  extern int try_online_node(int nid);
>  
>  extern int arch_add_memory(int nid, u64 start, u64 size,
> -			struct mhp_restrictions *restrictions);
> +			   struct mhp_params *params);
>  extern u64 max_mem_size;
>  
>  extern bool memhp_auto_online;
> @@ -126,17 +126,17 @@ extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
>  
>  /* reasonably generic interface to expand the physical pages */
>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> -		       struct mhp_restrictions *restrictions);
> +		       struct mhp_params *params);
>  
>  #ifndef CONFIG_ARCH_HAS_ADD_PAGES
>  static inline int add_pages(int nid, unsigned long start_pfn,
> -		unsigned long nr_pages, struct mhp_restrictions *restrictions)
> +		unsigned long nr_pages, struct mhp_params *params)
>  {
> -	return __add_pages(nid, start_pfn, nr_pages, restrictions);
> +	return __add_pages(nid, start_pfn, nr_pages, params);
>  }
>  #else /* ARCH_HAS_ADD_PAGES */
>  int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> -	      struct mhp_restrictions *restrictions);
> +	      struct mhp_params *params);
>  #endif /* ARCH_HAS_ADD_PAGES */
>  
>  #ifdef CONFIG_NUMA
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0a54ffac8c68..c69469e1b40e 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -299,11 +299,11 @@ static int check_hotplug_memory_addressable(unsigned long pfn,
>   * add the new pages.
>   */
>  int __ref __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
> -		struct mhp_restrictions *restrictions)
> +		      struct mhp_params *params)
>  {
>  	int err;
>  	unsigned long nr, start_sec, end_sec;
> -	struct vmem_altmap *altmap = restrictions->altmap;
> +	struct vmem_altmap *altmap = params->altmap;
>  
>  	err = check_hotplug_memory_addressable(pfn, nr_pages);
>  	if (err)
> @@ -993,7 +993,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>   */
>  int __ref add_memory_resource(int nid, struct resource *res)
>  {
> -	struct mhp_restrictions restrictions = {};
> +	struct mhp_params params = {};
>  	u64 start, size;
>  	bool new_node = false;
>  	int ret;
> @@ -1021,7 +1021,7 @@ int __ref add_memory_resource(int nid, struct resource *res)
>  	new_node = ret;
>  
>  	/* call arch's memory hotadd */
> -	ret = arch_add_memory(nid, start, size, &restrictions);
> +	ret = arch_add_memory(nid, start, size, &params);
>  	if (ret < 0)
>  		goto error;
>  
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 09b5b7adc773..6891a503a078 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -161,7 +161,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  {
>  	struct resource *res = &pgmap->res;
>  	struct dev_pagemap *conflict_pgmap;
> -	struct mhp_restrictions restrictions = {
> +	struct mhp_params params = {
>  		/*
>  		 * We do not want any optional features only our own memmap
>  		 */
> @@ -275,7 +275,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  	 */
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>  		error = add_pages(nid, PHYS_PFN(res->start),
> -				PHYS_PFN(resource_size(res)), &restrictions);
> +				PHYS_PFN(resource_size(res)), &params);
>  	} else {
>  		error = kasan_add_zero_shadow(__va(res->start), resource_size(res));
>  		if (error) {
> @@ -284,7 +284,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  		}
>  
>  		error = arch_add_memory(nid, res->start, resource_size(res),
> -					&restrictions);
> +					&params);
>  	}
>  
>  	if (!error) {
> @@ -292,7 +292,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  
>  		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
>  		move_pfn_range_to_zone(zone, PHYS_PFN(res->start),
> -				PHYS_PFN(resource_size(res)), restrictions.altmap);
> +				PHYS_PFN(resource_size(res)), params.altmap);
>  	}
>  
>  	mem_hotplug_done();
> -- 
> 2.20.1

-- 
Michal Hocko
SUSE Labs
