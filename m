Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1486D27BF2B
	for <lists+linux-sh@lfdr.de>; Tue, 29 Sep 2020 10:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgI2IVZ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 29 Sep 2020 04:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgI2IVY (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 29 Sep 2020 04:21:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6160AC061755
        for <linux-sh@vger.kernel.org>; Tue, 29 Sep 2020 01:21:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so4460922lfp.9
        for <linux-sh@vger.kernel.org>; Tue, 29 Sep 2020 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qkiAd//e7ilPEuCvZiRJKS6sA8EM2y6aN1CWjagp6qE=;
        b=jwHGIORQ82zgGp9CJK847QFPh929lvN/Meg9Nde49m4qEaLY6mmrb60cxgZSVFQOOQ
         ySLbwK48PmrmTvHlCuZwYwihqhXx2GCC4yAUZxZdJiiXp1z7JfUyAGFGNzMgo1Nqft8M
         g8TU1s0bNmSRM2EuXnnQEqc3Vj3wfnfUovSsVBNz7jIhHBEYe4PpQ1D+XJGpF3dsgc9r
         IrqEkbVHTzE3H4ANFUHLm7SWcxFxiW/0ADEVEBwNbnPddBbHmQ3YR8tb1tA8mvIC9h35
         ODFcBqQ/Ab2PsiW9vdQ7JgMspfRYlGBlgoJ3HlxY/Wu54mtrJaj/ZWbpT3oEBKmlQXnY
         Jbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qkiAd//e7ilPEuCvZiRJKS6sA8EM2y6aN1CWjagp6qE=;
        b=t+cHGzkn6L7W55QjE4KKFeREWf3HhmtPCtqoesAcvg1+foNNrTkhbYQ/eHTcmSL4kL
         mhTpYJP7xMAlOXXHWIahHVqnf+JcAUGhSFVe572j8o/NFxlDzNuwyP0p5IY4PIz02XZJ
         fsxWZeCLGCIJZEiOwueNUouaUVUiaAN5GrhKLYYAD+B4K/w3mgBDYH02I/mhs/mCfl12
         09eU1QuaEAuHLXfDbo8FarQVG2S57Z5jOlWZjqWJ7dCTrk4E8dJS7n2jrto6xsvpmBAt
         8KDpMLcNCWaAIzP2BixgGFPnYdnTDVSE2tDBQB8u5LkosXYyPcMgQOFHbL114Q4g/cRq
         XbVQ==
X-Gm-Message-State: AOAM530xGvphksrFOHqa0H1//qCBXmKbbrfwNt6z1zVHWw8+i9b1mzFR
        pVBZ2CN+m0gBr3mHQYdR5ckIfxTXG2g=
X-Google-Smtp-Source: ABdhPJzVdeDrtfBs9LhWsFGGGImVHRZ3qRSgLQQCHLgpv3qXGg1PTtAl9h9moyE3oxAekMO6zVtPXg==
X-Received: by 2002:a19:8bd5:: with SMTP id n204mr844194lfd.227.1601367682723;
        Tue, 29 Sep 2020 01:21:22 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:40d:691b:b1f8:443c:2ebc:f573? ([2a00:1fa0:40d:691b:b1f8:443c:2ebc:f573])
        by smtp.gmail.com with ESMTPSA id n8sm295822lji.1.2020.09.29.01.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 01:21:22 -0700 (PDT)
Subject: Re: [PATCH] sh: remove CONFIG_IDE from most defconfig
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
To:     Christoph Hellwig <hch@lst.de>, ysato@users.sourceforge.jp,
        dalias@libc.org
Cc:     linux-sh@vger.kernel.org
References: <20200924043139.522028-1-hch@lst.de>
 <573773d1-89ca-1d99-9aaf-dc27fd58eaaa@gmail.com>
Organization: Brain-dead Software
Message-ID: <0693c197-051b-2a37-208d-eb6c40e650db@gmail.com>
Date:   Tue, 29 Sep 2020 11:21:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <573773d1-89ca-1d99-9aaf-dc27fd58eaaa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 25.09.2020 11:30, Sergei Shtylyov wrote:

>> Remove CONFIG_IDE from defconfigs that did not actually select chipset
>> drivers, and switch ones that have libata drivers to libata.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> [...]
>> diff --git a/arch/sh/configs/sdk7786_defconfig 
>> b/arch/sh/configs/sdk7786_defconfig
>> index 61bec46ebd66a8..4a44cac640bc94 100644
>> --- a/arch/sh/configs/sdk7786_defconfig
>> +++ b/arch/sh/configs/sdk7786_defconfig
>> @@ -116,9 +116,6 @@ CONFIG_MTD_UBI_GLUEBI=m
>>   CONFIG_BLK_DEV_LOOP=y
>>   CONFIG_BLK_DEV_CRYPTOLOOP=y
>>   CONFIG_BLK_DEV_RAM=y
>> -CONFIG_IDE=y
>> -CONFIG_BLK_DEV_IDECD=y
>> -CONFIG_BLK_DEV_PLATFORM=y
> 
>     How about CONFIG_PATA_PLATFORM=y here?

    Ah, it enables both IDE and PATA drivers! Sorry for the noise then. :-)

>>   CONFIG_BLK_DEV_SD=y
>>   CONFIG_BLK_DEV_SR=y
>>   CONFIG_SCSI_MULTI_LUN=y
> [...]

MBR, Sergei
