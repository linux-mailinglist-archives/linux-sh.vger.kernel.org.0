Return-Path: <linux-sh+bounces-501-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D93AF86F8B7
	for <lists+linux-sh@lfdr.de>; Mon,  4 Mar 2024 03:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6710C1F214BD
	for <lists+linux-sh@lfdr.de>; Mon,  4 Mar 2024 02:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B636A1FAA;
	Mon,  4 Mar 2024 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxA5/NQR"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5A1854
	for <linux-sh@vger.kernel.org>; Mon,  4 Mar 2024 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520855; cv=none; b=IEL6r8wAF+xwcQI/h8e9eS8jVH0kXV2K0p8mFqRWAoyLg8wJnJ2IPUpfBzWyIgnYm2CJ+VNBgY0iKV8MUgTFaKVi5bCncrL4hsCSvAwN7Xh38/Am8CECQDRB8QLLpycEHWnbaup1p4kniAE9m+LANkKYYEduiyo67xUm8kt2ZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520855; c=relaxed/simple;
	bh=xdSiMK7kjjGZRlGul3QgzLnwYbT1W966o/MZNoy7N9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVEv4fsJqPXL/l6C4VbMSJheluXUDsOE08n1WUiOnA2I4LDW8EBLBGIaAy7/ZMV9z7fBK4jj7FedVDjfUSDmidU+MMklEDhuIfvf4m8uLcSE8D+MwAKNEvcr4AJlI0LxywdXvmzyFw0cPY3U7G9/PrkVdX+xHKEFXreZIbsuZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxA5/NQR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709520852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUCvEG7ZPFwX6+W3DZtnUtBmleJUDEj8UA3febVhuUw=;
	b=YxA5/NQR3VmtFQu5ULCj2HOqydiTcWRIj4Kr1W9qDzfKQljO8ewIn/ZqNENBWweIgrZvfq
	hrxMhiHNhsoWEPf2omI2Usc4kzwL0rulC3oKEaIdmBGKRStK44NF3SOsUobZJ2NiIsgg1r
	osIYThKCXRgwo2TdO0Lt82R+cAPt9LI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-eDWbzhTBMrCNWuWvzMiDrw-1; Sun,
 03 Mar 2024 21:54:07 -0500
X-MC-Unique: eDWbzhTBMrCNWuWvzMiDrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 432FB1C060C8;
	Mon,  4 Mar 2024 02:54:07 +0000 (UTC)
