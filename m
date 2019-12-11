Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7E211B565
	for <lists+linux-sh@lfdr.de>; Wed, 11 Dec 2019 16:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732527AbfLKPxf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 11 Dec 2019 10:53:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38135 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731437AbfLKPTA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 11 Dec 2019 10:19:00 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so7371258wmi.3
        for <linux-sh@vger.kernel.org>; Wed, 11 Dec 2019 07:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qbeJjKW4nbf0Chq8HrmirNCO/t8cTX+VWEBs6JApRCM=;
        b=sIxKfhz7W+XGG4A+6rFofyi3ZHJBmXvcd0/Lmofb8xlLjnFgZ0CEgeCNzsjg9nLaZm
         2HJpmBkNxcmbYYlRemzPJyHRp2BtaBvLcbHeA5L3tTBIgIzquuFqTfjhMVTnuEu4yVei
         iFR5wcNTGEO4KVaGnW3ezQ5vkRDCyqrAE0WiGgo+Yx/5sD316WPFgmqypIV1utZrCclf
         jwvV6hs/7mEZilmGoyybo9f5s41Mf7FCQdiiBWnIyygYpvCyBqO5rrDLcsJfGQTQ8dZY
         Rpi1NmEz6cDl/RUWtlIL8Zdon43y26OrmdUdlZFz/LpYffsTTpNz4e9QoACgaFzjJ159
         NnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbeJjKW4nbf0Chq8HrmirNCO/t8cTX+VWEBs6JApRCM=;
        b=Mq48EKGsVyQQDGu7WYMLDIT3r4xidGC6nIoFyFO+CBJ8WvcL/3/hzVA5g9FWZCZJTm
         49EBuPGF9UPigybktJr5FreiQxbNZwdb3FDoAgIj4Gdr06cEcuHlUjADqfoWKVAfOliO
         xLvXn//VDLlyZ+HSdCLFM1UdCe/sR2hBLRtg4WsSK9MFlwQaOaP2I/GRoSS18vnoYf84
         zLpPVC2KJ8wzEaAFB7TiPgFg+YNugpi08akyamzTszmL9Bt4vJqVD7HksQ3dzD81BXpG
         Kb9vGOq6d8b9iJ7MOlgmVJkTcBUnnyho+YlyYOQHuZDSvPIR54RtX3J1MDMKONGRzvBh
         lG2A==
X-Gm-Message-State: APjAAAWaedvbaUiETEcoq2hXvULiQkbqbUjpw1fbBVlLqn1+OFdO4myh
        5DWs2r2AboL3UHg/z5ltSOrciQ==
X-Google-Smtp-Source: APXvYqwMPPc+4B4dB6jAQ8b+5nRg9tYQcN/aezgiVC9EtiwmXqwgIMdUoTdUwZTp4c6n3StHD7jnxA==
X-Received: by 2002:a7b:cb15:: with SMTP id u21mr354499wmj.25.1576077539024;
        Wed, 11 Dec 2019 07:18:59 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x132sm6891747wmg.0.2019.12.11.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:18:58 -0800 (PST)
Date:   Wed, 11 Dec 2019 15:18:56 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Will Deacon <will@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Paul Burton <paul.burton@mips.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: kgdb: Mark expected switch fall-throughs
Message-ID: <20191211151856.krh7jbrl5vsa7imq@holly.lan>
References: <87o8wgy3ra.wl-kuninori.morimoto.gx@renesas.com>
 <87muc0y3q4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87muc0y3q4.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Dec 10, 2019 at 05:39:00PM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following error:
> 
> LINUX/arch/sh/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
> LINUX/arch/sh/kernel/kgdb.c:267:6: error: this statement may fall through [-Werror=implicit-fallthrough=]
> if (kgdb_hex2long(&ptr, &addr))
> ^
> LINUX/arch/sh/kernel/kgdb.c:269:2: note: here
> case 'D':
> ^~~~
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  arch/sh/kernel/kgdb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/kernel/kgdb.c b/arch/sh/kernel/kgdb.c
> index 6d61f8c..0d5f3c9 100644
> --- a/arch/sh/kernel/kgdb.c
> +++ b/arch/sh/kernel/kgdb.c
> @@ -266,6 +266,7 @@ int kgdb_arch_handle_exception(int e_vector, int signo, int err_code,
>  		ptr = &remcomInBuffer[1];
>  		if (kgdb_hex2long(&ptr, &addr))
>  			linux_regs->pc = addr;
> +		/* fallthrough */

Since v5.5-rc1 there is the fallthrough pseudo keyword to document
these cases:
https://elixir.bootlin.com/linux/v5.5-rc1/source/Documentation/process/coding-style.rst#L59


Daniel.


>  	case 'D':
>  	case 'k':
>  		atomic_set(&kgdb_cpu_doing_single_step, -1);
> -- 
> 2.7.4
> 
