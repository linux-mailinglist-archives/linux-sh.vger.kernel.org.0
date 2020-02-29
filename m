Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DD31749BA
	for <lists+linux-sh@lfdr.de>; Sat, 29 Feb 2020 23:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgB2WdU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 29 Feb 2020 17:33:20 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37013 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbgB2WdU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 29 Feb 2020 17:33:20 -0500
Received: by mail-oi1-f193.google.com with SMTP id 5so1039686oiy.4
        for <linux-sh@vger.kernel.org>; Sat, 29 Feb 2020 14:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+qFmqhcgb7jhEPbeVLEVdCHOr+If3XHxdqQ1tb+5pc=;
        b=MJlh0jh6fKGmlMf8QKHfSMGKxkzGHEeUxIKuMK576jnOzp5ajBbWFd723+Nwz5sX5o
         kd5kFB1Qa4nMK4C2Quz1EtosMFhbFGty2TrTrSeM0926YL1M9TjPuncmtlZef3BqKcKO
         0QMDkTU7/GfTsJIR/w5n5LoqIVS0h8Ha+vMH2bvx31vmcGio+VmcVwwkaawh8iuK3FDK
         B8oJ2LCRKfwY4UJPa+Ufg0yoRxTMpdzcD2JzNOx//OiTA4E21r9KhphDTjUvXXJpa4mN
         qph+2qengVBm0C0Rc0eQp7M69RV9q8SQixDZKId1V2L1G6rpoNj9Qc0++zW1EeGd/ZTO
         X0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+qFmqhcgb7jhEPbeVLEVdCHOr+If3XHxdqQ1tb+5pc=;
        b=cA1Xg5mXLRkpbYrECbP3hAeGhdV2dWRn5j/xg1KOKYviVrMyfqLjPPIqmisCHEnhnz
         Qj+BPOxm23iKAYOyVJp0zED1LWFKVKBaNSm8M/GDFhu6BzHQzgkgyOVe4U75q4iu2/pt
         +TzB/TrjEuFVz8Yu/Bf6wUqRw/h3Tj6P1mgEJcswxpLbFqYo5oK1IgyHYIzDv6TpCQc7
         ERfnk8IZvnh3uoVWteZelXlyC0YWYKZySt6mLsLPvz75fdNwsRn0PCkVqRJ5TaVg8uWs
         jub62bBnUHjxIDE/gNV78bUhAsFofIHJ2wqdzlE2HPO8X4UATdttvAWkcfbVGvhCeuxz
         PTSQ==
X-Gm-Message-State: APjAAAWzE1Po9mxQWxCdfe8LMiB81v9MYxFv20EJONiHctZ/bNn7Ei/A
        YyLc1PSbmStDtj4+1Yho432tc6XTjlEsqAM0xdmTfQ==
X-Google-Smtp-Source: APXvYqyGoDfozeCQcvGtfIbG5zusEz6FXIH1C19GvJgWOw0G4+LzaZgF0KV8DfFmkR6MhUJ7WBGfGAzVDBqWpHKu+yI=
X-Received: by 2002:a54:4791:: with SMTP id o17mr6946593oic.70.1583015599612;
 Sat, 29 Feb 2020 14:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-5-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-5-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 29 Feb 2020 14:33:08 -0800
Message-ID: <CAPcyv4j=bZ5KBPp6PbViERdDe+HZpV_W6qbSJupTNAzyfiK6xg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] x86/mm: Introduce _set_memory_prot()
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Badger <ebadger@gigaio.com>,
        "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> For use in the 32bit arch_add_memory() to set the pgprot type of the
> memory to add.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  arch/x86/include/asm/set_memory.h | 1 +
>  arch/x86/mm/pat/set_memory.c      | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
> index 64c3dce374e5..0aca959cf9a4 100644
> --- a/arch/x86/include/asm/set_memory.h
> +++ b/arch/x86/include/asm/set_memory.h
> @@ -34,6 +34,7 @@
>   * The caller is required to take care of these.
>   */
>
> +int _set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);

I wonder if this should be separated from the naming convention of the
other routines because this is only an internal helper for code paths
where the prot was established by an upper layer. For example, I
expect that the kernel does not want new usages to make the mistake of
calling:

   _set_memory_prot(..., pgprot_writecombine(pgprot))

...instead of

    _set_memory_wc()

I'm thinking just a double underscore rename (__set_memory_prot) and a
kerneldoc comment for that  pointing people to use the direct
_set_memory_<cachemode> helpers.

With that you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
