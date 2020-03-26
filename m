Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFB01949A7
	for <lists+linux-sh@lfdr.de>; Thu, 26 Mar 2020 21:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCZU5n (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 26 Mar 2020 16:57:43 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:57608 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCZU5n (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 26 Mar 2020 16:57:43 -0400
Date:   Thu, 26 Mar 2020 16:42:40 -0400
From:   Rich Felker <dalias@libc.org>
To:     Romain Naour <romain.naour@gmail.com>
Cc:     linux-sh@vger.kernel.org, Alan Modra <amodra@gmail.com>
Subject: Re: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
Message-ID: <20200326204240.GF11469@brightrain.aerifal.cx>
References: <20200315175108.9694-1-romain.naour@gmail.com>
 <20200315175108.9694-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315175108.9694-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Mar 15, 2020 at 06:51:08PM +0100, Romain Naour wrote:
> Since the patch [1], building the kernel using a toolchain built with
> Binutils 2.33.1 prevent booting a sh4 system under Qemu.
> Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Alan Modra <amodra@gmail.com>

Acked-by: Rich Felker <dalias@libc.org>

> ---
>  include/asm-generic/vmlinux.lds.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index e00f41aa8ec4..d46d34b58c96 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -374,6 +374,7 @@
>   */
>  #ifndef RO_AFTER_INIT_DATA
>  #define RO_AFTER_INIT_DATA						\
> +	. = ALIGN(8);							\
>  	__start_ro_after_init = .;					\
>  	*(.data..ro_after_init)						\
>  	JUMP_TABLE_DATA							\
> -- 
> 2.24.1
