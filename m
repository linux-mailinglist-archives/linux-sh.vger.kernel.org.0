Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD9912ABCC
	for <lists+linux-sh@lfdr.de>; Thu, 26 Dec 2019 12:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfLZLNc (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 26 Dec 2019 06:13:32 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:52710 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726105AbfLZLNb (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 26 Dec 2019 06:13:31 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 114431A9DE489C6B6775;
        Thu, 26 Dec 2019 19:13:29 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.96) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Thu, 26 Dec 2019
 19:13:21 +0800
Subject: Re: [PATCH] scsi: don't memset to zero after dma_alloc_coherent
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <aacraid@microsemi.com>, <jejb@linux.ibm.com>,
        <martin.petersen@oracle.com>, <sathya.prakash@broadcom.com>,
        <chaitra.basappa@broadcom.com>,
        <suganath-prabu.subramani@broadcom.com>
CC:     <linux-sh@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <MPT-FusionLinux.pdl@broadcom.com>,
        <zhengbin13@huawei.com>, <yi.zhang@huawei.com>
References: <20191225132327.7121-1-yukuai3@huawei.com>
 <a3b27b94-1ab6-c33f-611c-56143fd390f8@cogentembedded.com>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <958ffbe5-f3da-da16-9f2b-05923d13485b@huawei.com>
Date:   Thu, 26 Dec 2019 19:13:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a3b27b94-1ab6-c33f-611c-56143fd390f8@cogentembedded.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.96]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 2019/12/26 19:03, Sergei Shtylyov wrote:
> Hello!
> 
> On 25.12.2019 16:23, yu kuai wrote:
> 
>> dma_alloc_coherent already zeros out memory, so memset to zero is not
>> needed.
>>
>> Signed-off-by: yu kuai <yukuai3@huawei.com>
>> ---
>>   arch/sh/mm/consistent.c             | 2 --
> 
>     How this one is related to SCSI?
> 
Thank you for your response!
I put them in the same patch because I thougt they are the same 
situation. I'm sorry if it's not appropriate.

Yu Kuai

