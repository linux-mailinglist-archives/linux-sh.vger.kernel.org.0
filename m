Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501FA10E66C
	for <lists+linux-sh@lfdr.de>; Mon,  2 Dec 2019 08:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfLBHkU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 2 Dec 2019 02:40:20 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40166 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLBHkT (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 2 Dec 2019 02:40:19 -0500
Received: by mail-oi1-f196.google.com with SMTP id 6so6329384oix.7
        for <linux-sh@vger.kernel.org>; Sun, 01 Dec 2019 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wAQOIWdO/+YrSmQ/0SbvKkchZaRVepDEGzH/WoVZ34o=;
        b=NiMFtPxVoAMfub2BvU9FYk3U1q8NBuRHSoMScD94QybDfrwUv9UO6hNNWLwyQIpwAx
         JSsuXxJf7TErTJf0CdS9eZRlxRtMxWKpBtDG+3CtsvVTr2g9sevWoW8IZMX8LwkXmBDM
         oE0VzYURmJ1dhbW2PEauo+e6wtpjQ7I1Y6XMsGmaRjnxaEhjI/rFF5Yx3xk1p3OXlOMA
         34Hlp10oFyH6mwidg4ssixKAeimfhsu4J2WcoPbEfxNpdO8u/9yG/CaVBq0ci6MmHS9O
         +tDmI9YjmvjwOCrFucTHUNf8Am4S8qPo3Mm/3xan/NYIq5qIGVkuOkdnWo0BudVvM3hy
         vTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wAQOIWdO/+YrSmQ/0SbvKkchZaRVepDEGzH/WoVZ34o=;
        b=Ef0sHFd2M/yNvvxC853xW6UPkvLh4U+8syNUTZYVttFlwr1eLzzEu1lW0fmIZOvDdc
         dREw8z/LTZMAb7DlI0cWdTL5XpmN1oElgWKWZdOzQqhC/hHEdhxSEJOfsvwFQETaaSWo
         uA/UUlHJh+M+zmfW30bBvXyJVtWoc0g89JtfUmIsj1KsyVuwJgHvX7oUUVs/hyrRP++h
         dGugHwZiLMnjFwg+s5ChLjgHswHCrpbHZxM3sj2x/1xctVMFDeriJ0tbnqgLvM7YMZE5
         P8MRkHRBzQ7YXoT4Ku8xvbxTus2yQ/mgAbFTpV5y4p3K1ebJR0+eVk1QaTngd7ogFb0M
         LqFQ==
X-Gm-Message-State: APjAAAWmQuXN8+uOB1lleuZlN33Y6mnmZ0+TTXGS+K8fbxRZgkQf5L4d
        HDWNF7fLDtVDID2GLm/As7vEnx2XUF5uLHuelRKg/Q==
X-Google-Smtp-Source: APXvYqz/BP3Gg+NKo3upJsW1kcj4YPHQVeb5HFVM1u4oXIkaTmISM2hIwhY4PpeNQsPIl9s+3BZvUufP/j+byB/241g=
X-Received: by 2002:aca:d904:: with SMTP id q4mr23066147oig.21.1575272418472;
 Sun, 01 Dec 2019 23:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20191003092913.10731-1-brgl@bgdev.pl> <20191003092912.G3pupKBmyct1r9ScP5Skuw9D-_ALcMVSnfMfHAlwe0Y@z>
 <20191202041440.GA1628@roeck-us.net>
In-Reply-To: <20191202041440.GA1628@roeck-us.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Dec 2019 08:40:07 +0100
Message-ID: <CAMpxmJW3i4zmJJ14Xg65+T27kF3sgR1WG0K3FUT6+jeKtiHx=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: move the early platform device support to arch/sh
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jslaby@suse.com>, linux-sh@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

pon., 2 gru 2019 o 05:14 Guenter Roeck <linux@roeck-us.net> napisa=C5=82(a)=
:
>
> On Thu, Oct 03, 2019 at 11:29:12AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > SuperH is the only user of the current implementation of early platform
> > device support. We want to introduce a more robust approach to early
> > probing. As the first step - move all the current early platform code
> > to arch/sh.
> >
> > In order not to export internal drivers/base functions to arch code for
> > this temporary solution - copy the two needed routines for driver
> > matching from drivers/base/platform.c to arch/sh/drivers/platform_early=
.c.
> >
> > Also: call early_platform_cleanup() from subsys_initcall() so that it's
> > called after all early devices are probed.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Wondering ... has anyone tested this patch on affected hardware ?
> All my qemu boot tests (both sh and sheb) fail because of it.
> Bisect log below.
>
> Guenter
>
> ---
> # bad: [72c0870e3a05d9cd5466d08c3d2a3069ed0a2f9f] Merge branch 'for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> # good: [89d57dddd7d319ded00415790a0bb3c954b7e386] Merge tag 'media/v5.5-=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> git bisect start 'HEAD' '89d57dddd7d3'
> # good: [0a6cad5df541108cfd3fbd79eef48eb824c89bdc] Merge branch 'vmwgfx-c=
oherent' of git://people.freedesktop.org/~thomash/linux into drm-next
> git bisect good 0a6cad5df541108cfd3fbd79eef48eb824c89bdc
> # bad: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-core-=
5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e
> git bisect bad 9a3d7fd275be4559277667228902824165153c80
> # good: [59274c7164807d27b24e6c068dfe734f7bea4623] Merge tag 'usb-5.5-rc1=
' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> git bisect good 59274c7164807d27b24e6c068dfe734f7bea4623
> # good: [e71903106721dc53923e90aa484d78bc86c039a9] staging: mt7621-dma: a=
lign to match open parenthesis
> git bisect good e71903106721dc53923e90aa484d78bc86c039a9
> # good: [8f56e4ebe05c26c30e167519273843476e39e244] Merge tag 'char-misc-5=
.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> git bisect good 8f56e4ebe05c26c30e167519273843476e39e244
> # good: [8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50] Merge tag 'iio-for-5.5=
c' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into stagin=
g-next
> git bisect good 8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50
> # bad: [0628cda318df6baec439ca6e6e274007492f1ccd] mac80211: Use debugfs_c=
reate_xul() helper
> git bisect bad 0628cda318df6baec439ca6e6e274007492f1ccd
> # bad: [03324507e66c7664c754b1ef92c5c3be24c78aa2] driver core: Allow fwno=
de_operations.add_links to differentiate errors
> git bisect bad 03324507e66c7664c754b1ef92c5c3be24c78aa2
> # bad: [313f5dbba41d905d59c820bb2d91ee6c661aff99] debugfs: remove return =
value of debugfs_create_u16()
> git bisect bad 313f5dbba41d905d59c820bb2d91ee6c661aff99
> # good: [d4387cd117414ba80230f27a514be5ca4a09cfcc] of: property: Create d=
evice links for all child-supplier depencencies
> git bisect good d4387cd117414ba80230f27a514be5ca4a09cfcc
> # bad: [c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1] base: soc: Handle custo=
m soc information sysfs entries
> git bisect bad c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1
> # bad: [201e91091b1d47047f55580b5474e1239f4d17aa] sh: add the sh_ prefix =
to early platform symbols
> git bisect bad 201e91091b1d47047f55580b5474e1239f4d17aa
> # bad: [507fd01d5333338753a1cc26322dfc9f856c109f] drivers: move the early=
 platform device support to arch/sh
> git bisect bad 507fd01d5333338753a1cc26322dfc9f856c109f
> # first bad commit: [507fd01d5333338753a1cc26322dfc9f856c109f] drivers: m=
ove the early platform device support to arch/sh

Hi Guenter,

can you post some bootlogs? Is it the same problem everywhere?

Bart
