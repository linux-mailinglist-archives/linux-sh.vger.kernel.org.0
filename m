Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E257AA497
	for <lists+linux-sh@lfdr.de>; Fri, 22 Sep 2023 00:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbjIUWMl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Thu, 21 Sep 2023 18:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjIUWMQ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 21 Sep 2023 18:12:16 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DAB88486;
        Thu, 21 Sep 2023 10:38:55 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qjG4o-0001JE-6A; Thu, 21 Sep 2023 11:34:26 +0200
Received: from p5b13a40a.dip0.t-ipconnect.de ([91.19.164.10] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qjG4n-002kwl-Uq; Thu, 21 Sep 2023 11:34:26 +0200
Message-ID: <fdab78c75a73f55b5ab496aff52b1b2855991bbd.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: mm: Re-add lost __ref to ioremap_prot() to fix
 modpost warning
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 21 Sep 2023 11:34:25 +0200
In-Reply-To: <20230911093850.1517389-1-geert+renesas@glider.be>
References: <20230911093850.1517389-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.10
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, 2023-09-11 at 11:38 +0200, Geert Uytterhoeven wrote:
> When __ioremap_caller() was replaced by ioremap_prot(), the __ref
> annotation added in commit af1415314a4190b8 ("sh: Flag
> __ioremap_caller() __init_refok.") was removed, causing a modpost
> warning:
> 
>     WARNING: modpost: vmlinux: section mismatch in reference: ioremap_prot+0x88 (section: .text) -> ioremap_fixed (section: .init.text)
> 
> ioremap_prot() calls ioremap_fixed() (which is marked __init), but only
> before mem_init_done becomes true, so this is safe.  Hence fix this by
> re-adding the lost __ref.
> 
> Fixes: 0453c9a78015cb22 ("sh: mm: convert to GENERIC_IOREMAP")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/sh/mm/ioremap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sh/mm/ioremap.c b/arch/sh/mm/ioremap.c
> index c33b3daa4ad1a3e6..33d20f34560fd5cb 100644
> --- a/arch/sh/mm/ioremap.c
> +++ b/arch/sh/mm/ioremap.c
> @@ -72,8 +72,8 @@ __ioremap_29bit(phys_addr_t offset, unsigned long size, pgprot_t prot)
>  #define __ioremap_29bit(offset, size, prot)		NULL
>  #endif /* CONFIG_29BIT */
>  
> -void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
> -			   unsigned long prot)
> +void __iomem __ref *ioremap_prot(phys_addr_t phys_addr, size_t size,
> +				 unsigned long prot)
>  {
>  	void __iomem *mapped;
>  	pgprot_t pgprot = __pgprot(prot);

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
