Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879685983A
	for <lists+linux-sh@lfdr.de>; Fri, 28 Jun 2019 12:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfF1KPY (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Jun 2019 06:15:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36386 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfF1KPX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Jun 2019 06:15:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so5446557ljj.3
        for <linux-sh@vger.kernel.org>; Fri, 28 Jun 2019 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kuj/HA5ST1YfjCjqjIBhZNTXDUSb6xW7P1aCaiPqrgA=;
        b=r6dSQpzyJ15l8/BZOerGnIC0wmlXFFxfmCNPswk98awd0aKKD/xz4DYIkFnrcpARwc
         9sdvqCgd+viVCqOoqV5DsJAzOBUhUf/9nizOab/W05hGnZ+aRPgxYSIvNp/etvsf0Bd5
         7F4BrgRgXu1c9aYrUgEPX1eF/7LB/YoDreIZpGZnd2Ti3SaiRfgp05yGFCfRpyUWgepa
         oLODrZ7ssyKN4rbX8g59LuC3JvntLy+gjzULgxNHEHNn3QTm6v/wkO5hDsKGyWISADOz
         7bVhqeEKt5MJ2n98pVYGCrxjEj6/99R06YIrx9A8E2D83Zm2PoCJRlDWEY6NInkGexOX
         pB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kuj/HA5ST1YfjCjqjIBhZNTXDUSb6xW7P1aCaiPqrgA=;
        b=KrzC0jgUYtD1oDJR7W1LIkLgUixhk3mVxhNeFAwtT1rAsE6CGC9An5yEJjSOzye/vq
         sjjesRZJPNn/hO9qyd+DSoHnQ6YuPb4p4Hkoo9mxbt1D7tZEYBZVwWscsdIbUJJEt+RO
         o7gxHDdutU9I6KtO0wPM3qKekV1thRhQE9PsRx9+LXrenBnlEOeF2mDQzZtDeZSg2sss
         +jWg7p3cyFkUNotxLm83r/sKV9l3VcJjEWkEw/rOCr/opAG6NOqwxl6D6SxZsRue+FnX
         ji5w+Ac/g6OMilxaM2u9onA23bUg8YQ4Cyp9IpTNYENdrgcsP6p3U83npui1ehJF5XTv
         ET8A==
X-Gm-Message-State: APjAAAXG/iWoRR43GOenYW8+/3rbhfOUswHBnjFVPAj2fOF30zjftnJk
        kVqKD/U9p5PDOHiE4fmvA0SxDRLo3LTvLKc7mVWDRg==
X-Google-Smtp-Source: APXvYqwYZ2VwFJZSHzxzSaLF/aTvHeHNBwJGW3yg8YND+7cFBk+h9mUEiXw+n8bOv+ARb6mtvZlpXB0Ri+mSjhURIAs=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr5837692ljj.108.1561716922174;
 Fri, 28 Jun 2019 03:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190628100253.8385-1-brgl@bgdev.pl>
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 11:15:10 +0100
Message-ID: <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
Subject: Re: [PATCH RFT 0/4] backlight: gpio: simplify the driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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

On Fri, Jun 28, 2019 at 11:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> While working on my other series related to gpio-backlight[1] I noticed
> that we could simplify the driver if we made the only user of platform
> data use GPIO lookups and device properties. This series tries to do
> that.
>
> The first patch sets up all the required structures in the board file,
> the second modifies the backlight driver, the third and fourth remove
> the leftovers.
>
> This series depends on the three first patches from [1].
>
> I don't have access to this HW but hopefully this works. Only compile
> tested.

This series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Excellent work!

Yours,
Linus Walleij
