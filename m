Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4507E3A11A7
	for <lists+linux-sh@lfdr.de>; Wed,  9 Jun 2021 12:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238461AbhFIKyb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 9 Jun 2021 06:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56681 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236142AbhFIKyM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 9 Jun 2021 06:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623235937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
        b=fjJX8TmHM2wHWrwMYmipcfiBYoO3vOPHqHS7Eg5Q/yifzZXcfnPwQmQLnXx5c6I28Fo1Jd
        GH7pV8Cjh1F8PROqoc/wIKBkFejYzaLuOZAw5pT5aL6nysgtUv1zD6tNuFdkXKjpcEdirA
        BK014ZLHAzgGGTzmp/kjcCmij6v5hMU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-JWRpNVMnO1OQeKY32ZHvpg-1; Wed, 09 Jun 2021 06:52:14 -0400
X-MC-Unique: JWRpNVMnO1OQeKY32ZHvpg-1
Received: by mail-wr1-f69.google.com with SMTP id g14-20020a5d698e0000b0290117735bd4d3so10489395wru.13
        for <linux-sh@vger.kernel.org>; Wed, 09 Jun 2021 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
        b=k3cEsJDX2wI0jpAPksXzF7htfhrjRhucxSbMb4t9lZoDFL2x78Y2uzlb2tgGn0GINS
         03W9aUL+q9jleHhI0OJSTawaJGYo0wA8L6f5gf5Dt7yw+rMtFUfPlwQOGNtxDY/KOyCT
         +sjJ8uIgaFMfnYpC/a7SJw5eujBTNLHIJuEvfyowr3EP3o0p1moXx3V0wJ0Gb5urNEnB
         ASeRu58nu2beErXsr39s5WJ01xMLtcmbpjX/cUgyVJP28gogExksUfLY78R55bVOwTZ+
         RUeUuyWnuZ8eU4ZmFRqemNHXy754vG0dKCwfgZS/BOK/qYJYw3hcT0IrHN8EJTBh1LV7
         hj9g==
X-Gm-Message-State: AOAM530Rd6+0ZN4ubM29ZRK06iNeWmBGlQ6NpJHxjkfhR1u6mesL9JW3
        OqCRhKRDm7t47y3UEpnuBP4WIx1XLuoqAQvQZiTC1/Fr/FU89s+6bZnXvcxDAvCiNrLGSVLQMfX
        gBnMkvv/Of9XWZa7cS0Q=
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr26528248wmm.156.1623235933484;
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOhpm0kR/qb02GnRlZAdwrQqqdavzoWPuk2BGBrMztminfq9lmdrK+j2M/FH+Xh9QtwaeMHg==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr26528228wmm.156.1623235933268;
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id 89sm25391165wrq.14.2021.06.09.03.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Subject: Re: [PATCH 2/9] arc: update comment about HIGHMEM implementation
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-3-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2764dca8-f395-f76a-0939-215eccdfd82e@redhat.com>
Date:   Wed, 9 Jun 2021 12:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-3-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Arc does not use DISCONTIGMEM to implement high memory, update the comment
> describing how high memory works to reflect this.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/arc/mm/init.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index e2ed355438c9..397a201adfe3 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
>   
>   #ifdef CONFIG_HIGHMEM
>   	/*
> -	 * Populate a new node with highmem
> -	 *
>   	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
> -	 * than addresses in normal ala low memory (0x8000_0000 based).
> +	 * than addresses in normal aka low memory (0x8000_0000 based).
>   	 * Even with PAE, the huge peripheral space hole would waste a lot of
> -	 * mem with single mem_map[]. This warrants a mem_map per region design.
> -	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
> -	 *
> -	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
> -	 * populated with normal memory zone while node 1 only has highmem
> +	 * mem with single contiguous mem_map[].
> +	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
> +	 * to the hole is freed and ARC specific version of pfn_valid()
> +	 * handles the hole in the memory map.
>   	 */
>   #ifdef CONFIG_DISCONTIGMEM
>   	node_set_online(1);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

