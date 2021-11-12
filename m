Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB98344ECA8
	for <lists+linux-sh@lfdr.de>; Fri, 12 Nov 2021 19:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhKLShh (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 12 Nov 2021 13:37:37 -0500
Received: from mail-qt1-f180.google.com ([209.85.160.180]:34421 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhKLShh (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 12 Nov 2021 13:37:37 -0500
Received: by mail-qt1-f180.google.com with SMTP id o17so9362276qtk.1
        for <linux-sh@vger.kernel.org>; Fri, 12 Nov 2021 10:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NOaTkC0hFskxr7Gv8XzcUyFNDkI4w0bcx3Kr6ryRD1w=;
        b=ZQO/TQ54PxQ9vhIE5ojylZ1SB3/UElmQjJo+LrGOPif6nG5hTzzyuOIlpIjPRk/r+R
         pYnUZn23383nlbFl1NvYEfb2ZvhEsF3OFYhhmxPNFdtz7Hg853eIuOheAzhimodhqHhI
         ZRL18vWanAH9XjHfcb9FervBaBfXtqDNMdyUNYJFaEVjNSh9QoVsCqaNdqTwsLCSTGcw
         KQOZUy1gUSG/pbY5O+/2Rj+nCOwKvviylg2IUfCYuqP65O2fRnx6zdxaa2aUG2X05RuD
         063pnzDwv85fXZHMbuI7YVytN9hEG6ogoPZEdXeJKimeJ9Y+yJ1kd878w33a+iVcUi+7
         o6WA==
X-Gm-Message-State: AOAM531UuTt++M5QeSb7XzhyfzTnBU8EN6aQ2+B+PgxZmigqFRE35n02
        eSPU96qvlY3Dfw2G254mkvAsM9227F8=
X-Google-Smtp-Source: ABdhPJy9dojtGgpq5sufRMrdeau4uC0tb6HjcHGsBDRAgrmpRo8lDZ6aU9q5CmBPagF7/rID6zZkKg==
X-Received: by 2002:ac8:7f03:: with SMTP id f3mr18239206qtk.320.1636742085784;
        Fri, 12 Nov 2021 10:34:45 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id l2sm3516494qtk.41.2021.11.12.10.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 10:34:45 -0800 (PST)
Date:   Fri, 12 Nov 2021 13:34:43 -0500
From:   Dennis Zhou <dennis@kernel.org>
To:     Rich Felker <dalias@libc.org>
Cc:     Rob Landley <rob@landley.net>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Fix the j-core SOC build.
Message-ID: <YY6zw5PmrOPMdJ6C@fedora>
References: <7d559bd1-1f9c-124f-ad4d-c805c049971a@landley.net>
 <20211003021851.GA2559@brightrain.aerifal.cx>
 <20211110213345.GK7074@brightrain.aerifal.cx>
 <20211111005312.GM7074@brightrain.aerifal.cx>
 <YYx5ZuWFSNOu/wah@fedora>
 <20211111141621.GN7074@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111141621.GN7074@brightrain.aerifal.cx>
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Nov 11, 2021 at 09:16:22AM -0500, Rich Felker wrote:
> On Wed, Nov 10, 2021 at 09:01:10PM -0500, Dennis Zhou wrote:
> > Hello,
> > 
> > On Wed, Nov 10, 2021 at 07:53:13PM -0500, Rich Felker wrote:
> > > On Wed, Nov 10, 2021 at 04:33:46PM -0500, Rich Felker wrote:
> > > > On Sat, Oct 02, 2021 at 10:18:51PM -0400, Rich Felker wrote:
> > > > > On Sat, Oct 02, 2021 at 02:32:15PM -0500, Rob Landley wrote:
> > > > > > From: Rob Landley <rob@landley.net>
> > > > > > 
> > > > > > Commit b67177ecd956 broke the j-core SOC build with a link failure, because
> > > > > > mm/percpu.c function pcpu_post_unmap_tlb_flush() calls flush_tlb_kernel_range()
> > > > > > which is defined under #ifdef CONFIG_MMU.
> > > > > > 
> > > > > > Signed-off-by: Rob Landley <rob@landley.net>
> > > > > > ---
> > > > > > 
> > > > > >  arch/sh/kernel/smp.c |    5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
> > > > > > index 65924d9ec245..3ec8f32aad85 100644
> > > > > > --- a/arch/sh/kernel/smp.c
> > > > > > +++ b/arch/sh/kernel/smp.c
> > > > > > @@ -468,4 +468,9 @@ void flush_tlb_one(unsigned long asid, unsigned long vaddr)
> > > > > >  	local_flush_tlb_one(asid, vaddr);
> > > > > >  }
> > > > > > 
> > > > > > +#else
> > > > > > +void flush_tlb_kernel_range(unsigned long start, unsigned long end)
> > > > > > +{
> > > > > > +	local_flush_tlb_all();
> > > > > > +}
> > > > > >  #endif
> > > > > 
> > > > > local_flush_tlb_all() is defined in arch/sh/mm/nommu.c as BUG(); so
> > > > > this is most likely wrong unless it just doesn't get called. I think
> > > > > there should probably be something at a very general level dummying
> > > > > out these functions/macros on nommu but I don't know where it should
> > > > > be.
> > > > 
> > > > I've looked into this some more, and while arch/arm does dummy its
> > > > equivalent functions out on nommu, arch/sh has always had them as
> > > > BUG(), and indeed it makes some sense to catch erroneous usage.
> > > > pcpu_post_unmap_tlb_flush should probably have the flush under #ifdef
> > > > CONFIG_MMU or something.
> > > > 
> > > > I've added the author of the commit that broke this to Cc in case he
> > > > has any thoughts.
> > > 
> > > I think we actually have the wrong commit to blame; it looks like
> > > 93274f1dd6b0 ("percpu: flush tlb in pcpu_reclaim_populated()") added
> > > the TLB flush. However, this rabbit hole seems to go a lot deeper.
> > > According to the comments in the files, percpu-km.c, not percpu-vm.c,
> > > is supposed to be used on nommu archs. However, mm/Kconfig has
> > > NEED_PER_CPU_KM depending on !SMP rather than !SMP || !MMU, which
> > > mismatches the comments in the source. So should we be trying to fix
> > > the Kconfig constraints to use -km? Or fixing -vm to work on nommu
> > > like it used to?
> > > 
> > > Rich
> > 
> > I'm surprised I haven't heard any reports of this until now. Thanks for
> > ccing me. Fwiw, it's generally good to cc the author / subsystem
> > maintainer when there is an issue.
> 
> Thanks for the quick reply!
> 

Sorry, I've had to think about this a little bit.

> > I would need to think about it a little bit more, but I think
> > percpu-km.c was written more in the mindset of !MMU == !SMP. It sounds
> > like for superh that's not true.
> 
> Indeed, it's possible we have the only NOMMU+SMP system Linux
> currently runs on; if so that makes it something of a good smoke test
> for corner cases. J2 users just haven't kept up with the last few
> kernel releases, so the breakage went unnoticed for a while until
> resyncing with current.
> 

So NOMMU+SMP is the odd case out. How percpu works is by creating
regions in the VMA that are a fixed offset apart. With NOMMU, this means
if we don't find physical addresses to suffice the initial condition
we're going to fail allocations. My guess is that these machines have a
fairly limited amount of memory so it isn't an issue.

> > Given that, if sh has no MMU, then it really should be using percpu-km.c
> > not percpu-vm.c as there is no notion of unpopulated pages for that
> > configuration. I think we should fix the Kconfig constraints and give
> > that a shot. I didn't have any known users of !mmu/percpu-km.c, so I
> > didn't want to make the changes without someone verifying it or needing
> > it.
> 
> I'm not familiar with the different percpu implementations, and
> apparently up til now we've been using percpu-vm.c without noticing
> any problem. In concept, should both be usable, or was it just an
> accident that it worked?
> 
> Does it suffice to do:
> 
>  config NEED_PER_CPU_KM
> -       depends on !SMP
> +       depends on !SMP || !MMU
> 
> or should we also have:
> 
> +       select NEED_PER_CPU_KM if !MMU && SMP
> 
> for arch/sh/Kconfig to ensure there's a conflict if it can't be
> selected? (Or, should this logic be higher level and not
> arch-dependent?)
> 
> I'm not sure if there are any NOMMU+SMP ARM systems Linux supports,
> but FYI ARM has no-op implementations of all the TLB flush functions
> (whereas arch/sh is missing some and has BUG() for others), so it's
> possible the same thing is happening on ARM and just not exhibiting
> any outwardly wrong behaviors.
> 

Continuing my explanation above, percpu on !SMP is just a pass through
allocation. Percpu can just blindly allocate memory and work as an
identity mapped pass through. So !SMP == NEED_PER_CPU_KM.

The tricky part is we still need to space the allocations which is what
percpu-vm.c kind of conflates with having an MMU and paging. SMP really
needs that part of percpu-vm.c not the vmalloc part.

So really, the appropriate fix would be to split out the address
allocation logic from the paging logic of percpu. This way backing can
occur through percpu-km.c for NOMMU+SMP. Unfortunately that is quite a
bit of work that I don't have the bandwidth for right now.

As a stop gap, I think we can get away with just stubbing out the tlb
flush as you've done and not bugging out on it because in the NOMMU+SMP
land, we need to get that specific address and not anything else. Doing
so should still be fine if my assumption about J2 being a small machine
is correct.

Thanks,
Dennis
