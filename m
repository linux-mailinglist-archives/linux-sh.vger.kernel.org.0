Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B97201B26
	for <lists+linux-sh@lfdr.de>; Fri, 19 Jun 2020 21:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733142AbgFSTWQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 19 Jun 2020 15:22:16 -0400
Received: from ms.lwn.net ([45.79.88.28]:55252 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733159AbgFSTWN (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 19 Jun 2020 15:22:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5FFFB23B;
        Fri, 19 Jun 2020 19:22:12 +0000 (UTC)
Date:   Fri, 19 Jun 2020 13:22:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>, Christoph Hellwig <hch@lst.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: remove SH-5 index entries
Message-ID: <20200619132211.0d2b19db@lwn.net>
In-Reply-To: <71e1f336-ef5c-f5e9-25cf-16bd4439b9f9@infradead.org>
References: <71e1f336-ef5c-f5e9-25cf-16bd4439b9f9@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, 14 Jun 2020 19:59:07 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Remove SH-5 documentation index entries following the removal
> of SH-5 source code.
> 
> Error: Cannot open file ../arch/sh/mm/tlb-sh5.c
> Error: Cannot open file ../arch/sh/mm/tlb-sh5.c
> Error: Cannot open file ../arch/sh/include/asm/tlb_64.h
> Error: Cannot open file ../arch/sh/include/asm/tlb_64.h
> 
> Fixes: 3b69e8b45711 ("Merge tag 'sh-for-5.8' of git://git.libc.org/linux-sh")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: ysato@users.sourceforge.jp
> Cc: linux-sh@vger.kernel.org
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> ---
>  Documentation/sh/index.rst |   12 ------------
>  1 file changed, 12 deletions(-)

Applied, thanks.

jon
