Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AE31BC5A8
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2020 18:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgD1Qqf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 28 Apr 2020 12:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgD1Qqf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 28 Apr 2020 12:46:35 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67A5C03C1AB
        for <linux-sh@vger.kernel.org>; Tue, 28 Apr 2020 09:46:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a2so17817501ejx.5
        for <linux-sh@vger.kernel.org>; Tue, 28 Apr 2020 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHXIK5KG4MM6NL6ZnqDyJCo1++3O5tMDxa0Oox/FCk0=;
        b=Qu+2TQv0OYiYE16287sogB8uDjS8JZz9MFHDIwMmE4QWXix8Yj3Rir/mLPwz00RjUg
         hnk6uNKaE0hzn5zlYIZTWKFCs2u3Lk4U9c8hgRG4h/3lWuPoDD91flVvK19N8QzMsCzs
         vJ6aDNedAL1ptIzuTwxhsiNW9/aiFum9pNkTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHXIK5KG4MM6NL6ZnqDyJCo1++3O5tMDxa0Oox/FCk0=;
        b=mRNtlquPF5zQWYJuiqUqpHhKWXjl36xqjROtLQpDep6mkXvCHpGo0IpJ3D2vV2erVu
         5y4KYaDDX0F4dcn9G+9LF+PavuXQEnMhDkI7mZvHNbGvKjV3LioCBH4jAK2j0r5deT03
         lUf+hVdrkqFas/6hFJ9qUQNhCq2dyZHTJEdgB6TCjlf0S/rECQJQxowCT0e0gaoINkZd
         WzrFCTGPopJ1+7yi/pHNpY6ZZQf5oCQ5ukJ2NNSMImVAcCf2gmOEzjUp/Q1ltKXO3A8G
         6Nzoz0wtYs6gm8obB6D1cUrdzwfPo+4GmEBeYOkk8LaNRjwD7HfScAgnujQjWa7JZmWu
         jX1A==
X-Gm-Message-State: AGi0PuYGqExXq4o7mH0K8T58BtnJtyHBCR1cigdY3P7XIvxotqj8U9bx
        qujNLktVzCujLKz338FeuLvB4mLIRx4=
X-Google-Smtp-Source: APiQypJArkUtucMFBsqZ4h0Py/AP/qG/kswrvd6S/Y70e5HOT51WIKFZi/PBezJgO+PanOF1UMR/og==
X-Received: by 2002:a17:906:7282:: with SMTP id b2mr5034021ejl.161.1588092393055;
        Tue, 28 Apr 2020 09:46:33 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id n7sm452421ejj.17.2020.04.28.09.46.32
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 09:46:32 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id k8so17792994ejv.3
        for <linux-sh@vger.kernel.org>; Tue, 28 Apr 2020 09:46:32 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr19924040lfk.30.1588092037785;
 Tue, 28 Apr 2020 09:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200428032745.133556-1-jannh@google.com> <20200428032745.133556-3-jannh@google.com>
 <CAHk-=wjSYTpTH0X8EcGGJD84tsJS62BN3tC6NfzmjvXdSkFVxg@mail.gmail.com> <94141fbb-9559-1851-54c1-cdc5fc529a1a@landley.net>
In-Reply-To: <94141fbb-9559-1851-54c1-cdc5fc529a1a@landley.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 Apr 2020 09:40:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2uw09tJMKTooQBr=AJPzzLTaq95b+SSS513Gm0gy5sw@mail.gmail.com>
Message-ID: <CAHk-=wg2uw09tJMKTooQBr=AJPzzLTaq95b+SSS513Gm0gy5sw@mail.gmail.com>
Subject: Re: [PATCH 2/5] coredump: Fix handling of partial writes in dump_emit()
To:     Rob Landley <rob@landley.net>
Cc:     Jann Horn <jannh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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

On Tue, Apr 28, 2020 at 9:34 AM Rob Landley <rob@landley.net> wrote:
>
> Writes to a local filesystem should never be short unless disk full/error.

Well, that code is definitely supposed to also write to pipes.

But it also has "was I interrupted" logic, which stops the core dump.

So short writes can very much happen, it's just that they also imply
that the core dump should be aborted.

So the loop seems to be unnecessary. The situations where short writes
can happen are all the same situations where we want to abort anyway,
so the loop count should probably always be just one.

The same would go for any potential network filesystem with the
traditional NFS intr-like behavior.

            Linus
