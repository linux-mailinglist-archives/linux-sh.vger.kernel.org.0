Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBB4D69FB
	for <lists+linux-sh@lfdr.de>; Mon, 14 Oct 2019 21:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732301AbfJNTRV (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 14 Oct 2019 15:17:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728005AbfJNTRV (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 14 Oct 2019 15:17:21 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E75B9217F9;
        Mon, 14 Oct 2019 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571080640;
        bh=GVOpKJU8+fX2Cvw0U5HfH5hzn91D4G2Rk4nes27+pag=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FR3WzbMF70HWxk7LTH30/6dEQ8O2Dy6iHIYsz3roW7gGsiv/bCa+/sQvvUktTZ/BO
         sea8B8Iv2qQrW/t9KU/O3J+J0m3QYNRD0hYc9BPn9xPN45izvaOitFObeTCJxIolf7
         oGAogT4n2dH58KrM+gstDU8nD3TYaBLq3dqW2/DM=
Date:   Mon, 14 Oct 2019 12:17:19 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 04/10] mm/memory_hotplug: Don't access uninitialized
 memmaps in shrink_zone_span()
Message-Id: <20191014121719.cb9b9efe51a7e9e985b38075@linux-foundation.org>
In-Reply-To: <5a4573de-bd8a-6cd3-55d0-86d503a236fd@redhat.com>
References: <20191006085646.5768-1-david@redhat.com>
        <20191006085646.5768-5-david@redhat.com>
        <5a4573de-bd8a-6cd3-55d0-86d503a236fd@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, 14 Oct 2019 11:32:13 +0200 David Hildenbrand <david@redhat.com> wrote:

> > Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
> 
> @Andrew, can you convert that to
> 
> Fixes: f1dd2cd13c4b ("mm, memory_hotplug: do not associate hotadded 
> memory to zones until online") # visible after d0dc12e86b319
> 
> and add
> 
> Cc: stable@vger.kernel.org # v4.13+

Done, thanks.
