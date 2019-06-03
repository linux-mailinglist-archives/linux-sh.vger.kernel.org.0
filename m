Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD0D3349E
	for <lists+linux-sh@lfdr.de>; Mon,  3 Jun 2019 18:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfFCQJE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 3 Jun 2019 12:09:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39861 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbfFCQJD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 3 Jun 2019 12:09:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id p24so7586056lfo.6
        for <linux-sh@vger.kernel.org>; Mon, 03 Jun 2019 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgsfrWNkeAwXitTJcoIdmm+S5jV0yGJC2wH7GAyc/RM=;
        b=WCXqjpyK9CxskKR1Rsa2JsUVjNbLjTBCO3DKbpdiCOAgDG3/x4OwA5zT3oR9AF+TAb
         KoxRzjysV3/yPddUMg57RzzWz8pj3wl00UXp/zI8qmqY5Pxb0GSO0BkOluklf9MnQYLn
         o8mf30F5cjoqsx0tY+OcCybKIrmRF+OMKq7aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgsfrWNkeAwXitTJcoIdmm+S5jV0yGJC2wH7GAyc/RM=;
        b=aWjKeOWhox2U96gbjGtZwhwCAFgTiEPC5RL8YI9ifnh0QdTbZo4mvRl9HFtEPBkzc1
         uTmBOBwaMdZQNjcC/d3IE3X6BvjFaZCCNasdsGyFFtpuF8X510jIlIGRm9o3crb2gI+K
         I15SKMwLapSi9pyMZ13G9Y0gFE0y9mE4AZqnjLSfwuMvWpZR7CHH9mb2PHTGSJot8bF3
         6fi+B41zt8THxQUMX4ODh5UTYbrphZzedU6y5dY0+3XX4NzDDnx1c6vnXWvvU+AsgxkL
         ipenlTWiDAqrCTKCbvG1jeUmuhD45/6J2JeAzGAApw5SyIzQMbZ/L3gsenZ/GKZvRucQ
         FS4w==
X-Gm-Message-State: APjAAAXYj+VfcBv/4qE3byGgJdjyBNRF26blW2VKF38yUmEjWts9g2+H
        WPsAbCfueAbCqbktNq3MDliR5x/7bE0=
X-Google-Smtp-Source: APXvYqwO/EQbiub7MooEjsIheG2oGBJQLAzn7H95UYoIpcsFcSnVj+RV/8S/G7GXphRII45IdAHSMg==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr14197262lfi.140.1559578140821;
        Mon, 03 Jun 2019 09:09:00 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id z12sm1467973lfe.2.2019.06.03.09.08.59
        for <linux-sh@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id r76so16755976lja.12
        for <linux-sh@vger.kernel.org>; Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
X-Received: by 2002:a2e:4246:: with SMTP id p67mr14377820lja.44.1559578139147;
 Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de>
 <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com> <20190603074121.GA22920@lst.de>
In-Reply-To: <20190603074121.GA22920@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jun 2019 09:08:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
Message-ID: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
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

On Mon, Jun 3, 2019 at 12:41 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I only removed a duplicate of it.

I don't see any remaining cases.

> The full (old) code in get_user_pages_fast() looks like this:
>
>         if (nr_pages <= 0)
>                 return 0;
>
>         if (unlikely(!access_ok((void __user *)start, len)))
>                 return -EFAULT;
>
>         if (gup_fast_permitted(start, nr_pages)) {

Yes, and that code was correct.

The new code has no test at all for "nr_pages == 0", afaik.

                 Linus
