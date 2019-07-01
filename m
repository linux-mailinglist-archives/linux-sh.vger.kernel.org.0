Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991B435207
	for <lists+linux-sh@lfdr.de>; Tue,  4 Jun 2019 23:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfFDVmi (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Jun 2019 17:42:38 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45865 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDVmi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Jun 2019 17:42:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id f20so2537479edt.12;
        Tue, 04 Jun 2019 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kGgg2cwccQhQ87BOLNQ19P0eOVj/IxJHAOcVaT8qQRo=;
        b=MvGpvha5uoaqY64DB9m3OiEBHBCB0j/M3ygCmk9qYPQh0e62kI5YP56dl+XWkyPnPj
         EG/cWmaZtCuz9hrmKDhu4vozWbJ9HCkn7M8Ttp4ZeNIEWR+kY0Xs1oHmqWMFnzgffAmo
         aey94bU9w8nbfa6XiE5SwjNNvKvkfk8p0vKyNskG+C2prnMXAnSjjP70FTRoflsXkKBc
         d4IfMDucbN7yQaPg6KW7aP3MSRkOfE5IhyOPp/ZbfuiWxjztb8ng2R3gwnFogtiBFUd5
         uMSDMlELCgRY0FjQycMIniwNmizvH+zAX04W5t/NFF3kWUW3eih44Ay8/4cnCTikeQeY
         whig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=kGgg2cwccQhQ87BOLNQ19P0eOVj/IxJHAOcVaT8qQRo=;
        b=TnMzZcF33omcmRUOhE6IKRyFV5ZVyt25ebdUX3B9vOtlcIVVIckLY1+sXIdZFOl6Vo
         zSNwjfHIbJRnzX3Dyx3CQVbM4n3r9pBOQwmo7RKs2kND99iLLkNJeRV+SYnBAwkWBDoN
         uE6Tbc83M0hGtJITc4wwxHdFtnqaImyJpP45UiGbKrjEWmqWOLr+uw28ru79z85E/8ip
         jr35xPUtliFsRBGfcV8tUlKo4VIowYtT5YdgotrM/RmPlUdR2daBUAjMjKqeck5gqsOg
         u+Lz6GTkGmZbJLT66HZrOK9v0HkXdwLh4QT4zcmCf6imG3s7lULzZ2BCR0tHODz1gftn
         zQGQ==
X-Gm-Message-State: APjAAAVqi5O/9xQnihne2i7vJw/ZejVvAM3EUx1tI01p6WmT5ycvWcEs
        /UTxcvnra9LuzXbG8OI5A0o=
X-Google-Smtp-Source: APXvYqxAJB613MXS5SsQSAVAhyXKrrpfkgYY86Logu8BWUaW7EUGho3leJeBoyNfYrNBhWO+qVCbjg==
X-Received: by 2002:a17:906:1303:: with SMTP id w3mr32002043ejb.196.1559684555972;
        Tue, 04 Jun 2019 14:42:35 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id r14sm3337551eja.77.2019.06.04.14.42.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 14:42:34 -0700 (PDT)
Date:   Tue, 4 Jun 2019 21:42:34 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
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
        "mike.travis@hpe.com" <mike.travis@hpe.com>,
        Ingo Molnar <mingo@kernel.org>,
        Andrew Banman <andrew.banman@hpe.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v3 07/11] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190604214234.ltwtkcdoju2gxisx@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-8-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, May 27, 2019 at 01:11:48PM +0200, David Hildenbrand wrote:
>Only memory to be added to the buddy and to be onlined/offlined by
>user space using /sys/devices/system/memory/... needs (and should have!)
>memory block devices.
>
>Factor out creation of memory block devices. Create all devices after
>arch_add_memory() succeeded. We can later drop the want_memblock parameter,
>because it is now effectively stale.
>
>Only after memory block devices have been added, memory can be onlined
>by user space. This implies, that memory is not visible to user space at
>all before arch_add_memory() succeeded.
>
>While at it
>- use WARN_ON_ONCE instead of BUG_ON in moved unregister_memory()
>- introduce find_memory_block_by_id() to search via block id
>- Use find_memory_block_by_id() in init_memory_block() to catch
>  duplicates

