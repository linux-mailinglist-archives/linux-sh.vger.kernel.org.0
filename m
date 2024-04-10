Return-Path: <linux-sh+bounces-850-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB589ED6C
	for <lists+linux-sh@lfdr.de>; Wed, 10 Apr 2024 10:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67311F21302
	for <lists+linux-sh@lfdr.de>; Wed, 10 Apr 2024 08:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE0913CFA1;
	Wed, 10 Apr 2024 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmRNL7d0"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CA2AE88
	for <linux-sh@vger.kernel.org>; Wed, 10 Apr 2024 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712737253; cv=none; b=qKL5dW2KjXzl1lTu+ej+6cv3T8MzNahLGG9NIITtOxDmpuSWDU0L5f/wBs+DYOj12siYtWH+PsNwr+yybSDtvwKarNxD+PW/TcTLvKF3GZz2maXVWuTuhEVkWjZLQztfcQw6ZIdvzybC2Fk8ol1kVwCHAccC5ppqYG2T7EQDIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712737253; c=relaxed/simple;
	bh=PnYCXwqQXwIuIUdDv2sTWF+OEhZuSBXw+2zwh+CpxY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJZPy0HKNvYFTUd+5dwkhaYnpF3ugE3bESnILkCvu+m2/YZn5BuYEx3MHoDE+jsAYWhwQscFmvJVAYTvMGBeVOMEnFcFerbFXjvSQevqZkRea40aA6hMqWAHsKutUik8vo8WjcnZePXU9kXCNVKyccm0Hdiu3gnWt5A05+GzE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmRNL7d0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712737251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nXt9QgBL5KsCTsMhUv7LoBmgAUYvhj/Ac6lKPs0TUWs=;
	b=SmRNL7d0W1wwfN25nd/iEgJUI/kRHXj81wITaYtbozYooXUq4u7Ea0O/XGEFjMyKbfNo/w
	T0ctlPY92XTA3mMFf3q39csCQ2g6F+6EbI1G5mn7RWH6uFlyezAnYWhO/vyorIxvbijhJr
	t70MvgW1p2JNPRlwi7jRzAKhLmRdaYE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-EA86OAbuOmyFx_a8cxqSFA-1; Wed, 10 Apr 2024 04:20:49 -0400
X-MC-Unique: EA86OAbuOmyFx_a8cxqSFA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-343c6a990dbso2737759f8f.1
        for <linux-sh@vger.kernel.org>; Wed, 10 Apr 2024 01:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712737248; x=1713342048;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nXt9QgBL5KsCTsMhUv7LoBmgAUYvhj/Ac6lKPs0TUWs=;
        b=dSW6i5w1L3nF0W9FucoYqncCrBBiZWqa0KjsrM7pSNXSKzAeWelXXPU5LDCgmrzxVh
         Vi9E/L5tlXJiMDKpwvq2HkuKqtfHO+wRQYUmog8EigF+v4EDGL7kacbOmD6wcRMiK2h5
         WQXURRl35BaXuiUEg73RZfKDr/JuvVpZxnebt78iX8YZvFcQYEyk7FFh1u3D2/JEfQiL
         zKVsH7FN1OP8wHXFzPZF+Ojr6/bz+Tey5qJbFilfO7vYQcKPuM1MfQ24gxVbJgwJ4gVv
         pNu6YjMFuelNBQC7IIJ0qc9gtP1EyaN5K+Yndsu3BW7fhufvS6PLdC8WjBNhF8JrKZxy
         1UNw==
X-Forwarded-Encrypted: i=1; AJvYcCWXMy1lqxzJNFbQXuyLriV/sSjTfd/BTZ5P26YgzYOWFpGSHmHgfVLz/ajLtId1xkwa5xgw52G+sI77lt/8EHTtc6rAae3ruMM=
X-Gm-Message-State: AOJu0YyVip8O23wnmSmNp2D/ctIw1pQ9mQhrfNJ0eJQKgPFF4Cmo9o+/
	QuN9IQO00oshRLcCx103oL0U+uXfob/yNKnzuFguPdWmF+gSHQg9cK/aPSP+ll2yakNKvjZXOeJ
	0BlKsM9s7SNRYnSxH/NHPLqBg6QSBSfQVJDLq4I0J9TMF6gtF5oUPuPjc
