Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E72D39BD5
	for <lists+linux-sh@lfdr.de>; Sat,  8 Jun 2019 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfFHI17 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 8 Jun 2019 04:27:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33993 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFHI17 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 8 Jun 2019 04:27:59 -0400
Received: by mail-lf1-f66.google.com with SMTP id y198so3305829lfa.1
        for <linux-sh@vger.kernel.org>; Sat, 08 Jun 2019 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PnILbnFkA52+DVYMDpIF+UT+wsKYLb/Bzf7cSmdeRLg=;
        b=qYot+9jIOZNxHCmAnzG6kjiLQrsJ8y6E6Dd7ee8L3dcvp6igRcO/JpG+m+iOaOsOaF
         Q4coYi2WHWUeOqbwOHwGl7l7aE8nV/DEzfpJwWO2A84uloxxxTb8ye7aWB4rzpMGPQRD
         tEN8zK32CFYJFeqSMy0fxkiRw5/v/mvbiWzZDOXDMfvjoti/k7czjN/8osD97kxdN0+x
         wryPZNm1kq8rIbRf1uSrpPKy22poWKqI8+XJYPHFp3Jke5aUmYZ2o0jqHyuS0NEZiKx4
         y2zPjsW88WHkAM4weUH8+M4wBGi4lMxWQybxcGd4da15aXYCBVNwXBEURNJvimBPpQfo
         JcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PnILbnFkA52+DVYMDpIF+UT+wsKYLb/Bzf7cSmdeRLg=;
        b=RlHyUT23RnTjFrp+sPMpH5wLcFdk6hmhLZFosP0wrg7k5e4WsYCsc0G/8CyXcfFenP
         E1H0SKJAkoNk/fVGyrfWK0l8LXvYSUz43f6uqKoyZQVwyuiDWXVHbmhbzTf7R4jaDs/7
         ZdRSca9UxMj6Stg9yBW1d4XpxEtFyu4CW/QjYTLCjpB468POVgkidCaght9Nb53GUOea
         wwhX4sdzLp5xBxEU8TFCbaFTxzTvGx8zd6wKLNpIkN8wDt0kqosgCM8XAcm9RrJ9oSOU
         ypX9BfAFlq2tGIv8TiSyAP0ti/TBMtJyemH803Y967p7gD9jFPppvl2klY543c8rnS3f
         s9tw==
X-Gm-Message-State: APjAAAWK1BIAnb4XFlCEFVz3RM0jrPwcRfwS2hpqsUFNlvHmYXFiVr3J
        YfNXuhEqZ/xl1RMsbaMLEnCKw91fC94=
X-Google-Smtp-Source: APXvYqwXjtXJuS4o+b+gf70p8GXt0T7Pe8w6a/00y+GF/QWdvcrw8PiZGqc/+e/5VubWYstVWaJo4g==
X-Received: by 2002:ac2:46f9:: with SMTP id q25mr31267693lfo.181.1559982478000;
        Sat, 08 Jun 2019 01:27:58 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.83.119])
        by smtp.gmail.com with ESMTPSA id o74sm817256lff.46.2019.06.08.01.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 01:27:57 -0700 (PDT)
Subject: Re: [PATCH] sh: dma: Add missing IS_ERR test
To:     Rolf Evers-Fischer <embedded24@evers-fischer.de>,
        ysato@users.sourceforge.jp, dalias@libc.org,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190607115404.4557-1-embedded24@evers-fischer.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b731167e-6285-4fe0-e280-b2626b8efe44@cogentembedded.com>
Date:   Sat, 8 Jun 2019 11:27:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607115404.4557-1-embedded24@evers-fischer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello!

On 07.06.2019 14:54, Rolf Evers-Fischer wrote:

> get_dma_channel may return ERR_PTR, so a check is added.
> 
> Signed-off-by: Rolf Evers-Fischer <embedded24@evers-fischer.de>
> ---
>   arch/sh/drivers/dma/dma-api.c   | 20 +++++++++++++++++++-
>   arch/sh/drivers/dma/dma-sysfs.c |  2 +-
>   2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sh/drivers/dma/dma-api.c b/arch/sh/drivers/dma/dma-api.c
> index ab9170494dcc..5d6f1a46cc5e 100644
> --- a/arch/sh/drivers/dma/dma-api.c
> +++ b/arch/sh/drivers/dma/dma-api.c
> @@ -94,7 +94,7 @@ int get_dma_residue(unsigned int chan)
>   	struct dma_info *info = get_dma_info(chan);
>   	struct dma_channel *channel = get_dma_channel(chan);
>   
> -	if (info->ops->get_residue)
> +	if (!IS_ERR(channel) && (info->ops->get_residue))

    Extra parens not needed here.

[...]

MBR, Sergei
