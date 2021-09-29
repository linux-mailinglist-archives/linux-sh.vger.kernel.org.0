Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1369941C057
	for <lists+linux-sh@lfdr.de>; Wed, 29 Sep 2021 10:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243188AbhI2INt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 Sep 2021 04:13:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:26965 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243282AbhI2INt (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 29 Sep 2021 04:13:49 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HK8BF0FTczbmxb;
        Wed, 29 Sep 2021 16:07:49 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 16:12:05 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 16:12:04 +0800
Message-ID: <4e8f6872-28f8-9651-c6a7-0643e6069ce2@huawei.com>
Date:   Wed, 29 Sep 2021 16:12:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 0/3] Cleanup MAY_HAVE_SPARSE_IRQ
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-csky@vger.kernel.org>
References: <20210929023522.57732-1-wangkefeng.wang@huawei.com>
 <CAMuHMdVjfBEcvKMCvcG2P+K4rs+SZHDcf4OKsGzyFjtOHNFyqw@mail.gmail.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAMuHMdVjfBEcvKMCvcG2P+K4rs+SZHDcf4OKsGzyFjtOHNFyqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 2021/9/29 15:21, Geert Uytterhoeven wrote:
> Hi Kefeng,
> 
> On Wed, Sep 29, 2021 at 4:35 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> Most ARCHs support SPARSE_IRQ, the dynamical and statical irq
>> description allocation are alternative.
>>
>> The last user of MAY_HAVE_SPARSE_IRQ is sh/csky, but the sh use
>> SPARSE_IRQ, MAY_HAVE_SPARSE_IRQ could be kill. and for csky, it
>> uses statical allocation by default.
>>
>> So MAY_HAVE_SPARSE_IRQ seems to be useless, no need to maintain a
>> separate MAY_HAVE_SPARSE_IRQ config, kill it.
>>
>> Also cleanup the kernel/irq/Kconfig a little.
>>
>> v2:
>> - drop all the NR_IRQS suggested by Geert
>> - don' use SPARSE_IRQ for csky by default, suggested by Guo.
>>
>> Kefeng Wang (3):
>>    sh: Cleanup about SPARSE_IRQ
>>    csky: Kill MAY_HAVE_SPARSE_IRQ
>>    genirq: Cleanup Kconfig
> 
> Thanks for the update!
> 
> Tested on SH on landisk (real) and rts7751r2d (qemu), so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your test.
> 
> P.S. Please use the same version number in all patches of the series,
>       to avoid confusing tools like b4.
> 
> https://lore.kernel.org/all/20210929023522.57732-1-wangkefeng.wang@huawei.com/
> 2021-09-29  2:35 ` [PATCH v1 1/3] sh: Cleanup about SPARSE_IRQ Kefeng Wang
> 2021-09-29  2:35 ` [PATCH v2 2/3] csky: Kill MAY_HAVE_SPARSE_IRQ Kefeng Wang
> 2021-09-29  2:35 ` [PATCH v3 3/3] genirq: Cleanup Kconfig Kefeng Wang
>                            ^^
> 
Strange, maybe some unexpected change in my local dir... sorry for the 
confusing.

> Gr{oetje,eeting}s,
> 
>                          Geert
> 
