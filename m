Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABEF31FE9
	for <lists+linux-sh@lfdr.de>; Sat,  1 Jun 2019 18:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfFAQUN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 1 Jun 2019 12:20:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36004 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAQUN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 1 Jun 2019 12:20:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id m22so12207145ljc.3
        for <linux-sh@vger.kernel.org>; Sat, 01 Jun 2019 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
        b=RdmXCPI1V+CWEuQQLIpoDnZHvNbMKl90LuqFIcI1YnEKXhPCSK5AUEFPNd650/ERUV
         Qh10sm7MSlB6HnOBHykL5KhchRGHirJ9ssAdIkVcDYKPumYo1Zi2YYM6BhTRVFDVSg7U
         Nczzjs9o+pp1b0tTsgtO9YPvDZ1uwi7oKCdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
        b=skzJ/OqHCSy+QstfmvnpJrux4yyMBOKXChpZy9cmidPqJqfBUAX+Hr/59I2nPJXgaL
         WD5m73nYA+z/Rid1sXi6XlkZJG0y7GV3mJsXqI+UpbSr+7R9gQSGjNtsmSRckr2kYSuj
         NNoMucYEmv3dSzFCBOOnqdB+jbFNRs3N4ixQLi27WSM81ByrWl1+ns6Yiht+zS/WD8tA
         0oAo421DWS0TB25RqFOR+jUNs/5Jv0L2EpGm03uCZM4YVmxXmvtbzMIkk8rRUIsu2hkJ
         BiuDxKzhZHkze0cSZPcmFMpCrlDri7gogu91ak0aatzwIY3tdsO2ckI7tEDBDr8nzZDD
         PCwQ==
X-Gm-Message-State: APjAAAWzhz8vgtcVpd6j+Qf3GnB0NSgzAUsQ/grt+tNiezCcwNX754sP
        BJDs32Lm11Nlk/A8xwSIObl6gt3h2MI=
X-Google-Smtp-Source: APXvYqyrsFBm+AX+xi72t+a1EREk5VKpLRv1Np9jMqZXaBHT985pzMcFs9CDJKiO+zMJ+JJLBOvI4g==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr9255332ljj.52.1559406010571;
        Sat, 01 Jun 2019 09:20:10 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id x1sm368074ljd.93.2019.06.01.09.20.10
        for <linux-sh@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 09:20:10 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id y17so10365683lfe.0
        for <linux-sh@vger.kernel.org>; Sat, 01 Jun 2019 09:20:10 -0700 (PDT)
X-Received: by 2002:a19:ae01:: with SMTP id f1mr8899724lfc.29.1559405673566;
 Sat, 01 Jun 2019 09:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de>
In-Reply-To: <20190601074959.14036-4-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 1 Jun 2019 09:14:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Pass in the already calculated end value instead of recomputing it, and
> leave the end > start check in the callers instead of duplicating them
> in the arch code.

Good cleanup, except it's wrong.

> -       if (nr_pages <= 0)
> +       if (end < start)
>                 return 0;

You moved the overflow test to generic code - good.

You removed the sign and zero test on nr_pages - bad.

The zero test in particular is _important_ - the GUP range operators
know and depend on the fact that they are passed a non-empty range.

The sign test it less so, but is definitely appropriate. It might be
even better to check that the "<< PAGE_SHIFT" doesn't overflow in
"long", of course, but with callers being supposed to be trusted, the
sign test at least checks for stupid underflow issues.

So at the very least that "(end < start)" needs to be "(end <=
start)", but honestly, I think the sign of the nr_pages should be
continued to be checked.

                      Linus
