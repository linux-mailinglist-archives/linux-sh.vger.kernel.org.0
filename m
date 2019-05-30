Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBCD32FE2D
	for <lists+linux-sh@lfdr.de>; Thu, 30 May 2019 16:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE3OnQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 30 May 2019 10:43:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45830 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfE3OnP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 30 May 2019 10:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rgEoTv+ob3nuU0s1PzvAuS7/7JlQcVGSqkG2dHU05po=; b=fwQIgc/fkWXGK3UVvCSHkPNJy
        PDMw24C005vjS+rBEMLkWWHMb8/n5G5c4z7SOgvzYLDesczvTnSWIH9VMcmLmuhrOfaHFs19wJ5/r
        ViAyGkDpWs6UUr5G0T30QH8zCjlQEgl3pzo+jfMOQcj2mRHFY0wNDAVYs/eOxWuvpfwrls+XTJvvh
        F9onf0NqibALS9NgZYhCS9UvDz380yzI2zIVtEv144yfuymb+idvVL5HxXI25VIPhmMNe6tMI02Px
        AMr74BHFPY9bFN/g5Uu4jBP5Ww+YlEcFrvUJ8t/WQAqe26NTYendgBCqJddsbQInxkaxUeRWL4akL
        8K28/dX4w==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWMGw-0007Cm-2t; Thu, 30 May 2019 14:43:14 +0000
Subject: Re: [linux-stable-rc:linux-5.0.y 1434/2350]
 arch/sh/kernel/cpu/sh2/clock-sh7619.o:undefined reference to
 `followparent_recalc'
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Sasha Levin (Microsoft)" <sashal@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
References: <201905301509.9Hu4aGF1%lkp@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <92c0e331-9910-82e9-86de-67f593ef4e5d@infradead.org>
Date:   Thu, 30 May 2019 07:43:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201905301509.9Hu4aGF1%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 5/30/19 12:31 AM, kbuild test robot wrote:
> Hi Randy,
> 
> It's probably a bug fix that unveils the link errors.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> head:   8c963c3dcbdec7b2a1fd90044f23bc8124848381
> commit: b174065805b55300d9d4e6ae6865c7b0838cc0f4 [1434/2350] sh: fix multiple function definition build errors
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout b174065805b55300d9d4e6ae6865c7b0838cc0f4
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sh 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/sh/kernel/cpu/sh2/clock-sh7619.o:(.data+0x1c): undefined reference to `followparent_recalc'
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


The maintainer posted a patch for this but AFAIK it is not merged anywhere.

https://marc.info/?l=linux-sh&m=155585522728632&w=2


-- 
~Randy
