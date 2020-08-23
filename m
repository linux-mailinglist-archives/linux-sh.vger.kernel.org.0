Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EB424EC3B
	for <lists+linux-sh@lfdr.de>; Sun, 23 Aug 2020 10:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHWIrv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 23 Aug 2020 04:47:51 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33295 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgHWIru (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 23 Aug 2020 04:47:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id t7so4958917otp.0
        for <linux-sh@vger.kernel.org>; Sun, 23 Aug 2020 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhJEmJaYW5qM4i0u5d/AXYqzfWoyYUP4vvzZHyLF35A=;
        b=THZnFi4GvfYTP03QDYO4RS+3dEKyGbT5Y+CGQOpTGgA3mT/M+fDrRnDVKJseA/4pGg
         BZZOLovUHgYsUX2uuCJlJDbFNlxmVPwbQNjPSuG62aKhF4thVlgSGgTviuQUmbaeyZhi
         jzWo5/GiUzyx05LW6rbtp6KcdZk5e+YzRrbqep67QJfnZAAqUMEupACIg+G6+JwjdqAm
         7xPVCse3K5VYIE7yRmEmHiL2ME8PBSiO+0Ykag0V+mp7d2v3g9+mAlZCdOSITzbgwkVb
         cF89soboqaTnHNQZm7eE1ZyKMSNRiI9TMVjDh23tfW137dK0bTY/bytDzwGrHJqhvmMZ
         UU+Q==
X-Gm-Message-State: AOAM532Xl8CIrmBcfBpMPjmE9trCUZ0Y5Zh7uLP0umzVcIPbbF3eWkTB
        eU8w5xyhJdPOZhziz9LFjFuG3RuUag3pLy2lk7g=
X-Google-Smtp-Source: ABdhPJzznC9sxKrIG0WaNzEKIU6c6QeU9/UY11gf5+M9KYTc/Eh3zZQvXO4bpv5rL9kzNsJwewsffmsh/FUgYSHn3qs=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr286796otb.107.1598172469308;
 Sun, 23 Aug 2020 01:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdVYeAqLHuW2fjQk7HQbnGJhY7YJcksMddn_6Cp61cd-AQ@mail.gmail.com>
 <C510813DTTYI.1PZXLO9Y2FRLM@atris> <CAMuHMdWAeccfEbZ=7MFgR=2SyC_1zRNGXG5G6VL5qY=d0HW37A@mail.gmail.com>
 <d78cbae7-30c1-245a-84f6-8f1518d99340@landley.net>
In-Reply-To: <d78cbae7-30c1-245a-84f6-8f1518d99340@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 23 Aug 2020 10:47:36 +0200
Message-ID: <CAMuHMdW49JKKqckxsbb1CZxDT8=PDNcVs+e+6ob4aCDQn-QkUg@mail.gmail.com>
Subject: Re: [PATCH 1/1] sh: add support for cmpxchg on u8 and u16 pointers
To:     Rob Landley <rob@landley.net>
Cc:     Liam Beguin <liambeguin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Rob,

On Fri, Aug 21, 2020 at 10:37 PM Rob Landley <rob@landley.net> wrote:
> On 8/19/20 8:50 AM, Geert Uytterhoeven wrote:
> > On Wed, Aug 19, 2020 at 3:34 PM Liam Beguin <liambeguin@gmail.com> wrote:
> >> On Wed Aug 19, 2020 at 5:09 AM EDT, Geert Uytterhoeven wrote:
> >>> On Wed, Aug 19, 2020 at 5:07 AM Liam Beguin <liambeguin@gmail.com>
> >>> wrote:
> >>>> The kernel test bot reported[1] that using set_mask_bits on a u8 causes
> >>>> the following issue on SuperH:
> >>>>
> >>>>     >> ERROR: modpost: "__cmpxchg_called_with_bad_pointer" [drivers/phy/ti/phy-tusb1210.ko] undefined!
> >>>>
> >>>> Add support for cmpxchg on u8 and u16 pointers.
> >>>>
> >>>> [1] https://lore.kernel.org/patchwork/patch/1288894/#1485536
> >>>>
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Signed-off-by: Liam Beguin <liambeguin@gmail.com>

> >>>> This was reported by the kernel test bot on an architecture I can't
> >>>> really test on. I was only able to make sure the build succeeds, but
> >>>> nothing more.
> >>>> This patch is based on the __cmpxchg_u32 impletmentation and seems
> >>>> incomplete based on the different cmpxchg headers I can find.
> >>>
> >>> Indeed. This version is suitable for non-SMP machines only.
> >>> BTW, it looks like this version can be replaced by the one in
> >>> asm-generic?
> >>>
> >>
> >> Thanks for your feedback I'll have a look at the asm-generic functions
> >> and try to use those instead.
>
> Does using the asm-generic one automatically use the architecture version for
> j-core? (Technically we're compare-and-swap rather than cmpxchg but eh, close
> enough: CAS.L Rm, Rn, @R0 opcode 0010-nnnn-mmmm-0011, based on the IBM 360
> instruction. Not sure how the #include plumbing winds up selecting the version
> here, if there's an extra thing we have to do we should do it.)

No, the asm-generic is only suitable for arch/sh/include/asm/cmpxchg-irq.h.
There are 3 different implementations needed to cover all, cfr. below.

> >> Okay, I'll look into that. Would you recommend a good way to test these
> >> changes?
> >
> > That's gonna be harder, I'm afraid.
> > Who has suitable hardware?
>
> Define suitable? (Not familiar with testbot? In addition to a raspberry pi form
> factor j-core board that runs off my laptop's usb power pretty much with me at
> all times, I have a johnson controls sh4 board in a box, a little blue board
> that runs an st kernel fork in the same box, and an sh2 board from the dawn of
> time in another box. I generally use the j-core board as my hardware and
> regression test sh4 on qemu unless I'm checking a specific hardware thing.)

arch/sh/include/asm/cmpxchg.h:

    #if defined(CONFIG_GUSA_RB)
    #include <asm/cmpxchg-grb.h>
    #elif defined(CONFIG_CPU_SH4A)
    #include <asm/cmpxchg-llsc.h>
    #elif defined(CONFIG_CPU_J2) && defined(CONFIG_SMP)
    #include <asm/cmpxchg-cas.h>
    #else
    #include <asm/cmpxchg-irq.h>
   #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
