Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987E91BB4D1
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2020 05:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgD1DvB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 Apr 2020 23:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgD1DvB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 27 Apr 2020 23:51:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24791C03C1A9
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:51:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d25so751325lfi.11
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVBS2zR8u10QnId+SjIws+E/mbDlgxt11FVLpUCy9Fk=;
        b=fSI/ijUiq7Zsrz+mYpIid9wBMr+ufvXZJdEGYfYAV6Wa7WrfJcI8pP8JyJG39ryg8H
         oS3R8qQuk5cLe0fU2CCWNj05+kTTXNRrrHruAKyDUm0TOEQcvdS9B6OBB0/HcU2kGNsZ
         OclGbGyiNhfGDIr+gFIj8hC2fmRzB7XJRVfjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVBS2zR8u10QnId+SjIws+E/mbDlgxt11FVLpUCy9Fk=;
        b=b0tC53cTX1T4qmC2epElH2oOW7DHDC8KJxIQ/FDx5K4/wMWWAt3OiXHOREaQrpEIoQ
         tLs0RCvdD5SFlA80ppDyrZyOih7JwaBCabI6st+en4NaQUsMdkndv3KzCoOtQKcnh1bA
         iivKZCfKkjgC6F+WzuIfItQ9R9CKUaatzosQfYh0MgSDNSjHVY7rst96BaZpNINAnvXH
         ThU6qqLa2mMSizEiE1Wd1Y5AdzBXs4hdD4HkuW6OpiOeMSqblzyqq431UnQc/1teTLSe
         HODan2/O+d/8pWDllq7mUnKTg5bosZje8T7LI3grEvPmcR91mnf+c/uXIF6RuxXQHWRF
         heKw==
X-Gm-Message-State: AGi0PuaO5d01sgZbcsbhlXbRU/CoZbd1LVo/PtjJ9uNaSrbTm2GERQjP
        ycjVb6wuqY657Nhn4KnTKc2moR8j+Hw=
X-Google-Smtp-Source: APiQypLCP1IuGm+9KdK9nMz7KcwNFeE9spKRVfh3Y8yeVaYA0MJE2qxkjh6mDHPHvtapHu89/JQTpg==
X-Received: by 2002:ac2:4832:: with SMTP id 18mr17813917lft.162.1588045858313;
        Mon, 27 Apr 2020 20:50:58 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id d22sm12859774lfe.75.2020.04.27.20.50.56
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 20:50:57 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id b2so19877743ljp.4
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:50:56 -0700 (PDT)
X-Received: by 2002:a2e:7308:: with SMTP id o8mr16201494ljc.16.1588045856507;
 Mon, 27 Apr 2020 20:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200428032745.133556-1-jannh@google.com> <20200428032745.133556-6-jannh@google.com>
In-Reply-To: <20200428032745.133556-6-jannh@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 27 Apr 2020 20:50:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBNSQhH1gyjo+Z2NFy4tOQnBQB4rra-jh+3XTpOjnThQ@mail.gmail.com>
Message-ID: <CAHk-=wgBNSQhH1gyjo+Z2NFy4tOQnBQB4rra-jh+3XTpOjnThQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] mm/gup: Take mmap_sem in get_dump_page()
To:     Jann Horn <jannh@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Apr 27, 2020 at 8:28 PM Jann Horn <jannh@google.com> wrote:
>
> Properly take the mmap_sem before calling into the GUP code from
> get_dump_page(); and play nice, allowing __get_user_pages_locked() to drop
> the mmap_sem if it has to sleep.

This makes my skin crawl.

The only reason for this all is that page cache flushing.

My gut feeling is that it should be done by get_user_pages() anyway,
since all the other users presumably want it to be coherent in the
cache.

And in fact, looking at __get_user_pages(), it already does that

                if (pages) {
                        pages[i] = page;
                        flush_anon_page(vma, page, start);
                        flush_dcache_page(page);
                        ctx.page_mask = 0;
                }

and I think that the get_dump_page() logic is unnecessary to begin with.

               Linus
