Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04B81E7A72
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2020 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgE2KWB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 May 2020 06:22:01 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46373 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgE2KVf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 May 2020 06:21:35 -0400
Received: by mail-oi1-f193.google.com with SMTP id b3so2076446oib.13
        for <linux-sh@vger.kernel.org>; Fri, 29 May 2020 03:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxVnqrx085NuHFy5nmbhmTRLcYmULvN72Be2s+cieco=;
        b=ACZ/3b7bWhNqfOp6F1EBjJ03eKHUQ9EkXk8kZfq3XhGBcrIdTXgzagsBUZhi4Ks0NB
         eDADtZKxVBleo26nVl/ly0uEl8jXI0xh2uI1KBoNmV7eUCfOz6/qt42B5Eq33wsLhDLW
         b1MgGb0kKhkEr9HdT1FbIvzlECGiJy4tGqjOWHCL54Mmyg90E9VqxIvnKDkcl/Gz0VNl
         IN12FxEPZgm30Lj9PiZEAq338/cK86bEDBmLLyz/IB2fjZcWoyDs+37ERqVYi4GLzuPB
         wQ/UEWlnVNQoLWZPB+NHGUxTyK2fbkPJlcv1u1UOWBwIW01ZZ3k2JZ/VHXBQLJNlhvRL
         6/2g==
X-Gm-Message-State: AOAM531x+e1kzgfDpM9XYDn4PlNTPl/haaCl3BGulr4pZwisRqbFMzz9
        ACQj0Se+TSZ5MYyV/eYrvyrmjWKDBnN0qUTAR2k=
X-Google-Smtp-Source: ABdhPJx++mbCAGBQaBMcYVvzusZlcFIseYmS0HFgloFtNUC4oRwN7/P021zUhYcvmkDDMLOHb/cDnXrQaMr4HVK0hqE=
X-Received: by 2002:aca:644:: with SMTP id 65mr4681325oig.148.1590747675398;
 Fri, 29 May 2020 03:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <8945f9b7-d4d3-851e-dc4f-2d05ed94c169@physik.fu-berlin.de>
 <CAMuHMdXnbCtRUFvJ=JUWjgO2O8h=tHfKB30HQCdZrnhwtWgG8g@mail.gmail.com> <11913b96-0a05-7fca-e744-dd29eddf5327@physik.fu-berlin.de>
In-Reply-To: <11913b96-0a05-7fca-e744-dd29eddf5327@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 12:21:04 +0200
Message-ID: <CAMuHMdVep67j96taE6aaBO3r+Vo2kBXn-zt653YU0iTiDnH8Xg@mail.gmail.com>
Subject: Re: Build fails with unknown symbol __get_user_unknown with
 InifiniBand enabled
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Adrian,

On Fri, May 29, 2020 at 12:13 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 5/29/20 11:59 AM, Geert Uytterhoeven wrote:
> >> sh-next branch [2] but I couldn't figure out where __get_user_unknown() is actually
> >> defined within the kernel.
> >
> > "git grep __get_user_unknown" tells you ;-)
> > See __get_user_size in arch/sh/include/asm/uaccess_32.h
> >
> >> Does anyone know how to fix this problem?
> >
> > __get_user_size() lacks a case for 64-bit values.
> > Interestingly, __put_user_size() has one, cfr. __put_user_u64().
>
> Ah, so this is the problem then? I'm surprised that this issue has
> surfaced only recently.
>
> Would this be fixed by Arnds patch series to remove SH-5 support by any chance?

No, it won't. As this is uaccess_32.h, i.e. for sh32.
All architectures are supposed to implement 64-bit get_user() accesses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
