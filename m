Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986AB2782C4
	for <lists+linux-sh@lfdr.de>; Fri, 25 Sep 2020 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbgIYIay (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 25 Sep 2020 04:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgIYIay (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 25 Sep 2020 04:30:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03F4C0613CE
        for <linux-sh@vger.kernel.org>; Fri, 25 Sep 2020 01:30:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so1740206ljk.8
        for <linux-sh@vger.kernel.org>; Fri, 25 Sep 2020 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4/DCTsPfuwv6Kvz36Kkbl5Rb2lbJAYYRqX6F2YgviWg=;
        b=Il0WBPzY0bNFlHumvhQ3f1/CgQy738IqzB2bvlUgRRe2mGEiY2D3my9DhVTzepVpcZ
         PpZtbaYaqPvfcvxqPgq6Sq/t/F4gtT01y3JeaGF5gu1wIbm7THL2lziFp4qyxFL0xwd0
         tp1NftctEHRwDvjU68N8YEjI5O3FWXZ1gikOkvNfjN6nWBj5DbCfQAKLsKVHSDpQVJzX
         64DMty1Z0A7GW+A6vjeTwGe9AIHt61Hek+9jhKHDBDN2pxIesOfKDfHyJgZFe1ktddGb
         Fv228WyYYowxN9HMUofz0Tp2Q5TVYkrLD/5QcyYgm6FyxTK9J+PWFlcI/Nj2adViWSIh
         Y6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4/DCTsPfuwv6Kvz36Kkbl5Rb2lbJAYYRqX6F2YgviWg=;
        b=OoDI2XFVmu+lbsmbnBiAvhmaznniOvQKQONT3TE6d1g5ZotNSta0z0FTu4ENyIsQNi
         irlmk6kDTHVoWY1LGx3p+8qiyA6k6lNL2tVUly9lcdFz4733xyo8xeTeyvvrE0o1qUt7
         DbSYpOh05kTZaalb95uR2nYJG2I9u4Taf1IAPTd+SmFfvdG0Jt+wC5Gm1UGbe3FQKomR
         dEHApdGoLKFxXal3ocDOY8O1ZOn/7WYj7g6RsekgleSE0E8DVD7YpP21CdNY/ZWXwOmP
         Ottcu+eCFsmxhK6baCOf95uZpKXjWFCx/wAOGKSoXD88Mpk4a5bm14iCvG/4Zm8RmlTX
         BfIg==
X-Gm-Message-State: AOAM531XDCjhoXdZmVnfHqLLAzWT5QxBgb3nVrHgj1dQjMETOywxuuVj
        3toAhp0+YVC/hHDyGE4HBiYNyewIE2s=
X-Google-Smtp-Source: ABdhPJzBJo0yCou9Yr6468x0ksvlc+nilCl52v2ukW6BXtNLmu6PWbF92iPwSc7luU1kTIzYapkZqA==
X-Received: by 2002:a2e:9743:: with SMTP id f3mr1097326ljj.310.1601022652132;
        Fri, 25 Sep 2020 01:30:52 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48a5:7ba0:6c83:d646:4716:7c8f? ([2a00:1fa0:48a5:7ba0:6c83:d646:4716:7c8f])
        by smtp.gmail.com with ESMTPSA id l15sm1832531lje.16.2020.09.25.01.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:30:51 -0700 (PDT)
Subject: Re: [PATCH] sh: remove CONFIG_IDE from most defconfig
To:     Christoph Hellwig <hch@lst.de>, ysato@users.sourceforge.jp,
        dalias@libc.org
Cc:     linux-sh@vger.kernel.org
References: <20200924043139.522028-1-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <573773d1-89ca-1d99-9aaf-dc27fd58eaaa@gmail.com>
Date:   Fri, 25 Sep 2020 11:30:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924043139.522028-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello!

On 24.09.2020 7:31, Christoph Hellwig wrote:

> Remove CONFIG_IDE from defconfigs that did not actually select chipset
> drivers, and switch ones that have libata drivers to libata.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]
> diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
> index 61bec46ebd66a8..4a44cac640bc94 100644
> --- a/arch/sh/configs/sdk7786_defconfig
> +++ b/arch/sh/configs/sdk7786_defconfig
> @@ -116,9 +116,6 @@ CONFIG_MTD_UBI_GLUEBI=m
>   CONFIG_BLK_DEV_LOOP=y
>   CONFIG_BLK_DEV_CRYPTOLOOP=y
>   CONFIG_BLK_DEV_RAM=y
> -CONFIG_IDE=y
> -CONFIG_BLK_DEV_IDECD=y
> -CONFIG_BLK_DEV_PLATFORM=y

    How about CONFIG_PATA_PLATFORM=y here?

>   CONFIG_BLK_DEV_SD=y
>   CONFIG_BLK_DEV_SR=y
>   CONFIG_SCSI_MULTI_LUN=y
[...]

MBR, Sergei
