Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A80316D2B
	for <lists+linux-sh@lfdr.de>; Tue,  7 May 2019 23:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfEGV1S (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 May 2019 17:27:18 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44076 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfEGV1S (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 May 2019 17:27:18 -0400
Received: by mail-oi1-f196.google.com with SMTP id y25so6453557oih.11
        for <linux-sh@vger.kernel.org>; Tue, 07 May 2019 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ilo8gO1PWkcUZofYMK/PQNaZ6dgV/WeRBJ4EsjHLWhY=;
        b=ByBpM4rzcj0KLQCSJMTba88G4xlCaGSUA2kjKdZ426F15Q+rvisuUjrNKCKg64SatI
         hGfpL9+XJAVJAd7OK5x2X7bOH8UCONoqiDVzLbqIp/IwaUKRXv8SrDPC18TUUPCHF1gK
         2ha1HiuGirXRlCSSMKaKoHhE3E0pCkvMTucgiZDNVgY2pWXKQO4TeLkDOnsgzqC0ogLS
         OXmlSVXRnkw9NGgqDXboFi/m4xoLMtnx/yEKBYx7gU5J+BtPxhDhIoaniVzPXH31qT27
         CiUS/ula03FH7UD7iS0zY5et0vheHiUY5MatSWBPpGJ0F9FW8j6qp4fQGfelMW/FaD3I
         /X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ilo8gO1PWkcUZofYMK/PQNaZ6dgV/WeRBJ4EsjHLWhY=;
        b=Fi63ADCO/uBBaK/zYNMEOH9NDmoPSYim+JIxmiMLCG/HDJMgxHn/m/X3xYDHipjjWV
         fQo700rIMt0IGlRFu/vBU5/NeaULG5Av2QaxGuJCD/epUqDuss4Ah/K4d6ykySeF+1yp
         i/U7fBvIAWe/816Go6vcYJvZig8ZMp+MhdmMQDxuWFlN6lwDcj5NoIUJWBNNv9NZHk0x
         50SltyuKmDDjgzDIHycR1i2UKBgg1F2GDDdvB06CyVxWphKhEtgTnHxjIhelATvuJuhw
         ft7CAvJ4ws4RSZ3GtmdjnfL+zOYoB9fAJjKik7vOdcZciJoiK88ewnZQk0I795uI/Uv2
         6vDg==
X-Gm-Message-State: APjAAAW4tvmiWemg21B84JxAPzR7lbYLXbpbMKdXSVgyeruYBehZNaap
        scogFYvDRcfXHHYefbUNMkAAxabZpJ2rFgHtu/QyLw==
X-Google-Smtp-Source: APXvYqw1UieLnjdL3uGgndiZUbDSoney6ZAGnwarorW4h7jzSSrmLPgXgH79dv35ujhPqT1clUMPDGkfp9OwGUC0OOc=
X-Received: by 2002:aca:220f:: with SMTP id b15mr361431oic.73.1557264437776;
 Tue, 07 May 2019 14:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-7-david@redhat.com>
In-Reply-To: <20190507183804.5512-7-david@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 14:27:07 -0700
Message-ID: <CAPcyv4gvuBfA0gJrChaUNR-8swU2Vq-UFJA9yRtsEbf2ajf7+w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm/memory_hotplug: Remove memory block devices
 before arch_remove_memory()
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "mike.travis@hpe.com" <mike.travis@hpe.com>,
        Andrew Banman <andrew.banman@hpe.com>,
        Ingo Molnar <mingo@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Oscar Salvador <osalvador@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 7, 2019 at 11:39 AM David Hildenbrand <david@redhat.com> wrote:
>
> Let's factor out removing of memory block devices, which is only
> necessary for memory added via add_memory() and friends that created
> memory block devices. Remove the devices before calling
> arch_remove_memory().
>
> This finishes factoring out memory block device handling from
> arch_add_memory() and arch_remove_memory().

Also nice! makes it easier in the future for the "device-memory" use
case to not avoid messing up the typical memory hotplug flow.

>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andrew Banman <andrew.banman@hpe.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/memory.c  | 39 +++++++++++++++++++--------------------
>  drivers/base/node.c    | 11 ++++++-----
>  include/linux/memory.h |  2 +-
>  include/linux/node.h   |  6 ++----
>  mm/memory_hotplug.c    |  5 +++--
>  5 files changed, 31 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 862c202a18ca..47ff49058d1f 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -756,32 +756,31 @@ int hotplug_memory_register(unsigned long start, unsigned long size)
>         return ret;
>  }
>
> -static int remove_memory_section(struct mem_section *section)
> +/*
> + * Remove memory block devices for the given memory area. Start and size
> + * have to be aligned to memory block granularity. Memory block devices
> + * have to be offline.
> + */
> +void hotplug_memory_unregister(unsigned long start, unsigned long size)
>  {
> +       unsigned long block_nr_pages = memory_block_size_bytes() >> PAGE_SHIFT;
> +       unsigned long start_pfn = PFN_DOWN(start);
> +       unsigned long end_pfn = start_pfn + (size >> PAGE_SHIFT);
>         struct memory_block *mem;
> +       unsigned long pfn;
>
> -       if (WARN_ON_ONCE(!present_section(section)))
> -               return;
> +       BUG_ON(!IS_ALIGNED(start, memory_block_size_bytes()));
> +       BUG_ON(!IS_ALIGNED(size, memory_block_size_bytes()));

Similar BUG_ON vs comments WARN_ON comments as the previous patch.

>
>         mutex_lock(&mem_sysfs_mutex);
> -
> -       /*
> -        * Some users of the memory hotplug do not want/need memblock to
> -        * track all sections. Skip over those.
> -        */
> -       mem = find_memory_block(section);
> -       if (!mem)
> -               goto out_unlock;
> -
> -       unregister_mem_sect_under_nodes(mem, __section_nr(section));
> -
> -       mem->section_count--;
> -       if (mem->section_count == 0)
> +       for (pfn = start_pfn; pfn != end_pfn; pfn += block_nr_pages) {
> +               mem = find_memory_block(__pfn_to_section(pfn));
> +               if (!mem)
> +                       continue;
> +               mem->section_count = 0;
> +               unregister_memory_block_under_nodes(mem);
>                 unregister_memory(mem);
> -       else
> -               put_device(&mem->dev);
> -
> -out_unlock:
> +       }
>         mutex_unlock(&mem_sysfs_mutex);
>  }
>
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 8598fcbd2a17..04fdfa99b8bc 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -801,9 +801,10 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
>         return 0;
>  }
>
> -/* unregister memory section under all nodes that it spans */
> -int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
> -                                   unsigned long phys_index)
> +/*
> + * Unregister memory block device under all nodes that it spans.
> + */
> +int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  {
>         NODEMASK_ALLOC(nodemask_t, unlinked_nodes, GFP_KERNEL);
>         unsigned long pfn, sect_start_pfn, sect_end_pfn;
> @@ -816,8 +817,8 @@ int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
>                 return -ENOMEM;
>         nodes_clear(*unlinked_nodes);
>
> -       sect_start_pfn = section_nr_to_pfn(phys_index);
> -       sect_end_pfn = sect_start_pfn + PAGES_PER_SECTION - 1;
> +       sect_start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> +       sect_end_pfn = section_nr_to_pfn(mem_blk->end_section_nr);
>         for (pfn = sect_start_pfn; pfn <= sect_end_pfn; pfn++) {
>                 int nid;
>
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 95505fbb5f85..aa236c2a0466 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -112,7 +112,7 @@ extern void unregister_memory_notifier(struct notifier_block *nb);
>  extern int register_memory_isolate_notifier(struct notifier_block *nb);
>  extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
>  int hotplug_memory_register(unsigned long start, unsigned long size);
> -extern void unregister_memory_section(struct mem_section *);
> +void hotplug_memory_unregister(unsigned long start, unsigned long size);
>  extern int memory_dev_init(void);
>  extern int memory_notify(unsigned long val, void *v);
>  extern int memory_isolate_notify(unsigned long val, void *v);
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 1a557c589ecb..02a29e71b175 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -139,8 +139,7 @@ extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
>  extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
>  extern int register_mem_sect_under_node(struct memory_block *mem_blk,
>                                                 void *arg);
> -extern int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
> -                                          unsigned long phys_index);
> +extern int unregister_memory_block_under_nodes(struct memory_block *mem_blk);
>
>  extern int register_memory_node_under_compute_node(unsigned int mem_nid,
>                                                    unsigned int cpu_nid,
> @@ -176,8 +175,7 @@ static inline int register_mem_sect_under_node(struct memory_block *mem_blk,
>  {
>         return 0;
>  }
> -static inline int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
> -                                                 unsigned long phys_index)
> +static inline int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  {
>         return 0;
>  }
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 107f72952347..527fe4f9c620 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -519,8 +519,6 @@ static void __remove_section(struct zone *zone, struct mem_section *ms,
>         if (WARN_ON_ONCE(!valid_section(ms)))
>                 return;
>
> -       unregister_memory_section(ms);
> -
>         scn_nr = __section_nr(ms);
>         start_pfn = section_nr_to_pfn((unsigned long)scn_nr);
>         __remove_zone(zone, start_pfn);
> @@ -1844,6 +1842,9 @@ void __ref __remove_memory(int nid, u64 start, u64 size)
>         memblock_free(start, size);
>         memblock_remove(start, size);
>
> +       /* remove memory block devices before removing memory */
> +       hotplug_memory_unregister(start, size);
> +
>         arch_remove_memory(nid, start, size, NULL);
>         __release_memory_resource(start, size);

Other than the BUG_ON concern you can add

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
