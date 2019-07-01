Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAA035227
	for <lists+linux-sh@lfdr.de>; Tue,  4 Jun 2019 23:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfFDVr5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Jun 2019 17:47:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45504 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFDVr5 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Jun 2019 17:47:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id f20so2553709edt.12;
        Tue, 04 Jun 2019 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YAOiP57A01Sn4VN1p2tU0pXmqdLPIiJ4XRB9cBH/L60=;
        b=LHVOjJU+PrWUKjw2La9VE1vPKl5KearF9vd1gx+fMOah0NIYnTCpk/hLPywmGuD7Qx
         ubKVoOSXllgIIOtqhu2gVJ3x9B0/bsgZ7dOqAY3y5Ayi0qhLPf1tZQD8IUflfR/bo3b1
         F4TaQlhPSFK4tf44OdTct45QOW1HbhpVKmRS1UPgsRmJ8ykiC6IB1kc0IjzAbHbpYgcW
         XocfR253q6JmXmpbPH+wSLE5nYqYTiHdUq2ypGGmgfgczCsKHTbAbfTkEuh649zZZ9c/
         Obhuc+H39gsisfGYj1xrWFrX2Lyh1bRdUjq62tExuKhoIe4zwnBrI2RwiYnmhdgPNIGz
         bDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YAOiP57A01Sn4VN1p2tU0pXmqdLPIiJ4XRB9cBH/L60=;
        b=NULAeei9khK+CQ3Lbp52QiJxztnZ32IYSoc9ib4IX8i+bXt/GqhGAVNI4e7vXa4ROt
         GNdBAobfPaup7tehAmkGoxj+ynS0BiBZAu+WSjSMMqXdr5bqBEzzjbClRve8/dipkCmq
         4F7GQEQdT9Ax46SO700SO16EkHvg8RjmXeWUXUD+2MjKNJnNK6Tp5wWolrA1uTTbfv26
         of59Ci4AloPtYmzdE6SlsD3UpUxNyRvE11gnEXvsrPGhaKc8su+dIXkM746uQmnYD8ut
         qCgPUK49EE1RS3/3Qw5s5ackjlcxbR04CIIOXz7Rf+KKsPwzjflN8QRu/fc8FHU0ZXFu
         iM6w==
X-Gm-Message-State: APjAAAWGzrG5VDuqRAXENkhGdKKRed7MLRRMbHmRa/aJkFFppQYATV5j
        RA3U28PmZqe87V8R2ZjTm5lncabqzC0=
X-Google-Smtp-Source: APXvYqwDVoxJj2tIOxzLuK3nYNHPwTJ67OHC1d3ag5SDYh0bPqzR5f57ZgPalm+F2A4DDOJ5mfMHNQ==
X-Received: by 2002:a50:bb24:: with SMTP id y33mr38369134ede.116.1559684875305;
        Tue, 04 Jun 2019 14:47:55 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id n5sm2897404edt.65.2019.06.04.14.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 14:47:54 -0700 (PDT)
Date:   Tue, 4 Jun 2019 21:47:53 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, Qian Cai <cai@lca.pw>,
        Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v3 08/11] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
Message-ID: <20190604214753.utbdrjtjavgi7yhf@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-9-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, May 27, 2019 at 01:11:49PM +0200, David Hildenbrand wrote:
>No longer needed, the callers of arch_add_memory() can handle this
>manually.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Oscar Salvador <osalvador@suse.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>Cc: Qian Cai <cai@lca.pw>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> include/linux/memory_hotplug.h | 8 --------
> mm/memory_hotplug.c            | 9 +++------
> 2 files changed, 3 insertions(+), 14 deletions(-)
>
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index 2d4de313926d..2f1f87e13baa 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
> extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
> 			   unsigned long nr_pages, struct vmem_altmap *altmap);
> 
>-/*
>- * Do we want sysfs memblock files created. This will allow userspace to online
>- * and offline memory explicitly. Lack of this bit means that the caller has to
>- * call move_pfn_range_to_zone to finish the initialization.
>- */
>-
>-#define MHP_MEMBLOCK_API               (1<<0)
>-
> /* reasonably generic interface to expand the physical pages */
> extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> 		       struct mhp_restrictions *restrictions);
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index b1fde90bbf19..9a92549ef23b 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -251,7 +251,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
> #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
> 
> static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
>-		struct vmem_altmap *altmap, bool want_memblock)
>+				   struct vmem_altmap *altmap)
> {
> 	int ret;
> 
>@@ -294,8 +294,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
> 	}
> 
> 	for (i = start_sec; i <= end_sec; i++) {
>-		err = __add_section(nid, section_nr_to_pfn(i), altmap,
>-				restrictions->flags & MHP_MEMBLOCK_API);
>+		err = __add_section(nid, section_nr_to_pfn(i), altmap);
> 
> 		/*
> 		 * EEXIST is finally dealt with by ioresource collision
>@@ -1067,9 +1066,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>  */
> int __ref add_memory_resource(int nid, struct resource *res)
> {
>-	struct mhp_restrictions restrictions = {
>-		.flags = MHP_MEMBLOCK_API,
>-	};
>+	struct mhp_restrictions restrictions = {};
> 	u64 start, size;
> 	bool new_node = false;
> 	int ret;
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
