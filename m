Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1737608BA
	for <lists+linux-sh@lfdr.de>; Tue, 25 Jul 2023 06:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjGYElv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 25 Jul 2023 00:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjGYElt (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 25 Jul 2023 00:41:49 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5511BC0
        for <linux-sh@vger.kernel.org>; Mon, 24 Jul 2023 21:41:47 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d10354858e8so1915611276.2
        for <linux-sh@vger.kernel.org>; Mon, 24 Jul 2023 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690260106; x=1690864906;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tFc7lI8l/TAp6N4SH/RnjHMrhDjcjpOS0NvhRjK3tI=;
        b=syg9IyMH/gqJY1k4LT3S6JMx0fSLcgE37Cs+8KWCUO35fKCYg0MuLIIi0nsu37jtyV
         JWnNbNndjflxoqEknhV3drMoPO1rLP5Mf2NwuEGG3uNqc6WCc3lC70F16ZnEeLC+MDXA
         tlBtkvCExRePxNsWSrYSlIqtWo9fJaFXM7OzUrScUdzQ6XIpjZwJMknKg/XaSKKfA+Pp
         NHjPm93xL9xpQDR+q+3gjlysNDu5FD2n2xMli6SN590GUy6WkS3ghg4fMC/PcVORHv0z
         7pZwaHoSCWcs0DC0U/7aDMkjw3lDyZjRkGaSMnnCoKZ6Eh2nJ1AJW7AcIEll2MImoPAy
         2Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690260106; x=1690864906;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tFc7lI8l/TAp6N4SH/RnjHMrhDjcjpOS0NvhRjK3tI=;
        b=YAsznCJyyMyk6FefuehaYd4nmTj0P+nc3v4CxM5qKKZSa+6CX75tpXfSr75ZHBQfgo
         FpWVT7PuCRnUtlocm/xxG8mDtxa6hdH5hlmuXy+aRlBZRRRApfxbWReJ0ImwlePdcxLv
         3Gtl7EfhNdYoz1tTFczyRoVFXryyvmBdl7CzbAsSHWo0k7u3i+hmbaLxHq0ICkc58G1K
         RWPgk/Sqc0En5nzxy2eMkFC1kz9K5yU1LOrKc6lt0+7HHGWuglfO2g6D2XqCscnMpBWb
         ZjeA3cSUi8FWR1xcpGvz62bUSZeRFouW7pjyG6z0BhK0zNNEIEpDmBkj+Btn07jcSY06
         CMFw==
X-Gm-Message-State: ABy/qLbdk3oJeGn60zl07ItKBpAn+1dwdKsmnrAQnCCjkI9Xh/1Hsk2i
        98ZYKa0ZV85jacwFgpGJiHZA1g==
X-Google-Smtp-Source: APBJJlHQLTh3cgEYO+DVAD/fw8XSxxaq77z0mK7JibK/JjnN3wjA/kyDdlXYpJW7FLCpf9E01rW5SQ==
X-Received: by 2002:a25:2342:0:b0:d0d:2d17:3f11 with SMTP id j63-20020a252342000000b00d0d2d173f11mr5304231ybj.17.1690260106082;
        Mon, 24 Jul 2023 21:41:46 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z16-20020a25e310000000b00c71e4833957sm2656725ybd.63.2023.07.24.21.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:41:45 -0700 (PDT)
Date:   Mon, 24 Jul 2023 21:41:36 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH mm-unstable v7 00/31] Split ptdesc from struct page
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
Message-ID: <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, 24 Jul 2023, Vishal Moola (Oracle) wrote:

> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.
> 
> Ptdesc is a foundation to further standardize page tables, and eventually
> allow for dynamic allocation of page tables independent of struct page.
> However, the use of pages for page table tracking is quite deeply
> ingrained and varied across archictectures, so there is still a lot of
> work to be done before that can happen.

Others may differ, but it remains the case that I see no point to this
patchset, until the minimal descriptor that replaces struct page is
working, and struct page then becomes just overhead.  Until that time,
let architectures continue to use struct page as they do - whyever not?

Hugh

