Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B24A1E79F9
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2020 11:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2J7y (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 May 2020 05:59:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33580 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2J7x (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 May 2020 05:59:53 -0400
Received: by mail-ot1-f67.google.com with SMTP id v17so1528587ote.0
        for <linux-sh@vger.kernel.org>; Fri, 29 May 2020 02:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7hvpp4njcZ09Yt+zMLjABSa7SSfVDcUVUWW4DsxTZcs=;
        b=HRaHdzF893Rehz5M8tu63Xfo0C8VoWr9c1YswRgAXgB4qokSESy29PTC0yhMDY4nB0
         EZHD8S5jEI8MeC2k7KIrxVzOuKznB3HOy/zGuNDxrbWaIjSWcVgUA06/mVvrEMyApyzC
         /0bXugDxl+GKVjc+AJxfIjcIOZyXhyeweaWTwU58cE9HuOKGPgayunCsqS4pkoF08am5
         otv1Cthl0sPNEI0Z12sinrIHc95+UTeh5yly4yM/bnxxrPFMzDvTgRczlqtVdYdgIN2X
         17zjzufzpz8dU4/Z70NYSfM1l7oF1VQm6D4UhncGEk1GnwkGMgFUxgz7j5Kkce/5osIN
         MxQw==
X-Gm-Message-State: AOAM531kC3Wu71g54FWkzLaMhuhuw7EqT20+LqF2ZFczQCSsgj+2eSo0
        KaQLmCeRC9wa7CN/eROqXJb5Ke/RXBVHd5p7v2A=
X-Google-Smtp-Source: ABdhPJzXTwgI/gEWElPoy+kv++y3hSWf11UHpC1dOmRCOsG2YBO8okciix5Vkn2BKKPjxD74L0+uwWuzzzYQ4VqK4jM=
X-Received: by 2002:a05:6830:1151:: with SMTP id x17mr5508768otq.250.1590746392369;
 Fri, 29 May 2020 02:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <8945f9b7-d4d3-851e-dc4f-2d05ed94c169@physik.fu-berlin.de>
In-Reply-To: <8945f9b7-d4d3-851e-dc4f-2d05ed94c169@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 11:59:40 +0200
Message-ID: <CAMuHMdXnbCtRUFvJ=JUWjgO2O8h=tHfKB30HQCdZrnhwtWgG8g@mail.gmail.com>
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

On Fri, May 29, 2020 at 11:03 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Trying to build the SuperH kernel on Debian currently fails with:
>
>         ERROR: "__get_user_unknown" [drivers/infiniband/core/ib_uverbs.ko] undefined!
>
> when Infiniband is enabled (which is the default in Debian) during build.
>
> I have assumed that the problem is similar to what Kuninori Morimoto fixed in the

Morimoto-san fixed a different issue.

> sh-next branch [2] but I couldn't figure out where __get_user_unknown() is actually
> defined within the kernel.

"git grep __get_user_unknown" tells you ;-)
See __get_user_size in arch/sh/include/asm/uaccess_32.h

> Does anyone know how to fix this problem?

__get_user_size() lacks a case for 64-bit values.
Interestingly, __put_user_size() has one, cfr. __put_user_u64().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
