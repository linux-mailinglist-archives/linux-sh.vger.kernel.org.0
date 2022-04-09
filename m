Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566094FA1FB
	for <lists+linux-sh@lfdr.de>; Sat,  9 Apr 2022 05:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236793AbiDIDj4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 8 Apr 2022 23:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbiDIDjy (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 8 Apr 2022 23:39:54 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E1CDFB5
        for <linux-sh@vger.kernel.org>; Fri,  8 Apr 2022 20:37:48 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id f3so8946629qvz.10
        for <linux-sh@vger.kernel.org>; Fri, 08 Apr 2022 20:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPMboYNoi1Tq9s1o8EjnHiPJyfdvsa8XEDzwclG05nU=;
        b=ZSBY1RFuqn8ZwYn/HjI0d5AJ0GZqGT3Hv1VZHxXSu+MglJWtwv8mjtrMn7Wh8GSv0y
         C4FRuIwfEb9kASwqWhWnwoVm65oVzbnB2dRJSLcgX9+3EAkDZRixb2gtkR1DSWR5D82u
         oZl1VV9b4yJeD07+AStdFPt1TKOpNhUvl3f8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPMboYNoi1Tq9s1o8EjnHiPJyfdvsa8XEDzwclG05nU=;
        b=DhaEamTksGXJYrREwNc5G8HKwTJxxwRy6EJj3uhYvs+YCYN6d1NqBqAudGjlVOALUZ
         qTY5uZwppxI1720SG/IvfaGM4ffZ1vM20YX+Ih1K8DEpR7wxkn45e6IZPco2GQDZ84wB
         /fHdIQpnI8fsG8w/3O8IS9Fh5xulNc8r9c86ZcdPeRukOauyyTe0OmbWsBUJDjfC7BXi
         C2qqCaD0GZkllgGiFif4WVAZu1+rvp+a9566CxmG9KASvI9hj7j2SevfLNsyxD8J4cJ6
         tb8P9pyutyzRk1FZ390l3epyN9FKnZVjqM6rSicV31RpSeJRakxP7KEyMGRqH2A2YJH6
         HRPA==
X-Gm-Message-State: AOAM531H8NwArelI37tEqT9OC/P0ZDGLDEL4UloZXWmHpmX0H1LG3w+Y
        sQqssc04Cag/tMMGoJX++u34G9F+nVZBw71w6UThYA==
X-Google-Smtp-Source: ABdhPJx2skHaFGBmVPuWh026ZrD9+x9YgR9mbH2KjPOfAg+qXm2Dy1h2UjyHmuuULVBn29BLaloUhjCyxN7D3zqhYTA=
X-Received: by 2002:ad4:5743:0:b0:441:6da8:dc5e with SMTP id
 q3-20020ad45743000000b004416da8dc5emr18980082qvx.13.1649475467635; Fri, 08
 Apr 2022 20:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org> <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org> <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
In-Reply-To: <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 9 Apr 2022 12:37:36 +0900
Message-ID: <CAFr9PXmMzFa_iD1iECi7S=DvpMRKgLu=7P+=2RmbEWtqczjduA@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Rob Landley <rob@landley.net>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Rob,

On Sat, 9 Apr 2022 at 09:20, Rob Landley <rob@landley.net> wrote:

> I've been booting Linux on qemu-system-m68k -M q800 for a couple years now? (The
> CROSS=m68k target of mkroot in toybox?)
>
> # cat /proc/cpuinfo
> CPU:            68040
> MMU:            68040
> FPU:            68040
> Clocking:       1261.9MHz
> BogoMips:       841.31
> Calibration:    4206592 loops
>
> It certainly THINKS it's got m68000...

I couldn't work out how to define a mc68000 machine on the command line alone.
There might be a way but it didn't seem like it.

> (I'd love to get an m68k nommu system working but never sat down and worked out
> a kernel .config qemu agreed to run, plus compiler and libc. Musl added m68k
> support but I dunno if that includes coldfire?)

Once I get QEMU to emulate a simple mc68000 system my plan is to get
u-boot going (I managed to get it to build for plain mc68000 but I
didn't get far enough with the QEMU bit to try booting it yet) then
put together the buildroot configs to build qemu, u-boot, a kernel and
rootfs that just work. Then I can hook it into CI and have it build
and boot test automatically and it won't bit rot anymore.

> >> It looked like 68328serial.c was removed because someone tried to
> >> clean it up and it was decided that no one was using it and it was
> >> best to delete it.
> >> My plan was to at some point send a series to fix up the issues with
> >> the Dragonball support, revert removing the serial driver and adding
> >> the patch that cleaned it up.
> >
> > Nice. I will leave all the 68000/68328 code alone for now then.
>
> The q800 config uses CONFIG_SERIAL_PMACZILOG. Seems to work fine?

Dragonball uses a weird UART that doesn't seem to be compatible with
any of the common ones so it needs its own driver.

Cheers,

Daniel
