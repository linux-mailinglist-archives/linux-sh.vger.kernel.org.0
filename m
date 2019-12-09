Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AC111779E
	for <lists+linux-sh@lfdr.de>; Mon,  9 Dec 2019 21:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLIUnx (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Dec 2019 15:43:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46834 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726665AbfLIUnw (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Dec 2019 15:43:52 -0500
Received: by mail-oi1-f196.google.com with SMTP id a124so7612242oii.13
        for <linux-sh@vger.kernel.org>; Mon, 09 Dec 2019 12:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=plZMhK84PEv4yWmkyRgS9pvtlaQ95b7dai3GHtutF3U=;
        b=s8JcQPtbr+nVe651d3RxZBcB1lXgZKfKVFhn/ShuBpwGBroXkMdV+1srYkcwwzCfi/
         3AdkcPWeiO2eE4Vph0qmLnpLEA8qPwiUkiQSbuWv9LS1KxvGK3AP4uCAh+EMErUq8k74
         L494AbumcLYt4cMYgyYMcdh6j0zlFuGJ8ZPSO2PxzpS4hTMg0sQG1PNOFwBWl5Zzp6eP
         Hwu+hbiTpbKnoLj6CsAujCqJSlm6zAkwyEntNz5bxfqTJjvUbj59ZsDept7jCzKEEbgY
         DvR3hVrw+BRWOH7VlzK3NLFoCEF6jALh7nekxLiYRnJ0XVoNr+Z9wuJ3vSGrSPuKoOPd
         615w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plZMhK84PEv4yWmkyRgS9pvtlaQ95b7dai3GHtutF3U=;
        b=e4JeKTzi3QeBvV9PMNukosBFTkSLUcoOHj90xWAT0W9IlOE+r4gjPKCnb39LRTFfWC
         2BOYl6rzfQjIRDsjq2NWTc8oq5vZNIJpb0pNGswXWFAfejAO9u2b8bau0X7/5bthQGYM
         zemrZmITkf8/lGEkeB6/qge7VdeGU0YcPzftPbnQzpsnUXbwvXVqyjZX2ZM07yAYLS2N
         Ldi/DL492JSQJxyEyE/8K6ehNyZmTdW7muE4tXMTfhCVawIVbxXQi9cUGEI4jNd+fTS2
         WVxvCIev+MNTbJDSwQTM9ecT8QEetIjvEBxU/VUeC7nV26t7YoGSzudSFl9DykP3TKPC
         TPTg==
X-Gm-Message-State: APjAAAX4Ct0uo6D7cmmx0jmg9tfmZuCgcNXijOpzbjKTw2MaJbVtWrmS
        jh+vX9qV8bOGPx5jRfj1RWXg19/LrZLOFtHdwYhgKQ==
X-Google-Smtp-Source: APXvYqyeRHkHv/ywCxrBIm5A7egnQ5ryTQgyKvJL2kpqRDm3KyRgnulA7iNcBuX+BkZigYY9JneBtT9sFsmo5jtdPMY=
X-Received: by 2002:aca:4850:: with SMTP id v77mr913881oia.70.1575924231490;
 Mon, 09 Dec 2019 12:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20191209191346.5197-1-logang@deltatee.com> <20191209191346.5197-6-logang@deltatee.com>
 <ce50d9da-c60e-05a1-a86b-3bb3629de502@redhat.com> <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
In-Reply-To: <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 9 Dec 2019 12:43:40 -0800
Message-ID: <CAPcyv4hpXCZxV5p7WaeGgE7ceujBBa5NOz9Z8fepDHOt6zHO2A@mail.gmail.com>
Subject: Re: [PATCH 5/6] mm, memory_hotplug: Provide argument for the pgprot_t
 in arch_add_memory()
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Dec 9, 2019 at 12:24 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2019-12-09 12:23 p.m., David Hildenbrand wrote:
> > On 09.12.19 20:13, Logan Gunthorpe wrote:
> >> devm_memremap_pages() is currently used by the PCI P2PDMA code to create
> >> struct page mappings for IO memory. At present, these mappings are created
> >> with PAGE_KERNEL which implies setting the PAT bits to be WB. However, on
> >> x86, an mtrr register will typically override this and force the cache
> >> type to be UC-. In the case firmware doesn't set this register it is
> >> effectively WB and will typically result in a machine check exception
> >> when it's accessed.
> >>
> >> Other arches are not currently likely to function correctly seeing they
> >> don't have any MTRR registers to fall back on.
> >>
> >> To solve this, add an argument to arch_add_memory() to explicitly
> >> set the pgprot value to a specific value.
> >>
> >> Of the arches that support MEMORY_HOTPLUG: x86_64, s390 and arm64 is a
> >> simple change to pass the pgprot_t down to their respective functions
> >> which set up the page tables. For x86_32, set the page tables explicitly
> >> using _set_memory_prot() (seeing they are already mapped). For sh, reject
> >> anything but PAGE_KERNEL settings -- this should be fine, for now, seeing
> >> sh doesn't support ZONE_DEVICE anyway.
> >>
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Michal Hocko <mhocko@suse.com>
> >> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> >> ---
> >>  arch/arm64/mm/mmu.c            | 4 ++--
> >>  arch/ia64/mm/init.c            | 5 ++++-
> >>  arch/powerpc/mm/mem.c          | 4 ++--
> >>  arch/s390/mm/init.c            | 4 ++--
> >>  arch/sh/mm/init.c              | 5 ++++-
> >>  arch/x86/mm/init_32.c          | 7 ++++++-
> >>  arch/x86/mm/init_64.c          | 4 ++--
> >>  include/linux/memory_hotplug.h | 2 +-
> >>  mm/memory_hotplug.c            | 2 +-
> >>  mm/memremap.c                  | 2 +-
> >>  10 files changed, 25 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 60c929f3683b..48b65272df15 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -1050,7 +1050,7 @@ int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> >>  }
> >>
> >>  #ifdef CONFIG_MEMORY_HOTPLUG
> >> -int arch_add_memory(int nid, u64 start, u64 size,
> >> +int arch_add_memory(int nid, u64 start, u64 size, pgprot_t prot,
> >>                      struct mhp_restrictions *restrictions)
> >
> > Can we fiddle that into "struct mhp_restrictions" instead?
>
> Yes, if that's what people want, it's pretty trivial to do. I chose not
> to do it that way because it doesn't get passed down to add_pages() and
> it's not really a "restriction". If I don't hear any objections, I will
> do that for v2.

+1 to storing this information alongside the altmap in that structure.
However, I agree struct mhp_restrictions, with the MHP_MEMBLOCK_API
flag now gone, has lost all of its "restrictions". How about dropping
the 'flags' property and renaming the struct to 'struct
mhp_modifiers'?
