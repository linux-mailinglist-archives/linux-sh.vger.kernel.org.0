Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4BB258D9
	for <lists+linux-sh@lfdr.de>; Tue, 21 May 2019 22:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfEUU3Q (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 21 May 2019 16:29:16 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46478 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfEUU3Q (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 21 May 2019 16:29:16 -0400
Received: by mail-lf1-f68.google.com with SMTP id l26so14050841lfh.13
        for <linux-sh@vger.kernel.org>; Tue, 21 May 2019 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwA8SKkNo0NB1BSSFbQlGkhBkIi6dkzdh19hX1ggqqc=;
        b=E9cuWHFCD4Bgx1lOv97Ctr9bLKO3EjHQDpiZyM5FZUFuOxpsSHENK8V3oPkAEWY2CT
         4OwJ0l1afyS0KlYgZEStFftLyE7H7JbMd/BnYgfS8lVdq73pcYKuqkBJcrl7o7GLJZCx
         7466NcnIhfaDTvK1H+iwihEveSzhyKGC/2Zgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwA8SKkNo0NB1BSSFbQlGkhBkIi6dkzdh19hX1ggqqc=;
        b=AUOIqnnyZieCidHAJaFVjnvSlEo13pTDCxpZ+2nDV5fYUewXRI5UWKsJaDq3oA0QYR
         sZTu7/rOziJAfmqHhABU9U1f12imq7eWjC46UOom/XpwPlbkq644R5AFuJUQDPR83A/7
         G5M/KzDJIi6htImehVaoq29TKciu2bSqjw0BwhUQSttN7U71J01dp0b67hNOzuEUSJzH
         z8i4EdmeNK1wkeXOPH3pRijp7yasjZcscxwa0LeSJYU1uWPTtVRObjggaf3/N9VC35eC
         DbhjQT+HhMRk1SPEE2NhJw663j4dOP0dSD4GHXZsKCkBAQ9HB1nAhr1cl0U9RWAqq/ou
         G0Lg==
X-Gm-Message-State: APjAAAWfErrjiJwtKyafhKOKepfwMbo6n850crdALbq7ARPotI/Am2Ja
        d+ad3JsstrnxOxlTrXmBRl9dx4+jMRY=
X-Google-Smtp-Source: APXvYqw4qDOxs3YgK43pd1L2FpcTXpSPa2+DMITbesXuL7TrpIgJsdHoh2tWBbua/VqKP914WzdGSQ==
X-Received: by 2002:a19:5045:: with SMTP id z5mr42380791lfj.108.1558470554184;
        Tue, 21 May 2019 13:29:14 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id k10sm4743690ljh.86.2019.05.21.13.29.13
        for <linux-sh@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 13:29:13 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id a10so1979ljf.6
        for <linux-sh@vger.kernel.org>; Tue, 21 May 2019 13:29:13 -0700 (PDT)
X-Received: by 2002:a2e:2f03:: with SMTP id v3mr4725518ljv.6.1558470208997;
 Tue, 21 May 2019 13:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190521150006.GJ17978@ZenIV.linux.org.uk> <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk> <20190521164141.rbehqnghiej3gfua@brauner.io>
In-Reply-To: <20190521164141.rbehqnghiej3gfua@brauner.io>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 May 2019 13:23:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgtHm4t71oKbykE=awiVv2H2wCy8yH0L_FsyhHQ5OSO+Q@mail.gmail.com>
Message-ID: <CAHk-=wgtHm4t71oKbykE=awiVv2H2wCy8yH0L_FsyhHQ5OSO+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] open: add close_range()
To:     Christian Brauner <christian@brauner.io>
Cc:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Jann Horn <jannh@google.com>,
        Florian Weimer <fweimer@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        tkjos@android.com, "Dmitry V. Levin" <ldv@altlinux.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 21, 2019 at 9:41 AM Christian Brauner <christian@brauner.io> wrote:
>
> Yeah, you mentioned this before. I do like being able to specify an
> upper bound to have the ability to place fds strategically after said
> upper bound.

I suspect that's the case.

And if somebody really wants to just close everything and uses a large
upper bound, we can - if we really want to - just compare the upper
bound to the file table size, and do an optimized case for that. We do
that upper bound comparison anyway to limit the size of the walk, so
*if* it's a big deal, that case could then do the whole "shrink
fdtable" case too.

But I don't believe it's worth optimizing for unless somebody really
has a load where that is shown to be a big deal.   Just do the silly
and simple loop, and add a cond_resched() in the loop, like
close_files() does for the "we have a _lot_ of files open" case.

                   Linus
