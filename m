Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB7016E1C
	for <lists+linux-sh@lfdr.de>; Wed,  8 May 2019 02:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfEHAPa (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 May 2019 20:15:30 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:32866 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfEHAP3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 May 2019 20:15:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id 66so7329289otq.0
        for <linux-sh@vger.kernel.org>; Tue, 07 May 2019 17:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UhaIzukcu6eNmGwjEhDO3TIFvcLokXuz7xzLGx18Tbw=;
        b=1mu1WFjK0V8iMe1wMq6x6KzZRhtmQz1Se3V/vOtmmVL+ajookiHe5WaC/HRVqi1aOT
         pNOu0Kkq1JuDbFSEaVU0Q4YkN/2yshcr5Htq3wxT0t3oZMqjqfMg8Vq+soNUv9VYZmnz
         qi0ztt0Qg3G28TqdCTjWN1vnEVkOFntia6T7xZQSbhlue+TZ0cKMQElA/dVVyyHBtKYa
         +kuijAfBzxNmyY5C2URmhzlcqkDHeMIdKNYXQ5ZH8xBIjnqCcCZA64C8WvdBdR7YoQZS
         AJx4tTL7B5nNdsxXhvCIL0196DLuJDpCHwejztP7AEsIElbkHYHSNTQyFj+ksRiC53FU
         f1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhaIzukcu6eNmGwjEhDO3TIFvcLokXuz7xzLGx18Tbw=;
        b=Jt7zXlNltTVrk559Kr4Mr7CwXoDRNO6CHHYh9bxpQgSYMw+1aSWkoAfOCdi69DWUsl
         ajr0dOyHPH8cLEGUKWvJQffNxWOCWVHJh1+H3NgoqLqhsc+8TY5fFCdPj/wzexm0R1Xt
         ezLT+GwwwLA/LMc1tVZZYGAJ29lQXe1cLBHa5xUXYYW3CsezHlxlvEpatLB0e8gIZpcI
         tF0Gn/eUIkgzO16T10ppHklWp+SsG6GCyZTSe/uXsWAWNfvlqIfrEDwXh7YGQzpSv+s2
         L1lqn6/JqArZZaW+nkwu1sJhijwmTUvYMvxfdGJ5UQi2Mn693nflrdIAzU7BPvHzbAen
         Dybg==
X-Gm-Message-State: APjAAAVjlv7dsdSWhbYilKgG+RDZzZROv5sWJtH4wo9T3A3LF4WQgCML
        NR7hy9lyU4alcIUqMB3T3Jj3DRKzAelduezTuYYHyA==
X-Google-Smtp-Source: APXvYqzzxf6W9cnydO305g7fBJWgCOG4eg30Hdr9Euys8FINHS8ep2uY1uSq5jErxGYFDhvPRGJuaspiSElcCykByLo=
X-Received: by 2002:a9d:222c:: with SMTP id o41mr23840445ota.353.1557274528508;
 Tue, 07 May 2019 17:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-8-david@redhat.com>
In-Reply-To: <20190507183804.5512-8-david@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 17:15:17 -0700
Message-ID: <CAPcyv4h2PgzQZrD0UU=4Qz_yH2C_hiYQyqV9U7CCkjpmHZ5xjQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] mm/memory_hotplug: Make unregister_memory_block_under_nodes()
 never fail
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Oscar Salvador <osalvador@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 7, 2019 at 11:39 AM David Hildenbrand <david@redhat.com> wrote:
>
> We really don't want anything during memory hotunplug to fail.
> We always pass a valid memory block device, that check can go. Avoid
> allocating memory and eventually failing. As we are always called under
> lock, we can use a static piece of memory. This avoids having to put
> the structure onto the stack, having to guess about the stack size
> of callers.
>
> Patch inspired by a patch from Oscar Salvador.
>
> In the future, there might be no need to iterate over nodes at all.
> mem->nid should tell us exactly what to remove. Memory block devices
> with mixed nodes (added during boot) should properly fenced off and never
> removed.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/node.c  | 18 +++++-------------
>  include/linux/node.h |  5 ++---
>  2 files changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 04fdfa99b8bc..9be88fd05147 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -803,20 +803,14 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
>
>  /*
>   * Unregister memory block device under all nodes that it spans.
> + * Has to be called with mem_sysfs_mutex held (due to unlinked_nodes).

Given this comment can bitrot relative to the implementation lets
instead add an explicit:

    lockdep_assert_held(&mem_sysfs_mutex);

With that you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
