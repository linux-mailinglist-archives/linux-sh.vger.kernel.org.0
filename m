Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E781A122886
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 11:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfLQKTN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 05:19:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45394 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfLQKTN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 05:19:13 -0500
Received: by mail-lj1-f195.google.com with SMTP id j26so1142422ljc.12
        for <linux-sh@vger.kernel.org>; Tue, 17 Dec 2019 02:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FzmFmsLrqvnc5An4DsytwlvV71CPll4HoCOM1w/Xnqc=;
        b=kLKueNxkV5kYx3mGuHNB1Z4FSliGI9/NiF8gTYy7zBzArCF3/aZpKz/q76OxaoehFB
         PqDSxWAXN+mVpDhueKJQI8yUKsU73gPFLqZhVcxeQFuJX42OLbim6oBgnt03kBfal84t
         AfYKEUPgl1TmFB0RmazXVtRTlXkuLy2vT2cRUmaJTfo9grhATgKQKORNXIkQ5wVch/5/
         stRpC17/NfZetWw9IWiF9rpp4KAQwoSsNx1sZBOA5+XZF1zo3kVKSZnQglyrOKzwbVxr
         bbAF7AqkG/10EaE8HCXi06M8Dx79XNnFqOhhvPJJnzFsmdPJOLYH9ovQozNNRpoi9csO
         d3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FzmFmsLrqvnc5An4DsytwlvV71CPll4HoCOM1w/Xnqc=;
        b=GiAlFHUn/H7FZQsvdKmqDwsDw0zk51s8do/+viUwOSQ81DPMSfHHE6fr/A3T+ZuuNa
         lluNjXjWhT/Gq/PkbgEHGicMkcWFE4wFi9Qy8cohsc8Hov1LouuHOgIq97fPbbltaMMs
         nOoDuqhnX+785iJKE1K/g0ktXgc6GtDCtlnp5W4HreOCvol0L7hJjY1II2Yrj2k4InJ9
         IKHYOaAcmg10OMOjlGsXFjQkIjzZkwpPf7M23l4bWbGggJTeShJjpJjEA1UtuAOl21Rn
         vA/K1SL8AHCIM8ksoiRDq+0q1H3in72oe61wy6kcSr7uRCsPeuUMituhYTX0+fw6XYi2
         EAeQ==
X-Gm-Message-State: APjAAAV+LxCnuCuZqnMyNgyuJBGRPTHXx5qa68B36S7ud1NW8wRBctSQ
        rc+lMCue/MI6ko1vfLa8kkp3kNRv+67fKg==
X-Google-Smtp-Source: APXvYqzNeRwWt0AIiKm3LdZyFeA3Dsf0WuAO7HnNoldAc90hDHcI+WB59uAk4sIoINdir4Gilwo6UA==
X-Received: by 2002:a2e:144b:: with SMTP id 11mr2599596lju.216.1576577950604;
        Tue, 17 Dec 2019 02:19:10 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:290:15a:3c55:d836:6838:7553? ([2a00:1fa0:290:15a:3c55:d836:6838:7553])
        by smtp.gmail.com with ESMTPSA id s7sm12163349ljo.43.2019.12.17.02.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 02:19:10 -0800 (PST)
Subject: Re: [PATCH] SH: Convert ins[bwl]/outs[bwl] macros to inline functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-sh@vger.kernel.org
References: <87d0cnh2eb.wl-kuninori.morimoto.gx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1cbfc481-ed50-64fa-ff29-c99eb434562c@cogentembedded.com>
Date:   Tue, 17 Dec 2019 13:18:57 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87d0cnh2eb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello!

On 17.12.2019 9:50, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Macro ins[bwl]/outs[bwl] are just calling BUG(), but that results in
> unused variable warnings all over the place.
> This patch convert macro to inline to avoid warning
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   arch/sh/include/asm/io_noioport.h | 34 ++++++++++++++++++++++++++++------
>   1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/sh/include/asm/io_noioport.h b/arch/sh/include/asm/io_noioport.h
> index 90d6109..d39a1a8 100644
> --- a/arch/sh/include/asm/io_noioport.h
> +++ b/arch/sh/include/asm/io_noioport.h
> @@ -53,12 +53,34 @@ static inline void ioport_unmap(void __iomem *addr)
>   #define outw_p(x, addr)	outw((x), (addr))
>   #define outl_p(x, addr)	outl((x), (addr))
>   
> -#define insb(a, b, c)	BUG()
> -#define insw(a, b, c)	BUG()
> -#define insl(a, b, c)	BUG()
> +static inline void insb (unsigned long port, void *dst, unsigned long count)

    Why this space after the function name? I don't think scripts/checkpatch.pl
is happy about it...

[...]

MBR, Sergei