X-Received: by 2002:a05:6000:4595:b0:343:b5dd:fe1d with SMTP id gb21-20020a056000459500b00343b5ddfe1dmr3947606wrb.28.1712737248344;
        Wed, 10 Apr 2024 01:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMO7YVGXMtdwn7qyE6J9DfN53segr8TeIXW6v8wiHYh+AtmrCV1qpZvYljAfNwPFGdHoDF0A==
X-Received: by 2002:a05:6000:4595:b0:343:b5dd:fe1d with SMTP id gb21-20020a056000459500b00343b5ddfe1dmr3947569wrb.28.1712737247924;
        Wed, 10 Apr 2024 01:20:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c712:fa00:38eb:93ad:be38:d469? (p200300cbc712fa0038eb93adbe38d469.dip0.t-ipconnect.de. [2003:cb:c712:fa00:38eb:93ad:be38:d469])
        by smtp.gmail.com with ESMTPSA id e27-20020a5d595b000000b003445bb2362esm10674889wri.65.2024.04.10.01.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 01:20:47 -0700 (PDT)
Message-ID: <0e829c08-74f5-4487-97bd-4f81d8b70a2f@redhat.com>
Date: Wed, 10 Apr 2024 10:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/18] mm: track mapcount of large folios in single
 value
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yin Fengwei <fengwei.yin@intel.com>,
 Yang Shi <shy828301@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Hugh Dickins <hughd@google.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Richard Chang <richardycc@google.com>
References: <20240409192301.907377-1-david@redhat.com>
 <20240409192301.907377-5-david@redhat.com>
 <1DFEC99F-6BCE-4E6D-9EF2-267E8A94A705@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1DFEC99F-6BCE-4E6D-9EF2-267E8A94A705@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.24 22:13, Zi Yan wrote:
> On 9 Apr 2024, at 15:22, David Hildenbrand wrote:
> 
>> Let's track the mapcount of large folios in a single value. The mapcount of
>> a large folio currently corresponds to the sum of the entire mapcount and
>> all page mapcounts.
>>
>> This sum is what we actually want to know in folio_mapcount() and it is
>> also sufficient for implementing folio_mapped().
>>
>> With PTE-mapped THP becoming more important and more widely used, we want
>> to avoid looping over all pages of a folio just to obtain the mapcount
>> of large folios. The comment "In the common case, avoid the loop when no
>> pages mapped by PTE" in folio_total_mapcount() does no longer hold for
>> mTHP that are always mapped by PTE.
>>
>> Further, we are planning on using folio_mapcount() more
>> frequently, and might even want to remove page mapcounts for large
>> folios in some kernel configs. Therefore, allow for reading the mapcount of
>> large folios efficiently and atomically without looping over any pages.
>>
>> Maintain the mapcount also for hugetlb pages for simplicity. Use the new
>> mapcount to implement folio_mapcount() and folio_mapped(). Make
>> page_mapped() simply call folio_mapped(). We can now get rid of
>> folio_large_is_mapped().
>>
>> _nr_pages_mapped is now only used in rmap code and for debugging
>> purposes. Keep folio_nr_pages_mapped() around, but document that its use
>> should be limited to rmap internals and debugging purposes.
>>
>> This change implies one additional atomic add/sub whenever
>> mapping/unmapping (parts of) a large folio.
>>
>> As we now batch RMAP operations for PTE-mapped THP during fork(),
>> during unmap/zap, and when PTE-remapping a PMD-mapped THP, and we adjust
>> the large mapcount for a PTE batch only once, the added overhead in the
>> common case is small. Only when unmapping individual pages of a large folio
>> (e.g., during COW), the overhead might be bigger in comparison, but it's
>> essentially one additional atomic operation.
>>
>> Note that before the new mapcount would overflow, already our refcount
>> would overflow: each mapping requires a folio reference. Extend the
>> focumentation of folio_mapcount().
> 
> s/focumentation/documentation/  ;)

Thanks! :)

-- 
Cheers,

David / dhildenb


