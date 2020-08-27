Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A5A254604
	for <lists+linux-sh@lfdr.de>; Thu, 27 Aug 2020 15:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgH0Nes (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 27 Aug 2020 09:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbgH0Naf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 27 Aug 2020 09:30:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F04C061234
        for <linux-sh@vger.kernel.org>; Thu, 27 Aug 2020 06:30:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a5so5395466wrm.6
        for <linux-sh@vger.kernel.org>; Thu, 27 Aug 2020 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p33Zl85F48xSFFwh9Fvb6fYwVy/Jt4DGVFmz86MHbko=;
        b=CUujgUZRienGvENy9ZeNSE4OLq/gTozkw9vqhnndn3e+Pp27upZYxzcOy348qWT4x6
         fZ9HzhrGd6ok0/lpV6XJMXIHbIrfSS3H2kc5d+JTd1lletPZjVOkUQ8WZMoDnSSylgRw
         zOHH0JLxrQJsHR8v5+SGQOGgwwu7dIE6xp9Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p33Zl85F48xSFFwh9Fvb6fYwVy/Jt4DGVFmz86MHbko=;
        b=pVxfmGi3IBWn7+hTzWgau1JQEJcINvYdnbwKnmuGcB2HHSM2lykz+g+DAXTRUwF42l
         sVi+VRvCwIN1m27AYy4XMjK5QvpbjAYV0TpUSdqBuDsQHoTJxQ/Yq8lNSMQGspSAue7v
         kcZiSpr3qIkqyb1lJrr6vqzvaeJ9tdX+xMF4f4oW1Fw1qx0Oh8PgTncHNDoyiG2bY0cv
         UkYZkrywxJxVuapyQm/DaagRTCMMIs9jjYyHMBzXtVTS9QJXlmv9LC0Z80QkN26ipeXM
         QHmvcNN4bIqmvPprTtFgdoRT35eqZKg60/Z+IQmFBbrK8riF5efBtjpSHw8JKiP3zg74
         5ftQ==
X-Gm-Message-State: AOAM530TLTefT0EDsBz21LtSHbRtbFnKlcvKQ57N/bwbEHvYMfXI2c7y
        jaTaRW893zmHm6pQ87J9k6qwXX1dwI4J3gw4dqqvFw==
X-Google-Smtp-Source: ABdhPJyMtaFishcwtzNCj7DHN/faPMoK+tSF7O0vKJaBGS+gpAIRdF6geUez9pCQeleah1w6P5SJ7nzMgTS0KKpMqRI=
X-Received: by 2002:adf:bb54:: with SMTP id x20mr19609148wrg.413.1598535011238;
 Thu, 27 Aug 2020 06:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <b19bc982-a0c4-c6ff-d8f5-650f2b3a83c8@gmail.com> <20200827063517.GA4637@lst.de>
In-Reply-To: <20200827063517.GA4637@lst.de>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Thu, 27 Aug 2020 09:29:59 -0400
Message-ID: <CA+-6iNy3U9pO0Bykzgvb9n9fcsBi6FiatLdpA1s0HgQNWZ49mg@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] PCI: brcmstb: enable PCIe for STB chips
To:     Christoph Hellwig <hch@lst.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" 
        <linux-pci@vger.kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Robin Murphy <robin.murphy@arm.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVERS FOR ALLWINNER A10" 
        <dri-devel@lists.freedesktop.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <jroedel@suse.de>,
        Julien Grall <julien.grall@arm.com>,
        "open list:ACPI FOR ARM64 (ACPI/arm64)" <linux-acpi@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Aug 27, 2020 at 2:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Aug 25, 2020 at 10:40:27AM -0700, Florian Fainelli wrote:
> > Hi,
> >
> > On 8/24/2020 12:30 PM, Jim Quinlan wrote:
> >>
> >> Patchset Summary:
> >>    Enhance a PCIe host controller driver.  Because of its unusual design
> >>    we are foced to change dev->dma_pfn_offset into a more general role
> >>    allowing multiple offsets.  See the 'v1' notes below for more info.
> >
> > We are version 11 and counting, and it is not clear to me whether there is
> > any chance of getting these patches reviewed and hopefully merged for the
> > 5.10 merge window.
> >
> > There are a lot of different files being touched, so what would be the
> > ideal way of routing those changes towards inclusion?
>
> FYI, I offered to take the dma-mapping bits through the dma-mapping tree.
> I have a bit of a backlog, but plan to review and if Jim is ok with that
> apply the current version.
Sounds good to me.
Thanks, Jim
