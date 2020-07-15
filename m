Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30DA2202CA
	for <lists+linux-sh@lfdr.de>; Wed, 15 Jul 2020 05:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgGODMN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 14 Jul 2020 23:12:13 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:60894 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgGODMN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 14 Jul 2020 23:12:13 -0400
Date:   Tue, 14 Jul 2020 23:12:11 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ioremap and dma cleanups and fixes for superh (2nd resend)
Message-ID: <20200715031210.GD14669@brightrain.aerifal.cx>
References: <20200714121856.955680-1-hch@lst.de>
 <b0745e43-0ff1-58f7-70d5-60b9c8b8d81b@physik.fu-berlin.de>
 <20200714155914.GA24404@brightrain.aerifal.cx>
 <8cbf2963-d0e4-0ca8-4ffe-c2057694447f@physik.fu-berlin.de>
 <011f29e6-ad71-366e-dbff-bc8471f3da60@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011f29e6-ad71-366e-dbff-bc8471f3da60@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 15, 2020 at 01:12:33AM +0200, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> I have applied Christoph's full series on top of Linus' tree and I can confirm that
> the kernel boots fine on my SH-7785LCR board.
> 
> Thus, for the whole series of patches:
> 
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> However, independent of Christoph's series, the kernels throws two backtraces during
> boot which I think should require a git bisect (unless I missed a configuration option
> as I trimmed down the kernel a bit to make sure it's not too big).
> 
> See the traces below and let me know what you think.

I've got a slightly earlier version (my for-next) built for qemu r2d
board, and don't get any such messages. Do you have a lock-debugging
option enabled that's catching a problem, perhaps?

Rich
