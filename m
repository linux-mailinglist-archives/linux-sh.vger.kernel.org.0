Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F90011779A
	for <lists+linux-sh@lfdr.de>; Mon,  9 Dec 2019 21:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLIUnu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Dec 2019 15:43:50 -0500
Received: from verein.lst.de ([213.95.11.211]:44566 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbfLIUnu (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 9 Dec 2019 15:43:50 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 69ADB68BE1; Mon,  9 Dec 2019 21:43:45 +0100 (CET)
Date:   Mon, 9 Dec 2019 21:43:45 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        Christoph Hellwig <hch@lst.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/6] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20191209204345.GA29265@lst.de>
References: <20191209191346.5197-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209191346.5197-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Dec 09, 2019 at 12:13:40PM -0700, Logan Gunthorpe wrote:
> This changes is pretty routine for most of the arches: x86_64, s390, arm64
> and powerpc simply need to thread the pgprot through to where the page tables
> are setup. x86_32 unfortunately sets up the page tables at boot so
> must use _set_memory_prot() to change their caching mode. ia64 and sh
> don't appear to have an easy way to change the page tables so, for now
> at least, we just return -EINVAL on such mappings and thus they will
> not support P2PDMA memory until the work for this is done.

ia64 and sh don't support ZONE_DEVICE mappings anyway as far as I know.

This generally looks fine to me.
