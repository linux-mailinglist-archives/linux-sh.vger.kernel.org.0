Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C253B5581
	for <lists+linux-sh@lfdr.de>; Mon, 28 Jun 2021 00:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhF0W2s (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 27 Jun 2021 18:28:48 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:42005 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231644AbhF0W2s (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 27 Jun 2021 18:28:48 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lxdEM-003Sgu-0D; Mon, 28 Jun 2021 00:26:22 +0200
Received: from p57bd964c.dip0.t-ipconnect.de ([87.189.150.76] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lxdEL-000H0O-Pk; Mon, 28 Jun 2021 00:26:21 +0200
Subject: Re: [PATCH 0/3 v2] sh: fixes for various build and kconfig warnings
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210627220544.8757-1-rdunlap@infradead.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <be15fd85-1d35-0cba-5c27-8273f0647f94@physik.fu-berlin.de>
Date:   Mon, 28 Jun 2021 00:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627220544.8757-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.150.76
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Randy!

On 6/28/21 12:05 AM, Randy Dunlap wrote:
> Fix a few build warnings and one kconfig warning on SUPERH.
> 
> v2: add a previously-sent Kconfig patch
>     add a few more Cc's
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [PATCH 1/3 v2] sh: fix kconfig unmet dependency warning for FRAME_POINTER
> [PATCH 2/3 v2] sh: define __BIG_ENDIAN for math-emu
> [PATCH 3/3 v2] sh: fix READ/WRITE redefinition warnings
> 
>  arch/sh/Kconfig.debug             |    1 
>  arch/sh/include/asm/sfp-machine.h |    8 +++++
>  arch/sh/math-emu/math.c           |   44 ++++++++++++++--------------
>  3 files changed, 31 insertions(+), 22 deletions(-)

I'll test these tomorrow on my SH-7785LCR board. Would it be possible to queue
them up for linux-next after verification?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
