Return-Path: <linux-sh+bounces-884-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3608AAB54
	for <lists+linux-sh@lfdr.de>; Fri, 19 Apr 2024 11:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF7E1F226ED
	for <lists+linux-sh@lfdr.de>; Fri, 19 Apr 2024 09:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DF97A15C;
	Fri, 19 Apr 2024 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKt/sl2V"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725E7641E
	for <linux-sh@vger.kernel.org>; Fri, 19 Apr 2024 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518396; cv=none; b=ZD6LMCnZ8yjTbfibGLx4CC0B5ISM4uZjcFjU7CA8KCfPXv03Jvb93Lg0UTahH48rcAmpg+2+JXFCljlK32o5hhspkzAQlumgPBJ16DmdcwWyygsgw52SXfv/5LmC84dG8WrKlKlwYD9Nv/opwsmay3KUjXfMxwSyKTJKVuiN7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518396; c=relaxed/simple;
	bh=h9BYhlKg+vumdt1ARoFTJU+t44ZUoUKysyc8mq2QlNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEDynzNw7FFtliaJIcZKvMxzFKv6QNVbqFirby3q+AgdMVpWLXOAgWsYE6IfeDX3Gi3DuFKm4rSsbMaiat2fZH39hR2ej3GR3q42q0nFjdalwTZhnELuzSJJoeoEv0kkTelrzXJoMOP/CrOFuC8QB4QaCK7+/7Xp/poPu0XLUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKt/sl2V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713518394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vBx7bZBlgkTdQZODtbhF/Nyidu5C3R6hcUpumcfFwlE=;
	b=OKt/sl2VfLGC7ii7bDAliS4tQO3lJ5/0GRXCJ1NBUW/jdtk0KV2LXd3vk+bpfTeH1hc3oO
	2QRUXiB51r8h/NmkpUyLuDggKX5PnPs280rm5Cd96q1PQf1ZHpfFUEn7gJzX99x5n84yhI
	6bg4Mh/K+QLFjy/TNBvtZTE7pRKciuU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-8PXZtOmVOeqfzSd-K_P5RQ-1; Fri, 19 Apr 2024 05:19:52 -0400
X-MC-Unique: 8PXZtOmVOeqfzSd-K_P5RQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-346c08df987so1017348f8f.0
        for <linux-sh@vger.kernel.org>; Fri, 19 Apr 2024 02:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518391; x=1714123191;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBx7bZBlgkTdQZODtbhF/Nyidu5C3R6hcUpumcfFwlE=;
        b=UbP63gFH9Mwux6EUSbMxBUnOdgSrdsDDLIOp6Y36gq0C/r5cXmZfLU67jioWnLdaLx
         evkG/zuW/C5eM1Rk5TDxEt1k0BJizs3iPI61pFw3IISHo2PSdqvJd3CAc3YcJ6unHKZ3
         b9oOm/7QJ68zy22WZ3OEmO+towr4xWzkJk4bdDgMLPhQg1XnGHrJxXT/PBnK8gzqLrqn
         f+kWUghGeZ/N+IpPMhGP+ed5FiQxMC6JZlrfMOH45+ljV9/mhR/HYH2JdDL2qbsz9Cyx
         bOvSNkX2rZ0CqBHOUUETs1yTLn0ObIubGSJzeTIexNdqmF2zKe98P2T5wr3VXU7wIlhs
         VJMw==
X-Forwarded-Encrypted: i=1; AJvYcCVY9s7nv6XiuCEycRUEb7kPn/Q80QRGU4oOJ53UOB5KkfKsrvEznku+oXarxkMDGOQcLV22cwE+Uw+emO2MhLj925KM2h1ybN8=
X-Gm-Message-State: AOJu0YxNIeonLwp/avCN+3N+o+HJBO9AJ0PDa64C3VRy7CrSXLSIbylp
	bhvm83Wqmj4BEI0BP/ROsde5tqhtvnkuTKSVdr8Dhj5tM74SWTr+rKW+iU7+QC8PuL97KQD9WH/
	5cGrMYbiYxG1+vEC2MIiaAMF0CPtOqQlATzFSWlyGvPSpPDt984DcObbQ
X-Received: by 2002:adf:f1ca:0:b0:348:cd2c:d2fe with SMTP id z10-20020adff1ca000000b00348cd2cd2femr1318287wro.13.1713518391693;
        Fri, 19 Apr 2024 02:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdgPxrnSjfa5aRbxskK70u5lHmtIZqomcgKmujnOgZiEWjrwgS65s7JSljRGJ+B1tJFoKB3Q==
X-Received: by 2002:adf:f1ca:0:b0:348:cd2c:d2fe with SMTP id z10-20020adff1ca000000b00348cd2cd2femr1318261wro.13.1713518391167;
        Fri, 19 Apr 2024 02:19:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c716:f300:c9f0:f643:6aa2:16? (p200300cbc716f300c9f0f6436aa20016.dip0.t-ipconnect.de. [2003:cb:c716:f300:c9f0:f643:6aa2:16])
        by smtp.gmail.com with ESMTPSA id e5-20020adfe385000000b003455e5d2569sm4015124wrm.0.2024.04.19.02.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 02:19:50 -0700 (PDT)
Message-ID: <7a8eb8c0-35e5-4f45-bdd5-11a775ae752d@redhat.com>
Date: Fri, 19 Apr 2024 11:19:49 +0200
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/18] mm: improve folio_likely_mapped_shared() using
 the mapcount of large folios
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
 <20240409192301.907377-6-david@redhat.com>
 <b05cdac2-84f2-4727-af6c-3b666e6add14@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b05cdac2-84f2-4727-af6c-3b666e6add14@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.04.24 04:29, Yin, Fengwei wrote:
> 
> 
> On 4/10/2024 3:22 AM, David Hildenbrand wrote:
>> @@ -2200,7 +2200,22 @@ static inline size_t folio_size(struct folio *folio)
>>     */
>>    static inline bool folio_likely_mapped_shared(struct folio *folio)
>>    {
>> -	return page_mapcount(folio_page(folio, 0)) > 1;
>> +	int mapcount = folio_mapcount(folio);
>> +
>> +	/* Only partially-mappable folios require more care. */
>> +	if (!folio_test_large(folio) || unlikely(folio_test_hugetlb(folio)))
>> +		return mapcount > 1;
> My understanding is that mapcount > folio_nr_pages(folio) can cover
> order 0 folio. And also folio_entire_mapcount() can cover hugetlb (I am
> not 100% sure for this one).  I am wondering whether we can drop above
> two lines? Thanks.

folio_entire_mapcount() does not apply to small folios, so we must not 
call that for small folios.

Regarding hugetlb, subpage mapcounts are completely unused, except 
subpage 0 mapcount, which is now *always* negative (storing a page type) 
-- so there is no trusting on that value at all.

So in the end, it all looked cleanest when only special-casing on 
partially-mappable folios where we know the entire mapcount exists and 
we know that subapge mapcount 0 actually stores something reasonable 
(not a type).

Thanks!

-- 
Cheers,

David / dhildenb


