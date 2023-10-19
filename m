Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 276CF7CEDD7
	for <lists+linux-sh@lfdr.de>; Thu, 19 Oct 2023 04:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjJSCDq (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Oct 2023 22:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjJSCDp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Oct 2023 22:03:45 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E993EEA
        for <linux-sh@vger.kernel.org>; Wed, 18 Oct 2023 19:03:42 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-2.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id 6a2ea581-6fb8-41dc-99d5-2e253b2bdcc2;
        Thu, 19 Oct 2023 11:03:41 +0900 (JST)
Received: from SIOS1075.ysato.ml (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
        by sakura.ysato.name (Postfix) with ESMTPSA id 7C1F01C0037;
        Thu, 19 Oct 2023 11:03:39 +0900 (JST)
Date:   Thu, 19 Oct 2023 11:03:39 +0900
Message-ID: <875y338j2c.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH RFC] hw/sh4/sh7750: Add STBCR/STBCR2 register support
In-Reply-To: <20231018124023.2927710-1-geert+renesas@glider.be>
References: <20231018124023.2927710-1-geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_SOFTFAIL,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 18 Oct 2023 21:40:23 +0900,
Geert Uytterhoeven wrote:
> 
> The new Linux SH7750 clock driver uses the registers for power-down
> mode control, causing a crash:
> 
>     byte read to SH7750_STBCR_A7 (0x000000001fc00004) not supported
>     Aborted (core dumped)
> 
> Fix this by adding support for the Standby Control Registers STBCR and
> STBCR2.

FRQCR is also not returning the correct value, so it needs to be fixed.
Here are my changes.
https://gitlab.com/yoshinori.sato/qemu.git

It include.
- Minimal CPG support.
- DT support
- Add target LANDISK.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> [RFC PATCH v3 12/35] drivers/clk/renesas: clk-sh7750.c SH7750/7751 CPG driver.
> https://lore.kernel.org/all/a772e1b6de89af22057d3af31cc03dcad7964fc7.1697199949.git.ysato@users.sourceforge.jp
> 
> Accesses to CLKSTP00 and CLKSTCLK00 (0xfe0a0000/0x1e0a0000 and
> 0xfe0a0008/0x1e0a0008) don't seem to cause any issues, although I can't
> see immediately where they are handled?
> 
> ---
>  hw/sh4/sh7750.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
> index ebe0fd96d94ca17b..deeb83b4540bbf2b 100644
> --- a/hw/sh4/sh7750.c
> +++ b/hw/sh4/sh7750.c
> @@ -59,6 +59,9 @@ typedef struct SH7750State {
>      uint16_t bcr3;
>      uint32_t bcr4;
>      uint16_t rfcr;
> +    /* Power-Down Modes */
> +    uint8_t stbcr;
> +    uint8_t stbcr2;
>      /* PCMCIA controller */
>      uint16_t pcr;
>      /* IO ports */
> @@ -219,7 +222,13 @@ static void ignore_access(const char *kind, hwaddr addr)
>  
>  static uint32_t sh7750_mem_readb(void *opaque, hwaddr addr)
>  {
> +    SH7750State *s = opaque;
> +
>      switch (addr) {
> +    case SH7750_STBCR_A7:
> +        return s->stbcr;
> +    case SH7750_STBCR2_A7:
> +        return s->stbcr2;
>      default:
>          error_access("byte read", addr);
>          abort();
> @@ -318,14 +327,24 @@ static uint32_t sh7750_mem_readl(void *opaque, hwaddr addr)
>  static void sh7750_mem_writeb(void *opaque, hwaddr addr,
>                                uint32_t mem_value)
>  {
> +    SH7750State *s = opaque;
>  
>      if (is_in_sdrmx(addr, 2) || is_in_sdrmx(addr, 3)) {
>          ignore_access("byte write", addr);
>          return;
>      }
>  
> -    error_access("byte write", addr);
> -    abort();
> +    switch (addr) {
> +    case SH7750_STBCR_A7:
> +        s->stbcr = mem_value;
> +        return;
> +    case SH7750_STBCR2_A7:
> +        s->stbcr2 = mem_value;
> +        return;
> +    default:
> +        error_access("byte write", addr);
> +        abort();
> +    }
>  }
>  
>  static void sh7750_mem_writew(void *opaque, hwaddr addr,
> -- 
> 2.34.1
> 

-- 
Yosinori Sato
