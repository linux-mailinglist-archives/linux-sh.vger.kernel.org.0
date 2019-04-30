Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7169C100C2
	for <lists+linux-sh@lfdr.de>; Tue, 30 Apr 2019 22:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfD3U0N (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 30 Apr 2019 16:26:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45766 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfD3U0N (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 30 Apr 2019 16:26:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id e24so7612197pfi.12
        for <linux-sh@vger.kernel.org>; Tue, 30 Apr 2019 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+QG7LUyac8Bk0JT7xv5jYSfFqXif4TjSSyRo6jcCpuw=;
        b=nzo+Vhm73rkoNWUFmlVDo1zweAJCGmAR9ilVc9ahK9Wuq6QgGHOioiTeHHcR2sQyn0
         7H/2ArTXJ5Y2CR0+clAyx7fmXbOyyNddeDBFcxBj9Qs6vhkDao2OtTKBlMr9wRl+X+4L
         c5CBykbEjqxCY1a+eBZFPOQPPfR5PNbPykDcAZ/gv1blmYUApRUq+y8ZIbsGNLTb/upW
         +qYC9nasI7fMP37fu7szb/nftT+5/UoK7MsaVskVzDU8KqsLwA0/+LD4LmvuJMcCeRiu
         DOb2b0Q74qm2tQrV03ckh3Qtr4a3N5V0fFGkyZELOXLSRIDlIGkStOsxq0aUZa26b7gz
         aT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QG7LUyac8Bk0JT7xv5jYSfFqXif4TjSSyRo6jcCpuw=;
        b=irdkxh9938XLfmgY+47gXBSfzMN4ResGs/3fUYTtXaHs6sx+PKHzgxuAgwzZBYoZMA
         FJK75XWqU7kmXSZf3m/DpPdBO+yfZnXbL4Pje7pInmDkreAfmJtPkBb8TPSYFSf8sy55
         ZtHDb+Xyg5jTHfVBQ8orQ6bxBdPEUcgNbikA1rEREd3VswakIYVhD7XPmfEhmuF0wy2P
         WFyHbGXvJ3v5cJf/tSAJ/CsfpFumWQ6fgmYPSs1Sb1XB4r407f1eUwvzUmOg4yxWwb3b
         3nU2fjrt7VGSvw/fejHZb7LMcK/n1YtbPCjKRkS9KrbPFA839RxEKiUO27+DIJg/ms2R
         dO5g==
X-Gm-Message-State: APjAAAXvTgpSmMNyWAQ7YOuvsoLBZhNRIjzccETgq/tFTq7N/juxC0mv
        8BHsGqQJkrHyCA81gQwfEjpWNGSr2BY+cx37yRR4tQ==
X-Google-Smtp-Source: APXvYqyJtPQTiEhwUKZhUtYuou5KRhD+Exc7BXDNdAdOazvRoiC6+bVuH4IuQx6RxOj/AdkmQO+Q+CNNlrJ/0ikXdnE=
X-Received: by 2002:aa7:8096:: with SMTP id v22mr73372500pff.94.1556655971995;
 Tue, 30 Apr 2019 13:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASLBQ=w9YFBD80s7dit1bd_Tr+ggVyRNms0jf1pR9k=ZA@mail.gmail.com>
 <20190424180223.253025-1-ndesaulniers@google.com>
In-Reply-To: <20190424180223.253025-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 30 Apr 2019 13:26:00 -0700
Message-ID: <CAKwvOd=5SVBFsfEgYc9Dpgr--h+pQgCwOnpAjg9B4HG2VY6kFg@mail.gmail.com>
Subject: Re: [PATCH v2] sh: vsyscall: drop unnecessary cc-ldoption
To:     Yoshinori Sato <ysato@users.sourceforge.jp>, dalias@libc.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Lutomirski <luto@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-sh@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Apr 24, 2019 at 11:02 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Towards the goal of removing cc-ldoption, it seems that --hash-style=
> was added to binutils 2.17.50.0.2 in 2006. The minimal required version
> of binutils for the kernel according to
> Documentation/process/changes.rst is 2.20.
>
> Link: https://gcc.gnu.org/ml/gcc/2007-01/msg01141.html
> Cc: clang-built-linux@googlegroups.com
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * update commit subject and message as per Masahiro/Geert.
>
> To Geert's question about minimum binutils versions; no change needed to
> binutils.
>
>
>  arch/sh/kernel/vsyscall/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/sh/kernel/vsyscall/Makefile b/arch/sh/kernel/vsyscall/Makefile
> index 5db6579bc44c..6e8664448048 100644
> --- a/arch/sh/kernel/vsyscall/Makefile
> +++ b/arch/sh/kernel/vsyscall/Makefile
> @@ -15,8 +15,7 @@ quiet_cmd_syscall = SYSCALL $@
>
>  export CPPFLAGS_vsyscall.lds += -P -C -Ush
>
> -vsyscall-flags = -shared -s -Wl,-soname=linux-gate.so.1 \
> -               $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
> +vsyscall-flags = -shared -s -Wl,-soname=linux-gate.so.1 -Wl,--hash-style=sysv
>
>  SYSCFLAGS_vsyscall-trapa.so    = $(vsyscall-flags)
>
> --
> 2.21.0.593.g511ec345e18-goog
>

bumping for review
-- 
Thanks,
~Nick Desaulniers
