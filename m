Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEA518B0E
	for <lists+linux-sh@lfdr.de>; Thu,  9 May 2019 15:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfEINzh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 May 2019 09:55:37 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41816 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfEINzh (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 May 2019 09:55:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id m4so2107131edd.8;
        Thu, 09 May 2019 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rj8sR0p1Edqa94H02tBjaXnEUtoaRjwEJVzZPumNj1g=;
        b=oQCvYs9jZqA0mKZRzCMWu05oFj2Zz17/PVNd4bwpPPpxmMr0K+ZQCs7yxqlPtfjuMy
         8OjUA2czA5H6SB9uPKPi/jS92gskpNjvYeYP/Q4yo9+o9Xrd9/e5lEK5NKwBomh3Cy8d
         txu9rR8KNjutQFiKex2oKNITF45PZElb82I9QA/6KUxfMCLsrY1lDcu5LtawuUioBTcj
         C363GL59Zdaxz2o8wF08BTrzO41fdEKqPgs6o4QzXc1PYVqQv9UpbOEWVkNzzqcmKdVj
         852r0xVwgC3ApDh6OJFtIWvfw2X6OVJBAUv3KUKUNUdncpeZkAmD/cq2XxXLjQEZfw5F
         hPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rj8sR0p1Edqa94H02tBjaXnEUtoaRjwEJVzZPumNj1g=;
        b=FuxIhKCyoP/mbxqCoMMNNVHiTYFRLY6GeGczcDgWkaMrhAo4/IM96TTtJtJiR/jR5O
         x3AGXBl42VneTXnGLSEB0o4/Ade9YqNqDYyJyH//xncwf+2pyxsv47IaP/22/sbZs403
         lSTdGYvZrl8j8AILwnGfetf2fLjgKqiHo20AFYGtXl56pGwWsWCg2l8CUXIvPI3yuBM3
         F4SX/1CdlAJeHn5TBQ0RxN/8D8JtK3OnctkU5l6p+t957XgnxXWqfMOyvRM5LsXhpYV6
         MwE1fR8YJWSHUOZEVSlIR24yJIl9ARLU6L+1oPBsH60gl+BwyLldEnIMGouQJpX7LjmK
         7BNQ==
X-Gm-Message-State: APjAAAVmgkQWbBZcBGVqIZNh5g3+KkWJfHuJpQbAc0FunZsOxmDIOtlb
        ciQzYEVcUke/lt+WBOEdaSc=
X-Google-Smtp-Source: APXvYqyqamcbXYaLythnIDnP0cKrQ7Jqxn1LlTAxYUXRdkLE65y8UJdLAseURDgvrzBfIKf7YsPB9w==
X-Received: by 2002:a50:a5b4:: with SMTP id a49mr4299981edc.30.1557410134597;
        Thu, 09 May 2019 06:55:34 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id j55sm611135ede.27.2019.05.09.06.55.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 06:55:33 -0700 (PDT)
Date:   Thu, 9 May 2019 13:55:33 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        akpm@linux-foundation.org, Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "mike.travis@hpe.com" <mike.travis@hpe.com>,
        Ingo Molnar <mingo@kernel.org>,
        Andrew Banman <andrew.banman@hpe.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Qian Cai <cai@lca.pw>, Wei Yang <richard.weiyang@gmail.com>,
        Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v2 4/8] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190509135533.6xok3v7rxxaohc77@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507183804.5512-5-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 07, 2019 at 08:38:00PM +0200, David Hildenbrand wrote:
>Only memory to be added to the buddy and to be onlined/offlined by
>user space using memory block devices needs (and should have!) memory
>block devices.
>
>Factor out creation of memory block devices Create all devices after
>arch_add_memory() succeeded. We can later drop the want_memblock parameter,
>because it is now effectively stale.
>
>Only after memory block devices have been added, memory can be onlined
>by user space. This implies, that memory is not visible to user space at
>all before arch_add_memory() succeeded.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Ingo Molnar <mingo@kernel.org>
>Cc: Andrew Banman <andrew.banman@hpe.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Qian Cai <cai@lca.pw>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> drivers/base/memory.c  | 70 ++++++++++++++++++++++++++----------------
> include/linux/memory.h |  2 +-
> mm/memory_hotplug.c    | 15 ++++-----
> 3 files changed, 53 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 6e0cb4fda179..862c202a18ca 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -701,44 +701,62 @@ static int add_memory_block(int base_section_nr)
> 	return 0;
> }
> 
>+static void unregister_memory(struct memory_block *memory)
>+{
>+	BUG_ON(memory->dev.bus != &memory_subsys);
>+
>+	/* drop the ref. we got via find_memory_block() */
>+	put_device(&memory->dev);
>+	device_unregister(&memory->dev);
>+}
>+
> /*
>- * need an interface for the VM to add new memory regions,
>- * but without onlining it.
>+ * Create memory block devices for the given memory area. Start and size
>+ * have to be aligned to memory block granularity. Memory block devices
>+ * will be initialized as offline.
>  */
>-int hotplug_memory_register(int nid, struct mem_section *section)
>+int hotplug_memory_register(unsigned long start, unsigned long size)
> {
>-	int ret = 0;
>+	unsigned long block_nr_pages = memory_block_size_bytes() >> PAGE_SHIFT;
>+	unsigned long start_pfn = PFN_DOWN(start);
>+	unsigned long end_pfn = start_pfn + (size >> PAGE_SHIFT);
>+	unsigned long pfn;
> 	struct memory_block *mem;
>+	int ret = 0;
> 
>-	mutex_lock(&mem_sysfs_mutex);
>+	BUG_ON(!IS_ALIGNED(start, memory_block_size_bytes()));
>+	BUG_ON(!IS_ALIGNED(size, memory_block_size_bytes()));
> 
>-	mem = find_memory_block(section);
>-	if (mem) {
>-		mem->section_count++;
>-		put_device(&mem->dev);
>-	} else {
>-		ret = init_memory_block(&mem, section, MEM_OFFLINE);
>+	mutex_lock(&mem_sysfs_mutex);
>+	for (pfn = start_pfn; pfn != end_pfn; pfn += block_nr_pages) {
>+		mem = find_memory_block(__pfn_to_section(pfn));
>+		if (mem) {
>+			WARN_ON_ONCE(false);

One question here, the purpose of WARN_ON_ONCE(false) is? Would we trigger
this?

>+			put_device(&mem->dev);
>+			continue;
>+		}
>+		ret = init_memory_block(&mem, __pfn_to_section(pfn),
>+					MEM_OFFLINE);
> 		if (ret)
>-			goto out;
>-		mem->section_count++;
>+			break;
>+		mem->section_count = memory_block_size_bytes() /
>+				     MIN_MEMORY_BLOCK_SIZE;

Maybe we can leverage sections_per_block variable.

                mem->section_count = sections_per_block;

>+	}
>+	if (ret) {
>+		end_pfn = pfn;
>+		for (pfn = start_pfn; pfn != end_pfn; pfn += block_nr_pages) {
>+			mem = find_memory_block(__pfn_to_section(pfn));
>+			if (!mem)
>+				continue;
>+			mem->section_count = 0;
>+			unregister_memory(mem);
>+		}
> 	}

-- 
Wei Yang
Help you, Help me
