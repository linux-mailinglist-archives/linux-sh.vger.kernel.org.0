Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FA81298D0
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2019 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLWQmZ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 23 Dec 2019 11:42:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43760 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfLWQmZ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 23 Dec 2019 11:42:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so17194546wre.10
        for <linux-sh@vger.kernel.org>; Mon, 23 Dec 2019 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeblueprint-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ukxVfJh/BGwHOYNNZKAYUvoYhGnLhoqMqhQGTKoAgvY=;
        b=s7MOT20EmMGxZnxqyQdzHJGDnlnde7ZsvfDPM39Ld9xdIoraqf8wmJx+IaZ/9swJIU
         Kkv4qzaslRp4ICDhRik9/vdzZju0iS838I1TV9UXowRyuzmW69PA+v6rGgNromGwJzw1
         5rYXJuzj0h8ek08ZPpbaz9YwGGc7AouO72F8/Xm5zdZxesJGxzXEFTD0Rf7NA7qVtjyL
         IsIHZt3+4uXEcbKQhSeJFwprbGn1MbgRr0pu1FmSMqMNYx75hPSzLoX6occkeS9+XbrD
         ZQR08QVg9QhJ+42VnRb3n7Hxox9l1jD7tbfU5UYTLk6kGqTpy2Tjqelcyvcr/MZtp+p3
         a8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ukxVfJh/BGwHOYNNZKAYUvoYhGnLhoqMqhQGTKoAgvY=;
        b=HhFhb/f2U0gAxSe/G4ucQQopFZRrPYHb2ZXYeCgnoxEtD7dYQTMQqPz8L0c71vvBA1
         Y7WdtP//0boJwe37z4YCPLenT+15ibHmYlE7Dsxh85kazixKeWPb861LA4jHQY/sU8HS
         2hzvFqpp25j1wOBJKF8B+HKBuQl5dykgya/XjygRvWxpzYEbZ7rdsPYv04DD5jHWemCf
         V1oiF4MQD70t6coM+LN8nmdJN1mzp4lFsI1E17CvxPsdzugSLEtKugea8u3x7XewWAvC
         2LZeGFMsQDJX05+DAKcBTufDVv4/a4g9U0pLTq6ansM+YoBOv0D6ScvMcwpgt6cFgPB4
         n4wg==
X-Gm-Message-State: APjAAAXcmf86tx8NKpPLj479q/7Zc3MR/ncgRPRKb2rLoYsSaLFEwj7x
        OTpdOBnEB/IUuPHao4B12Vt3DA==
X-Google-Smtp-Source: APXvYqwCeAyFQR244xqoSO33ijfBZHTUX6Zzsc+6QEVmJpvqTP5oW1k9Ms2djsVhBv+Dz/rtHfP04A==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr31416903wrm.394.1577119343580;
        Mon, 23 Dec 2019 08:42:23 -0800 (PST)
Received: from localhost (97e6984e.skybroadband.com. [151.230.152.78])
        by smtp.gmail.com with ESMTPSA id t8sm20627820wrp.69.2019.12.23.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 08:42:23 -0800 (PST)
Date:   Mon, 23 Dec 2019 16:42:20 +0000
From:   Matt Fleming <matt@codeblueprint.co.uk>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/1] Fix undefined reference to 'node_reclaim_distance'.
Message-ID: <20191223164220.GA14394@codeblueprint.co.uk>
References: <20191216103522.32215-1-gonsolo@gmail.com>
 <20191216103522.32215-2-gonsolo@gmail.com>
 <CAMuHMdVotJuotVKa3rxgR3ujCedoWM19-HhwhbTC9g6gV_EVNw@mail.gmail.com>
 <CANL0fFS81NgFBcMBdWo6OKefz04h_FeXadcau9Rkcna7Ap5PDw@mail.gmail.com>
 <CAMuHMdVtm6BGx6d+F8-Bw+fD-M-DugspLkBvCtTKGgWiPvJnSA@mail.gmail.com>
 <CANL0fFSNdzM-e=u+w0BTUqg5sQP_DuVBuJe9m0JDQnVTOPDMNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANL0fFSNdzM-e=u+w0BTUqg5sQP_DuVBuJe9m0JDQnVTOPDMNQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, 16 Dec, at 02:50:49PM, Gonsolo wrote:
> > The offending commit seems to be a55c7454a8c887b2 ("sched/topology:
> > Improve load balancing on AMD EPYC systems").
> >
> > Probably the node_reclaim_distance variable should be moved from
> > an SMP-specific file to a NUMA-specific file.
> 
> There are two variables that are used elsewhere:
> 
> int                             sched_max_numa_distance;
> 
> Used in kernel/sched/fair.c and kernel/sched/topology.c. I would move
> it to fair.c.
> 
> int __read_mostly               node_reclaim_distance = RECLAIM_DISTANCE;
> 
> Used in
> arch/x86/kernel/cpu/amd.c, line 894
> kernel/sched/topology.c
> mm/khugepaged.c, line 725
> mm/page_alloc.c, line 3529
> 
> I'm not sure where to move this one.

Can someone test out this patch on one of the failing architectures?
(sh, ppc64)

---->8----

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 6ec1e595b1d4..bf20e5883026 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1281,7 +1281,6 @@ static int			sched_domains_curr_level;
 int				sched_max_numa_distance;
 static int			*sched_domains_numa_distance;
 static struct cpumask		***sched_domains_numa_masks;
-int __read_mostly		node_reclaim_distance = RECLAIM_DISTANCE;
 #endif
 
 /*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4785a8a2040e..733890d913ea 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3523,6 +3523,7 @@ bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
 }
 
 #ifdef CONFIG_NUMA
+int __read_mostly		node_reclaim_distance = RECLAIM_DISTANCE;
 static bool zone_allows_reclaim(struct zone *local_zone, struct zone *zone)
 {
 	return node_distance(zone_to_nid(local_zone), zone_to_nid(zone)) <=
