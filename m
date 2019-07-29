Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25EC3788FA
	for <lists+linux-sh@lfdr.de>; Mon, 29 Jul 2019 11:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbfG2J5e (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 29 Jul 2019 05:57:34 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39946 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbfG2J5e (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 29 Jul 2019 05:57:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so61109453wrl.7;
        Mon, 29 Jul 2019 02:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EgmHLFik/OPgDdGuLMAdfuPiX1r55Htn8ht8rmVprc=;
        b=iaRJt83iIe9rYC/VeVp51ao+N1QSI7arn17YvYlggOPWgnTXL9NPJQYIBFbePFqMW0
         lKexKmKwPccT4d20+MI/I/vqSnpP5Xdg8zpf/q0vUb6heWfgAGeRGt/b9hXUdjZ1pHBG
         0+wsdQ1iH4u9srnWGh5skMcvEa42LopACl9Ta2UE/wD39WGf6MEymIRRQHAgU6fEUVj+
         JwAtMRjiSI1jjRVIKmG+BRoc5kY7y8K1crDJ/fxZHS2JEzvrz1N9/9ZiXrxofcYHM+JB
         An9G6L3aOBKkEf9NSJKKXLjK0eckLsa6f6grPi97kKifp6S6BHu/MP5cYxMt3MB+fuGM
         B9dA==
X-Gm-Message-State: APjAAAUoixkFwGp/HA8FFhz+SrvgBNywByeW+IZFTuqj/IyzeczHm/S1
        11Kj5g+HPpefLhc/gly4F8MTAj7Is6JXC3iqOFGLQr6O
X-Google-Smtp-Source: APXvYqwjfJqS4NGp1R7UrJA2JKANbRDFjcVknk63xGwZnvz1sSMLkkUqcYNpnDqWGXG4WZ8w21QgE4NZzRTpKbjjx94=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr35431224wro.213.1564394251709;
 Mon, 29 Jul 2019 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190725063401.29904-1-hch@lst.de> <20190725063401.29904-5-hch@lst.de>
In-Reply-To: <20190725063401.29904-5-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 11:57:19 +0200
Message-ID: <CAMuHMdUBPj8AVSuDwaBB_4gRD6k7vzo0WAFJEkTUbxSw31bzUg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-mapping: provide a better default ->get_required_mask
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Takashi Iwai <tiwai@suse.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Michal Simek <monstr@monstr.eu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Christoph,

On Thu, Jul 25, 2019 at 8:35 AM Christoph Hellwig <hch@lst.de> wrote:
> Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
> of IOVA space, and the generic direct mapping code already provides its
> own routines that is intelligent based on the amount of memory actually
> present.  Wire up the dma-direct routine for the ARM direct mapping code
> as well, and otherwise default to the constant 32-bit mask.  This way
> we only need to override it for the occasional odd IOMMU that requires
> 64-bit IOVA support, or IOMMU drivers that are more efficient if they
> can fall back to the direct mapping.

As I know you like diving into cans of worms ;-)

Does 64-bit IOVA support actually work in general? Or only on 64-bit
platforms, due to dma_addr_t to unsigned long truncation on 32-bit?

https://lore.kernel.org/linux-renesas-soc/CAMuHMdWkQ918Y61tMJbHEu29AGLEyNwbvZbSBB-RRH7YYUNRcA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
