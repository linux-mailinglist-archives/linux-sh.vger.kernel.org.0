Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531FA307C96
	for <lists+linux-sh@lfdr.de>; Thu, 28 Jan 2021 18:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhA1Rb7 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 28 Jan 2021 12:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbhA1R3H (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 28 Jan 2021 12:29:07 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2ACDC0612F2
        for <linux-sh@vger.kernel.org>; Thu, 28 Jan 2021 09:27:54 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bl23so8975538ejb.5
        for <linux-sh@vger.kernel.org>; Thu, 28 Jan 2021 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QosST7j4l1ljXzY+3djf7Hi017sCNw0ib1djAQPlF10=;
        b=VHpnpcTumkVPV+DBvq46kW6shUt0mJwFGO5HVq5K/D0NuagbejoWu9ns95BEX8A9ns
         C3aLrfbwEBwwtpS1H8Xdtf7dJkiOjNm2MosdVyMYtML8fYXkPLFmASO3XkGbVJnWkG8X
         fcUK5Mx7nQIbZ8bouvbdOK5/PQRo0jj5re59EffIlnjIFi3KWZy5JwfRnSOloroN6Y3I
         71jI6HMp2OX6zYxO9479BOUxCwZQ3PXk3xVnALXww7rua3XG1O6KerGTXVmZSQdYumWh
         WuDzgizKb7lynLEEv4J9NWfNvC25Bdk1p6QGL1ul2K0TkFtysL4jkqUq38fYmPuC19DO
         zYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QosST7j4l1ljXzY+3djf7Hi017sCNw0ib1djAQPlF10=;
        b=RcgwdvOhz6HeFD+TF0iafb4umWMeCEHFCCYb72lurPo8OoSk1FIaVu+L4kKzxnPg0+
         fK0LSEyosrQAxBsVGKuHZ0XmC+ZS8oFZ/nGfHd6NMLz+bjct7MvoF4yu6XEdcCno5sQt
         kKP4uIJRa6s7FmFyWNfIRojsvKzUoTSAt1HHeaxZzffFCBb0cTrT4Nb5JmOmdibrVvXA
         SH0A2Z7ua2vgubNwlhQ59uJOo0aXofC86/QVGX0xL8/98+noHYrtjIhgwF+3O4wV+07U
         bnQnsD/7ojUxjfparF9Xo8dyB10EBlryImH96IqNTsFfYyZhsLOkJCVMJ3m181YogguI
         TG7Q==
X-Gm-Message-State: AOAM531Ja0e6L8OruNZ5WOGsTG7QHRC/ZfUe/vq1THDeqliUarM47tj0
        LOAAgjgcGHsrSuE85k0Md2yGf8EtUvM7QIwo3VoJvA==
X-Google-Smtp-Source: ABdhPJwI1ecVhIjuGu8sBmhkXt4myAABJcYO8AXi0IUBZfW1pptS1v5hWwtNcgxFFUl4Oc54eochR40aoUKuHqzEszg=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr418962eju.375.1611854873287;
 Thu, 28 Jan 2021 09:27:53 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
 <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 28 Jan 2021 22:57:41 +0530
Message-ID: <CA+G9fYupjtPhynZSRG36vr_n8Vsjp9u_wWdf7bAzEwnBikhy2w@mail.gmail.com>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Geert,

On Thu, 28 Jan 2021 at 20:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Naresh,
>
> On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> > arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
> >
> > FYI,
> > # CONFIG_MMU is not set on these failed configs.
> > config file attached to this email.
> >
> > make --silent --keep-going --jobs=8 O=/home/tux  -
> > build/.cache/tuxmake/builds/1/tmp ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> > mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
> >  1671 | void filemap_map_pages(struct vm_fault *vmf,
> >       |      ^~~~~~~~~~~~~~~~~
> > In file included from mm/nommu.c:20:
> > include/linux/mm.h:2578:19: note: previous declaration of
> > 'filemap_map_pages' was here
> >  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
> >       |                   ^~~~~~~~~~~~~~~~~
>
> Care to give "[PATCH -next] mm/nommu: Fix return type of
> filemap_map_pages()" a try?
> https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/
>

Thanks for your patch.
The reported build issues got fixed now.

- Naresh
