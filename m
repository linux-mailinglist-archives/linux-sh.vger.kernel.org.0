Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BFA87648
	for <lists+linux-sh@lfdr.de>; Fri,  9 Aug 2019 11:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406174AbfHIJfT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 9 Aug 2019 05:35:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38640 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405953AbfHIJfS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 9 Aug 2019 05:35:18 -0400
Received: by mail-lf1-f68.google.com with SMTP id h28so69002080lfj.5
        for <linux-sh@vger.kernel.org>; Fri, 09 Aug 2019 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZhZIKbPy1ojcvmbIo8mwd7oy4V33VIdwk5j1j74WW9w=;
        b=VcVeBlNEjS4wa/wbZ2Jy74bbWsbslezZzRDF5L5UlZPXuFgueVv76Apfbc48KCG7go
         O+JybRtPA55YOzc+rFrImDZn5Uzf4Iypjkw1Q2Jrzsy02VozkkgOmiMWFsyG/90IeJID
         s7g3Gev/hUXSaIrCTrM7IhGUouQ5uAYJrQU3W3SKx3qZhdrx3pME6i2VY+znRnPsMDZ6
         IqCV+5+rqLIKHOuF9OdviK0y/AZ3VputL3vLRILFoF8nj2+pSMBc+S3cQ85tH9TO2N3S
         m8AsLb+p6B1SXzPU1ej0Ppenwk9xbIlPPfP789O8926HVT26h04IVIjFQkPvwouSfOGR
         RQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZhZIKbPy1ojcvmbIo8mwd7oy4V33VIdwk5j1j74WW9w=;
        b=lgN+224NUEbExfLTpbf+Japnx9H+G3IGqModqUlsyc90yRwXLxyTu4PjRcsKBIjXgA
         KDOFTz00bo0T9Fm+dLBwgXRjiWSGhf4ZFRia6PPAf5aQJPtwlU6+qsRti+ogZYhJRdq1
         p3Rrkozv4gueRBJaHAJQ9wzK1+/T2QqpafhaMkIa53z/eUkAqzXR8vfczVYhyARlBSBC
         +oVIVsr9rdFudph63f6+v9Moyd4o3j083pMYIEYQF58jMnkQFbL9yPZGS0su1trFUIK2
         mUwNkI3eN0XajxgM+a8TL4rAKrtGuXdAHpfeWnMdwa3x+A/JfNSDUJQPfvUc159P0TsE
         epAQ==
X-Gm-Message-State: APjAAAVUiyMHp6IA5zpRIv1xvUiHk35aAgJPdJcdMWDGOWH4Ob/4ImfE
        ShtyBojWsWy70lOvkTmr6QJdlA==
X-Google-Smtp-Source: APXvYqzlq7k/M37b+stHUNm1aCq6nUomyYeuBENCXNdKlF0iST4RYWqRChfyDEB29cAPzX6iW+LIMA==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr12123067lfn.85.1565343316741;
        Fri, 09 Aug 2019 02:35:16 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44bf:fcca:cd2a:e5bf:7de5:cd? ([2a00:1fa0:44bf:fcca:cd2a:e5bf:7de5:cd])
        by smtp.gmail.com with ESMTPSA id t21sm19110864ljg.60.2019.08.09.02.35.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 02:35:15 -0700 (PDT)
Subject: Re: [PATCH 6/8] arm-nommu: call dma_mmap_from_dev_coherent directly
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Vladimir Murzin <vladimir.murzin@arm.com>,
        Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
References: <20190808160005.10325-1-hch@lst.de>
 <20190808160005.10325-7-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <247fabce-5284-8140-c492-fe49e1683ca6@cogentembedded.com>
Date:   Fri, 9 Aug 2019 12:35:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808160005.10325-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 08.08.2019 19:00, Christoph Hellwig wrote:

> Ther is no need to go through dma_common_mmap for the arm-nommu

    There. :-)

> dma mmap implementation as the only possible memory not handled above
> could be that from the per-device coherent pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
