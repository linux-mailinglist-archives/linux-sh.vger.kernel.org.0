Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30546D91B2
	for <lists+linux-sh@lfdr.de>; Wed, 16 Oct 2019 14:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391668AbfJPM5K (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 16 Oct 2019 08:57:10 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43279 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbfJPM5K (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 16 Oct 2019 08:57:10 -0400
Received: by mail-qk1-f196.google.com with SMTP id h126so22592762qke.10
        for <linux-sh@vger.kernel.org>; Wed, 16 Oct 2019 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iKYnCxXI+enDKKpRO1ujL8VETmHUaDu3E+T33R6ISPM=;
        b=g+hwROET54h2vndrV5UvySYq7yp4qvTU86tqp4hmxXDtqKunS2ZAkElaa58Q5b4Q8D
         M1ywHBIht82QXc0sQVnbrPHvj/77gY5eosNK8hQ57ufu93BZWmbfvHTwXMyNa6fnpzXa
         1PN3FvGDq+leBePGK/7aSGNWvUDLqMkfCcbyiVYHfRQtVyXktxQg8UuNek2nnYs/epA9
         LTtVGWlzRReML6keZeXR3wcPzCm8eQWLQk3G/4OKsBlnUS3D94qdF20EvR61SCA9XRva
         ssR4DyZSN19wIDjz3MgR9L2lJCmq5uSYaMwXvKF0seOtB1wgHwYAWSVCE58/8T/cafDj
         cjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iKYnCxXI+enDKKpRO1ujL8VETmHUaDu3E+T33R6ISPM=;
        b=Z9EYBXK5QU/DF6rs1lKyywIXE2PCWvOyWWZAk62Cx7dL/hrJIPoQCYYcJEVAFpHw1X
         YyIoOyuVuO/UlYgrWdYRzagY+suhd6jVriJ7ug1wDARUu9BwYrYq/sTEScun51rrWZBZ
         7rm2ndxSZhumEh6GZZsI/FUoPK09T4Zx7SK3kfQ/QD2X/BodpajIQSiYC5JUuH942MSb
         205DKlGYB2WsdzzvYxMUPUslNKCucTe2GGPoUuX9lW9r0uwMaQIw6O3BM1PgHVXuWV2+
         u4M48lhE9TyIgQ8Ulp8Ifo+70AbtAdOyIgTexvS0VCoo8TvYKShlfFN8rtfUrZP+JgHO
         5Xwg==
X-Gm-Message-State: APjAAAUW9gR4n5PZFBSdcnQ+sCfJK/9fRGNnXufvDQ0XJopA+F6eBIxZ
        s/bS7hEL+rTnJpD0MDUurN581oR4j18/fjpF1iY8HQ==
X-Google-Smtp-Source: APXvYqznfR9xVNBpGb36Jsp8fvtPYC6w0IX8Z65LGupMXk2zMNyuYFGC3dG8oecpreWNjUjM4OyYtcubd/IaRbgJffA=
X-Received: by 2002:a05:620a:34b:: with SMTP id t11mr38227900qkm.213.1571230629198;
 Wed, 16 Oct 2019 05:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
In-Reply-To: <20191014081220.GK4545@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:56:57 +0200
Message-ID: <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
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

On Mon, Oct 14, 2019 at 10:12 AM Lee Jones <lee.jones@linaro.org> wrote:

> >  arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
>
> I guess we're just waiting for the SH Acks now?

The one maintainer with this board is probably overloaded.

I would say just apply it, it can't hold back the entire series.

Yours,
Linus Walleij
