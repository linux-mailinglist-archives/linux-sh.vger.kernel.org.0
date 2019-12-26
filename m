Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69FB612ABC0
	for <lists+linux-sh@lfdr.de>; Thu, 26 Dec 2019 12:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfLZLEH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 26 Dec 2019 06:04:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35574 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLZLEH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 26 Dec 2019 06:04:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so18311353lfr.2
        for <linux-sh@vger.kernel.org>; Thu, 26 Dec 2019 03:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dMuzKwiDG9erY21rvfOIFhgZeA3agNAcCiJiS61PwtU=;
        b=Mfvwn7FJa6uuSnyUZWdsYRK1BPLGVGTda71DdZ00VryPu2xgB1/ctUYu/DTy7RZEBi
         7WN5JGj/upLjqTsuPs4V2T5acL2Zq1Bq/vuEPKVQbbgH1aMu830hXCyMWfgHiq9oauTF
         I715D1xkH6jylQT3zBZwRcthpgW4qDU2EyRBgX/PCTxGjqPupcuIkgI2RXIphW6imggK
         El2LjR1GV1WNIkf8sTYlEXQo5vADwL3h4p2TKvk386Sqh4hdQTUVzLSL6bsopQgqA1C/
         gMd5LoepahntJyZCkTAktCFj5X1/ob6G5iwqU+NSTXF2RErppyu1h+6fHPSqflHPXHNL
         r/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dMuzKwiDG9erY21rvfOIFhgZeA3agNAcCiJiS61PwtU=;
        b=gIDvpe8ncrzccE0WPWzPZgf1+2FCaKiWEvlK0z9voobMRr/r+pFS/dwdIAytbAyFpJ
         8pOJptebnwFp7YYvpakWSOBsccHmL18MqAyC53dw3+ZY7vUloMGMcnys39+hSfwwfZoF
         KuRmf0XzDfxfQlfo7HLztZ8OD+sC6uCTjoGvS+L0cmymeNzFX7CjaikVMU0nKUS2v6Hh
         ivvmQAVWSb2x7zmF6p9h5kPN7onNf0q3diVrbhVwIWc4vXcwBFOafQcKiBTpFwg/S25J
         TO8PemDDqHRW7GwUrdXM+9iVQkfAWkrqrTGgG7DtLUy8qOP4yd7Dvy+JIDubCimnSe32
         ixsw==
X-Gm-Message-State: APjAAAXW83lbzAR/iRMKVAFNeKQoLsmQdmOp5q2qGRoYXTzdvsYn4GQp
        o/9lKKNVEqMV40zhh2AHAqla8w==
X-Google-Smtp-Source: APXvYqxyty1Ur5C7kdZ8TaFQIOjjXKTBfsFDaeaWxLUho5PXnAcZgwjh39AF42C5Amhhl1+IARuWYQ==
X-Received: by 2002:ac2:5605:: with SMTP id v5mr26169631lfd.136.1577358245281;
        Thu, 26 Dec 2019 03:04:05 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:867:b21c:a50d:bd68:cd46:4921? ([2a00:1fa0:867:b21c:a50d:bd68:cd46:4921])
        by smtp.gmail.com with ESMTPSA id d24sm12128249lja.82.2019.12.26.03.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2019 03:04:04 -0800 (PST)
Subject: Re: [PATCH] scsi: don't memset to zero after dma_alloc_coherent
To:     yu kuai <yukuai3@huawei.com>, ysato@users.sourceforge.jp,
        dalias@libc.org, aacraid@microsemi.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, sathya.prakash@broadcom.com,
        chaitra.basappa@broadcom.com, suganath-prabu.subramani@broadcom.com
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
        zhengbin13@huawei.com, yi.zhang@huawei.com
References: <20191225132327.7121-1-yukuai3@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a3b27b94-1ab6-c33f-611c-56143fd390f8@cogentembedded.com>
Date:   Thu, 26 Dec 2019 14:03:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191225132327.7121-1-yukuai3@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello!

On 25.12.2019 16:23, yu kuai wrote:

> dma_alloc_coherent already zeros out memory, so memset to zero is not
> needed.
> 
> Signed-off-by: yu kuai <yukuai3@huawei.com>
> ---
>   arch/sh/mm/consistent.c             | 2 --

    How this one is related to SCSI?

>   drivers/scsi/dpt_i2o.c              | 4 ----
>   drivers/scsi/mpt3sas/mpt3sas_base.c | 1 -
>   drivers/scsi/mvsas/mv_init.c        | 4 ----
>   drivers/scsi/pmcraid.c              | 1 -
>   5 files changed, 12 deletions(-)
[...]

MBR, Sergei
