Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF9B8269C
	for <lists+linux-sh@lfdr.de>; Mon,  5 Aug 2019 23:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbfHEVMZ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 5 Aug 2019 17:12:25 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46537 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbfHEVMY (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 5 Aug 2019 17:12:24 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so54880468lfh.13
        for <linux-sh@vger.kernel.org>; Mon, 05 Aug 2019 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52Df7UYy5EhBLL4bv/P+/OnUf70c8jTeH6mJgj5Nc6s=;
        b=HvwClAPwJG3Pi3R4ysSHdSnZra19G+8lxf4u1AX3bm8UTIL32r5/3r4AQDUUnJ/o3L
         dpaHikb4ucEdmircjNP99G70agmxOPDPQMJwswRiDJ0anTMpviFli3+46wzjbxWNr1qH
         dghsq9SmMx3LQM+G8BVjUzYIiqSKOMRrvkiKT79W6AoIWk+5Pip47CWTOVU0kk2YNmU+
         0Izo3RTcKcBjeZveVRbI9DDa6X/mc1vAauC8y3m2avmDY+FIHe/0IazV0HkXFcr81ler
         t8S7rjmV2wXa1V+9Jsr6Shx95cI1Kl0lZoh/K5dH9RDgTkaryuZnjn+7/Z/NwST+Y+HQ
         WbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52Df7UYy5EhBLL4bv/P+/OnUf70c8jTeH6mJgj5Nc6s=;
        b=WRVoI62/gziqzXwdq52OZ8Qv/JRxmNL4BFhX/NGR8ebtaW7idv/XubP3KTW7CLzcZt
         0U+t4W6TaBfnja0PWDTOkmssQtB42e9dQ2CcTNA/WhfvCFHvSIKt+otgiISUbnofGL1y
         48v3TlrhssRF9Ho2CIgVtN9WHDub1ZOYw87l08lH3tbxx0aEZeHVqTcZP0VmAFZl+kAS
         hvtdcKYiAt4fwOq0g+hndE0Dgr/zKYb6aCqRdFq7kmrS2e46n+MPIOVjWA3fDuXSEnP2
         9Rjp4mzzcVmE7BmVSSq3CCooKmrSc/w8wCZgpb+hg7+qKQT0H/nGWAGK1txsyFlRnPK4
         QiAQ==
X-Gm-Message-State: APjAAAXwBaSFs0DodFfVcrbJwqyEv8M2AjHooDWtkF4DOF426Lp+Q/S0
        M/z0V/7w8ncxVhmvNXtSKwL0sTv3Nn05kPQ5RDoa7g==
X-Google-Smtp-Source: APXvYqyKCE9i41W7XXqJZ+YQ19WTxKlx1r3Tj3XoIOE9+3G2LGoa7zZV9WsUtd9BV0if5aOUW/6qAi6Sf9CuvXhzjNg=
X-Received: by 2002:a19:e006:: with SMTP id x6mr71138714lfg.165.1565039542766;
 Mon, 05 Aug 2019 14:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 23:12:10 +0200
Message-ID: <CACRpkdZBqxBKrLi+QskNpC8LPxY9OFOVL0K0pVBOkc61+ZXzGg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
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

On Wed, Jul 24, 2019 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> While working on my other series related to gpio-backlight[1] I noticed
> that we could simplify the driver if we made the only user of platform
> data use GPIO lookups and device properties. This series tries to do
> that.
>
> The first patch adds all necessary data structures to ecovec24. Patch
> 2/7 unifies much of the code for both pdata and non-pdata cases. Patches
> 3-4/7 remove unused platform data fields. Last three patches contain
> additional improvements for the GPIO backlight driver while we're already
> modifying it.
>
> I don't have access to this HW but hopefully this works. Only compile
> tested.
>
> [1] https://lkml.org/lkml/2019/6/25/900
>
> v1 -> v2:
> - rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
> - added additional two patches with minor improvements
>
> v2 -> v3:
> - in patch 7/7: used initializers to set values for pdata and dev local vars

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
