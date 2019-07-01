Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA804501E
	for <lists+linux-sh@lfdr.de>; Fri, 14 Jun 2019 01:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfFMXiK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 13 Jun 2019 19:38:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726177AbfFMXiK (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 13 Jun 2019 19:38:10 -0400
Received: from [10.44.0.22] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32C802133D;
        Thu, 13 Jun 2019 23:38:08 +0000 (UTC)
Subject: Re: binfmt_flat cleanups and RISC-V support v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
References: <20190613070903.17214-1-hch@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <9a7c0892-21f3-23fb-590d-011d66f97320@linux-m68k.org>
Date:   Fri, 14 Jun 2019 09:38:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Christoph,

On 13/6/19 5:08 pm, Christoph Hellwig wrote:
> below is a larger stash of cleanups for the binfmt_misc code,
> preparing for the last patch that now trivially adds RISC-V
> support, which will be used for the RISC-V nommu series I am
> about to post.
> 
> Changes since v2:
>   - fix the handling of old format flags
>   - don't pass arguments on stack for RISC-V
>   - small cleanups for flat_v2_reloc_t

Thanks for doing this work. Tested and works for me on
m68k/Coldfire too.

I have pushed these onto the for-next branch of the
m68knommu git tree.

Regards
Greg


