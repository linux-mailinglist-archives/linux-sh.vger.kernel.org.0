Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62683122521
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 08:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfLQHCE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 02:02:04 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:54576 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfLQHCE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 02:02:04 -0500
X-Greylist: delayed 493 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 02:02:04 EST
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2C5D38050B;
        Tue, 17 Dec 2019 07:53:48 +0100 (CET)
Date:   Tue, 17 Dec 2019 07:53:47 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] SH: Convert iounmap() macros to inline functions
Message-ID: <20191217065347.GA28172@ravnborg.org>
References: <87eex3h2g6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eex3h2g6.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
        a=7gkXJVJtAAAA:8 a=vCs3NcAQxDZeqXzmYkYA:9 a=CjuIK1q_8ugA:10
        a=QsnFDINu91a9xkgZirup:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Kuninori

On Tue, Dec 17, 2019 at 03:48:57PM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Macro iounmap() do nothing, but that results in
> unused variable warnings all over the place.
> This patch convert it to inline to avoid warning

To help other people with the same warning it is always a good idea to
include the warning you fix in the changelog.

With this fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Fixes: 98c90e5ea34e9 ("sh: remove __iounmap")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/sh/include/asm/io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index 1495489..351a0a9 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -328,7 +328,7 @@ __ioremap_mode(phys_addr_t offset, unsigned long size, pgprot_t prot)
>  #else
>  #define __ioremap(offset, size, prot)		((void __iomem *)(offset))
>  #define __ioremap_mode(offset, size, prot)	((void __iomem *)(offset))
> -#define iounmap(addr)				do { } while (0)
> +static inline void iounmap(void __iomem *addr) {}
>  #endif /* CONFIG_MMU */
>  
>  static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)
> -- 
> 2.7.4
