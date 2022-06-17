Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC83B54F28D
	for <lists+linux-sh@lfdr.de>; Fri, 17 Jun 2022 10:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380804AbiFQINf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 17 Jun 2022 04:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbiFQINf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 17 Jun 2022 04:13:35 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2357C606C5
        for <linux-sh@vger.kernel.org>; Fri, 17 Jun 2022 01:13:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id f16so2391490pjj.1
        for <linux-sh@vger.kernel.org>; Fri, 17 Jun 2022 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ajw5ZlW7BO6xh4idYg9ZGUxMVX3OZuSbGQMRvZITss=;
        b=BjmCyWwguCYTpglhYm7P+9sfT2Sf6eI4hqC5TCzRNcj8GpT7Cc5jJvVeFu+/QvdoQO
         RGPpgCZxneDK+JRvBbAA3vU8YL0MLBkdIjsUazKCO2zJ5IT6caqZ177xBPaHYaNtSFhL
         wsOPZyAq8zDsC4+RXY1GMKrYj3Yyu9EDxibHdpAAagnIOLEJ3bJD7JOCrpBNaHhaJdjq
         /4qXmmNFH+/zsDvQ2LPSFYj7Byd34mjZXsxzy6la7Th49HWzuITGgf435hSeF0LnrHen
         fHCXck9cWmkJX/PFv6Ee2nUXQikqy1BawnEmGitan/14y2a4JTmEO8TSXRXXDJrqoj/v
         LdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ajw5ZlW7BO6xh4idYg9ZGUxMVX3OZuSbGQMRvZITss=;
        b=E5w4wGJuZ3v16zcunCUD9eslsltwSwIa2+m9WVKPuFAQUPEZGuAiQX/YO26ua9TMqN
         4ZaaxKnC0W2TBuMLyCTx66LxGjfwMJY75VomgThWYlPnOlom1jnKNXgaunEQgHkUuvK8
         MCP1X79rtHnmBulzDJsis5xJPcfmdL1TqSzwwajrMi3uSRwQNp49LeM8nKILGLqzFGno
         SGmGgt6gzqG0RtVlYtvLQ8ssQNXBExmM6m09N6pRQiWPsq5x/KVQoraWyrqG2cKjlqLD
         efMl+ELBEGsfd/Xu6VQNBYJU4Ily3ftLklHSFBGnli4F7HTmAzB/ULjZ7fNI6aAd7Jaw
         rVEQ==
X-Gm-Message-State: AJIora//IVNHN6+TNZT3Xm5ceuH1DrdtExsa6wJb/I9GYH95g2wJh38F
        e6XCBXrnysl1TmLkrpRKScLopA==
X-Google-Smtp-Source: AGRyM1uaJ6D+98lyL0Nb8O2bTi6YMfyv3saLk9hySILdD8r9XB2OdIlAqHZgNeMyStjI4ZdfZ29vcg==
X-Received: by 2002:a17:90b:4a4c:b0:1e4:da3a:9b07 with SMTP id lb12-20020a17090b4a4c00b001e4da3a9b07mr9398372pjb.242.1655453612597;
        Fri, 17 Jun 2022 01:13:32 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b0015e8d4eb219sm2932151plk.99.2022.06.17.01.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:13:31 -0700 (PDT)
Date:   Fri, 17 Jun 2022 16:13:28 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        James Houghton <jthoughton@google.com>,
        Mina Almasry <almasrymina@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        catalin.marinas@arm.com, will@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <Yqw3qHZIwM35rcLh@FVFYT0MHHV2J.usts.net>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-2-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> HugeTLB address ranges are linearly scanned during fork, unmap and
> remap operations.  If a non-present entry is encountered, the code
> currently continues to the next huge page aligned address.  However,
> a non-present entry implies that the page table page for that entry
> is not present.  Therefore, the linear scan can skip to the end of
> range mapped by the page table page.  This can speed operations on
> large sparsely populated hugetlb mappings.
> 
> Create a new routine hugetlb_mask_last_page() that will return an
> address mask.  When the mask is ORed with an address, the result
> will be the address of the last huge page mapped by the associated
> page table page.  Use this mask to update addresses in routines which
> linearly scan hugetlb address ranges when a non-present pte is
> encountered.
> 
> hugetlb_mask_last_page is related to the implementation of
> huge_pte_offset as hugetlb_mask_last_page is called when huge_pte_offset
> returns NULL.  This patch only provides a complete hugetlb_mask_last_page
> implementation when CONFIG_ARCH_WANT_GENERAL_HUGETLB is defined.
> Architectures which provide their own versions of huge_pte_offset can also
> provide their own version of hugetlb_mask_last_page.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

It'll be more efficient, Thanks.

Acked-by: Muchun Song <songmuchun@bytedance.com>

