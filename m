Return-Path: <linux-sh+bounces-866-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1568A68F9
	for <lists+linux-sh@lfdr.de>; Tue, 16 Apr 2024 12:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8264328599B
	for <lists+linux-sh@lfdr.de>; Tue, 16 Apr 2024 10:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F2E127E38;
	Tue, 16 Apr 2024 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rv37uZoS"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523B128804
	for <linux-sh@vger.kernel.org>; Tue, 16 Apr 2024 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713264437; cv=none; b=YKr2ICVIfgr0WDRXTTXHrZWd79/rRebT9cMmJIx5HX7RyrP2OY03V5wsuF7tJVbnlKCnA2MPpKoi7cW91Pv4dZCnlFZlJ+9IiZdhJefEVTEvAxi3E+311Hb2/1qUCMxofTifVB4iARKy0JzAyWQ1lCbwAyGnsq4PJoHBDzIULYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713264437; c=relaxed/simple;
	bh=Z0otQ5YYNoZHKebJpbEfkwq1ZAUP2FGHT5aRdq0+x4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLoC+3pnmN91Ar4XsNQ3Wq2B2mwx18tAKK96gDnmY0P/5lvuGxnhm0vyKBwzgGQPNzaawLhhBKjYgqwr2kAv4yA0XUTgdvBJjbm8GPYRxcxKmMcyvWklG/CX9Sl4lF2pwp7zcZAGyzaBujgoaMmqwqii/D6fFYmkS8k6Nzwlf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rv37uZoS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713264434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sHZj7e95p83ZQB8krG0irfPjHNeZ0FGz68YJ92KzAAs=;
	b=Rv37uZoSovSYow3pWNhHBKZvMWQr4nCvb9nGH//VyVUYRX1GHczWcC0JW/TLlCXO7Dxn+p
	4V3ROoIoj7zDS2+1O3AojqhAi1YQJ8SJTqwhxGRRhEQGUR0DnaSKOjGs1WJfsY8+3LJ6wD
	CtA4hlCKjvtitfWQCFufyUHRWiX1R4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-3VIJpWI-Oq6oyQjoeGqx1g-1; Tue, 16 Apr 2024 06:47:11 -0400
X-MC-Unique: 3VIJpWI-Oq6oyQjoeGqx1g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41895b0a62cso3493325e9.2
        for <linux-sh@vger.kernel.org>; Tue, 16 Apr 2024 03:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713264430; x=1713869230;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sHZj7e95p83ZQB8krG0irfPjHNeZ0FGz68YJ92KzAAs=;
        b=C9Eo9wYlX7ic3PfEReH2OO4dhMVh249hPDdqZEkc7Q9W0DhVQUkP34wPn3dPQh2IC1
         yv7Km19ZS6CmLS2tU7hDEr2I+annadZRDiLX9ysnfabjonK+OPzn32fltHkWG2ANs4An
         eJRR1Hh3AfWJLne9JcWK+lwzBQGhZVQ05RBzNetOuhJxlllcBe0ptbC3iJn3TEvDRRGv
         j7uh9GLMmMYGR41OE8mNrAQPrfgZW13g2LXJO77dbd7gZvkorM9pBZot5CT7nwX/83xd
         xtJIJ7vXlbc48WEa1uyh6wGtf+P10yJ2YDl70YZH6aKIeeT0sGXZxLPgXAokqcSb464T
         8AOA==
X-Forwarded-Encrypted: i=1; AJvYcCWT7SUun4H7h2r/eKBYGfpsam9eovYbmRPlY7mboKiTABxOBGmo3Z4YNTpRBGZOVTAF+ZKwdgne0JM++yQOSzgE7E79r52uY58=
X-Gm-Message-State: AOJu0Yzz32xGyeJ5dTa1FvywotCUEsOtcJmekfrc1ra1JODSB6B4NAmq
	gnasZSeTc3VnbYxqi/N9j8ZH0Y06EDMGnUINt9lAEKzJlRwJrt89+qand+ZzC9YzCcygvPqWoNA
	rfIEUqhIPXmS1PrQbgYA/fZjpacUukbhYhACNvf2cILzjN0qDvhjximXX
X-Received: by 2002:a05:600c:3592:b0:416:2d39:bcc2 with SMTP id p18-20020a05600c359200b004162d39bcc2mr13412000wmq.29.1713264430112;
        Tue, 16 Apr 2024 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYuMJISYlwajPh8spZ3PKDh4MK3wXlH4X9uX9iwjGvozOW0xx4TN22/UgKUkWhFnuYBnnNqQ==
X-Received: by 2002:a05:600c:3592:b0:416:2d39:bcc2 with SMTP id p18-20020a05600c359200b004162d39bcc2mr13411966wmq.29.1713264429661;
        Tue, 16 Apr 2024 03:47:09 -0700 (PDT)
Received: from [192.168.3.108] (p4ff2389d.dip0.t-ipconnect.de. [79.242.56.157])
        by smtp.gmail.com with ESMTPSA id t11-20020adfe10b000000b00347edb20b6esm4119390wrz.106.2024.04.16.03.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 03:47:09 -0700 (PDT)
Message-ID: <3ef81fe3-2584-4db8-ab66-eaa44c035707@redhat.com>
Date: Tue, 16 Apr 2024 12:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/18] mm: improve folio_likely_mapped_shared() using
 the mapcount of large folios
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, cgroups@vger.kernel.org, chris@zankel.net,
 corbet@lwn.net, dalias@libc.org, fengwei.yin@intel.com,
 glaubitz@physik.fu-berlin.de, hughd@google.com, jcmvbkbc@gmail.com,
 linmiaohe@huawei.com, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, muchun.song@linux.dev,
 naoya.horiguchi@nec.com, peterx@redhat.com, richardycc@google.com,
 ryan.roberts@arm.com, shy828301@gmail.com, willy@infradead.org,
 ysato@users.sourceforge.jp, ziy@nvidia.com
References: <20240409192301.907377-6-david@redhat.com>
 <20240416104008.41979-1-ioworker0@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240416104008.41979-1-ioworker0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.24 12:40, Lance Yang wrote:
> Hey David,
> 
> Maybe I spotted a bug below.

Thanks for the review!

> 
> [...]
>   static inline bool folio_likely_mapped_shared(struct folio *folio)
>   {
> -	return page_mapcount(folio_page(folio, 0)) > 1;
> +	int mapcount = folio_mapcount(folio);
> +
> +	/* Only partially-mappable folios require more care. */
> +	if (!folio_test_large(folio) || unlikely(folio_test_hugetlb(folio)))
> +		return mapcount > 1;
> +
> +	/* A single mapping implies "mapped exclusively". */
> +	if (mapcount <= 1)
> +		return false;
> +
> +	/* If any page is mapped more than once we treat it "mapped shared". */
> +	if (folio_entire_mapcount(folio) || mapcount > folio_nr_pages(folio))
> +		return true;
> 
> bug: if a PMD-mapped THP is exclusively mapped, the folio_entire_mapcount()
> function will return 1 (atomic_read(&folio->_entire_mapcount) + 1).

If it's exclusively mapped, then folio_mapcount(folio)==1. In which case 
the previous statement:

if (mapcount <= 1)
	return false;

Catches it.

IOW, once we reach this point we now that folio_mapcount(folio) > 1, and 
there must be something else besides the entire mapping ("more than once").


Or did I not address your concern?

-- 
Cheers,

David / dhildenb


