Return-Path: <linux-sh+bounces-927-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B18B410F
	for <lists+linux-sh@lfdr.de>; Fri, 26 Apr 2024 23:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACAD1C21688
	for <lists+linux-sh@lfdr.de>; Fri, 26 Apr 2024 21:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCCA364DF;
	Fri, 26 Apr 2024 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAvSyhEx"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C082C85C
	for <linux-sh@vger.kernel.org>; Fri, 26 Apr 2024 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166434; cv=none; b=O4EJ8VKYhK+LTKzDTWWw4MPUpb97aiVZEWEmqAFZ1WmlZY2wv2rVdzSH0FzgHNPa/zvBCyAFRZACIjnO6moGope/B48QPB44mBmZ69WEq6J2aeg8V/DVJUfCLlZ5+AofgXN7iWo3CltSz8j1w++1PZni18Xd0Y4PsLRKgGcT8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166434; c=relaxed/simple;
	bh=4vfm25pSWYhum0iyZmhm+a6ab8flrVN/ajfV1srkvHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TMvSUFtoXKjF4fb+BoztDIRxl8gIwaE0bzvXQEQWzCMBcVOb3mXjul8jwjcsPlfZLMS6+oX8/2fIorWeiVGgU/oOxgpoug7Xro679j5aW48FH3gE8sQ7C/gkl25NsGfBvN5Wzw2ZNFxFlsrdGFxelHk0SDXGUdIkUr2taNVaB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAvSyhEx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714166431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YE+xroN3MSFRA2YVeljr0pVRi5jEiA/gyhgABPdlML0=;
	b=HAvSyhExdDwAOkJN2oS7gAPBMel1G/cWvzSLh92KzfTSdAND2LHmOzoM0YPVLo6WRmU92X
	0wokrtDtLuAsHuMjLgJ2Vv75nCtZdJ8IZvhMGV5K6WUh1Xmgf2j/Ut432TRwvmSHPpBdkx
	BDIiLosyAsrDWONa5E+l+IgrAgGu1k0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-5_54xRtsNSCw2fZQfYTfNA-1; Fri, 26 Apr 2024 17:20:28 -0400
X-MC-Unique: 5_54xRtsNSCw2fZQfYTfNA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69b147e856aso6540236d6.1
        for <linux-sh@vger.kernel.org>; Fri, 26 Apr 2024 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166428; x=1714771228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE+xroN3MSFRA2YVeljr0pVRi5jEiA/gyhgABPdlML0=;
        b=oOJEq1qIP+Cj4GCx2Qx5SoWPXG5+e/QVrTW3LoF1PiLJMNOGfEcT9K0eFqeVHvWZcj
         FxH0Wn0gX+m1Niji4yX3lD14OeGPHIg8ka8b8mHW4ZQzvP6UDTbW1bnG+gsP6q00gSeg
         k3EGCkwmru7CFMuTGb8nDJTrKecr+wps5Tro1YiXY3xB+n5Q8leFdMR7THmBq/82TRMU
         yjUTNpJUiZ7q1srXS2jBclyDSsZgs00kJ7q4J347511RwtOZbb0CdklJNmxgSTh6tWxZ
         fndWD8px/L2ef8iLOgDHfTcuRGxsCO5lwOy1Fzy3iqjgU9TUtjp+D8iyA8IwgcVghvpQ
         S9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeVCHqUMV37FDkXRUDvRpNkYQhWu7I7gp5QrGNrMLa7KZ1hSBmhlBF5L/9mPhBTnPdoJf563Lq5Zxg6/57MaztSVx0NMs1+1I=
X-Gm-Message-State: AOJu0Yyz2vzjx6cH+SbqFP2AwUUDJbmCoeAbN5850Iu+zR4S3+f20XIM
	/jSnajey1WaV2swxgAALQPuzIxQQ2gYErHBaEmbfZ2Tr/HGEkXG3ayDZDAgTTPVf8BIbv/QB9yn
	uFAWKxwzuHklK++HfIPIwDSyf4RP70yS+KaebyUaUPA8kR+G+q3YIBemk
X-Received: by 2002:a05:620a:4089:b0:790:8c20:e281 with SMTP id f9-20020a05620a408900b007908c20e281mr4399203qko.4.1714166427238;
        Fri, 26 Apr 2024 14:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfzashahVyLrvAJ9qdUfNGidrRIiANL3lMVu3kzLvmX9ZvfaFZoyGy8b+LUj3RVEq076HTsg==