> 
> This is rebased on mm-unstable.
> 
> v7:
>   Drop s390 gmap ptdesc conversions - gmap is unecessary complication
>     that can be dealt with later
>   Be more thorough with ptdesc struct sanity checks and comments
>   Rebase onto mm-unstable
> 
> Vishal Moola (Oracle) (31):
>   mm: Add PAGE_TYPE_OP folio functions
>   pgtable: Create struct ptdesc
>   mm: add utility functions for ptdesc
>   mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
>   mm: Convert ptlock_alloc() to use ptdescs
>   mm: Convert ptlock_ptr() to use ptdescs
>   mm: Convert pmd_ptlock_init() to use ptdescs
>   mm: Convert ptlock_init() to use ptdescs
>   mm: Convert pmd_ptlock_free() to use ptdescs
>   mm: Convert ptlock_free() to use ptdescs
>   mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
>   powerpc: Convert various functions to use ptdescs
>   x86: Convert various functions to use ptdescs
>   s390: Convert various pgalloc functions to use ptdescs
>   mm: Remove page table members from struct page
>   pgalloc: Convert various functions to use ptdescs
>   arm: Convert various functions to use ptdescs
>   arm64: Convert various functions to use ptdescs
>   csky: Convert __pte_free_tlb() to use ptdescs
>   hexagon: Convert __pte_free_tlb() to use ptdescs
>   loongarch: Convert various functions to use ptdescs
>   m68k: Convert various functions to use ptdescs
>   mips: Convert various functions to use ptdescs
>   nios2: Convert __pte_free_tlb() to use ptdescs
>   openrisc: Convert __pte_free_tlb() to use ptdescs
>   riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
>   sh: Convert pte_free_tlb() to use ptdescs
>   sparc64: Convert various functions to use ptdescs
>   sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
>   um: Convert {pmd, pte}_free_tlb() to use ptdescs
>   mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers
> 
>  Documentation/mm/split_page_table_lock.rst    |  12 +-
>  .../zh_CN/mm/split_page_table_lock.rst        |  14 +-
>  arch/arm/include/asm/tlb.h                    |  12 +-
>  arch/arm/mm/mmu.c                             |   7 +-
>  arch/arm64/include/asm/tlb.h                  |  14 +-
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/csky/include/asm/pgalloc.h               |   4 +-
>  arch/hexagon/include/asm/pgalloc.h            |   8 +-
>  arch/loongarch/include/asm/pgalloc.h          |  27 ++--
>  arch/loongarch/mm/pgtable.c                   |   7 +-
>  arch/m68k/include/asm/mcf_pgalloc.h           |  47 +++---
>  arch/m68k/include/asm/sun3_pgalloc.h          |   8 +-
>  arch/m68k/mm/motorola.c                       |   4 +-
>  arch/mips/include/asm/pgalloc.h               |  32 ++--
>  arch/mips/mm/pgtable.c                        |   8 +-
>  arch/nios2/include/asm/pgalloc.h              |   8 +-
>  arch/openrisc/include/asm/pgalloc.h           |   8 +-
>  arch/powerpc/mm/book3s64/mmu_context.c        |  10 +-
>  arch/powerpc/mm/book3s64/pgtable.c            |  32 ++--
>  arch/powerpc/mm/pgtable-frag.c                |  56 +++----
>  arch/riscv/include/asm/pgalloc.h              |   8 +-
>  arch/riscv/mm/init.c                          |  16 +-
>  arch/s390/include/asm/pgalloc.h               |   4 +-
>  arch/s390/include/asm/tlb.h                   |   4 +-
>  arch/s390/mm/pgalloc.c                        | 128 +++++++--------
>  arch/sh/include/asm/pgalloc.h                 |   9 +-
>  arch/sparc/mm/init_64.c                       |  17 +-
>  arch/sparc/mm/srmmu.c                         |   5 +-
>  arch/um/include/asm/pgalloc.h                 |  18 +--
>  arch/x86/mm/pgtable.c                         |  47 +++---
>  arch/x86/xen/mmu_pv.c                         |   2 +-
>  include/asm-generic/pgalloc.h                 |  88 +++++-----
>  include/asm-generic/tlb.h                     |  11 ++
>  include/linux/mm.h                            | 151 +++++++++++++-----
>  include/linux/mm_types.h                      |  18 ---
>  include/linux/page-flags.h                    |  30 +++-
>  include/linux/pgtable.h                       |  80 ++++++++++
>  mm/memory.c                                   |   8 +-
>  38 files changed, 585 insertions(+), 384 deletions(-)
> 
> -- 
> 2.40.1
