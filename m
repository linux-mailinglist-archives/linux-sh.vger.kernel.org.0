Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEB0594B8
	for <lists+linux-sh@lfdr.de>; Fri, 28 Jun 2019 09:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfF1HVx (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Jun 2019 03:21:53 -0400
Received: from verein.lst.de ([213.95.11.210]:45847 "EHLO newverein.lst.de"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726574AbfF1HVw (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 28 Jun 2019 03:21:52 -0400
X-Greylist: delayed 533 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 03:21:52 EDT
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 71D4B68D04; Fri, 28 Jun 2019 09:12:57 +0200 (CEST)
Date:   Fri, 28 Jun 2019 09:12:57 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] sh: clkfwk: don't pass void pointers to ioread*
Message-ID: <20190628071257.GA28615@lst.de>
References: <20190628062524.5436-1-hch@lst.de> <CAMuHMdVpvu+xzfh3Qee-Yz2H3YDc6CVUocKTwLTUG8gUOQPeGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpvu+xzfh3Qee-Yz2H3YDc6CVUocKTwLTUG8gUOQPeGA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Jun 28, 2019 at 09:01:40AM +0200, Geert Uytterhoeven wrote:
> This is due to include/asm-generic/io.h and include/asm-generic/iomap.h
> using different prototypes, right?
> 
> include/asm-generic/io.h:static inline u8 ioread8(const volatile void
> __iomem *addr)
> include/asm-generic/io.h:static inline u16 ioread16(const volatile
> void __iomem *addr)
> include/asm-generic/io.h:static inline u32 ioread32(const volatile
> void __iomem *addr)
> include/asm-generic/io.h:static inline u64 ioread64(const volatile
> void __iomem *addr)
> 
> include/asm-generic/iomap.h:extern unsigned int ioread8(void __iomem *);
> include/asm-generic/iomap.h:extern unsigned int ioread16(void __iomem *);
> include/asm-generic/iomap.h:extern unsigned int ioread32(void __iomem *);
> include/asm-generic/iomap.h:extern u64 ioread64(void __iomem *);
> 
> Wouldn't it be better to fix include/asm-generic/iomap.h and lib/iomap.c
> instead?

Oh, I didn't even notice we had this declared by different files..
