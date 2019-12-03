Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1620A10FB0F
	for <lists+linux-sh@lfdr.de>; Tue,  3 Dec 2019 10:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCJt2 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 3 Dec 2019 04:49:28 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:38605 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCJt2 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 3 Dec 2019 04:49:28 -0500
Received: by mail-io1-f67.google.com with SMTP id u7so452147iop.5
        for <linux-sh@vger.kernel.org>; Tue, 03 Dec 2019 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6aXIYJhJk7/8WEwP4jBXdYdOavwAluIwb+mxsH1scbY=;
        b=Zz7hzYXFTOGzQiN4dOZsw0BipZPdfaJG2RF4YSLHZM0zGSqPB1tujOPLu99MAvvBVa
         HolPnlveboPOQ1FMdO6YwSZ5M/FtthC0I2OqHxIfuAj+Pa2ueKgCDueoYFhKbmtxqQb4
         oCUBBy1P1LCn3i1vnMT1hZm3iF/PbyNoDmWAMekJ0NGVlKYzgK7bk6I6rMrSt2AdXvY+
         3TBsTwL5SPKdN8lp8QJsR9/Z7aw5wGuwLhM1IsdxfFO04OSIaRWK+Tdel2fCEAwdsTCR
         6HsceOlQ2E988BzTZH3jw84QSGGl9zL1H4I9BvTSHuDiKLuGYa+MvH4mzMWCpkgtHyF/
         yDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6aXIYJhJk7/8WEwP4jBXdYdOavwAluIwb+mxsH1scbY=;
        b=SQ7xwsYBXbnOenHCJ0YYSRwi7EoiqkC1U9w+zjxeRMU3btEdj9bRqoJZh7JZot+y6x
         U0LoH5uA1Ulkfn2gl95yEwTOeTS4D9oTrgDjVeYDXfyDO8DXStdz6Wtu2SniUGOYeKEO
         OwkVE/Izoqx+bjeUo5l5sVLRIUMtP6wazUGTOgebQ4ncPf0dGJzlCTFTjTV22RHDN6RK
         8K6NxaqfBQvgFdRDDZ7mJ1QsS9QaJjiCnBLtY/eIvBVeg4UQQj9zI7KJIZoSyomnKBLQ
         KKk74VLy7jXF2d0pbrTLtkqxLa2RnXTKY8pfgZoi77Q24/734g1U4c6KmytNNCXSsxAQ
         2a1w==
X-Gm-Message-State: APjAAAVx9fR6gK3qNGxHvhoCq7t7n6d+EDBKa/P52ctk2OrJ6uOAzCrs
        nwEobkNX9kZgJOQySuP2gUpHYOCxKVbn5GX9hQv/3A==
X-Google-Smtp-Source: APXvYqzKUkeFS68tcrD5KMLK2TmIdIHqUDU5TjdET6m8Y70R++JuYm15PgU/izlEixOZhvhIxHoC411n4I6jPkgxi48=
X-Received: by 2002:a02:711d:: with SMTP id n29mr1159147jac.114.1575366566810;
 Tue, 03 Dec 2019 01:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20191003092913.10731-1-brgl@bgdev.pl> <20191003092912.G3pupKBmyct1r9ScP5Skuw9D-_ALcMVSnfMfHAlwe0Y@z>
 <20191202041440.GA1628@roeck-us.net> <CAMpxmJW3i4zmJJ14Xg65+T27kF3sgR1WG0K3FUT6+jeKtiHx=Q@mail.gmail.com>
 <3f8ffe03-98b8-423a-7cba-53961a5600cb@roeck-us.net> <CAMpxmJUmTF3FwacjvTrC+Vvzm8MscS9E=ZyWLbJV87LkQhqVow@mail.gmail.com>
 <5e7aafc9-deb9-9305-afea-2c86e310683f@roeck-us.net>
