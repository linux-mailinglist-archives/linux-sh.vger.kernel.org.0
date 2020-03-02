Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5118176354
	for <lists+linux-sh@lfdr.de>; Mon,  2 Mar 2020 19:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgCBSzg (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 2 Mar 2020 13:55:36 -0500
Received: from ale.deltatee.com ([207.54.116.67]:57010 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727360AbgCBSzg (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 2 Mar 2020 13:55:36 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.92)
        (envelope-from <logang@deltatee.com>)
        id 1j8qDo-0005xH-8O; Mon, 02 Mar 2020 11:55:21 -0700
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
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
        Eric Badger <ebadger@gigaio.com>,
        Michal Hocko <mhocko@suse.com>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-7-logang@deltatee.com>
 <CAPcyv4gR1+NaWzteqNKip=cYk89oEVW18HNao7Xv=JipzzDagw@mail.gmail.com>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <8b13f6aa-77b7-a47d-1a49-b8e2f800ac9d@deltatee.com>
Date:   Mon, 2 Mar 2020 11:55:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gR1+NaWzteqNKip=cYk89oEVW18HNao7Xv=JipzzDagw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: mhocko@suse.com, ebadger@gigaio.com, peterz@infradead.org, luto@kernel.org, dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com, tglx@linutronix.de, benh@kernel.crashing.org, will@kernel.org, catalin.marinas@arm.com, hch@lst.de, akpm@linux-foundation.org, david@redhat.com, mhocko@kernel.org, linux-mm@kvack.org, platform-driver-x86@vger.kernel.org, linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        SURBL_BLOCKED,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: Re: [PATCH v3 6/7] mm/memory_hotplug: Add pgprot_t to mhp_params
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 2020-02-29 3:44 p.m., Dan Williams wrote:
> On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>> devm_memremap_pages() is currently used by the PCI P2PDMA code to create
>> struct page mappings for IO memory. At present, these mappings are created
>> with PAGE_KERNEL which implies setting the PAT bits to be WB. However, on
>> x86, an mtrr register will typically override this and force the cache
>> type to be UC-. In the case firmware doesn't set this register it is
>> effectively WB and will typically result in a machine check exception
>> when it's accessed.
>>
>> Other arches are not currently likely to function correctly seeing they
>> don't have any MTRR registers to fall back on.
>>
>> To solve this, provide a way to specify the pgprot value explicitly to
>> arch_add_memory().
>>
>> Of the arches that support MEMORY_HOTPLUG: x86_64, and arm64 need a simple
>> change to pass the pgprot_t down to their respective functions which set
>> up the page tables. For x86_32, set the page tables explicitly using
>> _set_memory_prot() (seeing they are already mapped). For ia64, s390 and
>> sh, reject anything but PAGE_KERNEL settings -- this should be fine,
>> for now, seeing these architectures don't support ZONE_DEVICE.
>>
>> A check in __add_pages() is also added to ensure the pgprot parameter was
>> set for all arches.
>>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Michal Hocko <mhocko@suse.com>
>> ---
>>  arch/arm64/mm/mmu.c            | 3 ++-
>>  arch/ia64/mm/init.c            | 3 +++
>>  arch/powerpc/mm/mem.c          | 3 ++-
>>  arch/s390/mm/init.c            | 3 +++
>>  arch/sh/mm/init.c              | 3 +++
>>  arch/x86/mm/init_32.c          | 5 +++++
>>  arch/x86/mm/init_64.c          | 2 +-
>>  include/linux/memory_hotplug.h | 2 ++
>>  mm/memory_hotplug.c            | 5 ++++-
>>  mm/memremap.c                  | 6 +++---
>>  10 files changed, 28 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ee37bca8aba8..ea3fa844a8a2 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1058,7 +1058,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>                 flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>
>>         __create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>> -                            size, PAGE_KERNEL, __pgd_pgtable_alloc, flags);
>> +                            size, params->pgprot, __pgd_pgtable_alloc,
>> +                            flags);
>>
>>         memblock_clear_nomap(start, size);
>>
>> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
>> index 97bbc23ea1e3..d637b4ea3147 100644
>> --- a/arch/ia64/mm/init.c
>> +++ b/arch/ia64/mm/init.c
>> @@ -676,6 +676,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>         unsigned long nr_pages = size >> PAGE_SHIFT;
>>         int ret;
>>
>> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot))
>> +               return -EINVAL;
>> +
>>         ret = __add_pages(nid, start_pfn, nr_pages, params);
>>         if (ret)
>>                 printk("%s: Problem encountered in __add_pages() as ret=%d\n",
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index 19b1da5d7eca..832412bc7fad 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -138,7 +138,8 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>>         resize_hpt_for_hotplug(memblock_phys_mem_size());
>>
>>         start = (unsigned long)__va(start);
>> -       rc = create_section_mapping(start, start + size, nid, PAGE_KERNEL);
>> +       rc = create_section_mapping(start, start + size, nid,
>> +                                   params->pgprot);
>>         if (rc) {
>>                 pr_warn("Unable to create mapping for hot added memory 0x%llx..0x%llx: %d\n",
>>                         start, start + size, rc);
>> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
>> index e9e4a7abd0cc..87b2d024e75a 100644
>> --- a/arch/s390/mm/init.c
>> +++ b/arch/s390/mm/init.c
>> @@ -277,6 +277,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>         if (WARN_ON_ONCE(params->altmap))
>>                 return -EINVAL;
>>
>> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot))
>> +               return -EINVAL;
>> +
>>         rc = vmem_add_mapping(start, size);
>>         if (rc)
>>                 return rc;
>> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
>> index e5114c053364..b9de2d4fa57e 100644
>> --- a/arch/sh/mm/init.c
>> +++ b/arch/sh/mm/init.c
>> @@ -412,6 +412,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>         unsigned long nr_pages = size >> PAGE_SHIFT;
>>         int ret;
>>
>> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot)
>> +               return -EINVAL;
>> +
>>         /* We only have ZONE_NORMAL, so this is easy.. */
>>         ret = __add_pages(nid, start_pfn, nr_pages, params);
>>         if (unlikely(ret))
>> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
>> index e25a4218e6ff..96d8e4fb1cc8 100644
>> --- a/arch/x86/mm/init_32.c
>> +++ b/arch/x86/mm/init_32.c
>> @@ -858,6 +858,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  {
>>         unsigned long start_pfn = start >> PAGE_SHIFT;
>>         unsigned long nr_pages = size >> PAGE_SHIFT;
>> +       int ret;
>> +
>> +       ret = _set_memory_prot(start, nr_pages, params->pgprot);
> 
> Perhaps a comment since it's not immediately obvious where the
> PAGE_KERNEL prot was established, and perhaps add a conditional to
> skip this call in the param->pgprot == PAGE_KERNEL case?

Yes I can add the skip in the PAGE_KERNEL case. Though I'm not sure what
you are asking for with regards to the comment. Just that pgprot is set
by the caller usually to PAGE_KERNEL?

> Other than that looks good to me, but only an ack since I'm only
> testing the x86 changes.
> 
> Acked-by: Dan Williams <dan.j.williams@intel.com>


Thanks,

Logan
