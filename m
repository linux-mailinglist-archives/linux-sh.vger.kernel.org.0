Return-Path: <linux-sh+bounces-630-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C288E9C1
	for <lists+linux-sh@lfdr.de>; Wed, 27 Mar 2024 16:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC7C1F35039
	for <lists+linux-sh@lfdr.de>; Wed, 27 Mar 2024 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B3D12F5AD;
	Wed, 27 Mar 2024 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBY91gqt"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B65024E
	for <linux-sh@vger.kernel.org>; Wed, 27 Mar 2024 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711554463; cv=none; b=rTqdIwgXZRAa+1fediF2ggdogG+BEUme8CwV/H1DaLuepUOtXyFQ6tNgALGKIHPscBFgXL4ggImNwnll7ubAIJ82/b6F0QC10WWe6HwCcz7qOdRuCxuN19DoBDTbmDnyQ0piuYMFnLL2j7y3O80ue40fz9qdlpoJEo++FmKLcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711554463; c=relaxed/simple;
	bh=DVO1rReh4ydB46JorXpL28hCKteSlDiF68Vwr+w5mPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNoqXesQl1x32HjdZDvk8jaMZhTVrKXj82nQ7Fh6cC+am+nXyfNHQ0QWkAFNearmN1xuPxZohHze6FtI2lwAOfwtGMXvcrz3WQMVpgzwxaTXBgpiSi5jE5MoHwsry/NCqHxCfgx+Q1dRFmXWo792DmLzlaBNyhxTWFKDdxdOdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBY91gqt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711554461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nx2RBcEO1zlkXSO8aDJi6Uao1EiV9BqGUI/e60nrr6c=;
	b=SBY91gqtVcFUzzi4TSoCzeGe9vmp0v24ukKZfzJt7wOw1zr/PfIBXYy9RUizIS09ggbs3a
	MkVQfC6QTbV3ZUYN7NYQrK+73TU/RXejokfPRtFk0Rk9arlFsQlHfJfFpXTf02LeGM96FV
	u1a2BhFKKDJrTeLC1ny8ABALMy3802w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-kPbsYfVDNua6PEtwluE02Q-1; Wed, 27 Mar 2024 11:47:39 -0400
X-MC-Unique: kPbsYfVDNua6PEtwluE02Q-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40e435a606aso37278935e9.3
        for <linux-sh@vger.kernel.org>; Wed, 27 Mar 2024 08:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711554458; x=1712159258;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx2RBcEO1zlkXSO8aDJi6Uao1EiV9BqGUI/e60nrr6c=;
        b=mGejmYYdys96eD3cxNmjGcvwDpkt9RdqcUqszU0IiFdw97uHVGJ7ATCVAlGT14zc4I
         syszizKHDDpUXM+rhshtn820fdKcMvuAoR0zRCfLLbrrt+Ny3HM15WnZS+HZisjjgTc9
         4ErK4xkPU/L5QH0HIAMkjesahElQoj56wx3Beu+zqN8eVXSgiNs0wL96GdaPYPGmaydt
         cP518oqlrVN5zZLSaCANFDkMrDG2nPPpC/7kVf8Gh+D1WSZZlF+ZWi0E8NJVk5S2nRnq
         PObaKGBgUJ7iCTJueD4Vgg1o9Q8+loN5HuCI9FHVvitPMtACYJCsImu/e7G4SjUw669X
         I7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWljQc22J56e/XgFLG8YEi4pqFCWlAijDRvALlDgq7c5baNlCQ2r77mVs7dgkJ3bbcceC0LfMOlkeMKYx+kxSahrRUFfnI6FCs=
X-Gm-Message-State: AOJu0Yzkrw2cB7l0mJ2UCnYCwGZVcGLo6tGXfOCP5NXXer9xKsRx8MZ2
	Ky/DyTY45O8XgQXzpEbOMBNgx6zz/861Ud56Pl2NLijoXI8Sls7h6OqttnchYWQtrTiVh6y0l0J
	PJAtQSY5CAkv9F4l5DTVEG8wpwpbR8D/RJ6x5HZFVOcKt81NEzlla35C5
X-Received: by 2002:a05:600c:524d:b0:414:8c04:23d7 with SMTP id fc13-20020a05600c524d00b004148c0423d7mr351323wmb.12.1711554458575;
        Wed, 27 Mar 2024 08:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMMNr9uPGzoqufs3UzwsuyIJrM6qX29FP7ICBLhhHmRIezXNRoAaLgs2liyRBDuZ/By57oYw==
X-Received: by 2002:a05:600c:524d:b0:414:8c04:23d7 with SMTP id fc13-20020a05600c524d00b004148c0423d7mr351286wmb.12.1711554458105;
        Wed, 27 Mar 2024 08:47:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:8a00:362b:7e34:a3bc:9ddf? (p200300cbc7088a00362b7e34a3bc9ddf.dip0.t-ipconnect.de. [2003:cb:c708:8a00:362b:7e34:a3bc:9ddf])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b004146bcdde06sm2534359wms.6.2024.03.27.08.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:47:37 -0700 (PDT)
Message-ID: <7f9fd647-dd0a-4be0-9e3b-3f0fe5f479cc@redhat.com>
Date: Wed, 27 Mar 2024 16:47:36 +0100
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
To: Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <8727a618-30c4-4a13-b0e9-eccc3fd67c73@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8727a618-30c4-4a13-b0e9-eccc3fd67c73@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.03.24 16:46, Ryan Roberts wrote:
>>
>> Some of them look like mm-unstable issue, For example, arm64 fails with
>>
>>    CC      arch/arm64/mm/extable.o
>> In file included from ./include/linux/hugetlb.h:828,
>>                   from security/commoncap.c:19:
>> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
>> 'arch_clear_hugetlb_flags'
>>     25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>>        |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
>> 'arch_clear_hugetlb_flags'
>>    840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
>> 'arch_clear_hugetlb_flags' with t
>> ype 'void(struct folio *)'
>>     21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from ./include/linux/hugetlb.h:828,
>>                   from mm/filemap.c:37:
>> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
>> 'arch_clear_hugetlb_flags'
>>     25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>>        |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
>> 'arch_clear_hugetlb_flags'
>>    840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
>> 'arch_clear_hugetlb_flags' with type 'void(struct folio *)'
>>     21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
> 
> see: https://lore.kernel.org/linux-mm/ZgQvNKGdlDkwhQEX@casper.infradead.org/
> 

Yes, besides the other failures I see (odd targets), I was expecting 
that someone else noticed that already :) thanks!

-- 
Cheers,

David / dhildenb


