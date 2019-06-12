Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D921419DA
	for <lists+linux-sh@lfdr.de>; Wed, 12 Jun 2019 03:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407559AbfFLBJn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 11 Jun 2019 21:09:43 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33428 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407541AbfFLBJn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 11 Jun 2019 21:09:43 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so10716920lfe.0
        for <linux-sh@vger.kernel.org>; Tue, 11 Jun 2019 18:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
        b=gAjfSlHuLsIpxvb8lF0RyxQXzEhYSHQJnAZ4as99A8GBRPKGt8LtILDEijhajNv2fV
         FXhIx40OUX4WPq1W1eQvis0UNqIoFt7tkihxVZ4QyREYOfVPuleZ/0Zq1i4TWCfQY/NA
         AhmvmJi02EHwj98eCflp9T4F3Jku2HpzQgXkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
        b=ksLr04iJ5E51ZehTpOpa+KsqXdDyvFcrlp3gVMf34kiRfxf3LCPeSHT0suhlK9sUx9
         GqGpFOi34B8PNwX681z7If7c25hkbmLGle7CMhfw9F3pVE7jxjRAejd55SvMbjiw+0tQ
         u4G3qS/M+6cxqjikiZV0dSWo6ASz2T3uwm6d/vuHF/UrcZnf63YqmpYUfbUnhu6oQ5r9
         cGGZp0SxYcnyum77KS3F+dd/4XM9UuggthzPWKPRuPUqRRqOzi4J8Jubvdp0aI9/y0+m
         IJxTYfyZamCCoymB6b2wu0VzrQO1sa/FTiXajhiN0LEDIjLUMQbLvUQv71FBB+gKP6tr
         +2Ew==
X-Gm-Message-State: APjAAAVR6ZSb/+IuQKEYqZwqJ77FgnchSX3CX8QmT+iFagp0msGq81N5
        rKWR0lSzaLL8YrEinqBOvyqqgYHCLPM=
X-Google-Smtp-Source: APXvYqzh2IY9vt4wmyKf4xhzVlzAyNWuiIVdHbwrQwpE6WfEZ8BEhAyBKsl5GHAaG+xdLmWzc5whHw==
X-Received: by 2002:a19:4bc5:: with SMTP id y188mr39608488lfa.113.1560301781487;
        Tue, 11 Jun 2019 18:09:41 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id z17sm2934425ljc.37.2019.06.11.18.09.40
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 18:09:41 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id p24so10707636lfo.6
        for <linux-sh@vger.kernel.org>; Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr26185312lfm.61.1560301780325;
 Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
In-Reply-To: <1560300464.nijubslu3h.astroid@bobo.none>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Jun 2019 15:09:24 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Jun 11, 2019 at 2:55 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> What does this do for performance? I've found this pattern can be
> bad for store aliasing detection.

I wouldn't expect it to be noticeable, and the lack of argument
reloading etc should make up for it. Plus inlining makes it a
non-issue when that happens.

But I guess we could also at least look at using "restrict", if that
ends up helping. Unlike the completely bogus type-based aliasing rules
(that we disable because I think the C people were on some bad bad
drugs when they came up with them), restricted pointers are a real
thing that makes sense.

That said, we haven't traditionally used it, and I don't know how much
it helps gcc. Maybe gcc ignores it entirely? S

               Linus
