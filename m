Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C833A4A8B
	for <lists+linux-sh@lfdr.de>; Fri, 11 Jun 2021 23:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhFKVLm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 11 Jun 2021 17:11:42 -0400
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21111 "EHLO
        sender4-of-o51.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhFKVLk (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 11 Jun 2021 17:11:40 -0400
X-Greylist: delayed 912 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Jun 2021 17:11:40 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1623444841; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=ce8iv3uhoTvb6Q4mp8yAk9ByyP/ztKIi+7b/No/F5R6a8XX6yJLnV1YBkzoUycc7oJWju88UBVC3K0dYBDgPLkQtt0DqzEImhEj/R5z+8wdFbqcETjVaY1Shy9z1laYIr40k6r0T2XaSSC8qDpPn1DMwqrGJiCbn6XQyLCJBeLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1623444841; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=AoiLwcmX3pbOV819C0Lo7M/WNWjoO/Lazqk1NS5j5f4=; 
        b=igDgmnMQYOE7OMpajT0d6+VpAk0is3qy1yDPiJ6VaI0g32XYdTLBW4vA2wzLDN0Fr5buSCoBFXJjIDMefERXTBCLx5jD9staWgrZl3S5UIB585+PiTcqJ+66g0aEakFC3AyMhBFBY43YTO9Kxx5kTUKFCto0CGA49vG6REfmPSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623444841;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
        bh=AoiLwcmX3pbOV819C0Lo7M/WNWjoO/Lazqk1NS5j5f4=;
        b=VUodxOwwNi8y2ZV9XwmfH/FLB5Dutdvekx3lJ+cc3zMogLBOrgoxpvh0Fn5PgteO
        DV4rTlIi8PRtIixHgmUQjDjasTJjwPojeggLpOcOcHRdHq3s5PanSnlFopFMJy1H+Ge
        RNuP8guFfEoTAR0L3QQgAj8N+d01mwEstQBT16Qc=
Received: from localhost (148.87.23.10 [148.87.23.10]) by mx.zohomail.com
        with SMTPS id 1623444832045346.08477193904275; Fri, 11 Jun 2021 13:53:52 -0700 (PDT)
From:   Stephen Brennan <stephen@brennan.io>
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 5/9] mm: remove CONFIG_DISCONTIGMEM
In-Reply-To: <20210608091316.3622-6-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
 <20210608091316.3622-6-rppt@kernel.org>
Date:   Fri, 11 Jun 2021 13:53:48 -0700
Message-ID: <87r1h886n7.fsf@stepbren-lnx.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Mike Rapoport <rppt@kernel.org> writes:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> There are no architectures that support DISCONTIGMEM left.
>
> Remove the configuration option and the dead code it was guarding in the
> generic memory management code.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  include/asm-generic/memory_model.h | 37 ++++--------------------------
>  include/linux/mmzone.h             |  8 ++++---
>  mm/Kconfig                         | 25 +++-----------------
>  mm/page_alloc.c                    | 13 -----------
>  4 files changed, 12 insertions(+), 71 deletions(-)
>
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index 7637fb46ba4f..a2c8ed60233a 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -6,47 +6,18 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/*
> + * supports 3 memory models.
> + */

This comment could either be updated to reflect 2 memory models, or
removed entirely.

Thanks,
Stephen

