Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991F410EE07
	for <lists+linux-sh@lfdr.de>; Mon,  2 Dec 2019 18:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfLBRSf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 2 Dec 2019 12:18:35 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40760 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfLBRSf (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 2 Dec 2019 12:18:35 -0500
Received: by mail-ot1-f67.google.com with SMTP id i15so138658oto.7
        for <linux-sh@vger.kernel.org>; Mon, 02 Dec 2019 09:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6m5GyYZgGjlReYT0UlQJpt9O1RSpFkhX7hTS5Y3rL8A=;
        b=GuLOx2Zp3ZZ90Tm4v6pIsuMUqW5EKKBOtz2OFCipBoqw0100kj7xtHtEdX64q6lWAW
         pD1itDn0zL2PH8BDTkq/ZohZNfnj1PJGqh8zFGjN6LrykJ2h4LZgAmf8MZ1t5+TODv/v
         nFdRCYmdVHIe5MH+6D0JBBnuR/6ran/ta4wvvVj1qbn/vnpBfMCYB9N4HPu9CKJ0EgLc
         A4cNfwiaZXvyHsmEp4cWUz/fOhPRLwI9IyHFzC5RqEH13/bDz709PU7fOxDW1c3cmkL8
         ECKs2OH7phaSwsIdhN9kdCWDl7v5tH/tmmlMf7eO/tLnobqg2mlQHqIIIJo2Bv/bIMPY
         MVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6m5GyYZgGjlReYT0UlQJpt9O1RSpFkhX7hTS5Y3rL8A=;
        b=lL3Drs6mVubyvJKx/T5iTsykSNodcWnNnBK+EPZ+62C5fQPmL7zmAjB5x8lyAMSYA0
         6w3eJnalifsJN74LufgbMEwN9WWq7ABHQ3hsX6GofN0pUWt5B91b6XL6vy8Hj0sEKLi9
         HrXGuhwwl0+lQ7hZYxSLuToB/++CfXG603irUPkUygPTCcnEki0vGr4YDk3whT/+1cMt
         pFvyIdU8VtAuvCOJ7/S9tQ5tKA3Srcs3J2DIA6ZF5S4A/D06/0Md7F+k6nMipbDcMdkT
         w0YlflL1c+A30cXJHkuf80v2L84l0pEU4LfG7ClgdXoUxI8TsW7iY25Z829jPUPgdeNU
         +26Q==
X-Gm-Message-State: APjAAAWNRDSYFaqLiNtr+P0ISSEJravwihdD4FGnfFqnxnRXNDhDdJZC
        9a9MJVbNbkZOgop81/oIO3mKOr2NKnt4SXuqEvUADA==
X-Google-Smtp-Source: APXvYqyYLXF9eAgv7IfmBg18I6YR52lazrz4VDRUHWzFpa7cmv7OeAl8w9FBa0bv0eN4jxBqQrkuqs5Bnn/pF8jwkaw=
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr95092oti.250.1575307113737;
 Mon, 02 Dec 2019 09:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20191003092913.10731-1-brgl@bgdev.pl> <20191003092912.G3pupKBmyct1r9ScP5Skuw9D-_ALcMVSnfMfHAlwe0Y@z>
 <20191202041440.GA1628@roeck-us.net> <CAMpxmJW3i4zmJJ14Xg65+T27kF3sgR1WG0K3FUT6+jeKtiHx=Q@mail.gmail.com>
 <3f8ffe03-98b8-423a-7cba-53961a5600cb@roeck-us.net>
In-Reply-To: <3f8ffe03-98b8-423a-7cba-53961a5600cb@roeck-us.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Dec 2019 18:18:22 +0100
Message-ID: <CAMpxmJUmTF3FwacjvTrC+Vvzm8MscS9E=ZyWLbJV87LkQhqVow@mail.gmail.com>
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

pon., 2 gru 2019 o 14:03 Guenter Roeck <linux@roeck-us.net> napisa=C5=82(a)=
:
>
> On 12/1/19 11:40 PM, Bartosz Golaszewski wrote:
> > pon., 2 gru 2019 o 05:14 Guenter Roeck <linux@roeck-us.net> napisa=C5=
=82(a):
> >>
> >> On Thu, Oct 03, 2019 at 11:29:12AM +0200, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>
> >>> SuperH is the only user of the current implementation of early platfo=
rm
> >>> device support. We want to introduce a more robust approach to early
> >>> probing. As the first step - move all the current early platform code
> >>> to arch/sh.
> >>>
> >>> In order not to export internal drivers/base functions to arch code f=
or
> >>> this temporary solution - copy the two needed routines for driver
> >>> matching from drivers/base/platform.c to arch/sh/drivers/platform_ear=
ly.c.
> >>>
> >>> Also: call early_platform_cleanup() from subsys_initcall() so that it=
's
> >>> called after all early devices are probed.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> Wondering ... has anyone tested this patch on affected hardware ?
> >> All my qemu boot tests (both sh and sheb) fail because of it.
> >> Bisect log below.
> >>
> >> Guenter
> >>
> >> ---
> >> # bad: [72c0870e3a05d9cd5466d08c3d2a3069ed0a2f9f] Merge branch 'for-li=
nus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> >> # good: [89d57dddd7d319ded00415790a0bb3c954b7e386] Merge tag 'media/v5=
.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> >> git bisect start 'HEAD' '89d57dddd7d3'
> >> # good: [0a6cad5df541108cfd3fbd79eef48eb824c89bdc] Merge branch 'vmwgf=
x-coherent' of git://people.freedesktop.org/~thomash/linux into drm-next
> >> git bisect good 0a6cad5df541108cfd3fbd79eef48eb824c89bdc
> >> # bad: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-co=
re-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-=
core
> >> git bisect bad 9a3d7fd275be4559277667228902824165153c80
> >> # good: [59274c7164807d27b24e6c068dfe734f7bea4623] Merge tag 'usb-5.5-=
rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> >> git bisect good 59274c7164807d27b24e6c068dfe734f7bea4623
> >> # good: [e71903106721dc53923e90aa484d78bc86c039a9] staging: mt7621-dma=
: align to match open parenthesis
> >> git bisect good e71903106721dc53923e90aa484d78bc86c039a9
> >> # good: [8f56e4ebe05c26c30e167519273843476e39e244] Merge tag 'char-mis=
c-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-mis=
c
> >> git bisect good 8f56e4ebe05c26c30e167519273843476e39e244
> >> # good: [8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50] Merge tag 'iio-for-=
5.5c' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-next
> >> git bisect good 8bde9f3d2a217d1635a7c7bdf8ad4c25c9a34b50
> >> # bad: [0628cda318df6baec439ca6e6e274007492f1ccd] mac80211: Use debugf=
s_create_xul() helper
> >> git bisect bad 0628cda318df6baec439ca6e6e274007492f1ccd
> >> # bad: [03324507e66c7664c754b1ef92c5c3be24c78aa2] driver core: Allow f=
wnode_operations.add_links to differentiate errors
> >> git bisect bad 03324507e66c7664c754b1ef92c5c3be24c78aa2
> >> # bad: [313f5dbba41d905d59c820bb2d91ee6c661aff99] debugfs: remove retu=
rn value of debugfs_create_u16()
> >> git bisect bad 313f5dbba41d905d59c820bb2d91ee6c661aff99
> >> # good: [d4387cd117414ba80230f27a514be5ca4a09cfcc] of: property: Creat=
e device links for all child-supplier depencencies
> >> git bisect good d4387cd117414ba80230f27a514be5ca4a09cfcc
> >> # bad: [c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1] base: soc: Handle cu=
stom soc information sysfs entries
> >> git bisect bad c31e73121f4c1ec45a3e523ac6ce3ce6dafdcec1
> >> # bad: [201e91091b1d47047f55580b5474e1239f4d17aa] sh: add the sh_ pref=
ix to early platform symbols
> >> git bisect bad 201e91091b1d47047f55580b5474e1239f4d17aa
> >> # bad: [507fd01d5333338753a1cc26322dfc9f856c109f] drivers: move the ea=
rly platform device support to arch/sh
> >> git bisect bad 507fd01d5333338753a1cc26322dfc9f856c109f
> >> # first bad commit: [507fd01d5333338753a1cc26322dfc9f856c109f] drivers=
: move the early platform device support to arch/sh
> >
> > Hi Guenter,
> >
> > can you post some bootlogs? Is it the same problem everywhere?
> >
>
> I don't have any useful logs. The boot fails too early for that.
>

Yeah, it touched "early" devices after all...

> Sorry, I don't understand "everywhere". It fails in mainline and -next, i=
f that is what you mean.

I referred to "All my qemu boot tests" when saying everywhere.

I don't have any relevant HW - the idea for this patch is to stop
compiling for everyone a bunch of code that's only used by one largely
irrelevant architecture and free the namespace for a generic early
platform drivers implementation.

How are you creating your SH qemu images? I'm seeing there's something
in buildroot for superh - maybe I'll be able to build something
useful.

Bartosz

> And, yes, it has failed in -next for a while, looking back at the log his=
tory.
>
> Guenter
