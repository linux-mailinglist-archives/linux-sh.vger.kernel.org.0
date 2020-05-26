Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7107E1A690D
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2020 17:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730638AbgDMPnk (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 13 Apr 2020 11:43:40 -0400
Received: from ale.deltatee.com ([207.54.116.67]:34168 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728597AbgDMPnj (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 13 Apr 2020 11:43:39 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.92)
        (envelope-from <logang@deltatee.com>)
        id 1jO1F5-0000dG-VC; Mon, 13 Apr 2020 09:43:24 -0600
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20200413014743.16353-1-masahiroy@kernel.org>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ef8addd0-81bb-249f-7d8f-dfa7fc032085@deltatee.com>
Date:   Mon, 13 Apr 2020 09:43:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200413014743.16353-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: tglx@linutronix.de, osalvador@suse.de, rppt@linux.ibm.com, mhocko@suse.com, david@redhat.com, dan.j.williams@intel.com, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, dalias@libc.org, ysato@users.sourceforge.jp, akpm@linux-foundation.org, masahiroy@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH] sh: fix build error in mm/init.c
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 2020-04-12 7:47 p.m., Masahiro Yamada wrote:
> The closing parenthesis is missing.
> 
> Fixes: bfeb022f8fe4 ("mm/memory_hotplug: add pgprot_t to mhp_params")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Oh, oops, I thought I compile checked all the arches. Must have been a
last minute change. I'm also surprised the kbuild robot didn't catch this.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Andrew, can this be squashed into the existing patch?

Thanks,

Logan
