Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8EC5B823
	for <lists+linux-sh@lfdr.de>; Mon,  1 Jul 2019 11:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbfGAJgu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 1 Jul 2019 05:36:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:52840 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728035AbfGAJgu (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 1 Jul 2019 05:36:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6E628AB87;
        Mon,  1 Jul 2019 09:36:48 +0000 (UTC)
Date:   Mon, 1 Jul 2019 11:36:44 +0200
From:   Oscar Salvador <osalvador@suse.de>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        akpm@linux-foundation.org, Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 10/11] mm/memory_hotplug: Make
 unregister_memory_block_under_nodes() never fail
Message-ID: <20190701093640.GA17349@linux>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-11-david@redhat.com>
 <20190701085144.GJ6376@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701085144.GJ6376@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jul 01, 2019 at 10:51:44AM +0200, Michal Hocko wrote:
> Yeah, we do not allow to offline multi zone (node) ranges so the current
> code seems to be over engineered.
> 
> Anyway, I am wondering why do we have to strictly check for already
> removed nodes links. Is the sysfs code going to complain we we try to
> remove again?

No, sysfs will silently "fail" if the symlink has already been removed.
At least that is what I saw last time I played with it.

I guess the question is what if sysfs handling changes in the future
and starts dropping warnings when trying to remove a symlink is not there.
Maybe that is unlikely to happen?

-- 
Oscar Salvador
SUSE L3
