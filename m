Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FB653645F
	for <lists+linux-sh@lfdr.de>; Fri, 27 May 2022 16:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352192AbiE0Oxu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 27 May 2022 10:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352352AbiE0Oxt (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 27 May 2022 10:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B5FD133251
        for <linux-sh@vger.kernel.org>; Fri, 27 May 2022 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653663225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
        b=ZUWXkMmaLR/WV6SaN23An4IjuzAIza1QX1t8JzsMALCVYB77n5xLXUBVTeDmXG4i9Rz8In
        93SdTNCn3lvYQKzM1zI+gr5m3+U3u6Q3xuOoj9aE3GpQX8tvfmVao021lGneA/iU37e0Wi
        G7M7d7KrJBIJ1UlhRAr3ZuYKmDOg12A=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-uuJHdqXnMwWnJ8C1u8_3lA-1; Fri, 27 May 2022 10:53:44 -0400
X-MC-Unique: uuJHdqXnMwWnJ8C1u8_3lA-1
Received: by mail-il1-f198.google.com with SMTP id g11-20020a056e021e0b00b002d1b5e8389bso3223162ila.2
        for <linux-sh@vger.kernel.org>; Fri, 27 May 2022 07:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
        b=7DxhKQ6/K5pSqbvk0tj13aKn4NcZWXQ5rxbo9HDDQm6If7r6buvArmsZx2+zF1coY5
         j+Niac+zUZnbPsuiOF5FbwZTYesyDltiys5CxvVMG9XMAkf7MjZHz5k4HwRey8KHuTtP
         HwhacgCSkVYkkk4Ding3IxmaQ764wga40RrteT6V40eSm0jOOONn0mhKkqMnv3Jk1nFs
         6UOAmSDlnuAzGhZrU9C/WsIE6KdRHMDbf9yVuCQVd4yuBEX65U1u/wa2lokPBlwDt6Og
         iJlne5lZOabwvQBifPqGaiBQ6RiLU98GvJeftptPo80akgvmbXfNVZlN9gWivC/kjmW5
         6LFw==
X-Gm-Message-State: AOAM533XCuQRpK/Sewu5jn4tCcZZA4T0QusUPtcFcOCH84PpKdKZA9Dm
        VDSYDRBX7F9Ys/hXNUYydLju+XLY+pFNapUfSUH8C9Fjuc374Y24urFL0Von8K5t3C5C+KPPdTj
        Xv79iHJW8kzrGvtoR3Vw=
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761901ilv.256.1653663223384;
        Fri, 27 May 2022 07:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG97+4KBIU6l93iytV0+qRm43dQQLHa2a/K8HbhfEtxo7G4J9rDpss95rHRYaCYZkQNmDyjQ==
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761868ilv.256.1653663222806;
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id d6-20020a023f06000000b00330efaf1161sm596380jaa.148.2022.05.27.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Date:   Fri, 27 May 2022 10:53:36 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Richard Henderson <rth@twiddle.net>,
        David Hildenbrand <david@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michal Simek <monstr@monstr.eu>,
        Russell King <linux@armlinux.org.uk>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        linux-riscv@lists.infradead.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        linux-m68k@lists.linux-m68k.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Chris Zankel <chris@zankel.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alistair Popple <apopple@nvidia.com>,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        sparclinux@vger.kernel.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-xtensa@linux-xtensa.org, Nicholas Piggin <npiggin@gmail.com>,
        linux-sh@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Borislav Petkov <bp@alien8.de>, linux-mips@vger.kernel.org,
        Max Filippov <jcmvbkbc@gmail.com>,
        Helge Deller <deller@gmx.de>, Vineet Gupta <vgupta@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-um@lists.infradead.org, linux-alpha@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-ia64@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Hugh Dickins <hughd@google.com>, Rich Felker <dalias@libc.org>,
        Andy Lutomirski <luto@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        linuxppc-dev@lists.ozlabs.org, Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-parisc@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpDl8IM0FF6GeJ4B@xz-m1.local>
References: <20220524234531.1949-1-peterx@redhat.com>
 <YpCsBwFArieTpvg2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <YpCsBwFArieTpvg2@gmail.com>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, May 27, 2022 at 12:46:31PM +0200, Ingo Molnar wrote:
> 
> * Peter Xu <peterx@redhat.com> wrote:
> 
> > This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> > program sequentially dirtying 400MB shmem file being mmap()ed and these are
> > the time it needs:
> >
> >   Before: 650.980 ms (+-1.94%)
> >   After:  569.396 ms (+-1.38%)
> 
> Nice!
> 
> >  arch/x86/mm/fault.c           |  4 ++++
> 
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> 
> Minor comment typo:
> 
> > +		/*
> > +		 * We should do the same as VM_FAULT_RETRY, but let's not
> > +		 * return -EBUSY since that's not reflecting the reality on
> > +		 * what has happened - we've just fully completed a page
> > +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> > +		 * that we want to take the mmap lock _again_.
> > +		 */
> 
> s/reflecting the reality on what has happened
>  /reflecting the reality of what has happened

Will fix.

> 
> >  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> > +
> > +	if (ret & VM_FAULT_COMPLETED) {
> > +		/*
> > +		 * NOTE: it's a pity that we need to retake the lock here
> > +		 * to pair with the unlock() in the callers. Ideally we
> > +		 * could tell the callers so they do not need to unlock.
> > +		 */
> > +		mmap_read_lock(mm);
> > +		*unlocked = true;
> > +		return 0;
> 
> Indeed that's a pity - I guess more performance could be gained here, 
> especially in highly parallel threaded workloads?

Yes I think so.

The patch avoids the page fault retry, including the mmap lock/unlock side.
Now if we retake the lock for fixup_user_fault() we still safe time for
pgtable walks but the lock overhead will be somehow kept, just with smaller
critical sections.

Some fixup_user_fault() callers won't be affected as long as unlocked==NULL
is passed - e.g. the futex code path (fault_in_user_writeable).  After all
they never needed to retake the lock before/after this patch.

It's about the other callers, and they may need some more touch-ups case by
case.  Examples are follow_fault_pfn() in vfio and hva_to_pfn_remapped() in
KVM: both of them returns -EAGAIN when *unlocked==true.  We need to teach
them to know "*unlocked==true" does not necessarily mean a retry attempt.

I think I can look into them if this patch can be accepted as a follow up.

Thanks for taking a look!

-- 
Peter Xu

