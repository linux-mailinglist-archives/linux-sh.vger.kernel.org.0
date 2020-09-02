Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE4425A7D4
	for <lists+linux-sh@lfdr.de>; Wed,  2 Sep 2020 10:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIBIc0 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Sep 2020 04:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIBIcZ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Sep 2020 04:32:25 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A060C061244
        for <linux-sh@vger.kernel.org>; Wed,  2 Sep 2020 01:32:24 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id v24so1311727uaj.7
        for <linux-sh@vger.kernel.org>; Wed, 02 Sep 2020 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V59oKVGgQ2o/hrV2OUnBHec2zNyLXF8phchXBgtNQf4=;
        b=ZKW3UwWfVmaJ7OUihqUwbWM0KxRjc5z+m5CDEaVftJB8efuWn9X40Ib8Z5tfvwApHa
         wQYES3HC6ruUfDohVzEUxEHvvX7qlbus/XvNhvEoXGCA/YawKvHGP/ibStZGq7iMcg/y
         XBvnqJ7w8XicH2VcNqsyivv7cRj2H1j8qXYpEVx89XDKaCiJjKx2otlIro4U9Y7POqu3
         J/S/Si1auHeHqSdj/0ZGa+1SfPeLiYixs0s8UUhQcYgxj8f80egeQPSduPL5Ih64gENY
         ISrt0Icc1gjJD55DhRrM7GtojiwI3s4lEWUTrLqlWt3PKznWlM5lxXNKK1f1jtKkxknL
         6OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V59oKVGgQ2o/hrV2OUnBHec2zNyLXF8phchXBgtNQf4=;
        b=StqgtLXZnDzgq2uAaYiGBbH415QOByxg5W/Ly3deK7Z5W6iwszZMTRBFqt9NnketQ4
         aUUJ9GD7ZSICvJHqYcRnsTR6/oKjA+cQedRU9RhOFVVYkl6iHiZVz28FFimaAz9DTSFy
         xBjxlas2LmVbuIPhh2r9r6foTN7TNiTsz8SSG4gV34E9RaC9fZFJOOjiLdzex03gOG97
         p7NmjkIe29PXk7M155biVDf8a+9LlyNZFSDTAzxbKr0cQLgttWwSuwHWdr6InYAVaU2/
         ZU89tU5nKn1raxdSOjsC62LsR6dcflgPgq/+lD9Fq1oL/m8tQAwtu+RRlzUpCERBePHk
         b9+w==
X-Gm-Message-State: AOAM530SdnFo5IP144he/SmDSV7jP57ObihTJkb9dehnD40Gf4ZmyyQ4
        oRVd6p1tOCpIovno6TNRsyaf+NVlcTmW5wvSWyhGwQ==
X-Google-Smtp-Source: ABdhPJzJlz0hPiPBx35vVZO+9fTCBRG4euIzrUMfRIboxgPwg9dJcuWO9GyJxP8/hgp9b5ll67xVA7G/+FfNxda+yJc=
X-Received: by 2002:a9f:2431:: with SMTP id 46mr3617265uaq.129.1599035543174;
 Wed, 02 Sep 2020 01:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200901150438.228887-1-ulf.hansson@linaro.org>
 <20200901150654.GB30034@lst.de> <CAPDyKFqZXdtVokrDQvJAh-NzN0T2ayPD6MepemLEaDt1TRPduw@mail.gmail.com>
 <20200901154049.GA376@lst.de>
In-Reply-To: <20200901154049.GA376@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 2 Sep 2020 10:31:47 +0200
Message-ID: <CAPDyKFqDKUG3RC241hv535CLFGEQc4b-vv0e3bexzGkDSY82Jg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_spi: Allow the driver to be built when
 CONFIG_HAS_DMA is unset
To:     Christoph Hellwig <hch@lst.de>, Rich Felker <dalias@libc.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 1 Sep 2020 at 17:40, Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 01, 2020 at 05:36:17PM +0200, Ulf Hansson wrote:
> > > I still don't think this makes sense, as the dma_mask should always
> > > be non-NULL here.
> >
> > If that is the case, I wonder how the driver could even have worked without DMA.
> >
> > Because in the existing code, host->dma_dev gets assigned to
> > spi->master->dev.parent->dma_mask - which seems to turn on the DMA
> > usage in the driver.
> >
> > What am I missing?
>
> Do you know of other non-DMA users?  For SH nommu it probably worked

I don't know of other non-DMA users. As I said, I wish someone could
step in and take better care of mmc_spi - as I know it's being used a
lot.

> because SH nommu used to provide a DMA implementation that worked
> fine for streaming maps, but was completely broken for coherent
> allocation.  And this driver appears to only use the former.

Alright, so you are saying the DMA support may potentially never have
been optional to this driver. In any case, I can remove the check in
$subject patch, as it shouldn't matter.

Anyway, let's see what Rich thinks of this. I am curious to see if the
patch works on his SH boards - as I haven't been able to test it.

Kind regards
Uffe
