Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F9D31C8D9
	for <lists+linux-sh@lfdr.de>; Tue, 16 Feb 2021 11:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhBPKcM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 16 Feb 2021 05:32:12 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:35191 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229761AbhBPKcD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 16 Feb 2021 05:32:03 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lBxdN-003Xpl-Nn; Tue, 16 Feb 2021 11:31:09 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lBxdM-001IpR-JZ; Tue, 16 Feb 2021 11:31:09 +0100
Subject: Re: Pending patches for linux-sh
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Rich Felker <dalias@libc.org>
Cc:     Rob Landley <rob@landley.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <133f8171-09ec-39b3-0660-de780cd879d6@physik.fu-berlin.de>
 <f14d4205-2031-7727-e013-7f75d17d4656@physik.fu-berlin.de>
Message-ID: <5c4dd910-eb34-4406-626b-0d80957d0379@physik.fu-berlin.de>
Date:   Tue, 16 Feb 2021 11:31:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f14d4205-2031-7727-e013-7f75d17d4656@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Rich!

Any chance we can get these patches (see below) merged for 5.12?

And let's add this one:

> - [PATCH] scripts/recordmcount.pl: support big endian for ARCH sh
> - https://marc.info/?l=linux-sh&m=161296964604229&w=2

Adrian

Adrian

On 1/24/21 11:07 PM, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> The following patches are still missing after the 5.11 SH pull:
> 
>> - [PATCH] [sh] fix trivial misannotations
>> - https://marc.info/?l=linux-kernel&m=160945707001399&w=2
>>
>> - [PATCH] sh: check return code of request_irq
>> - https://marc.info/?l=linux-kernel&m=160867050030140&w=2
>>
>> - [PATCH] sh: boards: Fix the cacography in irq.c
>> - https://marc.info/?l=linux-sh&m=160578410511403&w=2
>>
>> - [PATCH 1/2] sh: boot: add intermediate vmlinux.bin* to targets instead of extra-y
>> - https://marc.info/?l=linux-kernel&m=161088234517301&w=2
>>
>> - [PATCH 2/2] sh: boot: avoid unneeded rebuilds under arch/sh/boot/compressed/
>> - https://marc.info/?l=linux-kernel&m=161088245817344&w=2
>>
>> - [PATCH] maple: fix wrong return value of maple_bus_init().
>> - https://marc.info/?l=linux-kernel&m=160635878212678&w=2
>>
>> - [PATCH] sh: kdump: add some attribute to function
>> - https://marc.info/?l=linux-kernel&m=160758311622653&w=2
>>
>> - [PATCH] sh: kernel: traps: remove unused variable
>> - https://marc.info/?l=linux-kernel&m=160760435528709&w=2
> 
> Shall they go in for 5.12?
> 
> They all look fine to me as they're either trivial fixes or I verified that they
> don't cause any regression on my SH-7785LCR system.
> 
> Adrian
> 
-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

