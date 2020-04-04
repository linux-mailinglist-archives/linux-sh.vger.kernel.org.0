Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E817719E1E9
	for <lists+linux-sh@lfdr.de>; Sat,  4 Apr 2020 02:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgDDAWm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 3 Apr 2020 20:22:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:47055 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDDAWm (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 3 Apr 2020 20:22:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id 111so9194392oth.13
        for <linux-sh@vger.kernel.org>; Fri, 03 Apr 2020 17:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=mG3BApSICiEBPUMNYxdFHhDK4Mdu1a5MhYUNuh3ULto=;
        b=DpZRHZK011WAnOpFkyaDVfeTNIXvBCq6/gHinifM8iUa/ocnpxxiorZ0aR8w9V9wlc
         dXmiPrMm24Ug89UdW8yzP2GefIhmvhCBwN9L1wGiP2+Q03txDb8vc73wuRHTOhMGf1gB
         D95QNQtknmFCAYfNIy7nblqbwNCZF4oEyX4SCj08GSQ5GbgcfP6eTP4/5KReFOI0plGP
         J5ftyA5CurTdHQYW7lQwDdtHIO1gVNlnRnu2DMKJf4dnarDU3bUqHCnxVnFdcE7K/VtX
         nXKxWtWaY6a46yiYS5G4QYrLyYmWkXTAHqro9DOi0oiqWkucixk+KaFsL///5VhCCOkQ
         H+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=mG3BApSICiEBPUMNYxdFHhDK4Mdu1a5MhYUNuh3ULto=;
        b=ZcLibI8lzqHB0y02Be8QQrPcF7iSBogkMAi/Kj2m9KSk7faj3PWiml3PRtygwlup2A
         gMkgSp/gKlZZ7C6yTRAr/Eyo3i2Lh/Gs6QiWyE0yvNJ894Y+uINyADLieJGtRGo5e4H/
         Ei4PKIYjNT+vwezS0cyRSMxdXHqVyIhvOiwG8JcPgBuLNLM0Ofhew5opaRX9hSJn71DZ
         CiBNWgXztRcOm0D2+0ZxAbxg/SkdA0gnoV/KZrarX4MYcZfRDf4jXh8wRK5Ws+AOYytb
         QYk30f24HP/Br4iP4TIMiXmJ/4A+QsH0F1zFsMshRPXumrRl+fx5YMzLKTHDqxtIhd0u
         jEtg==
X-Gm-Message-State: AGi0PuZW8ahjwKU+mmCRAv418w0TFcxmDBkywUgooYu00wpLLBmMkKjV
        rLTolBjAlisFPejkoVj3KLWLwYoHKvE=
X-Google-Smtp-Source: APiQypLFRXFDPjLaO0kLK0N0Cz4AUR0wWLKkDHTEYT49x0YrB0vvxRsXFUOfec5EowZHSeMe4sBHLQ==
X-Received: by 2002:a05:6830:4035:: with SMTP id i21mr8052573ots.348.1585959761121;
        Fri, 03 Apr 2020 17:22:41 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id f3sm2514761ooq.9.2020.04.03.17.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 17:22:40 -0700 (PDT)
Subject: Re: v5.6 is still throwing a stack trace on boot.
To:     Rich Felker <dalias@libc.org>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
References: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
 <20200404000730.GE11469@brightrain.aerifal.cx>
From:   Rob Landley <rob@landley.net>
Message-ID: <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
Date:   Fri, 3 Apr 2020 19:28:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200404000730.GE11469@brightrain.aerifal.cx>
Content-Type: multipart/mixed;
 boundary="------------68AFB16041F79F84DC60FB2B"
Content-Language: en-US
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This is a multi-part message in MIME format.
--------------68AFB16041F79F84DC60FB2B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 4/3/20 7:07 PM, Rich Felker wrote:
> On Fri, Apr 03, 2020 at 06:49:00PM -0500, Rob Landley wrote:
>> Run /init as init process
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at mm/slub.c:2468 ___slab_alloc.constprop.0+0x1f0/0x290
>>
>> CPU: 0 PID: 1 Comm: swapper Not tainted 5.6.0 #2
>> PC is at ___slab_alloc.constprop.0+0x1f0/0x290
>> PR is at __slab_alloc.constprop.0+0x2e/0x54
>> PC  : 8c0a76c4 SP  : 8f829ea0 SR  : 400080f0
>> TEA : c0001240
>> R0  : 8c0a74d4 R1  : 00000100 R2  : 00000100 R3  : 00000000
>> R4  : 8f8020a0 R5  : 00000dc0 R6  : 8c01d678 R7  : 8fff5180
>> R8  : 8f8020a0 R9  : 8fff5180 R10 : 8c01d678 R11 : 80000000
>> R12 : 00007fff R13 : 00000dc0 R14 : 8f8020a0
>> MACH: 0000008b MACL: 0ae4849d GBR : 00000000 PR  : 8c0a7792
>>
>> Call trace:
>>  [<(ptrval)>] mm_alloc+0xe/0x48
>>  [<(ptrval)>] do_IRQ+0x0/0x50
>>  [<(ptrval)>] __slab_alloc.constprop.0+0x2e/0x54
>>  [<(ptrval)>] arch_local_irq_restore+0x0/0x24
>>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
>>  [<(ptrval)>] kmem_cache_alloc+0xd0/0x15c
>>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
>>  [<(ptrval)>] mm_init.isra.0+0xdc/0x138
>>  [<(ptrval)>] memset+0x0/0x8c
>>  [<(ptrval)>] __do_execve_file+0x22e/0x5d8
>>  [<(ptrval)>] kmem_cache_alloc+0x0/0x15c
>>  [<(ptrval)>] do_execve+0x16/0x24
>>  [<(ptrval)>] arch_local_irq_restore+0x0/0x24
>>  [<(ptrval)>] printk+0x0/0x24
>>  [<(ptrval)>] kernel_init+0x34/0xe8
>>  [<(ptrval)>] ret_from_kernel_thread+0xc/0x14
>>  [<(ptrval)>] schedule_tail+0x0/0x5c
>>  [<(ptrval)>] kernel_init+0x0/0xe8
>>
>> ---[ end trace 76213c1325250d90 ]---
> 
> Which hardware is this on? The qemu emulated board you're using?

Yes, qemu -M r2d. Built with attached miniconf, and run via:

qemu-system-sh4 -M r2d -serial null -serial mon:stdio -nographic -no-reboot \
  -m 256 -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" -kernel zImage \
  -initrd sh4.cpio.gz

Rob

--------------68AFB16041F79F84DC60FB2B
Content-Type: text/plain; charset=UTF-8;
 name="sh4.miniconf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="sh4.miniconf"

IyBtYWtlIEFSQ0g9c2ggYWxsbm9jb25maWcgS0NPTkZJR19BTExDT05GSUc9c2g0Lm1pbmlj
b25mCiMgbWFrZSBBUkNIPXNoIC1qICQobnByb2MpCiMgYm9vdCBhcmNoL3NoL2Jvb3Qveklt
YWdlCgoKQ09ORklHX0NQVV9TVUJUWVBFX1NINzc1MVI9eQpDT05GSUdfTU1VPXkKQ09ORklH
X01FTU9SWV9TVEFSVD0weDBjMDAwMDAwCkNPTkZJR19WU1lTQ0FMTD15CkNPTkZJR19TSF9G
UFU9eQpDT05GSUdfU0hfUlRTNzc1MVIyRD15CkNPTkZJR19SVFM3NzUxUjJEX1BMVVM9eQpD
T05GSUdfU0VSSUFMX1NIX1NDST15CkNPTkZJR19TRVJJQUxfU0hfU0NJX0NPTlNPTEU9eQoK
Q09ORklHX1BDST15CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQpDT05GSUdfODEzOUNQ
PXkKCkNPTkZJR19QQ0k9eQpDT05GSUdfQkxLX0RFVl9TRD15CkNPTkZJR19BVEE9eQpDT05G
SUdfQVRBX1NGRj15CkNPTkZJR19BVEFfQk1ETUE9eQpDT05GSUdfUEFUQV9QTEFURk9STT15
CgojQ09ORklHX1NQST15CiNDT05GSUdfU1BJX1NIX1NDST15CiNDT05GSUdfTUZEX1NNNTAx
PXkKCiNDT05GSUdfUlRDX0NMQVNTPXkKI0NPTkZJR19SVENfRFJWX1I5NzAxPXkKI0NPTkZJ
R19SVENfRFJWX1NIPXkKI0NPTkZJR19SVENfSENUT1NZUz15CgoKIyBDT05GSUdfRU1CRURE
RUQgaXMgbm90IHNldApDT05GSUdfRUFSTFlfUFJJTlRLPXkKQ09ORklHX0JJTkZNVF9FTEY9
eQpDT05GSUdfQklORk1UX1NDUklQVD15CkNPTkZJR19OT19IWj15CkNPTkZJR19ISUdIX1JF
U19USU1FUlM9eQoKQ09ORklHX0JMS19ERVY9eQpDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQpD
T05GSUdfUkRfR1pJUD15CgpDT05GSUdfQkxLX0RFVl9MT09QPXkKQ09ORklHX0VYVDRfRlM9
eQpDT05GSUdfRVhUNF9VU0VfRk9SX0VYVDI9eQpDT05GSUdfVkZBVF9GUz15CkNPTkZJR19G
QVRfREVGQVVMVF9VVEY4PXkKQ09ORklHX01JU0NfRklMRVNZU1RFTVM9eQpDT05GSUdfU1FV
QVNIRlM9eQpDT05GSUdfU1FVQVNIRlNfWEFUVFI9eQpDT05GSUdfU1FVQVNIRlNfWkxJQj15
CkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBGU19NT1VOVD15CkNPTkZJR19UTVBG
Uz15CkNPTkZJR19UTVBGU19QT1NJWF9BQ0w9eQoKQ09ORklHX05FVD15CkNPTkZJR19QQUNL
RVQ9eQpDT05GSUdfVU5JWD15CkNPTkZJR19JTkVUPXkKQ09ORklHX0lQVjY9eQpDT05GSUdf
TkVUREVWSUNFUz15CiNDT05GSUdfTkVUX0NPUkU9eQojQ09ORklHX05FVENPTlNPTEU9eQpD
T05GSUdfRVRIRVJORVQ9eQoK
--------------68AFB16041F79F84DC60FB2B--
