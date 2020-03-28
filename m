Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CCE19650C
	for <lists+linux-sh@lfdr.de>; Sat, 28 Mar 2020 11:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgC1K3Z (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 28 Mar 2020 06:29:25 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32921 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgC1K3Y (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 28 Mar 2020 06:29:24 -0400
Received: by mail-oi1-f195.google.com with SMTP id m14so11199576oic.0
        for <linux-sh@vger.kernel.org>; Sat, 28 Mar 2020 03:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVS/lXOVhzOS2Rpuqsijvc6LGBbir7YFrPCUG7+S8xg=;
        b=Fw1XL2kHXVD7VpSlOJ9WPfXz4HETdLbcb+cvyDJ9g2ogbmXxvvWKefm3GMjGPnpkZw
         2uTxyS/ZQT+HSHW29YccS2Ugth8gjjhK4RjXIQTCk0DdwgaSH7LqNX9eJul8jMHk3fdk
         Sb8f4hhGiwmlk3XGGfRi7D6RzQSrOD3djzI8FfwD+5rxxkSyyKxEhP/Cy56mRMKv+s2V
         Mbs7SHN3XggFjAwIr99UU+85gRU6Feru0ChUbhM491SrOlz3e6U8IHBikFvlqXohMvyd
         xEnul1BUvDclme5d/8KTt2P9yR0Umw+itMD6q8loZa1rHMhLDHMFEebZBOq2IOrEiN5j
         BXSg==
X-Gm-Message-State: ANhLgQ3J3XnqsXLPbuAvROfEr/OgWNpsqkbd29Ey7YzZYpyjuTKspSrI
        YZsa0BYCWmyC61bUGT+bkNYohWpVYg7EVGMw8uMCYg==
X-Google-Smtp-Source: ADFU+vtGvQhEqyc+5REbNBDePMjY7HR+AQ7/2fWOWifURSEXUlJNbmbYNtX54ZZO4Xpff2KfrIJTTESROBkrlL5KXkM=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr1911127oib.148.1585391364189;
 Sat, 28 Mar 2020 03:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200315175108.9694-1-romain.naour@gmail.com> <20200315175108.9694-2-romain.naour@gmail.com>
 <20200326204240.GF11469@brightrain.aerifal.cx> <0f44cd31-a3e4-7b14-b9a8-28e4b0fd571e@landley.net>
In-Reply-To: <0f44cd31-a3e4-7b14-b9a8-28e4b0fd571e@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 28 Mar 2020 11:29:13 +0100
Message-ID: <CAMuHMdV2BPUua6T7Bgu2mRj5De7mwUKm=hqNAs3_jZK4fZnXtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
To:     Rob Landley <rob@landley.net>
Cc:     Rich Felker <dalias@libc.org>,
        Romain Naour <romain.naour@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Alan Modra <amodra@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

CC arnd

On Fri, Mar 27, 2020 at 11:00 PM Rob Landley <rob@landley.net> wrote:
> On 3/26/20 3:42 PM, Rich Felker wrote:
> > On Sun, Mar 15, 2020 at 06:51:08PM +0100, Romain Naour wrote:
> >> Since the patch [1], building the kernel using a toolchain built with
> >> Binutils 2.33.1 prevent booting a sh4 system under Qemu.
> >> Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
> >>
> >> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> >> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> >>
> >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> Cc: Alan Modra <amodra@gmail.com>
> >
> > Acked-by: Rich Felker <dalias@libc.org>
>
> Is there any way to get this into sunday's release?

Not if the maintainer isn't in CC.

> Acked-by: Rob Landley <rob@landley.net>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
