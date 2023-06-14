Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C16EF730797
	for <lists+linux-sh@lfdr.de>; Wed, 14 Jun 2023 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbjFNStX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Wed, 14 Jun 2023 14:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjFNStW (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 14 Jun 2023 14:49:22 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D668DED;
        Wed, 14 Jun 2023 11:49:20 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q9VYQ-002ZBE-3L; Wed, 14 Jun 2023 20:49:14 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q9VYP-000vtI-S8; Wed, 14 Jun 2023 20:49:14 +0200
Message-ID: <2a1d8002f7e2982399cb8ab7641f54ac867270aa.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: Replace all non-returning strlcpy with strscpy
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Kees Cook <keescook@chromium.org>, ysato@users.sourceforge.jp,
        azeemshaikh38@gmail.com, dalias@libc.org
Cc:     linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        linux-sh@vger.kernel.org, linux-hardening@vger.kernel.org
Date:   Wed, 14 Jun 2023 20:49:13 +0200
In-Reply-To: <168676826702.1963449.9061022814058323294.b4-ty@chromium.org>
References: <20230530163041.985456-1-azeemshaikh38@gmail.com>
         <168676826702.1963449.9061022814058323294.b4-ty@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Kees!

On Wed, 2023-06-14 at 11:44 -0700, Kees Cook wrote:
> On Tue, 30 May 2023 16:30:41 +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> > 
> > [...]
> 
> Build tested with sh4 GCC 13.1 from:
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.1.0/
> 
> with defconfig and:
> 	CONFIG_CPU_SUBTYPE_SH7343=y
> 	CONFIG_SH_DMA=y
> 	CONFIG_SH_DMA_API=y
> 
> Applied to for-next/hardening, thanks!
> 
> [1/1] sh: Replace all non-returning strlcpy with strscpy
>       https://git.kernel.org/kees/c/ca64da3052be
> 

Apologies, this fell off my table. I should have acked and tested this being the
SuperH maintainer. If you can still update the patch in your tree, I can both
test and ack this patch.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
