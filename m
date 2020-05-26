Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE9A1DA6FA
	for <lists+linux-sh@lfdr.de>; Wed, 20 May 2020 03:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgETBKf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 19 May 2020 21:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgETBKf (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 19 May 2020 21:10:35 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CE51204EA;
        Wed, 20 May 2020 01:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589937034;
        bh=DuIRGWpmRLK4Gvn27f6R1NXMTUEFp+oebvCIa14JEGM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JFAKfzMKamKtRyjemuWdUz1jRN4K4CWk5OVvuONLFLBrKQqQ8L7NQPAaC46daEogY
         pjO9U5Mv3J+3T++sJawlSQgLkuxEe3od1b4PFiwkCoRqhc8E+f9qgYgexCoV2oHmRH
         xmII0G8lLa6czATOOSeDIWx6tMZwfyR0YWxfUlOk=
Date:   Tue, 19 May 2020 18:10:34 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: include linux/time_types.h for sockios
Message-Id: <20200519181034.58c67eb5bea24aae24d33421@linux-foundation.org>
In-Reply-To: <20200519131327.1836482-1-arnd@arndb.de>
References: <20200519131327.1836482-1-arnd@arndb.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 19 May 2020 15:13:13 +0200 Arnd Bergmann <arnd@arndb.de> wrote:

> Using the socket ioctls on arch/sh (and only there) causes build
> time problems when __kernel_old_timeval/__kernel_old_timespec are
> not already visible to the compiler.
> 
> Add an explict include line for the header that defines these
> structures.

I can grab this.

> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Fixes: 8c709f9a0693 ("y2038: sh: remove timeval/timespec usage from headers")
> Fixes: 0768e17073dc ("net: socket: implement 64-bit timestamps")

cc:stable?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/sh/include/uapi/asm/sockios.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
> index 3da561453260..ef01ced9e169 100644
> --- a/arch/sh/include/uapi/asm/sockios.h
> +++ b/arch/sh/include/uapi/asm/sockios.h
> @@ -2,6 +2,8 @@
>  #ifndef __ASM_SH_SOCKIOS_H
>  #define __ASM_SH_SOCKIOS_H
>  
> +#include <linux/time_types.h>
> +
>  /* Socket-level I/O control calls. */
>  #define FIOGETOWN	_IOR('f', 123, int)
>  #define FIOSETOWN 	_IOW('f', 124, int)

