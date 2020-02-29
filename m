Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFEA1749D9
	for <lists+linux-sh@lfdr.de>; Sat, 29 Feb 2020 23:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbgB2WsB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 29 Feb 2020 17:48:01 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44198 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbgB2Wr6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 29 Feb 2020 17:47:58 -0500
Received: by mail-ot1-f65.google.com with SMTP id v22so1598900otq.11
        for <linux-sh@vger.kernel.org>; Sat, 29 Feb 2020 14:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rTAnPPQPQ2zDwIh6KNULPqO4A3SBF/aTaf3+a0KIRA=;
        b=09+H6QEX0IFkK+L3p4GHO6Y0ATs+adHreQcu1bdLJyN+n2Vgctq6CmsN235zfYz7cz
         Zjowwp86NseHUm8hZsO+r0jOlHoaSUrXGunU/rqFwsJ1s7n5AN8EwU8Ta7ZV68MEDMoy
         cYFY629qtjE7k7S8TFWxiMwDorJu8ZM8TrjzCM6bvmFSocUCibA7lH7EUmIS6yLAffHg
         Ym9Ff+mKB4LVR21VHWSFek6dY5HD72PiWKRZfpQCH7KVSONiX3j+r8BDKOrr5WjC/edI
         3j/m/eKnMAevYsWQnEm1mQYYcl4k+knJqW8Hze1OVUGbNTe30vZzkPj3LXSahhmiaB5B
         dHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rTAnPPQPQ2zDwIh6KNULPqO4A3SBF/aTaf3+a0KIRA=;
        b=KDm56wKJLeavX1kDdyXyFnhjyFTOY8BwAbhla1JoILrzvxTduFRdkSEyXG3NdA2zGU
         aXtgx4LWAP2W6sb57H7IR4w5ZYyao+Doi+POhQeH8h4hMBJJmZ2JA754LPJE1lyL5OMn
         sJvx7Yfp4tgxGkCIzZBHh9HkxUoxQqwMOUhROjcBH/KOUJPzt1jWQArKdw7ZO25+4OlU
         lHIZuYrNTy/WLYsAr5ncQaIf5vLeoZVK6WV0FaFYx7Rp3KoR81gO+yGrNkx0FCVLJbIM
         8b66mDkY+lOewnTuHLFh+kXPXnSA1Cy4OE0cG33Y3rstIMygqCEss8kKUUjfftblQfwX
         x4Lg==
X-Gm-Message-State: APjAAAWeWXuGEq9JyDLlWMiHRBmSauPV4ZxYvIGpF/BkS5WGnW+RduOu
        qku687PX4fxd4+UO67KqK60n5RKaYuvhDjD4ZEJPvA==
X-Google-Smtp-Source: APXvYqwSzpqJpUKxRtH4EHX0XgauIJ4nXMymmXz192v5Aj+PoXy5ct4ECYTcjg/oqiVXoujFwDEj//qBNgc38LEqyHw=
X-Received: by 2002:a9d:5d09:: with SMTP id b9mr8013603oti.207.1583016478029;
 Sat, 29 Feb 2020 14:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-8-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-8-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 29 Feb 2020 14:47:47 -0800
Message-ID: <CAPcyv4gNi3sesGnujShStoF8bi8kYg+MQkqhQRCT_1+wex5wbw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mm/memremap: Set caching mode for PCI P2PDMA
 memory to WC
To:     Logan Gunthorpe <logang@deltatee.com>
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
        Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> PCI BAR IO memory should never be mapped as WB, however prior to this
> the PAT bits were set WB and it was typically overridden by MTRR
> registers set by the firmware.
>
> Set PCI P2PDMA memory to be WC (writecombining) as the only current
> user (the NVMe CMB) was originally mapped WC before the P2PDMA code
> replaced the mapping with devm_memremap_pages().

Will the change to UC regress this existing use case?

>
> Future use-cases may need to generalize this by adding flags to
> select the caching type, as some P2PDMA cases will not want WC.
> However, those use-cases are not upstream yet and this can be changed
> when they arrive.
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  mm/memremap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 06742372a203..8d141c3e3364 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -190,7 +190,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>                 }
>                 break;
>         case MEMORY_DEVICE_DEVDAX:
> +               need_devmap_managed = false;
> +               break;
>         case MEMORY_DEVICE_PCI_P2PDMA:
> +               params.pgprot = pgprot_writecombine(params.pgprot);

Approach looks good to me, modulo Jason's comment that this should be
UC. Upcoming DAX changes will want to pass this via pgmap, but as you
say this can wait for this changes to arrive.

After change to UC:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
