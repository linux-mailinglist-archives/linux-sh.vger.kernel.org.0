Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B70276ADA
	for <lists+linux-sh@lfdr.de>; Thu, 24 Sep 2020 09:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgIXHdR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Sep 2020 03:33:17 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:34209 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgIXHdR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Sep 2020 03:33:17 -0400
Received: by mail-oo1-f67.google.com with SMTP id o20so546893ook.1
        for <linux-sh@vger.kernel.org>; Thu, 24 Sep 2020 00:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPmGsNK0cbfN4HWtW7yKhBQjzgGWb4zWuGo4oocyk0w=;
        b=PuWTtcr3VaEoXARD2DUHZYp0VpeJ7N/BzRr85SrscXhMwi1iVD/vSGsoWH2tBXP/kk
         612lplbZyuhXaHT/oJ3m/F9F07ZcGmbhrvUzK8EueXHnG5HIWKTU/OYsvDnfCaAptBLG
         9/9b1yXb1mICW/r8YqVrR4s4DSlRzMJCU9PtWItETa4w/G/esBVwDVcSURuGa3OIyLLC
         69Ozj3LQkpL35juA0lMVlH6vjkBBZQ+reHbiu68RjUrcSaI8fA5AYBmCSfGCauDZr636
         z1kVxNXFpm9s0SO7W9Ce2AZ/okIbxClcoe4+0dD4+3FKfyxmVe6wOHAyNUEJjy4pu1OP
         Ht5A==
X-Gm-Message-State: AOAM530xa7pvZ6bokLX0pMxW79elqAQueu1Pc0oA5dMXVzG5X0x6+vik
        XI2znpv4HQc0Y6QhEdxbX7A93vC9501UeKI/Ncj6RfLIcgQ=
X-Google-Smtp-Source: ABdhPJynXRhhHzJxzqDCxpAJGtrhHm1WT12O50849/F0+Xwkx03+Ewi7Nhym2a1Gwulq4cQn3Q1quO9iJsH8GexqMHo=
X-Received: by 2002:a4a:e616:: with SMTP id f22mr2427902oot.11.1600932796303;
 Thu, 24 Sep 2020 00:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200924043139.522028-1-hch@lst.de>
In-Reply-To: <20200924043139.522028-1-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Sep 2020 09:33:05 +0200
Message-ID: <CAMuHMdVxZbNfBHyabaBReH3O7q5xB42+3g78A52xZBtxJzyRYg@mail.gmail.com>
Subject: Re: [PATCH] sh: remove CONFIG_IDE from most defconfig
To:     Christoph Hellwig <hch@lst.de>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Christoph,

On Thu, Sep 24, 2020 at 6:31 AM Christoph Hellwig <hch@lst.de> wrote:
> Remove CONFIG_IDE from defconfigs that did not actually select chipset
> drivers, and switch ones that have libata drivers to libata.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/arch/sh/configs/landisk_defconfig
> +++ b/arch/sh/configs/landisk_defconfig
> @@ -27,13 +27,12 @@ CONFIG_NETFILTER=y
>  CONFIG_ATALK=m
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_RAM=y
> -CONFIG_IDE=y
> -CONFIG_BLK_DEV_IDECD=y
> -CONFIG_BLK_DEV_OFFBOARD=y
> -CONFIG_BLK_DEV_GENERIC=y
> -CONFIG_BLK_DEV_AEC62XX=y
> +CONFIG_ATA=y
> +CONFIG_ATA_GENERIC=y
> +CONFIG_PATA_ATP867X=y

Landisk should also have

    +CONFIG_PATA_PLATFORM=y

but as it didn't have CONFIG_BLK_DEV_PLATFORM=y before neither,
probably that should be a separate patch anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