Generally looks good to me besides two tiny comments.

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
> drivers/base/memory.c  | 82 +++++++++++++++++++++++++++---------------
> include/linux/memory.h |  2 +-
> mm/memory_hotplug.c    | 15 ++++----
> 3 files changed, 63 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index ac17c95a5f28..5a0370f0c506 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -39,6 +39,11 @@ static inline int base_memory_block_id(int section_nr)
> 	return section_nr / sections_per_block;
> }
> 
>+static inline int pfn_to_block_id(unsigned long pfn)
>+{
>+	return base_memory_block_id(pfn_to_section_nr(pfn));
>+}
>+
> static int memory_subsys_online(struct device *dev);
> static int memory_subsys_offline(struct device *dev);
> 
>@@ -582,10 +587,9 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>  * A reference for the returned object is held and the reference for the
>  * hinted object is released.
>  */
>-struct memory_block *find_memory_block_hinted(struct mem_section *section,
>-					      struct memory_block *hint)
>+static struct memory_block *find_memory_block_by_id(int block_id,
>+						    struct memory_block *hint)
> {
>-	int block_id = base_memory_block_id(__section_nr(section));
> 	struct device *hintdev = hint ? &hint->dev : NULL;
> 	struct device *dev;
> 
>@@ -597,6 +601,14 @@ struct memory_block *find_memory_block_hinted(struct mem_section *section,
> 	return to_memory_block(dev);
> }
> 
>+struct memory_block *find_memory_block_hinted(struct mem_section *section,
>+					      struct memory_block *hint)
>+{
>+	int block_id = base_memory_block_id(__section_nr(section));
>+
>+	return find_memory_block_by_id(block_id, hint);
>+}
>+
> /*
>  * For now, we have a linear search to go find the appropriate
>  * memory_block corresponding to a particular phys_index. If
>@@ -658,6 +670,11 @@ static int init_memory_block(struct memory_block **memory, int block_id,
> 	unsigned long start_pfn;
> 	int ret = 0;
> 
>+	mem = find_memory_block_by_id(block_id, NULL);
>+	if (mem) {
>+		put_device(&mem->dev);
>+		return -EEXIST;
>+	}

find_memory_block_by_id() is not that close to the main idea in this patch.
Would it be better to split this part?

> 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> 	if (!mem)
> 		return -ENOMEM;
>@@ -699,44 +716,53 @@ static int add_memory_block(int base_section_nr)
> 	return 0;
> }
> 
>+static void unregister_memory(struct memory_block *memory)
>+{
>+	if (WARN_ON_ONCE(memory->dev.bus != &memory_subsys))
>+		return;
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
>+int create_memory_block_devices(unsigned long start, unsigned long size)
> {
>-	int block_id = base_memory_block_id(__section_nr(section));
>-	int ret = 0;
>+	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
>+	int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
> 	struct memory_block *mem;
>+	unsigned long block_id;
>+	int ret = 0;
> 
>-	mutex_lock(&mem_sysfs_mutex);
>+	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
>+			 !IS_ALIGNED(size, memory_block_size_bytes())))
>+		return -EINVAL;
> 
>-	mem = find_memory_block(section);
>-	if (mem) {
>-		mem->section_count++;
>-		put_device(&mem->dev);
>-	} else {
>+	mutex_lock(&mem_sysfs_mutex);
>+	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
> 		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
> 		if (ret)
>-			goto out;
>-		mem->section_count++;
>+			break;
>+		mem->section_count = sections_per_block;
>+	}
>+	if (ret) {
>+		end_block_id = block_id;
>+		for (block_id = start_block_id; block_id != end_block_id;
>+		     block_id++) {
>+			mem = find_memory_block_by_id(block_id, NULL);
>+			mem->section_count = 0;
>+			unregister_memory(mem);
>+		}
> 	}

Would it be better to do this in reverse order?

And unregister_memory() would free mem, so it is still necessary to set
section_count to 0?

>-
>-out:
> 	mutex_unlock(&mem_sysfs_mutex);
> 	return ret;
> }
> 
>-static void
>-unregister_memory(struct memory_block *memory)
>-{
>-	BUG_ON(memory->dev.bus != &memory_subsys);
>-
>-	/* drop the ref. we got via find_memory_block() */
>-	put_device(&memory->dev);
>-	device_unregister(&memory->dev);
>-}
>-
> void unregister_memory_section(struct mem_section *section)
> {
> 	struct memory_block *mem;
>diff --git a/include/linux/memory.h b/include/linux/memory.h
>index 474c7c60c8f2..db3e8567f900 100644
>--- a/include/linux/memory.h
>+++ b/include/linux/memory.h
>@@ -111,7 +111,7 @@ extern int register_memory_notifier(struct notifier_block *nb);
> extern void unregister_memory_notifier(struct notifier_block *nb);
> extern int register_memory_isolate_notifier(struct notifier_block *nb);
> extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
>-int hotplug_memory_register(int nid, struct mem_section *section);
>+int create_memory_block_devices(unsigned long start, unsigned long size);
> extern void unregister_memory_section(struct mem_section *);
> extern int memory_dev_init(void);
> extern int memory_notify(unsigned long val, void *v);
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 4b9d2974f86c..b1fde90bbf19 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -259,13 +259,7 @@ static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
> 		return -EEXIST;
> 
> 	ret = sparse_add_one_section(nid, phys_start_pfn, altmap);
>-	if (ret < 0)
>-		return ret;
>-
>-	if (!want_memblock)
>-		return 0;
>-
>-	return hotplug_memory_register(nid, __pfn_to_section(phys_start_pfn));
>+	return ret < 0 ? ret : 0;
> }
> 
> /*
>@@ -1107,6 +1101,13 @@ int __ref add_memory_resource(int nid, struct resource *res)
> 	if (ret < 0)
> 		goto error;
> 
>+	/* create memory block devices after memory was added */
>+	ret = create_memory_block_devices(start, size);
>+	if (ret) {
>+		arch_remove_memory(nid, start, size, NULL);
>+		goto error;
>+	}
>+
> 	if (new_node) {
> 		/* If sysfs file of new node can't be created, cpu on the node
> 		 * can't be hot-added. There is no rollback way now.
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
