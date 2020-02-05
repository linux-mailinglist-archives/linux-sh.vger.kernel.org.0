Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA741532CC
	for <lists+linux-sh@lfdr.de>; Wed,  5 Feb 2020 15:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgBEO0c (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 5 Feb 2020 09:26:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39226 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726308AbgBEO0b (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 5 Feb 2020 09:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580912791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KAdV3hA+UnlwePFUiQQxF7Qhd3fY3tGdtbme44OOFs8=;
        b=dM56oyW0PLeC7lZcKtklhPL2Tcba9dYouSmR8HUQlYqmJoWyLefQjkvWawkoKvTCTVoo95
        HROmfvZ4K9g/7GDR1LKIUELUzKnhIBFjgyd9cmb+oY/oXsm2SftkJs4/goXUgyEeaJeNaC
        ux7m9uwcb90bFQeteCZzBhb2LdmFJhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-OBZq-5t8Nwu9IXhE-e1YOQ-1; Wed, 05 Feb 2020 09:26:26 -0500
X-MC-Unique: OBZq-5t8Nwu9IXhE-e1YOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209311081FA3;
        Wed,  5 Feb 2020 14:26:24 +0000 (UTC)
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 56DD25C1B5;
        Wed,  5 Feb 2020 14:26:20 +0000 (UTC)
Date:   Wed, 5 Feb 2020 22:26:18 +0800
From:   Baoquan He <bhe@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205142618.GE8965@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200204142516.GD26758@MiWiFi-R3L-srv>
 <e0006cc4-d448-89c6-38c0-51da7fc08715@redhat.com>
 <20200205124329.GE26758@MiWiFi-R3L-srv>
 <cd353848-301a-025d-dd66-44d76e1bbc44@redhat.com>
 <20200205133442.GC8965@MiWiFi-R3L-srv>
 <2868343a-745b-e2b6-7e78-d5649c00ee31@redhat.com>
 <20200205141254.GD8965@MiWiFi-R3L-srv>
 <be8b9c0e-0929-4ea4-9c25-15e1f221dfb1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8b9c0e-0929-4ea4-9c25-15e1f221dfb1@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 02/05/20 at 03:16pm, David Hildenbrand wrote:
> >>>> Anyhow, that patch is already upstream and I don't consider this high
> >>>> priority. Thanks :)
> >>>
> >>> Yeah, noticed you told Wei the status in another patch thread, I am fine
> >>> with it, just leave it to you to decide. Thanks.
> >>
> >> I am fairly busy right now. Can you send a patch (double-checking and
> >> making this eventually unconditional?). Thanks!
> > 
> > Understood, sorry about the noise, David. I will think about this.
> > 
> 
> No need to excuse, really, I'm very happy about review feedback!
> 

Glad to hear it, thanks.

> The review of this series happened fairly late. Bad, because it's not
> perfect, but good, because no serious stuff was found (so far :) ). If
> you also don't have time to look into this, I can put it onto my todo
> list, just let me know.

Both is OK to me, as long as thing is clear to us. I will discuss with
Wei Yang for now. You can post patch anytime if you make one.

