Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A486CF59D
	for <lists+linux-sh@lfdr.de>; Wed, 29 Mar 2023 23:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjC2VwK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 Mar 2023 17:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjC2VwI (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 29 Mar 2023 17:52:08 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306E35BBA
        for <linux-sh@vger.kernel.org>; Wed, 29 Mar 2023 14:51:58 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so10591493wms.1
        for <linux-sh@vger.kernel.org>; Wed, 29 Mar 2023 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=X0RSiXgHE7YkzJiBvPfuECvjvZh/j9OCTlp5vS9G1kUZuHyE1mJThY46uxE8TkBE8F
         26YKvU03kRSEEbihp0nG/r6HBhciobPuGf3L9XG5lP7LIGmFx1xuZOCywjcKmPOmTu8N
         GYJA3eb2b0Q6VlUVpDCKV/9pvTj9LkixTX22pUdw50wCneJbfivXkkSI84dON9P5F9zR
         aPsg4Jeh3iGHabX4d9hb5dRKHYvbcqGCgHjWCSflhUWkYsO9R2cu9K7Yx5HZpgAK9C+P
         FR/T+Ct46EkosCoWvECTXbDfM4FfGO3jzQMNS58kzGepVwnhUrHOmPZqrc1qrzv6vlJT
         efvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=svNYu4D+4z3mOmCjHFkpa1dp/bmnzKfO6ufdLRz6SP5hAic2RMmNUgN6Y8/KAkYCKu
         rsQ0UYeHZ1+jGQXNDu1LXPaWrXgnW1VOM6P90+/RE58AyuhlGukUQcnXWuLL1wJp+QfJ
         yIAIvDrTl5iJjDtcZYVPQm3wDcm8/0IpdOzryGlrTHjZ0iSsj54ZEcqnZaZUdhyOBF95
         6XZSTTj2F+rnYKuDRJhU9KJKZgggr2/R08kIKaavE0q9ObS+ubf1AXO0dPELSzWvdJ3m
         7mrpkBeQmhvg448fHwCN4fRSTSMcIPqITwI71pGS16vGKhuuuwgPZVy1WIcnov0D3KbU
         y//w==
X-Gm-Message-State: AO0yUKWVTGP3sVDceZbccNPsTi3+EYPy58REg2ipcnzQyeyf2pVYgQ5i
        EWjrwBY8I/ya17qrmSlhS/6fTQ==
X-Google-Smtp-Source: AK7set8QoMq1gGRgzzGqEiUi0STo43D8VYRH41LQHDT7NbD/gZR3RJOV/DBadJ5PrJGjWGmEaVtwcg==
X-Received: by 2002:a7b:c413:0:b0:3ee:4531:8448 with SMTP id k19-20020a7bc413000000b003ee45318448mr17263952wmi.39.1680126716518;
        Wed, 29 Mar 2023 14:51:56 -0700 (PDT)
Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a1cf012000000b003ed4f6c6234sm3437896wmb.23.2023.03.29.14.51.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Mar 2023 14:51:55 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not
 flush
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
Date:   Wed, 29 Mar 2023 22:51:54 +0100
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-snps-arc@lists.infradead.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-oxnas@groups.io, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <837F1B2F-7090-4F9F-A894-594ACF6A8DB2@jrtc27.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 27 Mar 2023, at 13:13, Arnd Bergmann <arnd@kernel.org> wrote:
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

FYI [1] proposed this same change a while ago but its justification was
flawed (which was my objection at the time, not the diff itself).

Jess

[1] =
https://lore.kernel.org/all/20220818165105.99746-1-s.miroshnichenko@yadro.=
com

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> arch/riscv/mm/dma-noncoherent.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c =
b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
> 		break;
> 	case DMA_FROM_DEVICE:
> 	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> 		break;
> 	default:
> 		break;
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