In-Reply-To: <5e7aafc9-deb9-9305-afea-2c86e310683f@roeck-us.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Dec 2019 10:49:15 +0100
Message-ID: <CAMRc=MebSL+WA-nHFkaUd0rHTmwLkv2e16D9oO1=PY8-sPnzzQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: move the early platform device support to arch/sh
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jslaby@suse.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

wt., 3 gru 2019 o 06:24 Guenter Roeck <linux@roeck-us.net> napisa=C5=82(a):
>
> On 12/2/19 9:18 AM, Bartosz Golaszewski wrote:
> > pon., 2 gru 2019 o 14:03 Guenter Roeck <linux@roeck-us.net> napisa=C5=
=82(a):
> >>
> >> On 12/1/19 11:40 PM, Bartosz Golaszewski wrote:
> >>> pon., 2 gru 2019 o 05:14 Guenter Roeck <linux@roeck-us.net> napisa=C5=
=82(a):
> >>>>
> >>>> On Thu, Oct 03, 2019 at 11:29:12AM +0200, Bartosz Golaszewski wrote:
> >>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>>>
> >>>>> SuperH is the only user of the current implementation of early plat=
form
> >>>>> device support. We want to introduce a more robust approach to earl=
y
> >>>>> probing. As the first step - move all the current early platform co=
de
> >>>>> to arch/sh.
> >>>>>
> >>>>> In order not to export internal drivers/base functions to arch code=
 for
> >>>>> this temporary solution - copy the two needed routines for driver
> >>>>> matching from drivers/base/platform.c to arch/sh/drivers/platform_e=
arly.c.
> >>>>>
> >>>>> Also: call early_platform_cleanup() from subsys_initcall() so that =
it's
> >>>>> called after all early devices are probed.
> >>>>>
> >>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>>
> >>>> Wondering ... has anyone tested this patch on affected hardware ?
> >>>> All my qemu boot tests (both sh and sheb) fail because of it.
> >>>> Bisect log below.
> >>>>
> >>>> Guenter
> >>>>
> >>>> ---
> >>>> # bad: [72c0870e3a05d9cd5466d08c3d2a3069ed0a2f9f] Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> >>>> # good: [89d57dddd7d319ded00415790a0bb3c954b7e386] Merge tag 'media/=
v5.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-medi=
a
> >>>> git bisect start 'HEAD' '89d57dddd7d3'
> >>>> # good: [0a6cad5df541108cfd3fbd79eef48eb824c89bdc] Merge branch 'vmw=
gfx-coherent' of git://people.freedesktop.org/~thomash/linux into drm-next
> >>>> git bisect good 0a6cad5df541108cfd3fbd79eef48eb824c89bdc
> >>>> # bad: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-=
core-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/drive=
r-core
> >>>> git bisect bad 9a3d7fd275be4559277667228902824165153c80
> >>>> # good: [59274c7164807d27b24e6c068dfe734f7bea4623] Merge tag 'usb-5.=
5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> >>>> git bisect good 59274c7164807d27b24e6c068dfe734f7bea4623
> >>>> # good: [e71903106721dc53923e90aa484d78bc86c039a9] staging: mt7621-d=
ma: align to match open parenthesis
> >>>> git bisect good e71903106721dc53923e90aa484d78bc86c039a9
> >>>> # good: [8f56e4ebe05c26c30e167519273843476e39e244] Merge tag 'char-m=
isc-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-m=
isc
> >>>> git bisect good 8f56e4ebe05c26c30e167519273843476e39e244
> >>>> # good: [8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50] Merge tag 'iio-fo=
r-5.5c' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into s=
taging-next
> >>>> git bisect good 8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50
> >>>> # bad: [0628cda318df6baec439ca6e6e274007492f1ccd] mac80211: Use debu=
gfs_create_xul() helper
> >>>> git bisect bad 0628cda318df6baec439ca6e6e274007492f1ccd
> >>>> # bad: [03324507e66c7664c754b1ef92c5c3be24c78aa2] driver core: Allow=
 fwnode_operations.add_links to differentiate errors
