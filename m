Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8619A17417F
	for <lists+linux-sh@lfdr.de>; Fri, 28 Feb 2020 22:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgB1VbR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 28 Feb 2020 16:31:17 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46780 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgB1VbQ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 28 Feb 2020 16:31:16 -0500
Received: by mail-ot1-f66.google.com with SMTP id g96so3923641otb.13
        for <linux-sh@vger.kernel.org>; Fri, 28 Feb 2020 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E57qmAYxRULljTteoL9BnNM233t9xRFNSPdb4qSFmz4=;
        b=FOSXg/gDLnMTvsFKrROzrWHQkymULqZ4VWWSzkxbCpGWafrvoL1DbhvWHkNA1awmFJ
         mqZ4yc3Xu7lUtGU0lnzzTMrQrhjDoBb0aAi0O834VNv0Xx2wr1FRPluT436M+3L6Uu3P
         OeEfO9GHrkLM+a5+P9XzccUiCN5lVGpuO1RMFe6qheaZSXTBuWXwalcRrw3HRO/r9ITu
         dbpQvHayrSz63xS3XZJvxFAo9ni5zPDlHcVTL49HtS1LUdDaUyRpVgHEgZqSQiaYscIw
         1HyAUUJ1ehUcyfKMFiPZLd4BrozyOvRYXTSs34KN1qjk4Mke8taeKrGC90q2MJWKZrKw
         q4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E57qmAYxRULljTteoL9BnNM233t9xRFNSPdb4qSFmz4=;
        b=Vldh8Dnz08/d0vF7QMWlVajUp7zZPocsjcSDmGK+RULopkAJw2X3pTK7NYW7UNDRRg
         M0EjEbC4eWaxANLU9cCDs24oGgCkieyo1Wruqna8WHB69SrYtKV3RQwJUXF5gF6ItNbl
         C3JQkuHhWp1gqYLsq0bcTeKWblU3rtkRFSyZlWH+v19mxT++tHbWOXmm+zetZyTh4szq
         M87yViXwetn5mcJjucyNydcv09u2y00jEKgfZ6vEso36EPoi1SgbB2aOOcbnrtlNbkYP
         xwNUnP2+F+6kua4W/f/4NSblRanIKkN3PJB03ZfOXdG9mQp87SwZq43bmqVKSdsRhauo
         ebdQ==
X-Gm-Message-State: APjAAAUeAIkPnyUffRqMvAX6ggb1XKRylr3dVYimQnWccYc6DApovh7V
        gLfm0eOLMheMPGyams0W6PaRmoSH5iW4Pz2tZ85GZA==
X-Google-Smtp-Source: APXvYqw3lx5wUMOoXp5Dz6+9E6dRQ6P4Q87wBR0C2ISCuvp93d5At8nQ1nTZ6ODRu1fC1blNWg8tMcQbt7eE8AgCHRU=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr4607004otl.71.1582925476085;
 Fri, 28 Feb 2020 13:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-2-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-2-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 28 Feb 2020 13:31:05 -0800
Message-ID: <CAPcyv4gFiCBN_Bz5eZrWXV0PEaWhwdHDkgEW7e5z0xZkp6a83w@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mm/memory_hotplug: Drop the flags field from
 struct mhp_restrictions
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
        Eric Badger <ebadger@gigaio.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> This variable is not used anywhere and should therefore be removed
> from the structure.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
