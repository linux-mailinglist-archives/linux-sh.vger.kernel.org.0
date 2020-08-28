Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB38255794
	for <lists+linux-sh@lfdr.de>; Fri, 28 Aug 2020 11:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgH1J1l (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Aug 2020 05:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgH1J1f (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Aug 2020 05:27:35 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE14C06121B
        for <linux-sh@vger.kernel.org>; Fri, 28 Aug 2020 02:27:35 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id u131so234958vsu.11
        for <linux-sh@vger.kernel.org>; Fri, 28 Aug 2020 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52zKqUSdV0qZVoQTtvFuZSla22zZLeCM10kF2S2vylo=;
        b=L0FafcRxcvqheShftDUhSlbBJqAncc/ePSfPwPCIweprjftt5/BSgKy3BKAM1BIq8e
         d30cYn4yCMozW389UnScIzZA25N7mV48wgStk8TiZdT1bD6uB962M94nBJaZKxYvo/Gy
         HU7t/wY2ow3sRQ4AXXumJAONBgcaPrIKF0N0/HyR1NZiEGAeCCCp/6LL8hM7zHiVXksw
         bQO8ZmKqH8g/4wh2kgPILpNVwbm1LvlKJLjLtafFlsn49lhNg0zke4FGIMadetI0OUW5
         8HDZwmB0ef7yW3dz4nuGmLZrudcB6G5cqT0pOWgpJ+K/D7+LGf7Czf+JNZ77oJE6OQui
         K13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52zKqUSdV0qZVoQTtvFuZSla22zZLeCM10kF2S2vylo=;
        b=HQU5xgz+AoL48gFcIFhyBCKaAjLEImauuAGrBMtDY3ZX+SCWw+3axDs1ViORHzUtJV
         zt8GmVKgEqZx8MXhmMc3kSmSedzIu3zGQfg0036GqFWdGS6yt/Mp6DQHhTvGtK1nVRDo
         90uW0IjJ/uHrjKsksRfIe/OIX6e3fLRy8DC1zrtz2F7TkcCqyiiG4QVBzfV5bkAxXHa1
         l5YnD7yUJI8grUWHv/FecUi/2pxxdAX/2dXzatjwjsKA+ki5j79ki/jAyB5EEV46vzoQ
         aGesWIr6nCa/M84LxywS+mRHSYFo6HsvoaiyRcBvfh/DFFgJKaaniUhWtJMyYOI4RyKj
         eKEg==
X-Gm-Message-State: AOAM531z029eT6uc8Up3wnUzW70XUA6OfgKu4TvnuQGMYyj6HSSaoNwQ
        CVUL3/CErf4zdjL/BEJoPQx6SI6lDRHBCf5Ca+s9yQ==
X-Google-Smtp-Source: ABdhPJy/B7VHMvzvzbEi7QEAfxMZ4jV3nwJaVkTt3w6kaS4gxUPya72WKU4yOeFrkvQuSmkZLEUi4A5sE5rkYCX+fYk=
X-Received: by 2002:a67:f8ce:: with SMTP id c14mr251691vsp.14.1598606854311;
 Fri, 28 Aug 2020 02:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200714121856.955680-1-hch@lst.de> <20200714121856.955680-10-hch@lst.de>
 <20200828020045.GT3265@brightrain.aerifal.cx> <20200828021152.GU3265@brightrain.aerifal.cx>
 <20200828042422.GA29734@lst.de>
In-Reply-To: <20200828042422.GA29734@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 11:26:57 +0200
Message-ID: <CAPDyKFrKJrUN8mJ94g0+0Vs3aT1uq9MmHWfvzcVaoA5efaYPmQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] sh: don't allow non-coherent DMA for NOMMU
To:     Christoph Hellwig <hch@lst.de>
Cc:     Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, 28 Aug 2020 at 06:24, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 27, 2020 at 10:11:53PM -0400, Rich Felker wrote:
> > > This change broke SD card support on J2 because MMC_SPI spuriously
> > > depends on HAS_DMA. It looks like it can be fixed just by removing
> > > that dependency from drivers/mmc/host/Kconfig.
> >
> > It can't. mmp_spi_probe fails with ENOMEM, probably due to trying to
> > do some DMA setup thing that's not going to be needed if the
> > underlying SPI device doesn't support/use DMA.
>
> Adding the linux-mmc and linux-spi lists, as that seems pretty odd.

The mmc_spi driver needs modernizations, so I am not surprised to see
odd things.

My guess is that in ->probe() we check "if
(spi->master->dev.parent->dma_mask)" - > and runs dma_map*()
operations, which fails and leads to bailing out of ->probe() to
return an error code.

However, by looking at the code, one get the feeling that the DMA
support is somewhat prepared to be made optional. I guess it has never
been really tested, as the Kconfig option has "depends on HAS_DMA"  -
and it's been like that as long as I can remember.

Kind regards
Uffe
