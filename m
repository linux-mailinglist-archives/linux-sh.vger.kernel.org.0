Return-Path: <linux-sh+bounces-2480-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B7A4EC34
	for <lists+linux-sh@lfdr.de>; Tue,  4 Mar 2025 19:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9235E8C76B7
	for <lists+linux-sh@lfdr.de>; Tue,  4 Mar 2025 17:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA9428D067;
	Tue,  4 Mar 2025 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f4A84WM5"
X-Original-To: linux-sh@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07828D052
	for <linux-sh@vger.kernel.org>; Tue,  4 Mar 2025 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109432; cv=pass; b=SFW8UggnewlP2g3MvMYTRTxx30JTc5n83NKYZzOeP8uAkUh9KIasf3f/woCOXZKrg1854R6JXT/R7KCVy5laqMUcKgncX1klJiU75J7+Ny8V9bcxVJ7l1N9eX71/pnFzAfN4tyzib2l+ayoEgkWbm31upCoOt2keTcLCjVL4Cvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109432; c=relaxed/simple;
	bh=cyZ+Grt5WsWeJ35wJ4Miw4zucqCOoTXmPw42CecotaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFZn0QPoQcoh0EGVO0baMGZRYwEoPhwV4YpUo23sxscLLmCK2YbdaRmXAiTV06LDy8LV7Xlo+8dSMmx9rXBKT7fOf3mtzksZE3SWl7scwcLGRD5T5oLRDMQwRTeSPBlhPmXA6le0ohA+XkVBYWWbROxjYRP/XEa8Ywl8q30Xt80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f4A84WM5; arc=none smtp.client-ip=209.85.214.179; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id D823E40CECAA
	for <linux-sh@vger.kernel.org>; Tue,  4 Mar 2025 20:30:28 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f4A84WM5
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6h936qP2zG3gF
	for <linux-sh@vger.kernel.org>; Tue,  4 Mar 2025 19:34:31 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 9A83642722; Tue,  4 Mar 2025 19:34:14 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f4A84WM5
X-Envelope-From: <linux-kernel+bounces-541082-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f4A84WM5
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id DDE1C41FB2
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:15:59 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 74D462DCE5
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:15:59 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2628E3A8BAF
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424711EA7D7;
	Mon,  3 Mar 2025 07:15:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66D1E501C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986140; cv=none; b=UbnP8lXiaQbal6oVevUpUADIzn+VfpnWPHvmdOCVnmWZhIGKQlH2D8gZGwYBRcvHyDHqu0/9g5vOStcBO5fOg6iL8ck1ZEKXcO7wZV6sBgF13Zwmy7mWeHY2buU9xbgXzvLVQv+gOBYks7o07mEq/9LWCD1Wg2klKJlnbyMoNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986140; c=relaxed/simple;
	bh=cyZ+Grt5WsWeJ35wJ4Miw4zucqCOoTXmPw42CecotaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRHG4qa/A2btEukAcWzbjJwg8W8Kuoy+iOpGKDgvIPrQPOvexp0JvX6PQ9NOi4wb+XpZdVNwFT7YEmXa8FprlkpYnsJ/280Fjl9f9KWQyMG0e75rigIsBwLOMuSYfr3NAxpVVbowAHhb2fI5CXJiYNwj8zH8qxq5j+TmQJBu93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f4A84WM5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so17245755ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Mar 2025 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986137; x=1741590937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=f4A84WM5UBmOEItKzAifDxDy7QSqQog+5OdOY7cDip+Ifi/SFUtojaXd3nv9N46OkR
         obbn8XiDHfPwzOhP+v9F4yJio5kY6Fy6S6Dij4j9DhRO+gigEV2oQ1XDcdtvMOTvOPmE
         WpuxN3y1/iFpfhe6FIe7LgfmoW5WjaSdqf2obCSIVsNV4KU9GPJlIYbIQ+dtrHsEz8Qj
         obAsvIJ84Xaa/DfhJQP52pW8eNlzAzvKCu3ybiqdRykVPzSYIGvK4+hUWmRrrn+BPGQx
         E1zuno2Ug6TvBtzOsf/XTEeGekcF2JdKNte3lMVXw8TZSOU37BEEcnrYWZ+wVCIGz6FH
         p2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986137; x=1741590937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=V6hTYAc13n2GGK2+V+SYXFc83ibjM/YRGmA85UVw/yGr+iafh+3DpguMAsi44Msrak
         Rc8lm9ifmmy+sf3mGvgr1B6wy0DSn5kV6+sYKMFFiC6kWfir/ELsvw7O3ebFT4/plNiF
         8VLsjaDXmihAF7lP1xahofPIborwDagJoeqfFyIPApmAfp7gKKu7/jyr7kWInzYCWJvz
         tEHAGLO/EPMfvDII9FwTBJg5WgCxwX3vAHK37a5EMCQjkFnyssyH7780oACaE4iWtmgC
         +La9TQjcG6evTdCAUkXIEZpfrIPEs3atLIXnyaE+ggB3rnlfr/JI56QmixhSfJXam/Lh
         YjDA==
