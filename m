Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D21124E4F
	for <lists+linux-sh@lfdr.de>; Wed, 18 Dec 2019 17:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfLRQtP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Dec 2019 11:49:15 -0500
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:51730 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfLRQtO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Dec 2019 11:49:14 -0500
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1ihcVR-0007gu-00; Wed, 18 Dec 2019 16:49:01 +0000
Date:   Wed, 18 Dec 2019 11:49:01 -0500
From:   Rich Felker <dalias@libc.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] y2038: sh: remove timeval/timespec usage from headers
Message-ID: <20191218164901.GN1666@brightrain.aerifal.cx>
References: <20191218164527.542823-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218164527.542823-1-arnd@arndb.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Dec 18, 2019 at 05:45:11PM +0100, Arnd Bergmann wrote:
> This header file escaped my earlier cleanups for removing
> the in-kernel usage of timeval and timespec structs.
> 
> Replace them with the corresponding __kernel_old_* types.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Rich Felker <dalias@libc.org>

> ---
>  arch/sh/include/uapi/asm/sockios.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
> index ef18a668456d..3da561453260 100644
> --- a/arch/sh/include/uapi/asm/sockios.h
> +++ b/arch/sh/include/uapi/asm/sockios.h
> @@ -10,7 +10,7 @@
>  #define SIOCSPGRP	_IOW('s', 8, pid_t)
>  #define SIOCGPGRP	_IOR('s', 9, pid_t)
>  
> -#define SIOCGSTAMP_OLD	_IOR('s', 100, struct timeval) /* Get stamp (timeval) */
> -#define SIOCGSTAMPNS_OLD _IOR('s', 101, struct timespec) /* Get stamp (timespec) */
> +#define SIOCGSTAMP_OLD	_IOR('s', 100, struct __kernel_old_timeval) /* Get stamp (timeval) */
> +#define SIOCGSTAMPNS_OLD _IOR('s', 101, struct __kernel_old_timespec) /* Get stamp (timespec) */
>  
>  #endif /* __ASM_SH_SOCKIOS_H */
> -- 
> 2.20.0
