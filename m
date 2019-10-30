Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27469E9864
	for <lists+linux-sh@lfdr.de>; Wed, 30 Oct 2019 09:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfJ3IoO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 30 Oct 2019 04:44:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35777 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ3IoO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 30 Oct 2019 04:44:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id x5so1163229wmi.0
        for <linux-sh@vger.kernel.org>; Wed, 30 Oct 2019 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r8+wN7r4BrgoWGfrY7VXP4mHc/bPGpidu8v8LPP2YUc=;
        b=Z4rh9H+22xLXETaMo+PSqs80h6xxtBjz58NKJRTXfIHYnvYxG4qsk/qTPRZc5w3rSz
         IaYfVX548vJpJJOpwCjeb9GR4LiRuqdLkIP5Y45r5GgJuW8v1Oy8gt0wsND9oKgGtdtM
         OOaDZsNZfFYvSauMwEzJGHHJiVJQRNBWpLsdeCmj2MmrHUZ3NNWJARzBmVY/n6A6D0Dh
         9BsmO4XwhXOdoBZ+nuo+EhlcTL2drFa/dPRmAzQDtl8AScWe+QR6A0XhEEPvQ6jvjMlC
         dv/0S4msE94jk2DH0WkCWWVMKIXE/3o3p7/oZNPc7sQEkzDkcA03jf5JGH3HjALAFNud
         ULCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r8+wN7r4BrgoWGfrY7VXP4mHc/bPGpidu8v8LPP2YUc=;
        b=U8RBfo4Yxw5dstOl2Y945jnwoCLMtcnRJkZa6CL8e3V6bmBRD+Tkd0hQxY8aMI/Xjx
         EHhn8Cz96/DLzbGaiVWjdxqVPjRZwyjTuoVj7Mu9I6KM45LoYNq2tDRxXYekyhEefTOa
         rq5V0u0RkGva/37h+22g3u/L8yLQROHZXTMxdseFAH1ebGmdBY3o6OGuf+m7QYB/kGKL
         O8s5NVmLwX4KYMMvmby46EBTLQppsYmvqrduXVlVuAe4jPakAFcEV4dj1eW2x08D5SUO
         mgifVdMzphkqG5GufrNtXu8g3zpa/BRSVSMLtVoA9xGZ7YIPC6e5lJ9o1+4TTqEBDCFd
         fE4Q==
X-Gm-Message-State: APjAAAViHaHE9Si9OSMbG+V1ksQTx2GZe171kStff95R9isEhM3QtBKy
        4v4M3rQwaAVLOQWiCVzglRQcww==
X-Google-Smtp-Source: APXvYqyf/bgbpTbw1ikl55tZ1ofxh+SXQtEBmKYIHB9qzbVXVvoo7WtSZFMTd0FPH0oxU1jIoJrwng==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr3508726wml.22.1572425052624;
        Wed, 30 Oct 2019 01:44:12 -0700 (PDT)
Received: from pine ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id d10sm1327109wme.47.2019.10.30.01.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 01:44:11 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:44:10 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Will Deacon <will@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Paul Burton <paul.burton@mips.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        joe@perches.com
Subject: Re: [PATCH] sh: kgdb: Mark expected switch fall-throughs
Message-ID: <20191030084410.c7x2sa4ak3m2h2l7@pine>
References: <878sp2d7mm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sp2d7mm.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Oct 30, 2019 at 04:17:53PM +0900, Kuninori Morimoto wrote:
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

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Just FYI this is likely to be converted to be the fallthrough
pseudo-keyword shortly after introductionb but IIRC the keyword is only
available in linux-next right now (and the conversion, from Joe Perches,
is script based so it is likely the change will get picked up by the
script without you having to do anything explicit).


Daniel.

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
>  	case 'D':
>  	case 'k':
>  		atomic_set(&kgdb_cpu_doing_single_step, -1);
> -- 
> 2.7.4
> 
