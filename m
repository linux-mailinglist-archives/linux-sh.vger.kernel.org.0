Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF5A5202C6
	for <lists+linux-sh@lfdr.de>; Mon,  9 May 2022 18:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239214AbiEIQpp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 May 2022 12:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239215AbiEIQpn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 May 2022 12:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5C561C0F2B
        for <linux-sh@vger.kernel.org>; Mon,  9 May 2022 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652114504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=46wpjVCZhJPBmgWeRQ9uBt+Od81o8qIGqdyqzSCTbIU=;
        b=PYdbAY/2E2VoxABhLAJxXS+O3aXdHFc7ofvAS8KsVcBiYw/YdxmkgLVi/H2MfLpu5N5Hun
        aylasFCC95E5ys+WrzTSWnbpLantK4HKftnItpdNax6vIsAVijCLhQWrnzqzx06E8op/6N
        rt/0UL8gQURke+C74p5htGvI5vxfY9E=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-tLpRf4MZPgigBEu90qvu5A-1; Mon, 09 May 2022 12:41:43 -0400
X-MC-Unique: tLpRf4MZPgigBEu90qvu5A-1
Received: by mail-il1-f197.google.com with SMTP id v14-20020a056e020f8e00b002caa6a5d918so7914554ilo.15
        for <linux-sh@vger.kernel.org>; Mon, 09 May 2022 09:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=46wpjVCZhJPBmgWeRQ9uBt+Od81o8qIGqdyqzSCTbIU=;
        b=nAZ22UXK38Ucoic+zj8R2qLgLy8EBKBbiTl2rTsIn6QQJLRL2Q8T5DDP0YZ9EgOq0a
         aLeWiUkqFhwLcNGKp2Bj9FjMopsgB4i5XpHjVXUNkE8gpd564HkVqPTc0Gw4Hhv2P2ZR
         +TAbGG+VRsuOgCcmAB9Jebwk0J7sE8evQb2cLXFYyIBX4vOiic6Q4N9CX1/wroWaj5Bg
         5L0zaKEF5z0Vx06D476Td3Wn83H702HW1ffRTqzoUZ/Lo1JNeG7ik+AS+VvEUNTZ1Vpn
         IhAZEBP2HpSyUMpnLmHPN/XKF1wgqDE51KQyvhSekLIxjkbfa+V2uoH1+4sN0FW4GUG9
         xgaw==
X-Gm-Message-State: AOAM533UlWqz9/AkAMzgKlQdKiv1mML18G/7XaPXZ7aHgNIB20QrUMAP
        HywAKIxr85f40vIoSz2M45DgoTMwj8/o8sKK6fGlGcaAjjUczH2fd+VUHRP7Z8a5SVLlKNwKO3b
        klrl9HZhtUWswAXxp9TE=
X-Received: by 2002:a05:6e02:164e:b0:2cf:82bc:6c76 with SMTP id v14-20020a056e02164e00b002cf82bc6c76mr6451768ilu.95.1652114503275;
        Mon, 09 May 2022 09:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE3U4JsTh97DMqQwaSKR+J9MOnj5nTpGNATaHacf1CibJGqYaNUSWSiHqNy5VvKai+5PTu/Q==
X-Received: by 2002:a05:6e02:164e:b0:2cf:82bc:6c76 with SMTP id v14-20020a056e02164e00b002cf82bc6c76mr6451741ilu.95.1652114503011;
        Mon, 09 May 2022 09:41:43 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id x26-20020a6bfe1a000000b0065a48a57f6dsm3633311ioh.40.2022.05.09.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 09:41:42 -0700 (PDT)
Date:   Mon, 9 May 2022 12:41:38 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        akpm@linux-foundation.org, catalin.marinas@arm.com,
        will@kernel.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Message-ID: <YnlEQvipCM6hnIYT@xz-m1.local>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
 <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
 <20220502160232.589a6111@thinkpad>
 <48a05075-a323-e7f1-9e99-6c0d106eb2cb@linux.alibaba.com>
 <20220503120343.6264e126@thinkpad>
 <927dfbf4-c899-b88a-4d58-36a637d611f9@oracle.com>
MIME-Version: 1.0
In-Reply-To: <927dfbf4-c899-b88a-4d58-36a637d611f9@oracle.com>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, May 06, 2022 at 12:07:13PM -0700, Mike Kravetz wrote:
> On 5/3/22 03:03, Gerald Schaefer wrote:
> > On Tue, 3 May 2022 10:19:46 +0800
> > Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> >> On 5/2/2022 10:02 PM, Gerald Schaefer wrote:

[...]

> >> Please see previous code, we'll use the original pte value to check if 
> >> it is uffd-wp armed, and if need to mark it dirty though the hugetlbfs 
> >> is set noop_dirty_folio().
> >>
> >> pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
> > 
> > Uh, ok, that wouldn't work on s390, but we also don't have
> > CONFIG_PTE_MARKER_UFFD_WP / HAVE_ARCH_USERFAULTFD_WP set, so
> > I guess we will be fine (for now).
> > 
> > Still, I find it a bit unsettling that pte_install_uffd_wp_if_needed()
> > would work on a potential hugetlb *pte, directly de-referencing it
> > instead of using huge_ptep_get().
> > 
> > The !pte_none(*pte) check at the beginning would be broken in the
> > hugetlb case for s390 (not sure about other archs, but I think s390
> > might be the only exception strictly requiring huge_ptep_get()
> > for de-referencing hugetlb *pte pointers).

We could have used is_vm_hugetlb_page(vma) within the helper so as to
properly use either generic pte or hugetlb version of pte fetching.  We may
want to conditionally do set_[huge_]pte_at() too at the end.

I could prepare a patch for that even if it's not really anything urgently
needed. I assume that won't need to block this patchset since we need the
pteval for pte_dirty() check anyway and uffd-wp definitely needs it too.

Thanks,

-- 
Peter Xu

