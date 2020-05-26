Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CBF1C332A
	for <lists+linux-sh@lfdr.de>; Mon,  4 May 2020 08:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgEDGyP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 4 May 2020 02:54:15 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46321 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgEDGyO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 4 May 2020 02:54:14 -0400
Received: by mail-oi1-f195.google.com with SMTP id c124so5762086oib.13;
        Sun, 03 May 2020 23:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNhJYGrqC1Iv8sX+lYsU5bJcM7CuH+PFCYnSsocbUuE=;
        b=GDxPr8y3Fege8zABua6wABpgchMwnzDeNaVMbdWczYsSk/cGAHZibSwpMn0YdVPhnh
         asYzzK2HD0YYvmulm1HccAnmZb+dxAMhHPJQKPzEfFkK5ppLUJp2nx/yIewtfupbgGwa
         u9jX4mpr0JmcRMziR+PS172GQsZan8qtm/1pZGq6KnpkTdEcfnpjHbRfQ0HMaX16+ijl
         8symFxVqVJ6e4zJwSWKrhYf1Z4IWIwFD6Mzx4D4AZSRJOyzLuWrEgi6++vBLskgRqqOw
         iytDZVQUjhX5ySxvUmFA0FNsRYpgy6WgqJi94clXixvO0NWcCNgfnbg45UIFpBqjJo/E
         oSJg==
X-Gm-Message-State: AGi0PuYHevZ6Skjqk51ZlmPyjRKo5rlm6T0POKksXZ8TC+Ie8dk4rgQP
        NnIN2Cw+V4/WFEif16H2q4A7uz+l0gtNFjje20c=
X-Google-Smtp-Source: APiQypLoYqLAdj2pVdtdIi+uJfM6JoKkXYRiEh9jwvyzregxGncty9VI/kBqX0d605/EMSygx99ea3o/TGk3aM73ggQ=
X-Received: by 2002:aca:895:: with SMTP id 143mr7601323oii.153.1588575254264;
 Sun, 03 May 2020 23:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1588417483-30987-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588417483-30987-1-git-send-email-bmeng.cn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 May 2020 08:54:02 +0200
Message-ID: <CAMuHMdXCvpLNAK3a4SsMt=TUsJAUBxO21X2sAsKiyBOgvLE+qg@mail.gmail.com>
Subject: Re: [PATCH v2] sh: Replace CONFIG_MTD_M25P80 with CONFIG_MTD_SPI_NOR
 in sh7757lcr_defconfig
To:     Bin Meng <bmeng.cn@gmail.com>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, May 2, 2020 at 1:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> CONFIG_MTD_M25P80 was removed and replaced by CONFIG_MTD_SPI_NOR in
> commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
