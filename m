Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFE017B0A
	for <lists+linux-sh@lfdr.de>; Wed,  8 May 2019 15:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfEHNui (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 8 May 2019 09:50:38 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45114 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfEHNuh (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 8 May 2019 09:50:37 -0400
Received: by mail-oi1-f193.google.com with SMTP id u3so9369829oic.12
        for <linux-sh@vger.kernel.org>; Wed, 08 May 2019 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2EurxZMr2RolSsa7vNYJaos3juIlj/g/eKIBE0b5hok=;
        b=GgArHWlWkQXoHwkDnK52AErLjHNxY5Gtmfi45DghAvzYSBWNm6e7PeK3JgF31tT39u
         Q8JR+JNhhGsG4Y7l9oZGDgiuq1Vd5RwpB/qtfTMetqQ89+0JLpGSnC6dCfhpwx19hpSY
         dW71jKTymLLEW0H/kPBh86F7O8Pl6ugXsxDoo7RkHtzfBaDJhKBBOLKKOiQUz6mX4dfy
         /qJ/gwBQBKlIHCytwcPCDVmTqECvadxzkRYOgECHpEhiJhC26ncnwbpfGzSI5baBNh4g
         EXfGGgHq+v/FJ3xWAj5JIAmNaj4uBs1RsRNGNVmeAZDVHZ7DoyszSVQnNrDKMABq0UGH
         +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2EurxZMr2RolSsa7vNYJaos3juIlj/g/eKIBE0b5hok=;
        b=HuL8zwM4CHKI0fl4yP+GnxactoINQcBo9OYj0VDbkvymdaatwx7Ljk+B2wHWuW+oh1
         dPyksR08bYohnEuq5Z/m1gX3+G/5h+FO3p/6Jiy5IvulU5dIzPgzHja6xJGlHMmaUwDq
         cTImyr3NtzblMzcLqR39AgCfG+h8iqdVcT4QHYuht0ZgWbMzlgC2JHsGDS6z0Yu53ZpG
         V1ChSkBmzMW5B+sYrsuy6bz/YJms3SgEeKIos4UA8C5hZwOGqad2qgVnhDbgIzWEGM0f
         PLdiZNPx6eGhyWhuqGaye/yrqA8eThe2Zi3cI3nRrOuN2n3En7xgf4mGwuZUrBnzeN3/
         /rOg==
X-Gm-Message-State: APjAAAVCvw1eIOCyfG1TYkO9PClDudkImLYtMXYzxXPTitHvsYh5TkTG
        WVupxjgV8sCCcJIspVWGBMMT6N5LXu8TuS16/mXjCj8F
X-Google-Smtp-Source: APXvYqyeIjtF65mpJyGOqNS4h3BV3LQvlNHfYva0fI5IeZSoAKQb2exqaAUh3L7sY+Pt68OUPCAnfn3ZcLOt3M41mPQ=
X-Received: by 2002:aca:4208:: with SMTP id p8mr2432775oia.105.1557323437130;
 Wed, 08 May 2019 06:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-8-david@redhat.com>
 <CAPcyv4h2PgzQZrD0UU=4Qz_yH2C_hiYQyqV9U7CCkjpmHZ5xjQ@mail.gmail.com> <1d369ae4-7183-b455-646a-65bbbe697281@redhat.com>
In-Reply-To: <1d369ae4-7183-b455-646a-65bbbe697281@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 8 May 2019 06:50:25 -0700
Message-ID: <CAPcyv4jtS6G_ZqLCdO4gOjS9K2cuX=ywFHemhSb46aQvS8pa8A@mail.gmail.com>
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

On Wed, May 8, 2019 at 12:22 AM David Hildenbrand <david@redhat.com> wrote:
>
>
> >>  drivers/base/node.c  | 18 +++++-------------
> >>  include/linux/node.h |  5 ++---
> >>  2 files changed, 7 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/base/node.c b/drivers/base/node.c
> >> index 04fdfa99b8bc..9be88fd05147 100644
> >> --- a/drivers/base/node.c
> >> +++ b/drivers/base/node.c
> >> @@ -803,20 +803,14 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
> >>
> >>  /*
> >>   * Unregister memory block device under all nodes that it spans.
> >> + * Has to be called with mem_sysfs_mutex held (due to unlinked_nodes).
> >
> > Given this comment can bitrot relative to the implementation lets
> > instead add an explicit:
> >
> >     lockdep_assert_held(&mem_sysfs_mutex);
>
> That would require to make the mutex non-static. Is that what you
> suggest, or any other alternative?

If the concern is other code paths taking the lock when they shouldn't
then you could make a public "lockdep_assert_mem_sysfs_held()" to do
the same, but I otherwise think the benefit of inline lock validation
is worth the price of adding a new non-static symbol.
