Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF37F142591
	for <lists+linux-sh@lfdr.de>; Mon, 20 Jan 2020 09:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgATI2M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 20 Jan 2020 03:28:12 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34854 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgATI2M (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 20 Jan 2020 03:28:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id j1so32849289lja.2
        for <linux-sh@vger.kernel.org>; Mon, 20 Jan 2020 00:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g8tvo8Uu4rUlritD+AmO8tK3Og6eYimv/mza6g4tJb8=;
        b=xoDUbLJ9WjctoEy3K3g8cV0Dbt5RxyjHVe9g/0d+pxoY5Ea2IsLVbeTGvWT1+NOnHe
         4JyDO1x65mGR0lPf+t7aKIDP/EGGJSsQYJS7CzVe6ZP7+LwR1nKoZSj+gHIU6BdurEED
         kS6oY3lGAirNqo/TKXV2V8OpD8f+eiNzSGF1g7o3SZ1xicQRsrx6PZE7ih2yiyO3x9b7
         Xa5Ea4KjE3C12MmhAA5yQOEUHjSSUNelfUAlk/BIMFvBgInidDxEo8aufVLhBUiT/0Vh
         Oj84xMw/YsIlE7rf0k12NMsplwlSN8/IestZWI9DPvkDlgxR1pKYlru9s9frP4O+8LvO
         M0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g8tvo8Uu4rUlritD+AmO8tK3Og6eYimv/mza6g4tJb8=;
        b=LQb1s0FtnoZT6bRosoXonDxfZ0ryvhKjuJKyZ4J3IPOXj2U6SLobENP81ngYR2K/1Q
         +iDsj9Jq2RyQIntjMFu7hyE8izUpmvqeL0UXnRtAYNiBG4iLzcuQaJEGR8KsrNds7+kZ
         WFBecGe6VFPVCMGOylg0wWb5Fv5mbHJqlRHg0koE2MFeCMEkR9RYLRrY0cp1ycyLnfXV
         ugn/wmtlRH45a5d+bel4+eQTlR3YY/m2urB2fQr1xQ1aANZvXsPJz3qUb5X4suwEdhKu
         uqIr8PCRKVR0XUn+n8i3WJvblzKPa4ihDKa4+AMRR8Zb02XbAqR5KGZB4fG82hjxhNrh
         bX5A==
X-Gm-Message-State: APjAAAV5bDGgrctTzhwJ5WNq0uUWJI4mZUygxWqoyNwsDeX6m6xNWGMv
        UMR4PJaJP+Y4tEVB13TSQnh07w==
X-Google-Smtp-Source: APXvYqxgRnVdPOLQ9A+rEPDkvAc6hT6yoreURqC2DZIN3izgg6g7LSba1ER1SlppO/j+rF+GtKtLbQ==
X-Received: by 2002:a2e:8651:: with SMTP id i17mr1969011ljj.121.1579508890352;
        Mon, 20 Jan 2020 00:28:10 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:485a:3aea:adb3:caa0:efbe:8474? ([2a00:1fa0:485a:3aea:adb3:caa0:efbe:8474])
        by smtp.gmail.com with ESMTPSA id c8sm16146736lfm.65.2020.01.20.00.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2020 00:28:09 -0800 (PST)
Subject: Re: [PATCH resend 2/3] sh: Convert iounmap() macros to inline
 functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
References: <87o8uyylat.wl-kuninori.morimoto.gx@renesas.com>
 <87lfq2yl9y.wl-kuninori.morimoto.gx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8c6c0d91-4e99-9b85-10a2-c3e89fa25bac@cogentembedded.com>
Date:   Mon, 20 Jan 2020 11:28:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87lfq2yl9y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello!

On 20.01.2020 4:22, Kuninori Morimoto wrote:

    Why plurals in the subject if you only convert 1 function?

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Macro iounmap() do nothing, but that results in
> unused variable warnings all over the place.
> This patch convert it to inline to avoid warning
> 
> We will get this warning without this patch
> 
> 	${LINUX}/drivers/thermal/broadcom/ns-thermal.c:78:21: \
> 	  warning: unused variable 'ns_thermal' [-Wunused-variable]
> 	struct ns_thermal *ns_thermal = platform_get_drvdata(pdev);
> 	^~~~~~~~~~
> 
> Fixes: 98c90e5ea34e9 ("sh: remove __iounmap")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   arch/sh/include/asm/io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index 1495489..351a0a9 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -328,7 +328,7 @@ __ioremap_mode(phys_addr_t offset, unsigned long size, pgprot_t prot)
>   #else
>   #define __ioremap(offset, size, prot)		((void __iomem *)(offset))
>   #define __ioremap_mode(offset, size, prot)	((void __iomem *)(offset))
> -#define iounmap(addr)				do { } while (0)
> +static inline void iounmap(void __iomem *addr) {}
>   #endif /* CONFIG_MMU */
>   
>   static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)

MBR, Sergei

