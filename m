Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DEF1949A3
	for <lists+linux-sh@lfdr.de>; Thu, 26 Mar 2020 21:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgCZU53 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 26 Mar 2020 16:57:29 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:57606 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCZU53 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 26 Mar 2020 16:57:29 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Mar 2020 16:57:29 EDT
Date:   Thu, 26 Mar 2020 16:42:26 -0400
From:   Rich Felker <dalias@libc.org>
To:     Romain Naour <romain.naour@gmail.com>
Cc:     linux-sh@vger.kernel.org, Alan Modra <amodra@gmail.com>
Subject: Re: [PATCH 1/2] arch/sh: vmlinux.scr
Message-ID: <20200326204226.GE11469@brightrain.aerifal.cx>
References: <20200315175108.9694-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315175108.9694-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Mar 15, 2020 at 06:51:07PM +0100, Romain Naour wrote:
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
>  arch/sh/boot/compressed/vmlinux.scr | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
> index 862d74808236..dd292b4b9082 100644
> --- a/arch/sh/boot/compressed/vmlinux.scr
> +++ b/arch/sh/boot/compressed/vmlinux.scr
> @@ -1,6 +1,6 @@
>  SECTIONS
>  {
> -  .rodata..compressed : {
> +  .rodata..compressed : ALIGN(8) {
>  	input_len = .;
>  	LONG(input_data_end - input_data) input_data = .;
>  	*(.data)
> -- 
> 2.24.1
