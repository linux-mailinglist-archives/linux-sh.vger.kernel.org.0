Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1AC5CC75
	for <lists+linux-sh@lfdr.de>; Tue,  2 Jul 2019 11:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfGBJOP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 2 Jul 2019 05:14:15 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37893 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGBJOP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 2 Jul 2019 05:14:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so5674675wro.5
        for <linux-sh@vger.kernel.org>; Tue, 02 Jul 2019 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6nWtimC5vfxHX2tOLxULF1wu4CgPYNHaQ1h3AGat0sA=;
        b=v6R8xmxsb/AndlwuFoQmzCOZYeIpaKKWUPcKbfKDsWt30n4UhwuycxTefwW+hlDUo6
         mrmd+B/LOMTuu17R32eKM003sgTx2mfbJHrA4+H+JmCHvJZfo6XCj+VQRi+RvyaYZbYW
         2yqCao4iTsKNLNehd6zbTv5zBKMK5SUesgiWlBlM/3l3v3GcSApzIxhkWfMjPCC87gY9
         aKbEqrt4KolHKumR1H6Dfqz0BtJgxgSezBquF0s6Fl6HmOa6RDYJ5W7ks2vodJrltPKZ
         2BzCzKoAv9oWyGT4Kc/yqszCMboD0W4jiaC9IJJucx8ogkgCcji60W2+xYSlrbBZsrsm
         5N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6nWtimC5vfxHX2tOLxULF1wu4CgPYNHaQ1h3AGat0sA=;
        b=Ep7BDXuOBlQ8JiBCCux0/HbVyIGd5cSGP4Fjgl2PG1AWexVTLgcbCFi68UatRylvLA
         hBBNtjfDwNw1jW9REi6IYiKopL9SubFGQSNWiXcYBfDKKwNjkg963IdL4Zf7EqLilz+N
         l7C5HdiFdCaY4Esx3K10rF3QDcaVOtH2tLABQ5EwzFBylw5bect1KOJvInJQstQnbYcS
         CBRfl525snKZ2zu2Z07rL1zKDDLh2G9lITXr9o7Nm9+gHA+w7bUuQpyLCKb4gq3bopPe
         zZcXXXiJrDhTFC5xwuQs9HrVUVrXbEUdyTxCIkmBzCqLwTj959JHVX72ol9JTZ6KEb7B
         j/xw==
X-Gm-Message-State: APjAAAVVAJ0OiFEzXWij695CGK8tr4iGFJ3Jg+BMZ5FDfVGivqf9IRSk
        RWcQPS22oJPYQMkgDH2GGbSo5w==
X-Google-Smtp-Source: APXvYqznZQBIjc1cAANXlkANOuREA/yPD5X3rI575uAvrvEEMizzCcfvwLbK+9SYuOOWnUAgxECFCA==
X-Received: by 2002:adf:f581:: with SMTP id f1mr23425665wro.179.1562058853606;
        Tue, 02 Jul 2019 02:14:13 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id p11sm12254821wrm.53.2019.07.02.02.14.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 02:14:13 -0700 (PDT)
Date:   Tue, 2 Jul 2019 10:14:11 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-sh@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH RFT 0/4] backlight: gpio: simplify the driver
Message-ID: <20190702091411.vk3q5zhqh6xh7uyd@holly.lan>
References: <20190628100253.8385-1-brgl@bgdev.pl>
 <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Jun 28, 2019 at 11:15:10AM +0100, Linus Walleij wrote:
> On Fri, Jun 28, 2019 at 11:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > While working on my other series related to gpio-backlight[1] I noticed
> > that we could simplify the driver if we made the only user of platform
> > data use GPIO lookups and device properties. This series tries to do
> > that.
> >
> > The first patch sets up all the required structures in the board file,
> > the second modifies the backlight driver, the third and fourth remove
> > the leftovers.
> >
> > This series depends on the three first patches from [1].
> >
> > I don't have access to this HW but hopefully this works. Only compile
> > tested.
> 
> This series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Excellent work!

Ditto!

Hope to see this come around again alongside the other GPIO clean ups.


Daniel.
