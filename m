Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D0E693770
	for <lists+linux-sh@lfdr.de>; Sun, 12 Feb 2023 13:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBLMsR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 12 Feb 2023 07:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBLMsQ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 12 Feb 2023 07:48:16 -0500
X-Greylist: delayed 964 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Feb 2023 04:48:14 PST
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BE9FF08
        for <linux-sh@vger.kernel.org>; Sun, 12 Feb 2023 04:48:13 -0800 (PST)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-1.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id d44315c7-2943-41ba-8e1a-5896c9ebcab3;
        Sun, 12 Feb 2023 21:32:08 +0900 (JST)
Received: from SIOS1075.ysato.ml (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by sakura.ysato.name (Postfix) with ESMTPSA id AB5751C0122;
        Sun, 12 Feb 2023 21:32:05 +0900 (JST)
Date:   Sun, 12 Feb 2023 21:32:04 +0900
Message-ID: <87v8k7rrnf.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rich Felker <dalias@libc.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer for arch/sh (SUPERH)
In-Reply-To: <20230207165715.14617-1-glaubitz@physik.fu-berlin.de>
References: <20230207165715.14617-1-glaubitz@physik.fu-berlin.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/27.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 08 Feb 2023 01:57:15 +0900,
John Paul Adrian Glaubitz wrote:
> 
> Both Rich Felker and Yoshinori Sato haven't done any work on arch/sh
> for a while. As I have been maintaining Debian's sh4 port since 2014,
> I am interested to keep the architecture alive.
> 
> Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb1471cb5ed3..3c3696b68e93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20090,6 +20090,7 @@ F:	drivers/watchdog/sunplus_wdt.c
>  SUPERH
>  M:	Yoshinori Sato <ysato@users.sourceforge.jp>
>  M:	Rich Felker <dalias@libc.org>
> +M:	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>  L:	linux-sh@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.kernel.org/project/linux-sh/list/
> -- 
> 2.30.2
> 

Acked-by: Yoshinori Sato <ysato@users.sourceforge.jp>

I can't take enough time for this.
Thank you very much.

-- 
Yosinori Sato
