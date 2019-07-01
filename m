Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D61E4E98A
	for <lists+linux-sh@lfdr.de>; Fri, 21 Jun 2019 15:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfFUNkX (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 21 Jun 2019 09:40:23 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39435 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfFUNkX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 21 Jun 2019 09:40:23 -0400
Received: by mail-qt1-f195.google.com with SMTP id i34so6894651qta.6
        for <linux-sh@vger.kernel.org>; Fri, 21 Jun 2019 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZCrivaPmWHSHjQSdgEw4GI/j98fJxtxh9tp1DIhn9Pk=;
        b=iFE5ScFSlA9eaFIsPJU8p0w1qOx41yW1vrAuYeo+l9Q0KwpkxwhaD346XR6CI3LuMu
         FsUTSf6vE97JnP3EPZrFn46YHJ7vRTKevOvCMH1mna8IGtNFXf48ywkiIrsuxvMz1Lyo
         73WFQX5rdb2D6muLva15ZoWDq9Kj/YcD/y2bpNGuMg6dRxVmYAap99xfHkj4krlsmpA9
         WLzb7MYs8YrQkoW/Cq3RrCPIBJ2bvt0kiEleJq5K2k1LS5IcxoG3chSgmdVQLBLoizx0
         yMC2TCuZc1Ce7lhLmgcinzihQvYINNi8qNCu1nQLWvdKkjW4U7948HBdCkUlKYsn6Uth
         DaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZCrivaPmWHSHjQSdgEw4GI/j98fJxtxh9tp1DIhn9Pk=;
        b=g9TdeGrcmcX5HtS1swTbTVGzuyTMrn5kf6xW6sJv+Rc3KkcvYU71Xfx3Wt0T0tSLqf
         8UIdYM2cdzbYF3Xaohgm0Jfn2jEGfW7LFC7aVbW34BxQxG8UGFrXP9jl0pc5KlIQByAX
         9AHY/zu1+zV3EGKLMXC8aEPV+o02akJd6f3md/zKHl6fUBIfKfj4Jf9T1jJvjhViNomC
         VwsNOUYg73xcWK240PEpxQmrFamhxjgp/7sjHBsj1hDN4t94kLyVfJFkL9nawDHztkNj
         uqawb7vTB2dzrQASP+VrMRnuNNbQVuVNXlQciXDpy2RX5kA/3YSJ5dMzkKfTspNl5JZI
         5S1Q==
X-Gm-Message-State: APjAAAUkGZH3egMj9ZIu72J0LznadPC/2Gh4fCDQ8fnus4eInAarQy1N
        xH66JPuxeh8xpFAXWV5zoYdamyRvhGllXw==
X-Google-Smtp-Source: APXvYqzfk92nAm4v0PC/p+cfLaUPeFmmoTuTFE99jGSQ5m486NYHbLSajeoJYynPCh/suXX0ETWpgw==
X-Received: by 2002:ac8:17c1:: with SMTP id r1mr115641302qtk.41.1561124422594;
        Fri, 21 Jun 2019 06:40:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id i22sm1837536qti.30.2019.06.21.06.40.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 06:40:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heJm9-000060-L5; Fri, 21 Jun 2019 10:40:21 -0300
Date:   Fri, 21 Jun 2019 10:40:21 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] mm: simplify gup_fast_permitted
Message-ID: <20190621134021.GM19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-3-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:48PM +0200, Christoph Hellwig wrote:
> Pass in the already calculated end value instead of recomputing it, and
> leave the end > start check in the callers instead of duplicating them
> in the arch code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/s390/include/asm/pgtable.h   |  8 +-------
>  arch/x86/include/asm/pgtable_64.h |  8 +-------
>  mm/gup.c                          | 17 +++++++----------
>  3 files changed, 9 insertions(+), 24 deletions(-)

Much cleaner

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
