Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B8D7478C2
	for <lists+linux-sh@lfdr.de>; Tue,  4 Jul 2023 21:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjGDTiu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Tue, 4 Jul 2023 15:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGDTiu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Jul 2023 15:38:50 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9594C10C9;
        Tue,  4 Jul 2023 12:38:48 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qGlrC-001jKa-Gd; Tue, 04 Jul 2023 21:38:38 +0200
Received: from p5b13a7a5.dip0.t-ipconnect.de ([91.19.167.165] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qGlrC-003JOx-5U; Tue, 04 Jul 2023 21:38:38 +0200
Message-ID: <15801984863d45e99e5fe280115fa553b83d92fc.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: provide unxlate_dev_mem_ptr() in asm/io.h
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Cc:     Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 04 Jul 2023 21:38:36 +0200
In-Reply-To: <20230704190144.2888679-1-linux@roeck-us.net>
References: <20230704190144.2888679-1-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.167.165
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, 2023-07-04 at 12:01 -0700, Guenter Roeck wrote:
> The unxlate_dev_mem_ptr() function has no prototype on the sh architecture,
> which does not include asm-generic/io.h. This results in the following
> build failure.
> 
> drivers/char/mem.c: In function 'read_mem':
> drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr'
> 
> This compile error is now seen because commit 99b619b37ae1 ("mips: provide
> unxlate_dev_mem_ptr() in asm/io.h") removed the weak function which was
> previously in place to handle the problem.
> 
> Add a trivial macro to the sh header to provide the now missing dummy
> function.
> 
> Fixes: 99b619b37ae1 ("mips: provide unxlate_dev_mem_ptr() in asm/io.h")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/sh/include/asm/io.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index fba90e670ed4..d8f3537ef57f 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -286,6 +286,7 @@ static inline void iounmap(volatile void __iomem *addr) { }
>   * access
>   */
>  #define xlate_dev_mem_ptr(p)	__va(p)
> +#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>  
>  #define ARCH_HAS_VALID_PHYS_ADDR_RANGE
>  int valid_phys_addr_range(phys_addr_t addr, size_t size);

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

I'm going to pick this up tomorrow before sending my PR to Linus.

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
