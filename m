Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9199A416128
	for <lists+linux-sh@lfdr.de>; Thu, 23 Sep 2021 16:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241517AbhIWOjK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 23 Sep 2021 10:39:10 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:53103 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241708AbhIWOjJ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 23 Sep 2021 10:39:09 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mTPqt-000K86-7O; Thu, 23 Sep 2021 16:37:31 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mTPqs-001G6v-Gf; Thu, 23 Sep 2021 16:37:31 +0200
Message-ID: <c8730be9-edc4-5f71-b043-846d4b519e97@physik.fu-berlin.de>
Date:   Thu, 23 Sep 2021 16:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3 v2] sh: fixes for various build and kconfig warnings
Content-Language: en-US
To:     Rich Felker <dalias@libc.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>, j-core@j-core.org
References: <20210627220544.8757-1-rdunlap@infradead.org>
 <2bae95d0-0932-847c-c105-a333e9956dff@infradead.org>
 <f63694aa-85b3-0238-5228-eb35a52bf360@physik.fu-berlin.de>
 <CAFr9PXn5S_3mpJBF0bNo+S1US=Z5s89rbO-OhhqGk=zqPGWXoQ@mail.gmail.com>
 <20210912015740.GJ13220@brightrain.aerifal.cx>
 <5aa5301e-9b01-4e96-e185-13c2d4d7b675@physik.fu-berlin.de>
 <20210922024537.GA27465@brightrain.aerifal.cx>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20210922024537.GA27465@brightrain.aerifal.cx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Rich!

On 9/22/21 04:45, Rich Felker wrote:
> I didn't get through that yet, but I have rebased the patches that
> were pending in for-next onto v5.15-rc1 (no conflicts) and
> smoke-tested that a sh4 build runs in my qemu environment. linux-next
> pulled them 27 hours ago and hasn't complained yet either.

Sounds promising, thanks!

> I started going through the list/patch backlog, but didn't make it
> nearly as far as I'd like yet. If you have even a vague list of what's
> important (warnings breaking the build, unapplied changes blocking
> removal of cruft from other parts of the kernel and making people
> unhappy with us, etc.) that would be really helpful.

I will start testing kernel updates again from next week as I'm currently
busy with other open source work I want to get off my table first.

> I'll follow up again soon.

Thanks, looking forward for more updates.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

