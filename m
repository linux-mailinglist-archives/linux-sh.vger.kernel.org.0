Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C411A6EF7
	for <lists+linux-sh@lfdr.de>; Tue, 14 Apr 2020 00:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389494AbgDMWPb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 13 Apr 2020 18:15:31 -0400
Received: from ale.deltatee.com ([207.54.116.67]:38484 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727871AbgDMWPa (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 13 Apr 2020 18:15:30 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.92)
        (envelope-from <logang@deltatee.com>)
        id 1jO7MT-00087a-Vm; Mon, 13 Apr 2020 16:15:27 -0600
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200413161542.78700-1-linux@roeck-us.net>
 <20200414080807.78ac80d0@canb.auug.org.au>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ced5523f-c95c-1afb-4e38-788dd39d40cb@deltatee.com>
Date:   Mon, 13 Apr 2020 16:15:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200414080807.78ac80d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, dalias@libc.org, ysato@users.sourceforge.jp, linux@roeck-us.net, sfr@canb.auug.org.au
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH] sh: mm: Fix build error
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 2020-04-13 4:08 p.m., Stephen Rothwell wrote:
> I'll put this in my fixes tree until someone else picks it up.  Now
> that the patch has reached Linus' tree (and its SHA1 is stable), the
> Fixes line should be
> 
> Fixes: bfeb022f8fe4 ("mm/memory_hotplug: add pgprot_t to mhp_params")

Masahiroy already sent a fix for this that Andrew has picked up:

http://lkml.kernel.org/r/20200413014743.16353-1-masahiroy@kernel.org

Logan