Received: from [10.22.16.80] (unknown [10.22.16.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B789B1121313;
	Mon,  4 Mar 2024 02:54:06 +0000 (UTC)
Message-ID: <fad87131-8952-4c67-9208-e7c4683c0234@redhat.com>
Date: Sun, 3 Mar 2024 21:54:06 -0500
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC] locking/spinlocks: Make __raw_* lock ops static
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>
References: <c395b02613572131568bc1fd1bc456d20d1a5426.1709325647.git.geert+renesas@glider.be>
 <87fe0004-0e53-4b7a-b19d-c6b37c8db8dc@redhat.com>
 <CAMuHMdX+mpc5++8h4oM98FTPAdV-c8TzscTQA095Wzssae6amg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAMuHMdX+mpc5++8h4oM98FTPAdV-c8TzscTQA095Wzssae6amg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3


On 3/3/24 11:11, Geert Uytterhoeven wrote:
> Hi Waiman,
>
> CC s390
>
> On Sun, Mar 3, 2024 at 5:25 AM Waiman Long <longman@redhat.com> wrote:
>> On 3/1/24 15:43, Geert Uytterhoeven wrote:
>>> sh/sdk7786_defconfig (CONFIG_GENERIC_LOCKBREAK=y and
>>> CONFIG_DEBUG_LOCK_ALLOC=n):
>>>
>>> kernel/locking/spinlock.c:68:17: warning: no previous prototype for '__raw_spin_lock' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:80:26: warning: no previous prototype for '__raw_spin_lock_irqsave' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:98:17: warning: no previous prototype for '__raw_spin_lock_irq' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:103:17: warning: no previous prototype for '__raw_spin_lock_bh' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:68:17: warning: no previous prototype for '__raw_read_lock' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:80:26: warning: no previous prototype for '__raw_read_lock_irqsave' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:98:17: warning: no previous prototype for '__raw_read_lock_irq' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:103:17: warning: no previous prototype for '__raw_read_lock_bh' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:68:17: warning: no previous prototype for '__raw_write_lock' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:80:26: warning: no previous prototype for '__raw_write_lock_irqsave' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:98:17: warning: no previous prototype for '__raw_write_lock_irq' [-Wmissing-prototypes]
>>> kernel/locking/spinlock.c:103:17: warning: no previous prototype for '__raw_write_lock_bh' [-Wmissing-prototypes]
>>>
>>> Fix this by making the __raw_* lock ops static.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Compile-tested only.
>>>
>>> Is SH really the only SMP platform where CONFIG_GENERIC_LOCKBREAK=y?
>>> ---
>>>    kernel/locking/spinlock.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
>>> index 8475a0794f8c5ad2..7009b568e6255d64 100644
>>> --- a/kernel/locking/spinlock.c
>>> +++ b/kernel/locking/spinlock.c
>>> @@ -65,7 +65,7 @@ EXPORT_PER_CPU_SYMBOL(__mmiowb_state);
>>>     * towards that other CPU that it should break the lock ASAP.
>>>     */
>>>    #define BUILD_LOCK_OPS(op, locktype)                                        \
>>> -void __lockfunc __raw_##op##_lock(locktype##_t *lock)                        \
>>> +static void __lockfunc __raw_##op##_lock(locktype##_t *lock)         \
>>>    {                                                                   \
>>>        for (;;) {                                                      \
>>>                preempt_disable();                                      \
>>> @@ -77,7 +77,7 @@ void __lockfunc __raw_##op##_lock(locktype##_t *lock)                       \
>>>        }                                                               \
>>>    }                                                                   \
>>>                                                                        \
>>> -unsigned long __lockfunc __raw_##op##_lock_irqsave(locktype##_t *lock)       \
>>> +static unsigned long __lockfunc __raw_##op##_lock_irqsave(locktype##_t *lock) \
>>>    {                                                                   \
>>>        unsigned long flags;                                            \
>>>                                                                        \
>>> @@ -95,12 +95,12 @@ unsigned long __lockfunc __raw_##op##_lock_irqsave(locktype##_t *lock)    \
>>>        return flags;                                                   \
>>>    }                                                                   \
>>>                                                                        \
>>> -void __lockfunc __raw_##op##_lock_irq(locktype##_t *lock)            \
>>> +static void __lockfunc __raw_##op##_lock_irq(locktype##_t *lock)     \
>>>    {                                                                   \
>>>        _raw_##op##_lock_irqsave(lock);                                 \
>>>    }                                                                   \
>>>                                                                        \
>>> -void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)             \
>>> +static void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)              \
>>>    {                                                                   \
>>>        unsigned long flags;                                            \
>>>                                                                        \
>> This may not work if CONFIG_GENERIC_LOCKBREAK is defined. We had been
> sdk7786_defconfig sets CONFIG_GENERIC_LOCKBREAK=y?
>
> FTR, I checked all defconfigs, and it's set in three of them:
>    - s390/debug_defconfig
>    - sh/sdk7786_defconfig
>    - sh/shx3_defconfig
>
> However, the first one has CONFIG_DEBUG_LOCK_ALLOC=y, so the issue
> does not trigger there (but see below).

I was worrying about any of the INLINE_*_LOCK* config being turned on. 
It turns out that setting GENERIC_LOCKBREAK will not allow those locking 
functions to be inlined. So my concern is not warranted.

With that, I think your patch should be safe.

Acked-by: Waiman Long <longman@redhat.com>

It will be nice if you can document that either in the change log or in 
a comment.

Still the lock-break lock variants are simple TaS locks with preemption 
turned on in between successive attempts to acquire the lock. It will be 
slow and is only suitable for system with small number of cores. The 
long term goal should be to get rid of these variants and 
CONFIG_GENERIC_LOCKBREAK if possible.

Cheers,
Longman


