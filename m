Return-Path: <linux-sh+bounces-883-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357B8AAB43
	for <lists+linux-sh@lfdr.de>; Fri, 19 Apr 2024 11:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E323281F0B
	for <lists+linux-sh@lfdr.de>; Fri, 19 Apr 2024 09:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB321745EF;
	Fri, 19 Apr 2024 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFlZ/Ko4"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8497BAFF
	for <linux-sh@vger.kernel.org>; Fri, 19 Apr 2024 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518067; cv=none; b=PIM41+HoIPb3ejR2VcJQjWz1PcG0nPkcU8h8qhxXLXc6Ain40SKfgxgG3QWfWwCx6p5tETEHXwNmF58dUzG5O5Ojj/Ck4pB3EdKMP/U7aKwk7FrmU0dsgKCXll8IytuNnOmd4rpQeTrrTTAuP5eNmbktXlin1g6lmyME2M+fyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518067; c=relaxed/simple;
	bh=Xp2EiSEdIviNVxs+Qz+eQmTpkeDvxnaGWVXfC1igFFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNS3XdrCtre+R4OTUuougORaLNquU/BOkXPqCbzJyn668AErleFGn0FtHmM6JrEOYO3jL3k1nZyrtI/TykCr5RQDG/+BmRY5RUuMi3/MpFL4X5MD88C3gps+Lr73D0EGby6RvLyOkNm79c9EHnz2db6fEC6Kl9X1AyjLsIUrWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFlZ/Ko4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713518065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EqwO0572yowA0TBakaonePZNHGnWtzDXOOjoM1DutVs=;
	b=UFlZ/Ko44p097GFKO/hDNw5u8m0tuEkyJ0JGpw2ZaNPDAC0mEtkyCOzUReEvPidASY5pd0
	jSS0qGNa1jsI3o28ouya9BrIWcsBAOs34gopCiy4exLfK71+tTjNrsq9p8YGBYpcpgw17Z
	rgDOBH3UpeToEk3S4wNCGAlrz7q48dc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-Ftzmy0uDM-Osh5o1pQjvpQ-1; Fri, 19 Apr 2024 05:14:22 -0400
X-MC-Unique: Ftzmy0uDM-Osh5o1pQjvpQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-417de456340so10314285e9.2
        for <linux-sh@vger.kernel.org>; Fri, 19 Apr 2024 02:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518061; x=1714122861;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EqwO0572yowA0TBakaonePZNHGnWtzDXOOjoM1DutVs=;
        b=o8e/hIBVphyyfEy0JRNdZQhAfo4JQ1DZhq2fpRCz6wC/MSLZR1Y7ITcaNnb8tKEbg+
         lk6j6uNs3jx/tRNGqgPvx7+2piXTPqaft0A5EmiLJe0tQThsPbHPTcmHCREPoyEgG3rl
         a53ONf9i4ltpnOKvv0j6endqi4Hk2uKq3hRvS68q7BYuk0XEyuqA4F6YMp6km+UVdKV3
         uZhcEo9rXwhevjG9wbY59IKI/0D3sw12b0vOiw2umZ4l7vBLZIeHQfz5ZFRZ8weDD9Xq
         L8LGK5eyCj7wwG4TmLYCyoaTfi1s7F4pTNfLEGQw54MCxBQ6bTntwTzVl1eGzHVFvevs
         hx7w==
X-Forwarded-Encrypted: i=1; AJvYcCUjpHSvwZtJp9jEtYEq2/9Ak9zyH7zjQKlgKVHz9W69wDC4bS9FLiXAKTbUHhO0PS9H+gB1wSIToBn7g4P02ChTWegVLPKtjgk=
X-Gm-Message-State: AOJu0YygKQjK+QGa70oCTz//RyKyedTJqcT6YJ0tsSGoMetBRL46WDHM
	eNuIQMIeO1cWgrKNF5UDIGdxqZo+M4ppxTk5DMHmPTuI0Ia7KxxDMDPSUuYG/iReO84ZAmZDaW3
	5FU3ZwXrs4WDrLNTT+tvDwc45LU+4dAuZOOIKLk86Q3ySVORYWeXKDYRe
X-Received: by 2002:a05:600c:c16:b0:418:fdcc:7080 with SMTP id fm22-20020a05600c0c1600b00418fdcc7080mr1087557wmb.12.1713518060737;
        Fri, 19 Apr 2024 02:14:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5KCUiiuZF9OZuh6RkThz19zIB1mi9FMS0XWUZ94xu1t5eHJnPpGKa3Ly3AFrnJLxt6FqYug==
X-Received: by 2002:a05:600c:c16:b0:418:fdcc:7080 with SMTP id fm22-20020a05600c0c1600b00418fdcc7080mr1087525wmb.12.1713518060295;
        Fri, 19 Apr 2024 02:14:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c716:f300:c9f0:f643:6aa2:16? (p200300cbc716f300c9f0f6436aa20016.dip0.t-ipconnect.de. [2003:cb:c716:f300:c9f0:f643:6aa2:16])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c358f00b00418ef96472asm4398962wmq.0.2024.04.19.02.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 02:14:19 -0700 (PDT)
Message-ID: <bcd887c8-9830-42ed-b43a-2fdaa11dc837@redhat.com>
Date: Fri, 19 Apr 2024 11:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/18] mm/rmap: always inline anon/file rmap
 duplication of a single PTE
To: "Yin, Fengwei" <fengwei.yin@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Peter Xu
 <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Richard Chang <richardycc@google.com>
References: <20240409192301.907377-1-david@redhat.com>
 <20240409192301.907377-3-david@redhat.com>
 <c5c2ae26-d405-4b0f-8bf6-281abcdb3239@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c5c2ae26-d405-4b0f-8bf6-281abcdb3239@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.04.24 04:25, Yin, Fengwei wrote:
> 
> 
> On 4/10/2024 3:22 AM, David Hildenbrand wrote:
>> As we grow the code, the compiler might make stupid decisions and
>> unnecessarily degrade fork() performance. Let's make sure to always inline
>> functions that operate on a single PTE so the compiler will always
>> optimize out the loop and avoid a function call.
>>
>> This is a preparation for maintining a total mapcount for large folios.
>>
>> Signed-off-by: David Hildenbrand<david@redhat.com>
> The patch looks good to me. Just curious: Is this change driven by code
> reviewing or performance data profiling? Thanks.

It was identified while observing an performance degradation with small 
folios in the fork() microbenchmark discussed in the cover letter 
(mentioned here as "unnecessarily degrade fork() performance").

The added atomic_add() was sufficient for the compiler not inline and 
optimize-out nr_pages, inserting a function call to a function where 
nr_pages is not optimized out.

-- 
Cheers,

David / dhildenb


