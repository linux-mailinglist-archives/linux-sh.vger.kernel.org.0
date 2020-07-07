Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CF521786C
	for <lists+linux-sh@lfdr.de>; Tue,  7 Jul 2020 21:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgGGT6O (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Jul 2020 15:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgGGT6N (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 Jul 2020 15:58:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F8CC08C5E1
        for <linux-sh@vger.kernel.org>; Tue,  7 Jul 2020 12:58:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so3507755plr.2
        for <linux-sh@vger.kernel.org>; Tue, 07 Jul 2020 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VzRu+6RTYvmFttwhsiQLXCF6YnU1lg38nqV7v8N7whw=;
        b=POB0tDdCbNVqmVQZ6yua+ndmhJsgXFLarIJRrzZHpuDGP0B1FODyoxi9lUTM/pG0IL
         mE1dMIr/gsK64CjizChpcXywJYXY4Vfi25COfLptk3V+mFNHqoasjVtfubvV2ebCtl7a
         czRuA5AP473VLGgnEz34EgdAlV0QOt3H67RniAnOVC2+In0mdoC9rSRvmlMzUXfZVzt4
         xGEFUHBxADeMLVRzRAoW7/H0iSwTAcsqnlAtpK24wb/U0fEHrp7KMPF2hLocEXQ4+asp
         047TKx7zculMEGUVbpwgiExvH3ficDy6d/Wj01wsX8chenP63N6BpBBILOJ6KcW2NDnx
         OPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VzRu+6RTYvmFttwhsiQLXCF6YnU1lg38nqV7v8N7whw=;
        b=stgF44DAwViKueYYoY7D15n8B2b4EfwLyBGNb0zjRzNfYRiDspqHuPv9ufM9JtCxnv
         tbDYxOwlDQcPwpItbQDP3ICDIZh6h3RSOa+i34hI5IwXB8ffeBt3AmFOCX8O4Gh77pSY
         VHwFUb8x2Q2xdqZre2x5zKaGEm2+DHNPviPbc2gO21T1J/DjrZYp4IHXu3HUDZAABWQI
         Nz1ffFG8ZFw/xGtBkvui1D+Nv1kZ8CelKEn7aVAAoWNtFRTyZFpi6MIgErHJoFgLXRMX
         ecxQwxbU4Ey6FZuWI5wIOcetiwH1u+wkWj6AMOwf0DSc+ilO79HH7gmCmLuIGmcMsyNI
         Y33g==
X-Gm-Message-State: AOAM531d9OPaBhjpvnBH6wHUdQIx2Wtuw+H/UMYU1MOE5lbK9Ach1nzo
        0I9GrmwQW5PUaCGxiqHWN3z0CJa4/XkS+E94NhXOTw==
X-Google-Smtp-Source: ABdhPJwAgKOW6WJkomMyOukfnt4wP2/V35sf6mYJAhQLNyaosM4LY2uIUq7rKvvPZg70NVApdINfIkTmb6+bTRJLXD0=
X-Received: by 2002:a17:90b:1296:: with SMTP id fw22mr6086502pjb.20.1594151892296;
 Tue, 07 Jul 2020 12:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200707092117.963394-1-masahiroy@kernel.org>
In-Reply-To: <20200707092117.963394-1-masahiroy@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 7 Jul 2020 12:58:01 -0700
Message-ID: <CAFd5g46eCjZA-e4akYc1K8u29tp94gpmrAOxZ_joZ=9kJtZeuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: introduce ccflags-remove-y and asflags-remove-y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "David S. Miller" <davem@davemloft.net>,
        Haren Myneni <haren@us.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>, Jiri Kosina <jikos@kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Miroslav Benes <mbenes@suse.cz>,
        Paul Mackerras <paulus@samba.org>,
        Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Tal Gilboa <talgi@mellanox.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-crypto@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-sh@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Jul 7, 2020 at 2:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> CFLAGS_REMOVE_<file>.o filters out flags when compiling a particular
> object, but there is no convenient way to do that for every object in
> a directory.
>
> Add ccflags-remove-y and asflags-remove-y to make it easily.
>
> Use ccflags-remove-y to clean up some Makefiles.
>
> The add/remove order works as follows:
>
>  [1] KBUILD_CFLAGS specifies compiler flags used globally
>
>  [2] ccflags-y adds compiler flags for all objects in the
>      current Makefile
>
>  [3] ccflags-remove-y removes compiler flags for all objects in the
>      current Makefile (New feature)
>
>  [4] CFLAGS_<file> adds compiler flags per file.
>
>  [5] CFLAGS_REMOVE_<file> removes compiler flags per file.
>
> Having [3] before [4] allows us to remove flags from most (but not all)
> objects in the current Makefile.
>
> For example, kernel/trace/Makefile removes $(CC_FLAGS_FTRACE)
> from all objects in the directory, then adds it back to
> trace_selftest_dynamic.o and CFLAGS_trace_kprobe_selftest.o
>
> Please note ccflags-remove-y has no effect to the sub-directories.
> In contrast, the previous notation got rid of compiler flags also from
> all the sub-directories.
>
>   arch/arm/boot/compressed/
>   arch/powerpc/xmon/
>   arch/sh/
>   kernel/trace/
>
> ... have no sub-directories.
>
>   lib/
>
> ... has several sub-directories.
>
> To keep the behavior, I added ccflags-remove-y to all Makefiles
> in subdirectories of lib/, except:
>
>   lib/vdso/Makefile        - Kbuild does not descend into this Makefile
>   lib/raid/test/Makefile   - This is not used for the kernel build
>
> I think commit 2464a609ded0 ("ftrace: do not trace library functions")
> excluded too much. In later commit, I will try to remove ccflags-remove-y
> from sub-directory Makefiles.
>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Acked-by: Brendan Higgins <brendanhiggins@google.com> (KUnit)