X-Forwarded-Encrypted: i=1; AJvYcCXV3cRahDZLx9qw+XI6/hjlxWyx70R9mfe5cEgYOUph0I/3/IsNXrH29p57t2dLEKBH3UNpJLJ1eCWtAjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvdm1NGx4aZ13CwRnIA6mERBF2EhXuLaggrV/Auc1FC6cvuVo
	nr2bUITGBfheIL8uAXqZVvRA5x9ihLF7WSS+9emZB+17rhn4T5FIKHgFHOXL8+s=
X-Gm-Gg: ASbGncsJj56blywHiCfNcdRwIByWd/2pab06AUHQujSwG0fw+d8p0GhjeGLweBP+D0y
	sSNkGjA5UjlQjqdO/ANFgkIpC0WSYzqF9MQQDsUVX43qcaMTZQL+SQl/71Lh/k5Jbg+7HBmMmp6
	zUdUKTfBt8j8ZvcqQB1fbb0hY6oWdE4AeLfKH1k3g8dPgnVNU3VpqAxKa0VW0nOsqM5dIykEGcQ
	pUIM6SFTykv4DIOsXjqSKPUAVnmwWEGgrNKYb5ERb5X69TPTg5el5kkUdu6DBARPQVMnn+czTlD
	D3uEIf7EpqssocI08pKOapluzWZlNpps8uMQ5ZjOSnA7iJAev11JKMJVox4/FCOo0EVH1g==
X-Google-Smtp-Source: AGHT+IFFzAQLESy+9XTrR371K4l9s8+Ug8zXVzf/oXiEIXCRNjxwSBTp4Oh3Iq6eaMxuwqzsZm0CFA==
X-Received: by 2002:a17:902:f64a:b0:223:5645:8e1a with SMTP id d9443c01a7336-2236926727dmr181629675ad.51.1740986137075;
        Sun, 02 Mar 2025 23:15:37 -0800 (PST)
Received: from [10.68.122.90] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050ce10sm71093955ad.200.2025.03.02.23.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:15:36 -0800 (PST)
Message-ID: <4eb93ca8-7526-4709-b43e-2ed9e5583e3b@bytedance.com>
Date: Mon, 3 Mar 2025 15:15:22 +0800
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] riscv: pgtable: unconditionally use
 tlb_remove_ptdesc()
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
 <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6h936qP2zG3gF
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714106.3744@LY02P80fJkhWf9b4NCME8w
X-ITU-MailScanner-SpamCheck: not spam



On 3/3/25 9:45 AM, yunhui cui wrote:
> Hi Qi,
> 

[...]

>>
>>
> 
> This set of patches mainly refactors the remove page table function
> interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
> was no longer needed, and this patch handles that.
> 
> Additionally, whether riscv_use_sbi_for_rfence is true or false, page
> tables can now be released using RCU. This patch changes the previous
> synchronous release logic (for !riscv_use_sbi_for_rfence) to an
> RCU-based release.
> 
> So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> Based on qemu-system-riscv64, I tested this patch. The log is as follows:
> ./gup_test
> TAP version 13
> 1..1
> # GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
> # ok 1 ioctl status 0
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Nice.

> 
> So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thank you very much for your review and testing!

> 
> Thanks,
> Yunhui



