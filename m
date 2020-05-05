Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21771C5499
	for <lists+linux-sh@lfdr.de>; Tue,  5 May 2020 13:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgEELml (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 5 May 2020 07:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727090AbgEELml (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 5 May 2020 07:42:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B8CC061A0F
        for <linux-sh@vger.kernel.org>; Tue,  5 May 2020 04:42:40 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u15so1255253ljd.3
        for <linux-sh@vger.kernel.org>; Tue, 05 May 2020 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikKwSi47RkdUncF8ZIue6G09Cc3O7H+FG1YBZJHLO1c=;
        b=PZPHz2sf+Y8/7voSUCVwWYQDTFp6jwT4eccln+h2V5t1fLtEiuMZ5ce3f8GLrLB5/+
         Lv1kPL8izEzV+2IdG5SUTSb1GcCNzzZfyx/zyH1vNX1EgrQil8bLC2Jc+9mBLhAhHXe7
         lOi78W5ciY1Ra0aIWnH4lpyflE7/EEEyKc94UjlHjcZQTnCuGIhy7/dnoqU7UVdaxjRC
         Rdy8T9f0YhG4rZRuZD9UxnGFLdby4z/l2sf/CrEw82JtjLZcoH91Y9xfMaRapGwaeY1W
         cCq9z7jHxn2gQYCZgaN9WotoV7g5/hfB1w9fLaw30A+XNiJTmnTXn2BktrD8y/mxhzoX
         nxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikKwSi47RkdUncF8ZIue6G09Cc3O7H+FG1YBZJHLO1c=;
        b=eCQ1LUXtlsSpN5I+Rj5nZvT/ZwCAk6DhlAr+DZk/WoqIWPAwfl5Z2bjKzw8AyDhumY
         FN+NQCGbvD+U9129BPS0/YnQpC6a/TQ2y9zOmnzSoS+VoNdWdeBlHddy69aGCsJ/D6Bg
         PCQRNJtsd0TNA4QtBdbYWCsoow2ncdXXfGkq2zFKc506HeI9PJUqexP9zFq+syZ2nlZl
         FfQp2/OAV1zd+mjfIMxRFD+Qc7bcOaP/1gCesGz+xo3pAweg6CVhlOeDLFOHUyZx9one
         5KOPBvR/6t41bdngbr1/1eRjhg7EoGBOmme8e7XpWRYCAFs/Kg+RuQLfEiIJ2Ipvuttw
         PubQ==
X-Gm-Message-State: AGi0PuY9KpH40EuPaC7CehdDaJTXtJCHSzjOdH1ZMu8iEC6eluRMnyod
        o3VQRs2EZSyG8wJgjCYt26xKwR8cq//DoIAEVY2elw==
X-Google-Smtp-Source: APiQypLzrurPKOFHS71dRCXI6iqbXYejtciTu5aveMTkrB6ldhKIG7OBjVfkuUaytzaP4Y/gPJR2+9djLt+JtIxmsXQ=
X-Received: by 2002:a2e:b249:: with SMTP id n9mr1613232ljm.221.1588678959039;
 Tue, 05 May 2020 04:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200429214954.44866-1-jannh@google.com> <20200429214954.44866-2-jannh@google.com>
 <20200505104805.GA17400@lst.de>
In-Reply-To: <20200505104805.GA17400@lst.de>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 5 May 2020 13:42:12 +0200
Message-ID: <CAG48ez3F70-UXwdHmO4CnR0bAForn-SBtstW5WAYjcrLFwS_9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] binfmt_elf_fdpic: Stop using dump_emit() on user
 pointers on !MMU
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
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

On Tue, May 5, 2020 at 12:48 PM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Apr 29, 2020 at 11:49:50PM +0200, Jann Horn wrote:
> > dump_emit() is for kernel pointers, and VMAs describe userspace memory.
> > Let's be tidy here and avoid accessing userspace pointers under KERNEL_DS,
> > even if it probably doesn't matter much on !MMU systems - especially given
> > that it looks like we can just use the same get_dump_page() as on MMU if
> > we move it out of the CONFIG_MMU block.
>
> Looks sensible.  Did you get a chance to test this with a nommu setup?

Nope. Do you happen to have a recommendation for a convenient
environment I can use with QEMU, or something like that? I'm guessing
that just running a standard armel Debian userspace with a !mmu ARM
kernel wouldn't work so well?