> >>>> git bisect bad 03324507e66c7664c754b1ef92c5c3be24c78aa2
> >>>> # bad: [313f5dbba41d905d59c820bb2d91ee6c661aff99] debugfs: remove re=
turn value of debugfs_create_u16()
> >>>> git bisect bad 313f5dbba41d905d59c820bb2d91ee6c661aff99
> >>>> # good: [d4387cd117414ba80230f27a514be5ca4a09cfcc] of: property: Cre=
ate device links for all child-supplier depencencies
> >>>> git bisect good d4387cd117414ba80230f27a514be5ca4a09cfcc
> >>>> # bad: [c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1] base: soc: Handle =
custom soc information sysfs entries
> >>>> git bisect bad c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1
> >>>> # bad: [201e91091b1d47047f55580b5474e1239f4d17aa] sh: add the sh_ pr=
efix to early platform symbols
> >>>> git bisect bad 201e91091b1d47047f55580b5474e1239f4d17aa
> >>>> # bad: [507fd01d5333338753a1cc26322dfc9f856c109f] drivers: move the =
early platform device support to arch/sh
> >>>> git bisect bad 507fd01d5333338753a1cc26322dfc9f856c109f
> >>>> # first bad commit: [507fd01d5333338753a1cc26322dfc9f856c109f] drive=
rs: move the early platform device support to arch/sh
> >>>
> >>> Hi Guenter,
> >>>
> >>> can you post some bootlogs? Is it the same problem everywhere?
> >>>
> >>
> >> I don't have any useful logs. The boot fails too early for that.
> >>
> >
> > Yeah, it touched "early" devices after all...
> >
> >> Sorry, I don't understand "everywhere". It fails in mainline and -next=
, if that is what you mean.
> >
> > I referred to "All my qemu boot tests" when saying everywhere.
> >
> > I don't have any relevant HW - the idea for this patch is to stop
> > compiling for everyone a bunch of code that's only used by one largely
> > irrelevant architecture and free the namespace for a generic early
> > platform drivers implementation.
> >
> > How are you creating your SH qemu images? I'm seeing there's something
> > in buildroot for superh - maybe I'll be able to bearly_platform_cleanup=
uild something
> > useful.
> >
>
> Below is a possible fix. As I had suspected, the call to early_platform_c=
leanup()
> is in the wrong place.
>

This makes sense. If it fixes the issue - do you want to send it to Greg?

Bart

> Guenter
>
> ---
>   arch/sh/drivers/platform_early.c | 11 ++---------
>   drivers/base/platform.c          |  4 ++++
>   2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_=
early.c
> index f6d148451dfc..16f33bffd8fc 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -325,9 +325,9 @@ int __init sh_early_platform_driver_probe(char *class=
_str,
>   }
>
>   /**
> - * sh_early_platform_cleanup - clean up early platform code
> + * early_platform_cleanup - clean up early platform code
>    */
> -static int __init sh_early_platform_cleanup(void)
> +void early_platform_cleanup(void)
>   {
>         struct platform_device *pd, *pd2;
>
> @@ -337,11 +337,4 @@ static int __init sh_early_platform_cleanup(void)
>                 list_del(&pd->dev.devres_head);
>                 memset(&pd->dev.devres_head, 0, sizeof(pd->dev.devres_hea=
d));
>         }
> -
> -       return 0;
>   }
> -/*
> - * This must happen once after all early devices are probed but before p=
robing
> - * real platform devices.
> - */
> -subsys_initcall(sh_early_platform_cleanup);
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 7c532548b0a6..3ba153e356ee 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1325,10 +1325,14 @@ struct device *platform_find_device_by_driver(str=
uct device *start,
>   }
>   EXPORT_SYMBOL_GPL(platform_find_device_by_driver);
>
> +void __weak early_platform_cleanup(void) { }
> +
>   int __init platform_bus_init(void)
>   {
>         int error;
>
> +       early_platform_cleanup();
> +
>         error =3D device_register(&platform_bus);
>         if (error) {
>                 put_device(&platform_bus);
>