X-Received: by 2002:a05:620a:4089:b0:790:8c20:e281 with SMTP id f9-20020a05620a408900b007908c20e281mr4399166qko.4.1714166426469;
        Fri, 26 Apr 2024 14:20:26 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id oo8-20020a05620a530800b0078d693c0b4bsm8243842qkn.135.2024.04.26.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:20:26 -0700 (PDT)
Date: Fri, 26 Apr 2024 17:20:23 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <Ziwal-SucIye3hPM@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n>
 <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 26, 2024 at 07:28:31PM +0200, David Hildenbrand wrote:
> On 26.04.24 18:12, Peter Xu wrote:
> > On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
> > > On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
> > > > On 02.04.24 14:55, David Hildenbrand wrote:
> > > > > Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> > > > > all relevant internal functions to start with "gup_fast", to make it
> > > > > clearer that this is not ordinary GUP. The current mixture of
> > > > > "lockless", "gup" and "gup_fast" is confusing.
> > > > > 
> > > > > Further, avoid the term "huge" when talking about a "leaf" -- for
> > > > > example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> > > > > "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> > > > > stays.
> > > > > 
> > > > > What remains is the "external" interface:
> > > > > * get_user_pages_fast_only()
> > > > > * get_user_pages_fast()
> > > > > * pin_user_pages_fast()
> > > > > 
> > > > > The high-level internal functions for GUP-fast (+slow fallback) are now:
> > > > > * internal_get_user_pages_fast() -> gup_fast_fallback()
> > > > > * lockless_pages_from_mm() -> gup_fast()
> > > > > 
> > > > > The basic GUP-fast walker functions:
> > > > > * gup_pgd_range() -> gup_fast_pgd_range()
> > > > > * gup_p4d_range() -> gup_fast_p4d_range()
> > > > > * gup_pud_range() -> gup_fast_pud_range()
> > > > > * gup_pmd_range() -> gup_fast_pmd_range()
> > > > > * gup_pte_range() -> gup_fast_pte_range()
> > > > > * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> > > > > * gup_huge_pud()  -> gup_fast_pud_leaf()
> > > > > * gup_huge_pmd()  -> gup_fast_pmd_leaf()
> > > > > 
> > > > > The weird hugepd stuff:
> > > > > * gup_huge_pd() -> gup_fast_hugepd()
> > > > > * gup_hugepte() -> gup_fast_hugepte()
> > > > 
> > > > I just realized that we end up calling these from follow_hugepd() as well.
> > > > And something seems to be off, because gup_fast_hugepd() won't have the VMA
> > > > even in the slow-GUP case to pass it to gup_must_unshare().
> > > > 
> > > > So these are GUP-fast functions and the terminology seem correct. But the
> > > > usage from follow_hugepd() is questionable,
> > > > 
> > > > commit a12083d721d703f985f4403d6b333cc449f838f6
> > > > Author: Peter Xu <peterx@redhat.com>
> > > > Date:   Wed Mar 27 11:23:31 2024 -0400
> > > > 
> > > >      mm/gup: handle hugepd for follow_page()
> > > > 
> > > > 
> > > > states "With previous refactors on fast-gup gup_huge_pd(), most of the code
> > > > can be leveraged", which doesn't look quite true just staring the the
> > > > gup_must_unshare() call where we don't pass the VMA. Also,
> > > > "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
> > > > slow GUP ...
> > > 
> > > Yes it's not needed, just doesn't look worthwhile to put another helper on
> > > top just for this.  I mentioned this in the commit message here:
> > > 
> > >    There's something not needed for follow page, for example, gup_hugepte()
> > >    tries to detect pgtable entry change which will never happen with slow
> > >    gup (which has the pgtable lock held), but that's not a problem to check.
> > > 
> > > > 
> > > > @Peter, any insights?
> > > 
> > > However I think we should pass vma in for sure, I guess I overlooked that,
> > > and it didn't expose in my tests too as I probably missed ./cow.
> > > 
> > > I'll prepare a separate patch on top of this series and the gup-fast rename
> > > patches (I saw this one just reached mm-stable), and I'll see whether I can
> > > test it too if I can find a Power system fast enough.  I'll probably drop
> > > the "fast" in the hugepd function names too.
> > 
> 
> For the missing VMA parameter, the cow.c test might not trigger it. We never need the VMA to make
> a pinning decision for anonymous memory. We'll trigger an unsharing fault, get an exclusive anonymous page
> and can continue.
> 
> We need the VMA in gup_must_unshare(), when long-term pinning a file hugetlb page. I *think*
> the gup_longterm.c selftest should trigger that, especially:
> 
> # [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
> ...
> # [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (1048576 kB)
> 
> 
> We need a MAP_SHARED page where the PTE is R/O that we want to long-term pin R/O.
> I don't remember from the top of my head if the test here might have a R/W-mapped
> folio. If so, we could extend it to cover that.

