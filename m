Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A21849FD
	for <lists+linux-sh@lfdr.de>; Fri, 13 Mar 2020 15:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCMOw7 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 13 Mar 2020 10:52:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43027 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMOw6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 13 Mar 2020 10:52:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id c144so5347441pfb.10
        for <linux-sh@vger.kernel.org>; Fri, 13 Mar 2020 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=fMZlA1LecrWJNCxAW+zR7Z7LhYDFn/2H1aC7+s4ivFc=;
        b=Y+2Vr/odc2IZHXXcNQP1xK+tIIfYkUkHSngzkgbaXnkt4BQ4nY3LYtw9j9ndGQ+wsz
         xV3C9jH6V1a1Oq7DoQ/WxL1wyLveXKuqazODXdpTP4lkSehkdvbMJ6I4hb9zyvW67RXo
         2kWErKiEG00g6clu7CDviBVXdZHRj3HkS1HkB8zFDW6C77epAF1fHhvHt7M3IQzM2ezl
         5+NLpB2ThNLl0fk1lDZPJ9Ri7m678wND0ThNXZV9pKpF/a1bos5rpaaPDt5F/vUOD3UE
         FJpW3M04A93GdjR4iRsWA7B6Pu0eTgHmb3EC/TDyuAJ/MUaajdvYlx8An8NT86G6Wrpc
         9aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=fMZlA1LecrWJNCxAW+zR7Z7LhYDFn/2H1aC7+s4ivFc=;
        b=SwrJdoTiuQBk5rsgXtcbxfGN8h6AAexLCkSC+HKQIa4q3u4Dpi/CXP5UnaGbygT97h
         r4Ixp3CcQekgyczKmI9pBj7Sewc/nOOIQ3YbwEuS3GmSGBjwbd7sEvZTI0R6egLCYi4H
         gCBI7pmWegl+HOxgIVh9KBhjjz0YoCQvxB9YBtAF7EC8i5VAmtKmiksEzPLHhhH2TyzS
         DM3hFyyqJwb//aGxSIQ/PYrkEC43lHkutLKLXRQKE1eNhdN/sOMOW/LYcPQfPo/QgStW
         VdjWjRgCpNMVSFrucaRr/4cooLjTzHT+SWVmVok2FKMwOXpUlx0lgNw24WDpI3I6z9db
         9gMA==
X-Gm-Message-State: ANhLgQ2SlUZ/ukKF1n2qg76ILonddoSczZrrVvzhw5D/nvz0pad4rtWa
        w3hi4+tlZh1dPXLUl6c6xik=
X-Google-Smtp-Source: ADFU+vuKcueRw9JqSNhtpC1j3bg02EnzKjc7wrGDsc4wi2o8wYDDSrn5YSaSVGJnTsgeKhkvDypnsQ==
X-Received: by 2002:a63:ed4d:: with SMTP id m13mr13147902pgk.350.1584111176529;
        Fri, 13 Mar 2020 07:52:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h24sm17353328pfn.49.2020.03.13.07.52.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:52:55 -0700 (PDT)
Date:   Fri, 13 Mar 2020 07:52:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] mm/memory_hotplug: add pgprot_t to mhp_params
Message-ID: <20200313145253.GA29117@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Mar 13, 2020 at 04:10:21PM +1100, Logan Gunthorpe wrote:
> devm_memremap_pages() is currently used by the PCI P2PDMA code to create
> struct page mappings for IO memory.  At present, these mappings are
> created with PAGE_KERNEL which implies setting the PAT bits to be WB.
> However, on x86, an mtrr register will typically override this and force
> the cache type to be UC-.  In the case firmware doesn't set this register
> it is effectively WB and will typically result in a machine check
> exception when it's accessed.
> 
> Other arches are not currently likely to function correctly seeing they
> don't have any MTRR registers to fall back on.
> 
> To solve this, provide a way to specify the pgprot value explicitly to
> arch_add_memory().
> 
> Of the arches that support MEMORY_HOTPLUG: x86_64, and arm64 need a simple
> change to pass the pgprot_t down to their respective functions which set
> up the page tables.  For x86_32, set the page tables explicitly using
> _set_memory_prot() (seeing they are already mapped).  For ia64, s390 and
> sh, reject anything but PAGE_KERNEL settings -- this should be fine, for
> now, seeing these architectures don't support ZONE_DEVICE.
> 
> A check in __add_pages() is also added to ensure the pgprot parameter was
> set for all arches.
> 
...

> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index e5114c053364..b9de2d4fa57e 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -412,6 +412,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  	int ret;
>  
> +	if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot)
> +		return -EINVAL;

Compile test ?

Guenter
