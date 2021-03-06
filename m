Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A7A3C673B
	for <lists+linux-sh@lfdr.de>; Tue, 13 Jul 2021 01:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbhGLX7I (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 12 Jul 2021 19:59:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:3170 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232562AbhGLX7D (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 12 Jul 2021 19:59:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="231868182"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="231868182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 16:56:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="429846783"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 16:56:11 -0700
Date:   Mon, 12 Jul 2021 16:56:11 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/6] mm: remove flush_kernel_dcache_page
Message-ID: <20210712235611.GC3169279@iweiny-DESK2.sc.intel.com>
References: <20210712060928.4161649-1-hch@lst.de>
 <20210712060928.4161649-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210712060928.4161649-7-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 12, 2021 at 08:09:28AM +0200, Christoph Hellwig wrote:
> flush_kernel_dcache_page is a rather confusing interface that implements
> a subset of flush_dcache_page by not being able to properly handle page
> cache mapped pages.
> 
> The only callers left are in the exec code as all other previous callers
> were incorrect as they could have dealt with page cache pages.  Replace
> the calls to flush_kernel_dcache_page with calls to
> flush_kernel_dcache_page, which for all architectures does either
  ^^^^^^^^^^^^^^^^^^^^^^^^
  flush_dcache_page


Other than that, for the series:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> exactly the same thing, can contains one or more of the following:
> 
>  1) an optimization to defer the cache flush for page cache pages not
>     mapped into userspace
>  2) additional flushing for mapped page cache pages if cache aliases
>     are possible
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/core-api/cachetlb.rst           | 86 ++++++++-----------
>  .../translations/zh_CN/core-api/cachetlb.rst  |  9 --
>  arch/arm/include/asm/cacheflush.h             |  4 +-
>  arch/arm/mm/flush.c                           | 33 -------
>  arch/arm/mm/nommu.c                           |  6 --
>  arch/csky/abiv1/cacheflush.c                  | 11 ---
>  arch/csky/abiv1/inc/abi/cacheflush.h          |  4 +-
>  arch/mips/include/asm/cacheflush.h            |  8 +-
>  arch/nds32/include/asm/cacheflush.h           |  3 +-
>  arch/nds32/mm/cacheflush.c                    |  9 --
>  arch/parisc/include/asm/cacheflush.h          |  8 +-
>  arch/parisc/kernel/cache.c                    |  3 +-
>  arch/sh/include/asm/cacheflush.h              |  8 +-
>  block/blk-map.c                               |  2 +-
>  fs/exec.c                                     |  6 +-
>  include/linux/highmem.h                       |  5 +-
>  tools/testing/scatterlist/linux/mm.h          |  1 -
>  17 files changed, 51 insertions(+), 155 deletions(-)
> 
> diff --git a/Documentation/core-api/cachetlb.rst b/Documentation/core-api/cachetlb.rst
> index fe4290e26729..8aed9103e48a 100644
> --- a/Documentation/core-api/cachetlb.rst
> +++ b/Documentation/core-api/cachetlb.rst
> @@ -271,10 +271,15 @@ maps this page at its virtual address.
>  
>    ``void flush_dcache_page(struct page *page)``
>  
> -	Any time the kernel writes to a page cache page, _OR_
> -	the kernel is about to read from a page cache page and
> -	user space shared/writable mappings of this page potentially
> -	exist, this routine is called.
> +        This routines must be called when:
> +
> +	  a) the kernel did write to a page that is in the page cache page
> +	     and / or in high memory
> +	  b) the kernel is about to read from a page cache page and user space
> +	     shared/writable mappings of this page potentially exist.  Note
> +	     that {get,pin}_user_pages{_fast} already call flush_dcache_page
> +	     on any page found in the user address space and thus driver
> +	     code rarely needs to take this into account.
>  
>  	.. note::
>  
> @@ -284,38 +289,34 @@ maps this page at its virtual address.
>  	      handling vfs symlinks in the page cache need not call
>  	      this interface at all.
>  
> -	The phrase "kernel writes to a page cache page" means,
> -	specifically, that the kernel executes store instructions
> -	that dirty data in that page at the page->virtual mapping
> -	of that page.  It is important to flush here to handle
> -	D-cache aliasing, to make sure these kernel stores are
> -	visible to user space mappings of that page.
> -
> -	The corollary case is just as important, if there are users
> -	which have shared+writable mappings of this file, we must make
> -	sure that kernel reads of these pages will see the most recent
> -	stores done by the user.
> -
> -	If D-cache aliasing is not an issue, this routine may
> -	simply be defined as a nop on that architecture.
> -
> -        There is a bit set aside in page->flags (PG_arch_1) as
> -	"architecture private".  The kernel guarantees that,
> -	for pagecache pages, it will clear this bit when such
> -	a page first enters the pagecache.
> -
> -	This allows these interfaces to be implemented much more
> -	efficiently.  It allows one to "defer" (perhaps indefinitely)
> -	the actual flush if there are currently no user processes
> -	mapping this page.  See sparc64's flush_dcache_page and
> -	update_mmu_cache implementations for an example of how to go
> -	about doing this.
> -
> -	The idea is, first at flush_dcache_page() time, if
> -	page->mapping->i_mmap is an empty tree, just mark the architecture
> -	private page flag bit.  Later, in update_mmu_cache(), a check is
> -	made of this flag bit, and if set the flush is done and the flag
> -	bit is cleared.
> +	The phrase "kernel writes to a page cache page" means, specifically,
> +	that the kernel executes store instructions that dirty data in that
> +	page at the page->virtual mapping of that page.  It is important to
> +	flush here to handle D-cache aliasing, to make sure these kernel stores
> +	are visible to user space mappings of that page.
> +
> +	The corollary case is just as important, if there are users which have
> +	shared+writable mappings of this file, we must make sure that kernel
> +	reads of these pages will see the most recent stores done by the user.
> +
> +	If D-cache aliasing is not an issue, this routine may simply be defined
> +	as a nop on that architecture.
> +
> +        There is a bit set aside in page->flags (PG_arch_1) as "architecture
> +	private".  The kernel guarantees that, for pagecache pages, it will
> +	clear this bit when such a page first enters the pagecache.
> +
> +	This allows these interfaces to be implemented much more efficiently.
> +	It allows one to "defer" (perhaps indefinitely) the actual flush if
> +	there are currently no user processes mapping this page.  See sparc64's
> +	flush_dcache_page and update_mmu_cache implementations for an example
> +	of how to go about doing this.
> +
> +	The idea is, first at flush_dcache_page() time, if page_file_mapping()
> +	returns a mapping, and mapping_mapped on that mapping returns %false,
> +	just mark the architecture private page flag bit.  Later, in
> +	update_mmu_cache(), a check is made of this flag bit, and if set the
> +	flush is done and the flag bit is cleared.
>  
>  	.. important::
>  
> @@ -351,19 +352,6 @@ maps this page at its virtual address.
>  	architectures).  For incoherent architectures, it should flush
>  	the cache of the page at vmaddr.
>  
> -  ``void flush_kernel_dcache_page(struct page *page)``
> -
> -	When the kernel needs to modify a user page is has obtained
> -	with kmap, it calls this function after all modifications are
> -	complete (but before kunmapping it) to bring the underlying
> -	page up to date.  It is assumed here that the user has no
> -	incoherent cached copies (i.e. the original page was obtained
> -	from a mechanism like get_user_pages()).  The default
> -	implementation is a nop and should remain so on all coherent
> -	architectures.  On incoherent architectures, this should flush
> -	the kernel cache for page (using page_address(page)).
> -
> -
>    ``void flush_icache_range(unsigned long start, unsigned long end)``
>  
>    	When the kernel stores into addresses that it will execute
> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> index 8376485a534d..55827b8a7c53 100644
> --- a/Documentation/translations/zh_CN/core-api/cachetlb.rst
> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> @@ -298,15 +298,6 @@ HyperSparc cpu就是这样一个具有这种属性的cpu。
>  	用。默认的实现是nop（对于所有相干的架构应该保持这样）。对于不一致性
>  	的架构，它应该刷新vmaddr处的页面缓存。
>  
> -  ``void flush_kernel_dcache_page(struct page *page)``
> -
> -	当内核需要修改一个用kmap获得的用户页时，它会在所有修改完成后（但在
> -	kunmapping之前）调用这个函数，以使底层页面达到最新状态。这里假定用
> -	户没有不一致性的缓存副本（即原始页面是从类似get_user_pages()的机制
> -	中获得的）。默认的实现是一个nop，在所有相干的架构上都应该如此。在不
> -	一致性的架构上，这应该刷新内核缓存中的页面（使用page_address(page)）。
> -
> -
>    ``void flush_icache_range(unsigned long start, unsigned long end)``
>  
>  	当内核存储到它将执行的地址中时（例如在加载模块时），这个函数被调用。
> diff --git a/arch/arm/include/asm/cacheflush.h b/arch/arm/include/asm/cacheflush.h
> index 2e24e765e6d3..5e56288e343b 100644
> --- a/arch/arm/include/asm/cacheflush.h
> +++ b/arch/arm/include/asm/cacheflush.h
> @@ -291,6 +291,7 @@ extern void flush_cache_page(struct vm_area_struct *vma, unsigned long user_addr
>  #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>  extern void flush_dcache_page(struct page *);
>  
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  static inline void flush_kernel_vmap_range(void *addr, int size)
>  {
>  	if ((cache_is_vivt() || cache_is_vipt_aliasing()))
> @@ -312,9 +313,6 @@ static inline void flush_anon_page(struct vm_area_struct *vma,
>  		__flush_anon_page(vma, page, vmaddr);
>  }
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -extern void flush_kernel_dcache_page(struct page *);
> -
>  #define flush_dcache_mmap_lock(mapping)		xa_lock_irq(&mapping->i_pages)
>  #define flush_dcache_mmap_unlock(mapping)	xa_unlock_irq(&mapping->i_pages)
>  
> diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
> index 6d89db7895d1..7ff9feea13a6 100644
> --- a/arch/arm/mm/flush.c
> +++ b/arch/arm/mm/flush.c
> @@ -345,39 +345,6 @@ void flush_dcache_page(struct page *page)
>  }
>  EXPORT_SYMBOL(flush_dcache_page);
>  
> -/*
> - * Ensure cache coherency for the kernel mapping of this page. We can
> - * assume that the page is pinned via kmap.
> - *
> - * If the page only exists in the page cache and there are no user
> - * space mappings, this is a no-op since the page was already marked
> - * dirty at creation.  Otherwise, we need to flush the dirty kernel
> - * cache lines directly.
> - */
> -void flush_kernel_dcache_page(struct page *page)
> -{
> -	if (cache_is_vivt() || cache_is_vipt_aliasing()) {
> -		struct address_space *mapping;
> -
> -		mapping = page_mapping_file(page);
> -
> -		if (!mapping || mapping_mapped(mapping)) {
> -			void *addr;
> -
> -			addr = page_address(page);
> -			/*
> -			 * kmap_atomic() doesn't set the page virtual
> -			 * address for highmem pages, and
> -			 * kunmap_atomic() takes care of cache
> -			 * flushing already.
> -			 */
> -			if (!IS_ENABLED(CONFIG_HIGHMEM) || addr)
> -				__cpuc_flush_dcache_area(addr, PAGE_SIZE);
> -		}
> -	}
> -}
> -EXPORT_SYMBOL(flush_kernel_dcache_page);
> -
>  /*
>   * Flush an anonymous page so that users of get_user_pages()
>   * can safely access the data.  The expected sequence is:
> diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
> index 8b3d7191e2b8..2658f52903da 100644
> --- a/arch/arm/mm/nommu.c
> +++ b/arch/arm/mm/nommu.c
> @@ -166,12 +166,6 @@ void flush_dcache_page(struct page *page)
>  }
>  EXPORT_SYMBOL(flush_dcache_page);
>  
> -void flush_kernel_dcache_page(struct page *page)
> -{
> -	__cpuc_flush_dcache_area(page_address(page), PAGE_SIZE);
> -}
> -EXPORT_SYMBOL(flush_kernel_dcache_page);
> -
>  void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
>  		       unsigned long uaddr, void *dst, const void *src,
>  		       unsigned long len)
> diff --git a/arch/csky/abiv1/cacheflush.c b/arch/csky/abiv1/cacheflush.c
> index 07ff17ea33de..fb91b069dc69 100644
> --- a/arch/csky/abiv1/cacheflush.c
> +++ b/arch/csky/abiv1/cacheflush.c
> @@ -56,17 +56,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long addr,
>  	}
>  }
>  
> -void flush_kernel_dcache_page(struct page *page)
> -{
> -	struct address_space *mapping;
> -
> -	mapping = page_mapping_file(page);
> -
> -	if (!mapping || mapping_mapped(mapping))
> -		dcache_wbinv_all();
> -}
> -EXPORT_SYMBOL(flush_kernel_dcache_page);
> -
>  void flush_cache_range(struct vm_area_struct *vma, unsigned long start,
>  	unsigned long end)
>  {
> diff --git a/arch/csky/abiv1/inc/abi/cacheflush.h b/arch/csky/abiv1/inc/abi/cacheflush.h
> index 6cab7afae962..ed62e2066ba7 100644
> --- a/arch/csky/abiv1/inc/abi/cacheflush.h
> +++ b/arch/csky/abiv1/inc/abi/cacheflush.h
> @@ -14,12 +14,10 @@ extern void flush_dcache_page(struct page *);
>  #define flush_cache_page(vma, page, pfn)	cache_wbinv_all()
>  #define flush_cache_dup_mm(mm)			cache_wbinv_all()
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -extern void flush_kernel_dcache_page(struct page *);
> -
>  #define flush_dcache_mmap_lock(mapping)		xa_lock_irq(&mapping->i_pages)
>  #define flush_dcache_mmap_unlock(mapping)	xa_unlock_irq(&mapping->i_pages)
>  
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  static inline void flush_kernel_vmap_range(void *addr, int size)
>  {
>  	dcache_wbinv_all();
> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
> index d687b40b9fbb..b3dc9c589442 100644
> --- a/arch/mips/include/asm/cacheflush.h
> +++ b/arch/mips/include/asm/cacheflush.h
> @@ -125,13 +125,7 @@ static inline void kunmap_noncoherent(void)
>  	kunmap_coherent();
>  }
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -static inline void flush_kernel_dcache_page(struct page *page)
> -{
> -	BUG_ON(cpu_has_dc_aliases && PageHighMem(page));
> -	flush_dcache_page(page);
> -}
> -
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  /*
>   * For now flush_kernel_vmap_range and invalidate_kernel_vmap_range both do a
>   * cache writeback and invalidate operation.
> diff --git a/arch/nds32/include/asm/cacheflush.h b/arch/nds32/include/asm/cacheflush.h
> index 7d6824f7c0e8..c2a222ebfa2a 100644
> --- a/arch/nds32/include/asm/cacheflush.h
> +++ b/arch/nds32/include/asm/cacheflush.h
> @@ -36,8 +36,7 @@ void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
>  void flush_anon_page(struct vm_area_struct *vma,
>  		     struct page *page, unsigned long vaddr);
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -void flush_kernel_dcache_page(struct page *page);
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  void flush_kernel_vmap_range(void *addr, int size);
>  void invalidate_kernel_vmap_range(void *addr, int size);
>  #define flush_dcache_mmap_lock(mapping)   xa_lock_irq(&(mapping)->i_pages)
> diff --git a/arch/nds32/mm/cacheflush.c b/arch/nds32/mm/cacheflush.c
> index ad5344ef5d33..07aac65d1cab 100644
> --- a/arch/nds32/mm/cacheflush.c
> +++ b/arch/nds32/mm/cacheflush.c
> @@ -318,15 +318,6 @@ void flush_anon_page(struct vm_area_struct *vma,
>  	local_irq_restore(flags);
>  }
>  
> -void flush_kernel_dcache_page(struct page *page)
> -{
> -	unsigned long flags;
> -	local_irq_save(flags);
> -	cpu_dcache_wbinval_page((unsigned long)page_address(page));
> -	local_irq_restore(flags);
> -}
> -EXPORT_SYMBOL(flush_kernel_dcache_page);
> -
>  void flush_kernel_vmap_range(void *addr, int size)
>  {
>  	unsigned long flags;
> diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
> index 99663fc1f997..eef0096db5f8 100644
> --- a/arch/parisc/include/asm/cacheflush.h
> +++ b/arch/parisc/include/asm/cacheflush.h
> @@ -36,16 +36,12 @@ void flush_cache_all_local(void);
>  void flush_cache_all(void);
>  void flush_cache_mm(struct mm_struct *mm);
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
>  void flush_kernel_dcache_page_addr(void *addr);
> -static inline void flush_kernel_dcache_page(struct page *page)
> -{
> -	flush_kernel_dcache_page_addr(page_address(page));
> -}
>  
>  #define flush_kernel_dcache_range(start,size) \
>  	flush_kernel_dcache_range_asm((start), (start)+(size));
>  
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  void flush_kernel_vmap_range(void *vaddr, int size);
>  void invalidate_kernel_vmap_range(void *vaddr, int size);
>  
> @@ -59,7 +55,7 @@ extern void flush_dcache_page(struct page *page);
>  #define flush_dcache_mmap_unlock(mapping)	xa_unlock_irq(&mapping->i_pages)
>  
>  #define flush_icache_page(vma,page)	do { 		\
> -	flush_kernel_dcache_page(page);			\
> +	flush_kernel_dcache_page_addr(page_address(page)); \
>  	flush_kernel_icache_page(page_address(page)); 	\
>  } while (0)
>  
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 86a1a63563fd..39e02227e231 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -334,7 +334,7 @@ void flush_dcache_page(struct page *page)
>  		return;
>  	}
>  
> -	flush_kernel_dcache_page(page);
> +	flush_kernel_dcache_page_addr(page_address(page));
>  
>  	if (!mapping)
>  		return;
> @@ -375,7 +375,6 @@ EXPORT_SYMBOL(flush_dcache_page);
>  
>  /* Defined in arch/parisc/kernel/pacache.S */
>  EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
> -EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
>  EXPORT_SYMBOL(flush_data_cache_local);
>  EXPORT_SYMBOL(flush_kernel_icache_range_asm);
>  
> diff --git a/arch/sh/include/asm/cacheflush.h b/arch/sh/include/asm/cacheflush.h
> index 4486a865ff62..372afa82fee6 100644
> --- a/arch/sh/include/asm/cacheflush.h
> +++ b/arch/sh/include/asm/cacheflush.h
> @@ -63,6 +63,8 @@ static inline void flush_anon_page(struct vm_area_struct *vma,
>  	if (boot_cpu_data.dcache.n_aliases && PageAnon(page))
>  		__flush_anon_page(page, vmaddr);
>  }
> +
> +#define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
>  static inline void flush_kernel_vmap_range(void *addr, int size)
>  {
>  	__flush_wback_region(addr, size);
> @@ -72,12 +74,6 @@ static inline void invalidate_kernel_vmap_range(void *addr, int size)
>  	__flush_invalidate_region(addr, size);
>  }
>  
> -#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -static inline void flush_kernel_dcache_page(struct page *page)
> -{
> -	flush_dcache_page(page);
> -}
> -
>  extern void copy_to_user_page(struct vm_area_struct *vma,
>  	struct page *page, unsigned long vaddr, void *dst, const void *src,
>  	unsigned long len);
> diff --git a/block/blk-map.c b/block/blk-map.c
> index 3743158ddaeb..4639bc6b5c62 100644
> --- a/block/blk-map.c
> +++ b/block/blk-map.c
> @@ -309,7 +309,7 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
>  
>  static void bio_invalidate_vmalloc_pages(struct bio *bio)
>  {
> -#ifdef ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> +#ifdef ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE
>  	if (bio->bi_private && !op_is_write(bio_op(bio))) {
>  		unsigned long i, len = 0;
>  
> diff --git a/fs/exec.c b/fs/exec.c
> index 38f63451b928..41a888d4edde 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -574,7 +574,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
>  				}
>  
>  				if (kmapped_page) {
> -					flush_kernel_dcache_page(kmapped_page);
> +					flush_dcache_page(kmapped_page);
>  					kunmap(kmapped_page);
>  					put_arg_page(kmapped_page);
>  				}
> @@ -592,7 +592,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
>  	ret = 0;
>  out:
>  	if (kmapped_page) {
> -		flush_kernel_dcache_page(kmapped_page);
> +		flush_dcache_page(kmapped_page);
>  		kunmap(kmapped_page);
>  		put_arg_page(kmapped_page);
>  	}
> @@ -634,7 +634,7 @@ int copy_string_kernel(const char *arg, struct linux_binprm *bprm)
>  		kaddr = kmap_atomic(page);
>  		flush_arg_page(bprm, pos & PAGE_MASK, page);
>  		memcpy(kaddr + offset_in_page(pos), arg, bytes_to_copy);
> -		flush_kernel_dcache_page(page);
> +		flush_dcache_page(page);
>  		kunmap_atomic(kaddr);
>  		put_arg_page(page);
>  	}
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 8c6e8e996c87..e95551bf99e9 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -130,10 +130,7 @@ static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page
>  }
>  #endif
>  
> -#ifndef ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
> -static inline void flush_kernel_dcache_page(struct page *page)
> -{
> -}
> +#ifndef ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE
>  static inline void flush_kernel_vmap_range(void *vaddr, int size)
>  {
>  }
> diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
> index f9a12005fcea..16ec895bbe5f 100644
> --- a/tools/testing/scatterlist/linux/mm.h
> +++ b/tools/testing/scatterlist/linux/mm.h
> @@ -127,7 +127,6 @@ kmalloc_array(unsigned int n, unsigned int size, unsigned int flags)
>  #define kmemleak_free(a)
>  
>  #define PageSlab(p) (0)
> -#define flush_kernel_dcache_page(p)
>  
>  #define MAX_ERRNO	4095
>  
> -- 
> 2.30.2
> 
> 
