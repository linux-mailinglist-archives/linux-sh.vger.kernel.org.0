Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D08174963
	for <lists+linux-sh@lfdr.de>; Sat, 29 Feb 2020 21:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbgB2Uop (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 29 Feb 2020 15:44:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34265 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgB2Uop (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 29 Feb 2020 15:44:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id j16so6024019otl.1
        for <linux-sh@vger.kernel.org>; Sat, 29 Feb 2020 12:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rqrrnhnAhDxDR8DToJ03L+juASOs6Wy8PQ3rH1ycKSY=;
        b=TYpFojaFQdUqaHBll6wgyaBq0JuxhRQyFCiHl2aCihv5uMBc1KFDLDDeMczLWyt8tD
         qnLbcLplw+2WoNzbCgJnxTLzJUgibDfZbhT9vNbt0/enEuXTff8alC+u6o+URMJGyNJ6
         ou1NISRDvkqJtex7bh+3kcVgLSIao7pALFZD+un2PFXr3PJS3k+VeI1R+qVg2jI4wJXw
         L5hTOFFVEbsKWNM3uV0YKQ+t9u+eM/SZ1W/MR2NG+K24z72IjJI5pZ4CTLDqOY2K4PT1
         nii7SoL/cAdaHD/p50gusTVN3y7GcODdwr9wZ2TLWb8bhxiKX9kOGosaY8MhItMZJRCE
         nAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rqrrnhnAhDxDR8DToJ03L+juASOs6Wy8PQ3rH1ycKSY=;
        b=NuAJLUkHVS05d3epxXMSTVjPOhtlPfvTxQAiKEKRFDWYQgAIkEIp+J2NFDIKzueIeB
         wvfK8sa4HDF5YEdZNtQsklprXMMu5A9WHmLTo++GqgYr/eeuJ8Je955Q/o+w5CbWnMMm
         D71E3QLnBU+f3ir8nLY8fcjlEaCPHoulIatwg0HIXSRT2Pe14AyYspjdgVh6+wN7esqO
         fgAnMgW7az4TKEpeG5vaaM7DjaPJOyom4QjxUL8BPsue1GJgflnZaQBmuBUVed4K6qzp
         LngIufe+aHRraUV0TmkeiqPILTCvGJmcYqaqFik7YfpkOJ1vZsSrk2lqmP7xP8p/WPGj
         uB7Q==
X-Gm-Message-State: APjAAAUgr77+1E5GMPu25cP3RAWvjy+vjh5jVxXFnIngjWn3725l64JV
        QTKBQbs9AzN4SrSxlZz2mW37F5JUdZP9mhw5swfMYQ==
X-Google-Smtp-Source: APXvYqwuD7hXgqDuHa7bNKr2aGN5ZsRtxcfrMKKpE5k3aRoSjSLBCzEO28z30FjlnmPqDSMCgEWPc3EsieveZxFwGeE=
X-Received: by 2002:a05:6830:134c:: with SMTP id r12mr7849308otq.126.1583009084306;
 Sat, 29 Feb 2020 12:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-3-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-3-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 29 Feb 2020 12:44:29 -0800
Message-ID: <CAPcyv4hLvciwxSnsQRye9SuB-sy9fm+_6CwZSuHifkmbWQs-+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mm/memory_hotplug: Rename mhp_restrictions to mhp_params
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
> The mhp_restrictions struct really doesn't specify anything resembling
> a restriction anymore so rename it to be mhp_params as it is a list
> of extended parameters.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Tests ok, and looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