Let me try both then.

> 
> > Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.
> > 
> >    # ./cow  | grep -B1 "not ok"
> >    # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
> >    not ok 161 No leak from parent into child
> >    --
> >    # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
> >    not ok 215 No leak from parent into child
> >    --
> >    # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
> >    not ok 269 No leak from child into parent
> >    --
> >    # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
> >    not ok 323 No leak from child into parent
> > 
> > And it looks like it was always failing.. perhaps since the start?  We
> 
> Yes!
> 
> commit 7dad331be7816103eba8c12caeb88fbd3599c0b9
> Author: David Hildenbrand <david@redhat.com>
> Date:   Tue Sep 27 13:01:17 2022 +0200
> 
>     selftests/vm: anon_cow: hugetlb tests
>     Let's run all existing test cases with all hugetlb sizes we're able to
>     detect.
>     Note that some tests cases still fail. This will, for example, be fixed
>     once vmsplice properly uses FOLL_PIN instead of FOLL_GET for pinning.
>     With 2 MiB and 1 GiB hugetlb on x86_64, the expected failures are:
>      # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
>      not ok 23 No leak from parent into child
>      # [RUN] vmsplice() + unmap in child ... with hugetlb (1048576 kB)
>      not ok 24 No leak from parent into child
>      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
>      not ok 35 No leak from child into parent
>      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (1048576 kB)
>      not ok 36 No leak from child into parent
>      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
>      not ok 47 No leak from child into parent
>      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (1048576 kB)
>      not ok 48 No leak from child into parent
> 
> As it keeps confusing people (until somebody cares enough to fix vmsplice), I already
> thought about just disabling the test and adding a comment why it happens and
> why nobody cares.

I think we should, and when doing so maybe add a rich comment in
hugetlb_wp() too explaining everything?

> 
> > didn't do the same on hugetlb v.s. normal anon from that regard on the
> > vmsplice() fix.
> > 
> > I drafted a patch to allow refcount>1 detection as the same, then all tests
> > pass for me, as below.
> > 
> > David, I'd like to double check with you before I post anything: is that
> > your intention to do so when working on the R/O pinning or not?
> 
> Here certainly the "if it's easy it would already have done" principle applies. :)
> 
> The issue is the following: hugetlb pages are scarce resources that cannot usually
> be overcommitted. For ordinary memory, we don't care if we COW in some corner case
> because there is an unexpected reference. You temporarily consume an additional page
> that gets freed as soon as the unexpected reference is dropped.
> 
> For hugetlb, it is problematic. Assume you have reserved a single 1 GiB hugetlb page
> and your process uses that in a MAP_PRIVATE mapping. Then it calls fork() and the
> child quits immediately.
> 
> If you decide to COW, you would need a second hugetlb page, which we don't have, so
> you have to crash the program.
> 
> And in hugetlb it's extremely easy to not get folio_ref_count() == 1:
> 
> hugetlb_fault() will do a folio_get(folio) before calling hugetlb_wp()!
> 
> ... so you essentially always copy.

Hmm yes there's one extra refcount. I think this is all fine, we can simply
take all of them into account when making a CoW decision.  However crashing
an userspace can be a problem for sure.

> 
> 
> At that point I walked away from that, letting vmsplice() be fixed at some point. Dave
> Howells was close at some point IIRC ...
> 
> I had some ideas about retrying until the other reference is gone (which cannot be a
> longterm GUP pin), but as vmsplice essentially does without FOLL_PIN|FOLL_LONGTERM,
> it's quit hopeless to resolve that as long as vmsplice holds longterm references the wrong
> way.
> 
> ---
> 
> One could argue that fork() with hugetlb and MAP_PRIVATE is stupid and fragile: assume
> your child MM is torn down deferred, and will unmap the hugetlb page deferred. Or assume
> you access the page concurrently with fork(). You'd have to COW and crash the program.
> BUT, there is a horribly ugly hack in hugetlb COW code where you *steal* the page form
> the child program and crash your child. I'm not making that up, it's horrible.

I didn't notice that code before; doesn't sound like a very responsible
parent..

Looks like either there come a hugetlb guru who can make a decision to
break hugetlb ABI at some point, knowing that nobody will really get
affected by it, or that's the uncharted area whoever needs to introduce
hugetlb v2.

Thanks,

-- 
Peter Xu


