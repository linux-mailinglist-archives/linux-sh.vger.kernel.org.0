Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CC2193763
	for <lists+linux-sh@lfdr.de>; Thu, 26 Mar 2020 05:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgCZE4P (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 26 Mar 2020 00:56:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39004 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgCZE4O (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 26 Mar 2020 00:56:14 -0400
Received: by mail-oi1-f196.google.com with SMTP id d63so4421502oig.6
        for <linux-sh@vger.kernel.org>; Wed, 25 Mar 2020 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ekhD7YBIqYoJnoTElsHBd66DXbs0pEJHCUsKBQOoMM=;
        b=evXv8To+MdxO3Bz10HNk1jGd8+DvPblMbieBbdnZW+u4a/GE7NqcI4TgLHXbaY2Pky
         d+VIct9FZm0fKDC6DGlhHcOkrBooHxhgSacrbhmkgVr0QB1FHwFndwT9DuTCY0AGyB86
         nF7wm9HzKC6nSzaarOdke8Oj0rBADqi0t6R2WZcL1Q0WPcgjpnZcHWVXcTCECkhDdf9t
         N02TEhvGZRpZxFWyoTkXjhLBD114LSorDFDz1S1ad9T2VelKk1ii0A/sGjESc/W2M384
         oVvqDoTpFLi1hiNTXlSp5xz6Ic3s+spAZVqOqBrkJ1fm6tacEVTwNcBNqTMqIfl3XsMh
         5pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ekhD7YBIqYoJnoTElsHBd66DXbs0pEJHCUsKBQOoMM=;
        b=qpPsASSvaqTIPJtYkY0el18YlgTQPY0bgt+gswo1cXQmCMXoHcvBhqXyq8MC/gyU/S
         zfFFcb1Zp1I7rmAC0D9nO36b/RKWT7nLjXJNXSVc8706fu03OURl4m1OP5I8e5eX9Mb1
         pvJ3j5lLBfa/eYgH4no+lyNO4PUdFnIxoWbO/76H9S5X3MNmWVzyoo9T3+YlD01NZqsS
         Q3mBL8Pz2iurx2v4mhoHAdMxgxnPgFBik4LYDLRHhaB+xmzgg7F4L/Fqg9bfQaYLQJye
         8rNHx/Ey6hyEU/LRQ4Xp21on/SIAmL0Ec6WfNbJ2/f/W80iSayDOlWhvyD0Vj9DgXqHj
         ZU4A==
X-Gm-Message-State: ANhLgQ2iZg2cttrPvNjJtNmTvAdAiaIvmD034byxlurdGSkh4oHxH3Wa
        QNXege3espdRgmoCkshKGuL8gQ==
X-Google-Smtp-Source: ADFU+vtYbSoRZfncSUiPuGsX8pzVTKrkGgl5xYge8Nnlv2/Xg+iXtGWvuLDqlCADeMigsRXkKCS2Fw==
X-Received: by 2002:aca:2806:: with SMTP id 6mr644861oix.135.1585198572585;
        Wed, 25 Mar 2020 21:56:12 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id 33sm368379otn.50.2020.03.25.21.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 21:56:12 -0700 (PDT)
Subject: Re: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
To:     Romain Naour <romain.naour@gmail.com>, linux-sh@vger.kernel.org
Cc:     Alan Modra <amodra@gmail.com>
References: <20200315175108.9694-1-romain.naour@gmail.com>
 <20200315175108.9694-2-romain.naour@gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <6dca8a3e-65a3-78b8-a56f-976cecface58@landley.net>
Date:   Thu, 26 Mar 2020 00:01:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200315175108.9694-2-romain.naour@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 3/15/20 12:51 PM, Romain Naour wrote:
> Since the patch [1], building the kernel using a toolchain built with
> Binutils 2.33.1 prevent booting a sh4 system under Qemu.
> Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Alan Modra <amodra@gmail.com>
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
> 

This patch and the previous one:

Tested-by: Rob Landley <rob@landley.net>

Worked for me with a current musl-cross-make toolchain.

It would be nice if we could get this into 5.6.

Rob