>  #if defined(CONFIG_FLATMEM)
>  
>  #ifndef ARCH_PFN_OFFSET
>  #define ARCH_PFN_OFFSET		(0UL)
>  #endif
>  
> -#elif defined(CONFIG_DISCONTIGMEM)
> -
> -#ifndef arch_pfn_to_nid
> -#define arch_pfn_to_nid(pfn)	pfn_to_nid(pfn)
> -#endif
> -
> -#ifndef arch_local_page_offset
> -#define arch_local_page_offset(pfn, nid)	\
> -	((pfn) - NODE_DATA(nid)->node_start_pfn)
> -#endif
> -
> -#endif /* CONFIG_DISCONTIGMEM */
> -
> -/*
> - * supports 3 memory models.
> - */
> -#if defined(CONFIG_FLATMEM)
> -
>  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
>  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
>  				 ARCH_PFN_OFFSET)
> -#elif defined(CONFIG_DISCONTIGMEM)
> -
> -#define __pfn_to_page(pfn)			\
> -({	unsigned long __pfn = (pfn);		\
> -	unsigned long __nid = arch_pfn_to_nid(__pfn);  \
> -	NODE_DATA(__nid)->node_mem_map + arch_local_page_offset(__pfn, __nid);\
> -})
> -
> -#define __page_to_pfn(pg)						\
> -({	const struct page *__pg = (pg);					\
> -	struct pglist_data *__pgdat = NODE_DATA(page_to_nid(__pg));	\
> -	(unsigned long)(__pg - __pgdat->node_mem_map) +			\
> -	 __pgdat->node_start_pfn;					\
> -})
>  
>  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>  
> @@ -70,7 +41,7 @@
>  	struct mem_section *__sec = __pfn_to_section(__pfn);	\
>  	__section_mem_map_addr(__sec) + __pfn;		\
>  })
> -#endif /* CONFIG_FLATMEM/DISCONTIGMEM/SPARSEMEM */
> +#endif /* CONFIG_FLATMEM/SPARSEMEM */
>  
>  /*
>   * Convert a physical address to a Page Frame Number and back
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 0d53eba1c383..700032e99419 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -738,10 +738,12 @@ struct zonelist {
>  	struct zoneref _zonerefs[MAX_ZONES_PER_ZONELIST + 1];
>  };
>  
> -#ifndef CONFIG_DISCONTIGMEM
> -/* The array of struct pages - for discontigmem use pgdat->lmem_map */
> +/*
> + * The array of struct pages for flatmem.
> + * It must be declared for SPARSEMEM as well because there are configurations
> + * that rely on that.
> + */
>  extern struct page *mem_map;
> -#endif
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  struct deferred_split {
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 02d44e3420f5..218b96ccc84a 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -19,7 +19,7 @@ choice
>  
>  config FLATMEM_MANUAL
>  	bool "Flat Memory"
> -	depends on !(ARCH_DISCONTIGMEM_ENABLE || ARCH_SPARSEMEM_ENABLE) || ARCH_FLATMEM_ENABLE
> +	depends on !ARCH_SPARSEMEM_ENABLE || ARCH_FLATMEM_ENABLE
>  	help
>  	  This option is best suited for non-NUMA systems with
>  	  flat address space. The FLATMEM is the most efficient
> @@ -32,21 +32,6 @@ config FLATMEM_MANUAL
>  
>  	  If unsure, choose this option (Flat Memory) over any other.
>  
> -config DISCONTIGMEM_MANUAL
> -	bool "Discontiguous Memory"
> -	depends on ARCH_DISCONTIGMEM_ENABLE
> -	help
> -	  This option provides enhanced support for discontiguous
> -	  memory systems, over FLATMEM.  These systems have holes
> -	  in their physical address spaces, and this option provides
> -	  more efficient handling of these holes.
> -
> -	  Although "Discontiguous Memory" is still used by several
> -	  architectures, it is considered deprecated in favor of
> -	  "Sparse Memory".
> -
> -	  If unsure, choose "Sparse Memory" over this option.
> -
>  config SPARSEMEM_MANUAL
>  	bool "Sparse Memory"
>  	depends on ARCH_SPARSEMEM_ENABLE
> @@ -62,17 +47,13 @@ config SPARSEMEM_MANUAL
>  
>  endchoice
>  
> -config DISCONTIGMEM
> -	def_bool y
> -	depends on (!SELECT_MEMORY_MODEL && ARCH_DISCONTIGMEM_ENABLE) || DISCONTIGMEM_MANUAL
> -
>  config SPARSEMEM
>  	def_bool y
>  	depends on (!SELECT_MEMORY_MODEL && ARCH_SPARSEMEM_ENABLE) || SPARSEMEM_MANUAL
>  
>  config FLATMEM
>  	def_bool y
> -	depends on (!DISCONTIGMEM && !SPARSEMEM) || FLATMEM_MANUAL
> +	depends on !SPARSEMEM || FLATMEM_MANUAL
>  
>  config FLAT_NODE_MEM_MAP
>  	def_bool y
> @@ -85,7 +66,7 @@ config FLAT_NODE_MEM_MAP
>  #
>  config NEED_MULTIPLE_NODES
>  	def_bool y
> -	depends on DISCONTIGMEM || NUMA
> +	depends on NUMA
>  
>  #
>  # SPARSEMEM_EXTREME (which is the default) does some bootmem
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index aaa1655cf682..6fc22482eaa8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -331,20 +331,7 @@ compound_page_dtor * const compound_page_dtors[NR_COMPOUND_DTORS] = {
>  
>  int min_free_kbytes = 1024;
>  int user_min_free_kbytes = -1;
> -#ifdef CONFIG_DISCONTIGMEM
> -/*
> - * DiscontigMem defines memory ranges as separate pg_data_t even if the ranges
> - * are not on separate NUMA nodes. Functionally this works but with
> - * watermark_boost_factor, it can reclaim prematurely as the ranges can be
> - * quite small. By default, do not boost watermarks on discontigmem as in
> - * many cases very high-order allocations like THP are likely to be
> - * unsupported and the premature reclaim offsets the advantage of long-term
> - * fragmentation avoidance.
> - */
> -int watermark_boost_factor __read_mostly;
> -#else
>  int watermark_boost_factor __read_mostly = 15000;
> -#endif
>  int watermark_scale_factor = 10;
>  
>  static unsigned long nr_kernel_pages __initdata;
> -- 
> 2.28.0
