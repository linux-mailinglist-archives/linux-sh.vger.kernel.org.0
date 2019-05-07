Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C889916D24
	for <lists+linux-sh@lfdr.de>; Tue,  7 May 2019 23:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfEGVZ5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 May 2019 17:25:57 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45020 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbfEGVZ5 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 May 2019 17:25:57 -0400
Received: by mail-oi1-f194.google.com with SMTP id y25so6450869oih.11
        for <linux-sh@vger.kernel.org>; Tue, 07 May 2019 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrWLvelkD+mNuwk6Y9UcbtBZNb2SYcW2Bv4WekgkKa4=;
        b=niDOApxCFCnbMJ6JJnVXhAHXcDpvPX0VOIgX598FWvGb20NBKEjOLMGunPMCtT8w07
         CCUklL9XVIwM7XeXqt4R3SwqsQHc45UygSnPA7Vo5/Vcu6vZ67h+LQUBL4TP5gSuL9M8
         yOCXLz75NneW+bv+FADtD51VYmKLmjMo3ehqiItMgltR15OKUblt6t5oABGwZobyxZvY
         uoFoyjDvezyaKUeVwPy/0Ey+uAiBGDemhG0P5C7K98cYeXWIsdK4jIuVnW31DT+YwKBS
         axg9qxXBQfbqQqPbEvS+gX/40W5Qtk0I8uy1AfjO2oRgk00fIcb94S9PEZI5nxKZfbNK
         pzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrWLvelkD+mNuwk6Y9UcbtBZNb2SYcW2Bv4WekgkKa4=;
        b=b3bIfxHXyw9KZxUFIhvUaH8C4vHFzxEWJd9Zt33czPKz7evRpgpIJzxxASb0wm+MAE
         YwI4gi83YXF8Oa7MBxLaTjU/UbUW0V+hHRKCXBnvMxcAiX7a86jH5aogJ3C0JWX5Ps/c
         UaLdUCt+QLQn1lgRO92rp0UXWsnU7U5czZnKuyB68YB6cNl8Em/+mlOESUjndCYlIAwJ
         ZnoDdpEHXGmrhNBxoZjtfnjIm94Gpl9pxCpWhvPr4oYf07G2SF/a07dxBis4hY7Uk18n
         bsXuw8Vn4+uvjJbmqE0nFi8jWWe7nYQe+llOGylyjQV8NBcMVPXo6zh/TqiLulQy5vJX
         tnLg==
X-Gm-Message-State: APjAAAWd6SZvRw9EgcfbvAvk3dSIJj9gGMttiFiZsJ2ZRe0X/wyVddh4
        Tffil/Tlc3yLsdVTPxDUAiUqKRs1FFLhciYRlfJ+Ow==
X-Google-Smtp-Source: APXvYqzSvx7ljHyQCsbhoL+yq/IdpsbLQ8T4Uq4lItlX5+hsXeerJKyAq6+adzcHddCXxdDwo8WpxyHJeKyxh7hOkws=
X-Received: by 2002:aca:220f:: with SMTP id b15mr357563oic.73.1557264355934;
 Tue, 07 May 2019 14:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-6-david@redhat.com>
 <CAPcyv4ge1pSOopfHof4USn=7Skc-UV4Xhd_s=h+M9VXSp_p1XQ@mail.gmail.com> <d83fec16-ceff-2f6f-72e1-48996187d5ba@redhat.com>
In-Reply-To: <d83fec16-ceff-2f6f-72e1-48996187d5ba@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 14:25:45 -0700
Message-ID: <CAPcyv4iRQteuT9yESvbUyhp3KVVgTXDiGAo+TwPCM_4f0CzBgg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, Qian Cai <cai@lca.pw>,
        Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 7, 2019 at 2:24 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 07.05.19 23:19, Dan Williams wrote:
> > On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> No longer needed, the callers of arch_add_memory() can handle this
> >> manually.
> >>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Michal Hocko <mhocko@suse.com>
> >> Cc: Oscar Salvador <osalvador@suse.com>
> >> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> >> Cc: Wei Yang <richard.weiyang@gmail.com>
> >> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> >> Cc: Qian Cai <cai@lca.pw>
> >> Cc: Arun KS <arunks@codeaurora.org>
> >> Cc: Mathieu Malaterre <malat@debian.org>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  include/linux/memory_hotplug.h | 8 --------
> >>  mm/memory_hotplug.c            | 9 +++------
> >>  2 files changed, 3 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> >> index 2d4de313926d..2f1f87e13baa 100644
> >> --- a/include/linux/memory_hotplug.h
> >> +++ b/include/linux/memory_hotplug.h
> >> @@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
> >>  extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
> >>                            unsigned long nr_pages, struct vmem_altmap *altmap);
> >>
> >> -/*
> >> - * Do we want sysfs memblock files created. This will allow userspace to online
> >> - * and offline memory explicitly. Lack of this bit means that the caller has to
> >> - * call move_pfn_range_to_zone to finish the initialization.
> >> - */
> >> -
> >> -#define MHP_MEMBLOCK_API               (1<<0)
> >> -
> >>  /* reasonably generic interface to expand the physical pages */
> >>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> >>                        struct mhp_restrictions *restrictions);
> >> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >> index e1637c8a0723..107f72952347 100644
> >> --- a/mm/memory_hotplug.c
> >> +++ b/mm/memory_hotplug.c
> >> @@ -250,7 +250,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
> >>  #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
> >>
> >>  static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
> >> -               struct vmem_altmap *altmap, bool want_memblock)
> >> +                                  struct vmem_altmap *altmap)
> >>  {
> >>         int ret;
> >>
> >> @@ -293,8 +293,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
> >>         }
> >>
> >>         for (i = start_sec; i <= end_sec; i++) {
> >> -               err = __add_section(nid, section_nr_to_pfn(i), altmap,
> >> -                               restrictions->flags & MHP_MEMBLOCK_API);
> >> +               err = __add_section(nid, section_nr_to_pfn(i), altmap);
> >>
> >>                 /*
> >>                  * EEXIST is finally dealt with by ioresource collision
> >> @@ -1066,9 +1065,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
> >>   */
> >>  int __ref add_memory_resource(int nid, struct resource *res)
> >>  {
> >> -       struct mhp_restrictions restrictions = {
> >> -               .flags = MHP_MEMBLOCK_API,
> >> -       };
> >> +       struct mhp_restrictions restrictions = {};
> >
> > With mhp_restrictions.flags no longer needed, can we drop
> > mhp_restrictions and just go back to a plain @altmap argument?
> >
>
> Oscar wants to use it to configure from where to allocate vmemmaps. That
> was the original driver behind it.
>

Ah, ok, makes sense.
