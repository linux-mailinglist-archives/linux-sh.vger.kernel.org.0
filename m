Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB372A5B7
	for <lists+linux-sh@lfdr.de>; Sat, 25 May 2019 19:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfEYRGF (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 25 May 2019 13:06:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34416 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfEYRGF (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 25 May 2019 13:06:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id v18so9289034lfi.1
        for <linux-sh@vger.kernel.org>; Sat, 25 May 2019 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUnPUEw25xH84DOq6zJ0v6Aw5NodbUsM/I1jFeyU0KM=;
        b=ZvNWnuQZMG/SkUan4dFz03SkF+F6NtqRC/Cgx2fb5lXthFpCjyzEbczW/SDraYncIR
         zQgHz3FqW2dkuJzWrU9AHwiQ6MhmEIkM0Uwmoc25goSdoXSqyrERxHA6nnEdyvmvjOcJ
         rQ898QL/9J9sDjvhm9K66P/TQWm9eicsR7EOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUnPUEw25xH84DOq6zJ0v6Aw5NodbUsM/I1jFeyU0KM=;
        b=k07dGa958awJNLCHA/jVvkJngvOXiWPAcoqcXQXO17X5iu5Rur4Hay52PH1nEN/wOi
         jHa2zZolhv2AylhczaYR1YuHs/VohsGz/5ssYRmmASIxFfL8XhhGKmeVnOq+zPevqof3
         Q9TNM38d3j27b+lBphKNCmsPEZcn+xF8XHORtrR7CmehyxQm5ccTnKYWO4fQ55IRqAJC
         CMBpSH+YPN7YiTcJrtOTLn5Kkd8FwXXurjhlGqI03Uxa+cx8KkyISK5IpbEy1/GjfPyu
         2qcIc+PNfADrxeSYH/Mz1GE8j7HE/flfJV+P/IrlsX8QMc2FB6s6EiAh1N2hyT1Ntwj0
         8bLA==
X-Gm-Message-State: APjAAAWXnEc3C405WI3SduFNNEw1BoMLR49H1M4SWFhKeKaf0Wiks2XG
        IttJskEprJKEPRTkuuU9hjqgOFFFMOM=
X-Google-Smtp-Source: APXvYqwRqLB+TbjCpuWEzDA6uJ1iIDN6jp+LX4VXwxxl6m+1bPewlsw/8lf1Imz0nY5u2ZU1z7pVxw==
X-Received: by 2002:a19:a50b:: with SMTP id o11mr40970076lfe.2.1558803962612;
        Sat, 25 May 2019 10:06:02 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id a29sm1191654ljf.33.2019.05.25.10.06.01
        for <linux-sh@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 10:06:01 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id y17so1406958lfe.0
        for <linux-sh@vger.kernel.org>; Sat, 25 May 2019 10:06:01 -0700 (PDT)
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr629669lfn.52.1558803961013;
 Sat, 25 May 2019 10:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190525133203.25853-1-hch@lst.de> <20190525133203.25853-5-hch@lst.de>
In-Reply-To: <20190525133203.25853-5-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 May 2019 10:05:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
Message-ID: <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm: add a gup_fixup_start_addr hook
To:     Christoph Hellwig <hch@lst.de>,
        Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

[ Adding Khalid, who added the sparc64 code ]

On Sat, May 25, 2019 at 6:32 AM Christoph Hellwig <hch@lst.de> wrote:
>
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.  I have no idea why this
> is not required for plain old get_user_pages, but it keeps the
> existing sparc64 behavior.

This is actually generic. ARM64 has tagged pointers too. Right now the
system call interfaces are all supposed to mask off the tags, but
there's been noise about having the kernel understand them.

That said:

> +#ifndef gup_fixup_start_addr
> +#define gup_fixup_start_addr(start)    (start)
> +#endif

I'd rather name this much more specifically (ie make it very much
about "clean up pointer tags") and I'm also not clear on why sparc64
actually wants this. I thought the sparc64 rules were the same as the
(current) arm64 rules: any addresses passed to the kernel have to be
the non-tagged ones.

As you say, nothing *else* in the kernel does that address cleanup,
why should get_user_pages_fast() do it?

David? Khalid? Why does sparc64 actually need this? It looks like the
generic get_user_pages() doesn't do it.

                Linus
