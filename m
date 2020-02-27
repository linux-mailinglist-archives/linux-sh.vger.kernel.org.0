Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CB8172543
	for <lists+linux-sh@lfdr.de>; Thu, 27 Feb 2020 18:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgB0RnN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 27 Feb 2020 12:43:13 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36651 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgB0RnM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 27 Feb 2020 12:43:12 -0500
Received: by mail-qk1-f195.google.com with SMTP id f3so181063qkh.3
        for <linux-sh@vger.kernel.org>; Thu, 27 Feb 2020 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oCjJQPxZpDAddCTP2fyq9zy2cQ1xSVL89kL40WfyDFw=;
        b=h0ccKzeyP3flPLgjKffvX6NEZ8a/uwNV100LizRKN14n3zedm2cahPgJEhxnAi/Eux
         SoJyZIMb4T7nlpMiSIVzl4rMs2X4TuO582QZ1v3uBlvSIJKL/2eHq1X0Q3RguRMqGiyD
         jIHlP2hMNaMnlwbC+BJKvF6YRP2s83wQLQnu6HWuvl9gBkHIXEKgRfF2bx2kqxfLtaoi
         NHPp/iB678wthxbg1SayDlPMTRa2+OyRd0c8slMZFoj0NWbnumSUHITUyCw6JAjfKy0s
         /ZPnh7hQIi+kffDRK1XYwUv4XEf8RRXfY3Aofqotene7stHVy6OiSQWIReq879CDmrtM
         2sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oCjJQPxZpDAddCTP2fyq9zy2cQ1xSVL89kL40WfyDFw=;
        b=JLChrvXDM/miUI9wRFvnae7DblpiHu6f3US/Bu/XUT1DU/Xe5b+19RuntpOuc3HcYa
         bNWF33e61RWSQmVWnXLgqkI+zFQyF322K5MaXW7qSYHvmfIROjQ7PNuf7P3ZGzFq2bpT
         WIw+0gVdEUKS5B1I8mGCjuoGO0gl/m1qCetbzzA8pZWFbwS3aeWQSH4907nNfE2WI2wA
         9KCrF6roioNrggvUeTpjBAXADyxdmRqMO0O8XbQU0nsTt+qaR1X6QMk4DQ2wlftv4lVN
         R4vesUe7EmTHY4/3OfWW7oFNkIHP3++8bUG+nquh5cpOI7y4WZirPZp8JBfqgzRhxT/t
         Oqiw==
X-Gm-Message-State: APjAAAXMwsHozBj6HzVp5D760XtOhoqMTS7kpdsoZ997AMCJlDTw8D23
        +0Tx0A+j9KzdA535ljbmx2b9+w==
X-Google-Smtp-Source: APXvYqz1bAJmZgA8/8aWp40ku++Grc84lutv6gcjfJ4VE4iLl6cxS/fnpq6F9eLVrs8dckDJaWVR0g==
X-Received: by 2002:a05:620a:2185:: with SMTP id g5mr445502qka.4.1582825391979;
        Thu, 27 Feb 2020 09:43:11 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id k23sm3317124qtq.89.2020.02.27.09.43.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 09:43:11 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j7NBn-0003iZ-2v; Thu, 27 Feb 2020 13:43:11 -0400
Date:   Thu, 27 Feb 2020 13:43:11 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        Dan Williams <dan.j.williams@intel.com>,
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
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20200227174311.GL31668@ziepe.ca>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
 <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Feb 27, 2020 at 10:21:50AM -0700, Logan Gunthorpe wrote:
> 
> 
> On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
> >> Instead of this, this series proposes a change to arch_add_memory()
> >> to take the pgprot required by the mapping which allows us to
> >> explicitly set pagetable entries for P2PDMA memory to WC.
> > 
> > Is there a particular reason why WC was selected here? I thought for
> > the p2pdma cases there was no kernel user that touched the memory?
> 
> Yes, that's correct. I choose WC here because the existing users are
> registering memory blocks without side effects which fit the WC
> semantics well.

Hm, AFAIK WC memory is not compatible with the spinlocks/mutexs/etc in
Linux, so while it is true the memory has no side effects, there would
be surprising concurrency risks if anything in the kernel tried to
write to it.

Not compatible means the locks don't contain stores to WC memory the
way you would expect. AFAIK on many CPUs extra barriers are required
to keep WC stores ordered, the same way ARM already has extra barriers
to keep UC stores ordered with locking..

The spinlocks are defined to contain UC stores though.

If there is no actual need today for WC I would suggest using UC as
the default.

Jason
