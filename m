Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE91A955A
	for <lists+linux-sh@lfdr.de>; Wed,  4 Sep 2019 23:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbfIDVm4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 4 Sep 2019 17:42:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33308 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDVm4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 4 Sep 2019 17:42:56 -0400
Received: by mail-lf1-f67.google.com with SMTP id d10so239731lfi.0
        for <linux-sh@vger.kernel.org>; Wed, 04 Sep 2019 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afyKDAGEEGBbAV94gj2UOZt2XiwokGAAZY9fEg48q/g=;
        b=NaaXzsE03/A0aggT0JGsMPgqMPOgw689sbkH2wUyL6Wp3qKaZ1pKjDt9q3nSCqMPah
         2e4dX/SHASPLfri+fuLDS7WlObVzMB0uCQ613gb+lr0h/VEtc5FGRP26lR62YK8De+Ct
         /QjcaW9K7a4FCLT2Siyb/L/tVCZoNkYi2RP38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afyKDAGEEGBbAV94gj2UOZt2XiwokGAAZY9fEg48q/g=;
        b=Edtdfn6MXLzvLUByFMG8N3odYvz49uG2D2m8QjO1A3l3cXUVGEbKxLfvN6lUS9o2Vh
         23UOjj2+sBmrkU+ITJrJWJKib/LW6Q9qpNzEYaYL+wrzHhcXUJmogbuES1RgSUcCamct
         VjE8exZhLDae6ZIml/Hr3jGD54u78J0jYDphK/pviSa7idM+YNPxdNn6xswVtKXfdGXO
         MA9RSh61XNUyGc+1vpgYK0YXQK2vt6WJzgJbD+i3PgDgxq45JWv+v7V85X7t23LmRCOR
         Pr7IaEgwiFUnhuuxZIvv3r4eydM/DZqvKy3+GMbS6Jm5mkT7ksc5ZWt2M7Z5sFujyp2n
         +veA==
X-Gm-Message-State: APjAAAVq7lnUK3H19ff2YfpY1ioX7vLfCJYrrbphtu8DU6EhCnIU3ppW
        rvsNJtLobLc0MJbfK8LaiVEOVAzGOmE=
X-Google-Smtp-Source: APXvYqwOM+sfzNxT23mRPtl+uj088km6I1x9J3km7fBOqR8Nhnr+Kt5qXbCbCORUS/UEpHZUb+XQzQ==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr156801lfl.152.1567633373936;
        Wed, 04 Sep 2019 14:42:53 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id v1sm15912lfq.89.2019.09.04.14.42.53
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 14:42:53 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id t8so182217lfc.13
        for <linux-sh@vger.kernel.org>; Wed, 04 Sep 2019 14:42:53 -0700 (PDT)
X-Received: by 2002:a05:6512:512:: with SMTP id o18mr154625lfb.170.1567633024273;
 Wed, 04 Sep 2019 14:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com> <CAHk-=wiHRW3Z9xPRiExi9jLjB0cdGhM=3vaW+b80mjuRcbORyw@mail.gmail.com>
In-Reply-To: <CAHk-=wiHRW3Z9xPRiExi9jLjB0cdGhM=3vaW+b80mjuRcbORyw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 14:36:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiExfaVhUTvKj7hR6DG4C2+oy6usz0Sa6QbPr5EgDH28w@mail.gmail.com>
Message-ID: <CAHk-=wiExfaVhUTvKj7hR6DG4C2+oy6usz0Sa6QbPr5EgDH28w@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Sep 4, 2019 at 2:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 4, 2019 at 2:09 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So you'd have three stages:
> >
> >  1) ".." always returns -EXDEV
> >
> >  2) ".." returns -EXDEV if there was a concurrent rename/mount
> >
> >  3) ".." returns -EXDEV if there was a concurrent rename/mount and we
> > reset the sequence numbers and check if you escaped.
>
> In fact, I wonder if this should return -EAGAIN instead - to say that
> "retrying may work".

And here "this" was meant to be "case 2" - I was moving the quoted
text around and didn't fix my wording, so now it is ambiguous or
implies #3, which would be crazy.

Sorry for the confusion,

            Linus
