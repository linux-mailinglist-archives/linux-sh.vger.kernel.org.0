Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 214836E121
	for <lists+linux-sh@lfdr.de>; Fri, 19 Jul 2019 08:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfGSGpN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 19 Jul 2019 02:45:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:37648 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725616AbfGSGpN (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 19 Jul 2019 02:45:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6BDADAC8F;
        Fri, 19 Jul 2019 06:45:11 +0000 (UTC)
Date:   Fri, 19 Jul 2019 08:45:10 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Oscar Salvador <osalvador@suse.com>
Subject: Re: [PATCH v3 02/11] s390x/mm: Fail when an altmap is used for
 arch_add_memory()
Message-ID: <20190719064510.GL30461@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-3-david@redhat.com>
 <20190701074306.GC6376@dhcp22.suse.cz>
 <20190701124628.GT6376@dhcp22.suse.cz>
 <86f3ff3d-d035-a806-88b7-b8c7b77c206e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f3ff3d-d035-a806-88b7-b8c7b77c206e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon 15-07-19 12:51:27, David Hildenbrand wrote:
> On 01.07.19 14:46, Michal Hocko wrote:
> > On Mon 01-07-19 09:43:06, Michal Hocko wrote:
> >> On Mon 27-05-19 13:11:43, David Hildenbrand wrote:
> >>> ZONE_DEVICE is not yet supported, fail if an altmap is passed, so we
> >>> don't forget arch_add_memory()/arch_remove_memory() when unlocking
> >>> support.
> >>
> >> Why do we need this? Sure ZONE_DEVICE is not supported for s390 and so
> >> might be the case for other arches which support hotplug. I do not see
> >> much point in adding warning to each of them.
> > 
> > I would drop this one. If there is a strong reason to have something
> > like that it should come with a better explanation and it can be done on
> > top.
> > 
> 
> This was requested by Dan and I agree it is the right thing to do.

This is probably a matter of taste. I would argue that altmap doesn't
really equal ZONE_DEVICE. This is more a mechanism to use an alternative
memmap allocator. Sure ZONE_DEVICE is the only in tree user of the
feature but I really do not see why the arh specific code should care
about it. The lack of altmap allocator is handled in the sparse code so
this is just adding an early check which might confuse people in future.

> In
> the context of paravirtualized devices (e.g., virtio-pmem), it makes
> sense to block functionality an arch does not support.

Then block it on the config dependences.

-- 
Michal Hocko
SUSE Labs
