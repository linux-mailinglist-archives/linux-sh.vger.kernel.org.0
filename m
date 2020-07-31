Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718D323487C
	for <lists+linux-sh@lfdr.de>; Fri, 31 Jul 2020 17:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbgGaP3N (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 31 Jul 2020 11:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387575AbgGaP3L (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 31 Jul 2020 11:29:11 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B947C06174A
        for <linux-sh@vger.kernel.org>; Fri, 31 Jul 2020 08:29:11 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id q4so19412469edv.13
        for <linux-sh@vger.kernel.org>; Fri, 31 Jul 2020 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3k2Qozw9K7T3ULHctZF2uRyGbKqkev5Yvd3i8BwLL6Q=;
        b=rU/7m59TNeq5RpPtiUF/ooEfv7y67ob0BFihzDNxqzyOmEpsLDWpdRWM7a1Ta8diX9
         7/KmEpDzjGcJg/Pwvj5CJyOTsZLukJCMCLa8+AoMszs4qJ2ovqLeTB8tvugBUABNICT+
         eDx8T4FKQBB7a3AF6wXJM4aILfpBArYOrJuEN4lkQy4uwl9e0jQGD8SXyeGbMZNORy2L
         yAShufuKVBs3/3TERLOxaa0ePPEogNjB9YElAimeP98Z0X7DEawjgep2fVgs0yc7Su75
         36fuiJkQisHXPKWkagRGrmyt7j/f6VdTzQ17F84MaIPjL3U9bAoqmxQ5O1LyXMSuNHUw
         J1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3k2Qozw9K7T3ULHctZF2uRyGbKqkev5Yvd3i8BwLL6Q=;
        b=Zw43eiBQZ32caj7lXvXkMHFsFOX+6SG+LZPA2e5mBLroDR1YvH7IZy7nTvTdzv4AUo
         NXI+0dZRkYeQmU0J5fNHnAhMPGonAS0WFYmwNn4/UtQVCJqbbA6VzDLKBo1DeSRDL14c
         IZxk7are3UrTM3Q0DBPBbx8eruSp5G7KW3V1FU6jy7dPjADk9etjwsxZBh4CxWbUs6HF
         VUYWq1KLRdjztZUWrw26uAJcbnWW6FHQ2LFNG4JHXqFnGTU0WfkyusKP8fHsMXIzQF/O
         DKYflr23+Swrc7/W+iY3ZNP+Y1LGOqWmft3uR7vXrRTbCt9fotxtRlXQIhxJ4oh6y1zg
         b5fA==
X-Gm-Message-State: AOAM530mFJ68i5akQh6LtMYALymT5O4K7Y1emvZmdFKMd7UsXanmm7jy
        U52n4+9AjziirtHP54PIsPRacMEjh4oSsXKa1tiM3w==
X-Google-Smtp-Source: ABdhPJz0P/lPp3nduBpCI463CmMAzDxLqlASXNACZIK8CQVQjVPCG9CcO/+9HjqSM/KyFs+VY+csHhR3WhxQTYkaNqE=
X-Received: by 2002:a50:d51e:: with SMTP id u30mr2058575edi.296.1596209349842;
 Fri, 31 Jul 2020 08:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200709020629.91671-1-justin.he@arm.com>
In-Reply-To: <20200709020629.91671-1-justin.he@arm.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 31 Jul 2020 08:28:58 -0700
Message-ID: <CAPcyv4iqkuzyU_u+VW1nsaK7tiy+HJtUxLtgAxtfX0aXXcKhfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Fix and enable pmem as RAM device on arm64
To:     Jia He <justin.he@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        David Hildenbrand <david@redhat.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Jul 8, 2020 at 7:06 PM Jia He <justin.he@arm.com> wrote:
>
> This fixies a few issues when I tried to enable pmem as RAM device on arm64.

What NVDIMM bus driver is being used in this case? The ACPI NFIT
driver? I'm just looking to see if currently deployed
phys_to_target_node() is sufficient, or if this is coming in a new
driver?
