Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68C820B3D9
	for <lists+linux-sh@lfdr.de>; Fri, 26 Jun 2020 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgFZOpk (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 26 Jun 2020 10:45:40 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40289 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgFZOpk (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 26 Jun 2020 10:45:40 -0400
Received: by mail-oi1-f196.google.com with SMTP id t25so8264392oij.7
        for <linux-sh@vger.kernel.org>; Fri, 26 Jun 2020 07:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VRvemX/hOYtU6xECIz897lSRaWvQNYLOwiUUahI6LNk=;
        b=Rq3E/pmh8pqxUWZe31CdGzyYTBemlNYoCiEmGTWmsU2XmJa6exD0sx4FLj6If58gTx
         Ta/dhLi2NXxHymzM31LS4D1sUBiDyNf7is+6NegT1TkeEiT/J6SNFsf0IDyIytHMY0G4
         swlpwioBkCI/xjYmzaTRjkQhqc7r4vaM97ZGFII3go9M/KG2Ce4MlR9ng44bDGZr6j9x
         EJDXL4gg/Nrnibq1zLanDamtt6YxEjH6nIgijkuAcC7Qk5Scxx7lp+hWf6eIB9ErVuKI
         cZQGCaWWVz1o4GbgJbA+P2XNv7OrC9jIqcsG4fNybUFf+h/f65JFaenGt2jnXfxB57yK
         yQbg==
X-Gm-Message-State: AOAM530t4QI4vSSCSKFGRq+KvPJNrXYrqyIxvGI2SzwHytD8OI+2bU/O
        t+bO7/ELyT5/02xJHxmvENVEhHpBfxHS1Ii00MY=
X-Google-Smtp-Source: ABdhPJyoZA7lQN2ATm/LHCZAnZqZfK9qoQodqpsEO5d2YezvTernIUUP1tNJxhD/ArOIDRLpfgCAaXCr9j/A1pBVWig=
X-Received: by 2002:aca:849:: with SMTP id 70mr2568585oii.153.1593182739382;
 Fri, 26 Jun 2020 07:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <1441726946-30131-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1441726946-30131-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1441726946-30131-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Jun 2020 16:45:28 +0200
Message-ID: <CAMuHMdW7euPe0ngsftfYdJGi7xCOtmD9_Ysj72_NGxmPJKFKNQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ARM: shmobile: r8a7778: enable IRLM setup via DT
To:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Sep 8, 2015 at 5:42 PM Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Make use of the IRLM setup feature in the renesas-intc-irqpin driver.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Simon Horman <horms+renesas@verge.net.au>

Looks like this is still value?
Hence I plan to queue it in renesas-devel for v5.9....

> --- a/arch/arm/boot/dts/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/r8a7778.dtsi
> @@ -78,7 +78,8 @@
>                         <0xfe780010 4>,
>                         <0xfe780024 4>,
>                         <0xfe780044 4>,
> -                       <0xfe780064 4>;
> +                       <0xfe780064 4>,
> +                       <0xfe780000 4>;
>                 interrupts =   <0 27 IRQ_TYPE_LEVEL_HIGH
>                                 0 28 IRQ_TYPE_LEVEL_HIGH
>                                 0 29 IRQ_TYPE_LEVEL_HIGH

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
