Return-Path: <linux-sh+bounces-2477-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223EA4D38E
	for <lists+linux-sh@lfdr.de>; Tue,  4 Mar 2025 07:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE8317A3D07
	for <lists+linux-sh@lfdr.de>; Tue,  4 Mar 2025 06:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E131F4E2F;
	Tue,  4 Mar 2025 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AUPfMz6H"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A81F4739
	for <linux-sh@vger.kernel.org>; Tue,  4 Mar 2025 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068698; cv=none; b=VQVgHMkKdWF+nDvcDV8HZ7h5I599pKGNXNJuwnO/Wi6Qwfm6ACOKIAC3aXev+s6492pPXvyPFTAOrxnqjAgdT3hri827PstSLyPYOkJB2dwkotiZvgvac8i/1/6IeKfB2/hrnnUkSP0demuNrJwuvIYKgMKNjYUhfJ/3s7dUELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068698; c=relaxed/simple;
	bh=xVZb2uxImUx0ECcSqYKHOxrGyYGp1I4gtxr8DYt1oOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEeKuCPrpUvu+n7YIhiYfHRuL0ioNLKR7dM4ZPIb4lZmbox/MfNFAVs9T5f/9STJCkCSQVsKxZoRarBvAmALZI6fLt9N9d7nMDh8kh5IHSXNBo/hRcEGBEDYPWn8mWzPIP/q6eeXapNMoXSdk4GQfRe9lV1BszVGOn/YIsE+SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AUPfMz6H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2233622fdffso99234445ad.2
        for <linux-sh@vger.kernel.org>; Mon, 03 Mar 2025 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741068696; x=1741673496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=AUPfMz6HBETFK4R0Mgs28jh2E0iSLs4SSEp7XTmoiALoDkS//Uy7h4hJbFXzCH3UcR
         lGIj13pM/OuDs+VBhkjVDmvJpWnMaiqk3LM4WUKgsyzn/uq3QVeTneYl9F5gefREB3Es
         UYCXiAMwlluep6lkTCQAPfgOCzsmZm86Hl+GwRNInToF+9pD95vYLhQ4ute8JQsrKTXi
         yBQXB2yWVOzjPbFf2j5JZnM+ScKcqEVfgVBLLa+05TxvwRCNF3TBP2jVaSOiI4nBuv33
         t27pXqg5Pf3y1O8teLeBXMcQc8bZr2I5Rv3DKEAWMgJUq9Uek4VgjicA9lYrdV/B9XMI
         3PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068696; x=1741673496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=R1TtaUbIwmMG2aaXuyIPFjgB+0ZttbFZUbU+6wV2sZl/YQB0TY1oLkWmpBj/I1MTY+
         UzqCH6rtOo3nQNBZCyVGuSK66BanXIr7rLhRgIolZCTK/Zq4w1FO6hQrCJ69OaoPVsOz
         CDs4pBqUOGd86wnuqyp9vYq/l4Tnq0bwXPLnnILWRG+3yL9a6bbfmhuGpJhKxexWlVd8
         /QnqNpYeFeVlmyr+kXmOz3+7ZEnVJHPVNbR62c05dodEqvjhb28dZbRPK3p9EMbStEGu
         VobmFGtywMpBCX/4h5G9UQi36cb4xb1f6W/tpLGj/ojGjHT0L9j7jWWzNZPXURYRMiBl
         u/GA==
X-Forwarded-Encrypted: i=1; AJvYcCWFjklVtSX42GsVge3UbxWEX+kjnGucVqjzyJKu8+4nGeWSvd0BK9oThhVSfIK52C2QrLC1y3hLmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwoi8+M+OtMU6545Eh66gvZ8Vu6kBQd6+/vog/qdCk/09ttzqg
	xvepNNP0LTW3mePAZiO5D+tPl/7u4GXHXwhNyuvHeY+vmH9Rp3SuSW0yQqgeJlA=
X-Gm-Gg: ASbGnctIspP5ISUfUxggkqTk17cb6nD9ZFJgh4oMtopISzhWH5+7ApPnSIFtLW526CM
	AGWiIPRoPLnYA0PuzxLR2OjpxFdQ2EU43zOSnXrWU4IrW/ZRYk4oNwiMJDZEHT2hv471QuwTM54
	+2p1ZzHVOlxcl3c4qxVnpPPnW4+h6LCMz3KLzJUISTzPM3OgtjHcQzwV84ue7kuX8UXcN60ssPP
	05NgY/JjnWzeD15clInnUbJrwQ9yQXsxlnFdGB6nZ+dJf5o4md+AuvEaTGCCA9q4s9M8tys2zDH
	2grWKEt7fLlalm+nDNNM3ABciNbPbCiKHbAdJ6RwrnLD7+VIkopvinrARfd47T0z7eF9
X-Google-Smtp-Source: AGHT+IEXDQyCMQ8sBrL+0HeKoJpZdetEfwPwd6LYj+c4cbVY5/CTPcBDN/0v1nn1xNdV90cajxorag==
X-Received: by 2002:a05:6a20:db0a:b0:1f3:40d3:67d4 with SMTP id adf61e73a8af0-1f340d369d8mr504424637.30.1741068695820;
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf23b6sm9305805a12.15.2025.03.03.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Message-ID: <7d1c834d-bc65-4979-9b72-0d1d91019501@bytedance.com>
Date: Tue, 4 Mar 2025 14:11:24 +0800
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6 update] mm: pgtable: convert some architectures to
 use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
 <20250303072603.45423-1-zhengqi.arch@bytedance.com>
 <20250303155331.de9b2fff9b04984a255a7bc2@linux-foundation.org>
 <c48715aa-8c1f-41bf-92a0-bacf401c2f7c@bytedance.com>
 <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/25 12:08 PM, Andrew Morton wrote:
> On Tue, 4 Mar 2025 10:31:07 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>
>>
>> On 3/4/25 7:53 AM, Andrew Morton wrote:
>>> On Mon,  3 Mar 2025 15:26:03 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>
>>>> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
>>>> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
>>>> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
>>>> tlb_remove_page()). This is the same as the implementation of
>>>> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
>>>> convert these architectures to use tlb_remove_ptdesc().
>>>>
>>>
>>> checkpatch warns.
>>>
>>> Do these things have to be macros?  Switching to static inline fixes
>>> the unused-arg warning in a nice fashion.
>>
>> This can be switched to static inline. In addition, I found that alpha,
>> arc, microblaze, parisc, sparc32 and xtensa also have the unused-arg
>> issue. Do I need to add a new patch to fix all of them, or just fix the
>> newly added 11 warnings?
> 
> I guess leave things as they are now.  Switching all these to C
> functions can be addressed at a later time?

Okay, let's leave it for later.




