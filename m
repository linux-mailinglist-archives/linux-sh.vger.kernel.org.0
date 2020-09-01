Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E8725943B
	for <lists+linux-sh@lfdr.de>; Tue,  1 Sep 2020 17:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731313AbgIAPhD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Sep 2020 11:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgIAPg4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 1 Sep 2020 11:36:56 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDD5C061244
        for <linux-sh@vger.kernel.org>; Tue,  1 Sep 2020 08:36:55 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g16so79993uan.5
        for <linux-sh@vger.kernel.org>; Tue, 01 Sep 2020 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1B9nLNVLY42WxzWWaQLkKFC09iT2uTznxSa/7Ga9+ik=;
        b=EjZj6y+TjUP2e0zRcKUUQvE66STizixCKC/KAIDXV/69rk8mNQSfWyAU6WYWSKFuzu
         YdysqzXgzI2xtpYHzb6Bg9vJ2avPXngJVilLH84994hthxQshimmjhHojPFW896ik/4d
         7+SfIVuVuc/ZxqJXQpx6oVzAu/cP4B59SJR8lGPID+5gG2w4v4nOMnEQcQrCru633HNP
         zuDN+/5pNOLV30vak4kZQMnpd+VUgw2bg+XdxSwnEBkVo/zJgSOy5ArWNiN7cmol12Bb
         IqdXYacCg5YMcR4+mn8aBUmFtkx7PyrkYdutuPTIGu4pnVnQseXCdI/TJgx4fELy5snC
         I+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1B9nLNVLY42WxzWWaQLkKFC09iT2uTznxSa/7Ga9+ik=;
        b=Kcg/VIhZ/Hf1JhtGksb00syuuRwgMQ2pctEyZ9HIKDkFMugKtVp4TCFRuDODQdTdLp
         3vzfS8Pil8TsfvYDMl+fkHjY3BR/K3wMu6krrQ+8utu0+Ih8TDdRV1zUJvOsP/68ocH4
         GC5s2UnWdDwYpqjTKhVs2EmNLKPA6z3wGxiZwj3N4zFjG6oEBhxM3LU3Zgah6a2l4yM3
         Ok5EUSmRf+4a/PcuTM8pbBtCZMMb7WCd9VTKulE728tTFhP1AjF/I6aaIr2S6U2jmVeu
         /C5WVQHngriIwen/wUINzdU/vUA8bFnSZb2ht8MIc5g5aWiXvMUIDJ6o64pBv8DMBuEh
         w4BQ==
X-Gm-Message-State: AOAM531dZmxf1judjvW0UiHKd/qv/QxxO6ZY5MOYBOwTynxeann740Z0
        tW+EaZl1fPcq876UKWGpiGignLz8GNaieeyO1n5DBg==
X-Google-Smtp-Source: ABdhPJwNEOdYZ2JzAa+esqv8ikW74w5nzhA2RPqk11Z0XyL+fuHQHEnv1hhlq9RrJ7o9td9gDXMcOORUJEPmsoYSFJ0=
X-Received: by 2002:ab0:5e43:: with SMTP id a3mr1793697uah.19.1598974614146;
 Tue, 01 Sep 2020 08:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200901150438.228887-1-ulf.hansson@linaro.org> <20200901150654.GB30034@lst.de>
In-Reply-To: <20200901150654.GB30034@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 1 Sep 2020 17:36:17 +0200
Message-ID: <CAPDyKFqZXdtVokrDQvJAh-NzN0T2ayPD6MepemLEaDt1TRPduw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_spi: Allow the driver to be built when
 CONFIG_HAS_DMA is unset
To:     Christoph Hellwig <hch@lst.de>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Rich Felker <dalias@libc.org>, Mark Brown <broonie@kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 1 Sep 2020 at 17:06, Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 01, 2020 at 05:04:38PM +0200, Ulf Hansson wrote:
> > +#ifdef CONFIG_HAS_DMA
> > +static int mmc_spi_dma_alloc(struct mmc_spi_host *host)
> > +{
> > +     struct spi_device *spi = host->spi;
> > +     struct device *dev;
> > +
> > +     if (!spi->master->dev.parent->dma_mask)
> > +             return 0;
>
> I still don't think this makes sense, as the dma_mask should always
> be non-NULL here.

If that is the case, I wonder how the driver could even have worked without DMA.

Because in the existing code, host->dma_dev gets assigned to
spi->master->dev.parent->dma_mask - which seems to turn on the DMA
usage in the driver.

What am I missing?

Kind regards
Uffe
