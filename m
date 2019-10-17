Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD90DA662
	for <lists+linux-sh@lfdr.de>; Thu, 17 Oct 2019 09:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405115AbfJQHZ4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 17 Oct 2019 03:25:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40500 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408134AbfJQHZ4 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 17 Oct 2019 03:25:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so1042980wro.7
        for <linux-sh@vger.kernel.org>; Thu, 17 Oct 2019 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jAAT95spfsOy4+Rq+gH+u3lTOCghLhGj68CKdrx98lE=;
        b=F9UsfomGr2CNeYykZN6yZitMfmX8fyJmBmymlewoU1PXc2q1Vn6t2I3rLUE0QWoC+8
         MhGZC1Xxu/HAPvWEqxlCLTCRMaaDSMkAqReNf/vsQmeJgSro0pTbKA1qHoespSFtIU4T
         hckNX80j47KRUy7XU7YRVWBJJrOhFo29SE2b0tDHsFp6jwXQK2NKPBZS9NbwhF5Qrclh
         wEK1zOlExz/lr5gS1h3P4ujA4JxsgbbgXtH2moIUZpERKAVb7XpXk5V1UuFSDK+DHnkO
         HEdCkGHQMMEirfde1nue9BKxA5pg2UOVVQ7LOxvfko9gpIMy1XcL/1RyLnOW7FZBzwn0
         GIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jAAT95spfsOy4+Rq+gH+u3lTOCghLhGj68CKdrx98lE=;
        b=CQ88kDjzSdPfPNddPFqH5J016WfMejPti2Jl7HBL70DkyCDp8uXuLGlBWWBuaWiQYc
         PkC/lDTSg0lmoYLObldj4A7mDl6QduYmnGki1TvTXSA0Th9Xw6EexTQ10S0j0BpeB3o1
         q+Wfk6lRCRz5ToVQgduqO1/ftFKKuwgik4TQUb0yePCeV2TQDc+SmqSy5fxWt8CB6/0D
         mjXTLmgOCsQ4kAofNVcszybRSVl5kZYUC4+BlcorP5KDOvxkmq0PnZEdnS7SIqR7VWV6
         Sud7lusASvq4fPNV8H/k8fw41CdNv2IgHFWq6INnT0PwUdVMo5+ucvTK2w1KdFnKZ3a3
         i5Fw==
X-Gm-Message-State: APjAAAXaRrkIu96EIAQmYnT4b9FF2F7MWVFRkFpp4u4a+xQpUE+NXMXX
        2jjS7Bxh6UqyGUipHN5yJQYBCQ==
X-Google-Smtp-Source: APXvYqx9/y1nF0ofABrlWuRvb2aHc8qYFhZp9RVTdgQNYYfN+rH7FOQdXwZFWhoItjuvwj7hH3/jTA==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr1554836wru.87.1571297152660;
        Thu, 17 Oct 2019 00:25:52 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id o22sm1351495wra.96.2019.10.17.00.25.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 00:25:51 -0700 (PDT)
Date:   Thu, 17 Oct 2019 08:25:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
Message-ID: <20191017072550.GK4365@dell>
References: <20191007033200.13443-1-brgl@bgdev.pl>
 <20191014081220.GK4545@dell>
 <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
 <20191016130536.222vsi5whkoy6vzo@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191016130536.222vsi5whkoy6vzo@uno.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 16 Oct 2019, Jacopo Mondi wrote:

> Hi, sorry for not having replied earlier
> 
> On Wed, Oct 16, 2019 at 02:56:57PM +0200, Linus Walleij wrote:
> > On Mon, Oct 14, 2019 at 10:12 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
> > >
> > > I guess we're just waiting for the SH Acks now?
> >
> > The one maintainer with this board is probably overloaded.
> >
> > I would say just apply it, it can't hold back the entire series.
> 
> I've been able to resurect the Ecovec, and I've also been given a copy
> of its schematics file a few weeks ago.
> 
> It's in my TODO list to test this series but I didn't manage to find
> time. If I pinky promise I get back to you before end of the week,
> could you wait for me ? :)

Yes, no problem.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
