Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67464153BFE
	for <lists+linux-sh@lfdr.de>; Thu,  6 Feb 2020 00:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgBEXeP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 5 Feb 2020 18:34:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:54656 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbgBEXeP (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 5 Feb 2020 18:34:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 15:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; 
   d="scan'208";a="264405373"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
  by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 15:34:12 -0800
Date:   Thu, 6 Feb 2020 07:34:28 +0800
From:   Wei Yang <richardw.yang@linux.intel.com>
To:     Baoquan He <bhe@redhat.com>
Cc:     Wei Yang <richardw.yang@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205233428.GD28446@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200205095924.GC24162@richard>
 <20200205144811.GF26758@MiWiFi-R3L-srv>
 <20200205225633.GA28446@richard>
 <20200205230826.GF8965@MiWiFi-R3L-srv>
 <20200205232620.GC28446@richard>
 <20200205233051.GG8965@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205233051.GG8965@MiWiFi-R3L-srv>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Feb 06, 2020 at 07:30:51AM +0800, Baoquan He wrote:
>On 02/06/20 at 07:26am, Wei Yang wrote:
>> On Thu, Feb 06, 2020 at 07:08:26AM +0800, Baoquan He wrote:
>> >On 02/06/20 at 06:56am, Wei Yang wrote:
>> >> On Wed, Feb 05, 2020 at 10:48:11PM +0800, Baoquan He wrote:
>> >> >Hi Wei Yang,
>> >> >
>> >> >On 02/05/20 at 05:59pm, Wei Yang wrote:
>> >> >> >diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> >> >> >index f294918f7211..8dafa1ba8d9f 100644
>> >> >> >--- a/mm/memory_hotplug.c
>> >> >> >+++ b/mm/memory_hotplug.c
>> >> >> >@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>> >> >> > 		if (pfn) {
>> >> >> > 			zone->zone_start_pfn = pfn;
>> >> >> > 			zone->spanned_pages = zone_end_pfn - pfn;
>> >> >> >+		} else {
>> >> >> >+			zone->zone_start_pfn = 0;
>> >> >> >+			zone->spanned_pages = 0;
>> >> >> > 		}
>> >> >> > 	} else if (zone_end_pfn == end_pfn) {
>> >> >> > 		/*
>> >> >> >@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>> >> >> > 					       start_pfn);
>> >> >> > 		if (pfn)
>> >> >> > 			zone->spanned_pages = pfn - zone_start_pfn + 1;
>> >> >> >+		else {
>> >> >> >+			zone->zone_start_pfn = 0;
>> >> >> >+			zone->spanned_pages = 0;
>> >> >> >+		}
>> >> >> > 	}
>> >> >> 
>> >> >> If it is me, I would like to take out these two similar logic out.
>> >> >
>> >> >I also like this style. 
>> >> >> 
>> >> >> For example:
>> >> >> 
>> >> >> 	if () {
>> >> >> 	} else if () {
>> >> >> 	} else {
>> >> >> 		goto out;
>> >> >Here the last else is unnecessary, right?
>> >> >
>> >> 
>> >> I am afraid not.
>> >> 
>> >> If the range is not the first or last, we would leave pfn not initialized.
>> >
>> >Ah, you are right. I forgot that one. Then pfn can be assigned the
>> >zone_start_pfn as the old code. Then the following logic is the same
>> >as the original code, find_smallest_section_pfn()/find_biggest_section_pfn() 
>> >have done the iteration the old for loop was doing.
>> >
>> >	unsigned long pfn = zone_start_pfn;	
>> >	if () {
>> >	} else if () {
>> >	} 
>> >
>> >	/* The zone has no valid section */
>> >	if (!pfn) {
>> >        	zone->zone_start_pfn = 0;
>> >        	zone->spanned_pages = 0;
>> >	}
>> 
>> This one look better :-)
>
>Thanks for your confirmation, I will make one patch like this and post.

Sure :-)

-- 
Wei Yang
Help you, Help me
