Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B28BCC52E
	for <lists+linux-sh@lfdr.de>; Fri,  4 Oct 2019 23:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbfJDVsA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 4 Oct 2019 17:48:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44651 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbfJDVsA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 4 Oct 2019 17:48:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id m13so7887351ljj.11
        for <linux-sh@vger.kernel.org>; Fri, 04 Oct 2019 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
        b=hboFmV/U4IcPI89MtzDp+OzE5KwsWErja8LOnkuuLwv0fksWiRpqJQZRis7rFIeVPP
         Ooj27rcXns2Y4feoVEtg49n8CryY2RaGyouBUeaqk2ra5EWaVF1b9SJCzpbS0ccPcx6o
         OKGdwKxr435NLGf2rhVWgjPumSWR2SHoXx0hKGzQWcUyTo9N2UXJEk48l4i2HhDZs/lk
         /w5UDGdeyD3/r3JdKqYvjgprnF2+BDf/24afsGx6mveKIokPtaSJGfI7WbyMW88ICvUl
         cpiuvmH0N+uNxhDXRpNNofDROfjzaePmP13ERqR66MmREXUZCh8g2+gPv00qpvzL0Kk7
         +7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
        b=mGoblNUL58FwUGfD/JNpz2nNwaO56eOTykQnjQZU1flfmFIWgITATaeMxRel8xerEx
         JQMrm45tWvDsPgE1P8iSQaPSu+fhzLr14/tfT2kF0jyp5uEiijVeSa5XFxVeF5LSCURk
         sXuS0SHhn4XQyLM9jMS8Xq4GzyZ439//+vZyKLCu/pBSoAfxZXjpcnVlyBD12e1pYauZ
         4jRk/DGN9TExMcoLldoRqmvrrdn8jw7hNp9ucw12QKtI+pYUzVuNM4XzX4TgKzYASxgy
         p2Cdlj5J3bitP+jY3z+myStikLugyTnvqr61iJfDfgdqdeVVLu68qgEXJl/2eJx2SlYQ
         renQ==
X-Gm-Message-State: APjAAAVJAwHIiZQ7B2w/6C8ZfYWi6wdg/bvilidSoXRQhUqXMW5V0X1D
        Envdd+ryvYGTpwr2gOuNMAQegZLtBAnscAYOa/V9eQ==
X-Google-Smtp-Source: APXvYqxdZOCfwMC4ckXG//o/o4H8hELcsXHe3EoTOHIYVBOebIobkD8VaGs1KQIIBFvGy9ppesFAq6cvMyUvfIsKzS0=
X-Received: by 2002:a2e:6344:: with SMTP id x65mr10670505ljb.59.1570225678386;
 Fri, 04 Oct 2019 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125837.4472-1-brgl@bgdev.pl> <20191001125837.4472-2-brgl@bgdev.pl>
In-Reply-To: <20191001125837.4472-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:47:47 +0200
Message-ID: <CACRpkdbnkMvcSOoLGWi9nSfcpcNT0T28kFX=gyk6jSZ4UWG3gQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] backlight: gpio: remove unneeded include
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Oct 1, 2019 at 2:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We no longer use any symbols from of_gpio.h. Remove this include.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Bartosz,
Linus Walleij
