Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46771815EA
	for <lists+linux-sh@lfdr.de>; Mon,  5 Aug 2019 11:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbfHEJxS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 5 Aug 2019 05:53:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35880 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfHEJxS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 5 Aug 2019 05:53:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id j17so3400773lfp.3
        for <linux-sh@vger.kernel.org>; Mon, 05 Aug 2019 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
        b=K0B7/O1SMz4RHGXSXodAVa9L8sFoa6UoXKns2dJR1JyKOU2c6furolEA7Q5allCkl0
         hz3utRt5xZzsleYc5j96GSG5SHJEN9qRmcnlBwZ5Hbwn+fft/iuWyPYdhkJXD/m3jjk7
         jrqz4dcI6wnABAMB/2cejuK/mx5zUZuzGuS867Iji3hw8OpOMM0EX1haB0kh4NotBmOv
         TnrXt+nPzDsghutAkYvsNt/760Kmcu8ed+WXy1lumUgqOtf+HKx+P7IjgQ1X5X3F7qkT
         B41DImoEkIRtZUYYGgcCoKd1jS/rYluUTw2JPsGDWnr8wMsUgYyBHWgFNW3+ViFzuyiM
         iwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
        b=uoKdj8dO452VnnGmsZOZJC8SPbb58xRmiPx8a9hVIbvt9aIfSWU/Y9tRV9wbYt7zb/
         aNrj6T2vNysmP1u7kw3IpLBsQh1F5+DBFkNK2Wa6JDrBEQ+G6JV4AOD7HyfGIZsNov+N
         UZAbyur9xSu8deCRxywQqbluSOOHM8VzXLVdy/ECqxnDphlrXsccoy7rSZdEZzg9/2Sj
         7jCgtpPMfuDznO8gHNPBDVo85QpTpjkC0GrFp1wBD7XzdFsTj/4GEWVOgysSVeOFweEx
         RR05Oyr16XZwNh+zDaOykDkF+LPVSZJxDxGhh4yKBJP9wKhVVDQKAlq2Jsu/QjThMtZ1
         BKpA==
X-Gm-Message-State: APjAAAXOT8FuYCTNROj+C7U1BAI377eqUPPE78d9UkacFAaEo034qnXQ
        RVHNaazwGl8L03IwJiU66xZXyfEzogzc0FPs24d6Pg==
X-Google-Smtp-Source: APXvYqznj+OyBQxOK0qX1ZGixNtwr50nmLElXsC7qnFS3oH2+cAja/iMhd5ozIzmb9vouUkDfKjemRMc1Gv/14GZ9L0=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1288145lfq.152.1564998796491;
 Mon, 05 Aug 2019 02:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl> <20190722150302.29526-2-brgl@bgdev.pl>
In-Reply-To: <20190722150302.29526-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:53:04 +0200
Message-ID: <CACRpkdYexsXR=n+t1iVb1QMZc9U1FeKdyHy3w4VnfPy4B=xeiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] sh: ecovec24: add additional properties to the
 backlight device
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sh@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 22, 2019 at 5:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a GPIO lookup entry and a device property for GPIO backlight to the
> board file. Tie them to the platform device which is now registered using
> platform_device_register_full() because of the properties. These changes
> are inactive now but will be used once the gpio backlight driver is
> modified.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Clever! I must also use these dynamic properties now.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
