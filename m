Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46264D4B7
	for <lists+linux-sh@lfdr.de>; Thu, 20 Jun 2019 19:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfFTRWH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 20 Jun 2019 13:22:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39641 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfFTRWH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 20 Jun 2019 13:22:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so3445151ljh.6
        for <linux-sh@vger.kernel.org>; Thu, 20 Jun 2019 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
        b=g1mjJHSB+/44ZB7V3d991RQ8lmWdxyz7cRKmwtk9byrjcNUD9YP2uS+RZIIrKE7lKn
         tVpZNvyJkolb6AtIXbb56yLA6c56wf2OFIIZEIPMa1TRDMJb6FE75meYgwCBSBqSYdRC
         O8jEDgU+LfyGIAqseIIvIOnHddyiMVgjB9lIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
        b=RxarqTyWa59IVsbTV4daH6mn4M0Mr4A4voOquXbabeMoha9ypC9QQw6VFgAiJw2Lyh
         PMnZ2elE5IQr5r73/v0eoxqJwZ0txud9LpgRX8AdaMNy8edXDAQcBAhbm3oWkvAMbp/d
         vG4y9okA4G8vfm48wQiu1xHWrQhg46+MkO87I/+YPc2LktCukMSKn7NW5o1sbpcEhH8i
         dsPtyMBxdOUr9bHkorueZqgEyMTR2HAYdvXkLQ1VPz3+k/1E9XDIyfe/T4KQGKA9b0rL
         ZvKwS8+ovlhe327KL5R2oaFVUpK/coCOtsuAOG8RpDJssSLGk8vCOTHHCB7/jTbyADcG
         Z3Cg==
X-Gm-Message-State: APjAAAX4Y86w4eZS20VdQNNif82RPOb1r2arGlvsYJBVocFjqkMjueqB
        u4hTUtUiSbCuIWajkXiICiJacEc9VeE=
X-Google-Smtp-Source: APXvYqy2DceMEGZLBiDm3z2V+8CRP8EtMeGNPZmaDWSlTeOXs4vbSjGNMRgR2aKVq4AHNTIxjvNMWQ==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr23688028lji.223.1561051323996;
        Thu, 20 Jun 2019 10:22:03 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x15sm38833lfn.78.2019.06.20.10.22.02
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id p24so3005807lfo.6
        for <linux-sh@vger.kernel.org>; Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
X-Received: by 2002:ac2:5601:: with SMTP id v1mr51955604lfd.106.1561051322002;
 Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none> <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
 <1561032202.0qfct43s2c.astroid@bobo.none>
In-Reply-To: <1561032202.0qfct43s2c.astroid@bobo.none>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Jun 2019 10:21:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paul.burton@mips.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Jun 20, 2019 at 5:19 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> The processor aliasing problem happens because the struct will
> be initialised with stores using one base register (e.g., stack
> register), and then same memory is loaded using a different
> register (e.g., parameter register).

Hmm. Honestly, I've never seen anything like that in any kernel profiles.

Compared to the problems I _do_ see (which is usually the obvious
cache misses, and locking), it must either be in the noise or it's
some problem specific to whatever CPU you are doing performance work
on?

I've occasionally seen pipeline hiccups in profiles, but it's usually
been either some serious glass jaw of the core, or it's been something
really stupid we did (or occasionally that the compiler did: one in
particular I remember was how there was a time when gcc would narrow
stores when it could, so if you set a bit in a word, it would do it
with a byte store, and then when you read the whole word afterwards
you'd get a major pipeline stall and it happened to show up in some
really hot paths).

            Linus
