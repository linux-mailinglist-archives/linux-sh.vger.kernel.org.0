Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4381226A1
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 09:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfLQI0J (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 03:26:09 -0500
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:45798
        "EHLO sonic307-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725769AbfLQI0J (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 03:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576571167; bh=b1/SJq2WWn84V4hINKt/QX3jee59+VkChpGtQ7C/PhE=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=D+IT25OV5JNCeCkgvl/6fa2nzEUQb5aZjBMMrZcyzPOMNpbkf8roi5TxXeU71iWSm39PBX0IjLeGXj3KLuYS2Qpwbyig9ZQ5VrSp1rqgxw3O4vDwHlx+1m2Dt01PdZIF0jd4TSExQTgY01m4zaO2wIGamA6xgklTb95Q6+r+i6NRPM3XMabSA2YNQ1jQ+dNWuxo2BGkPWA9qFiFHFtrxfPJv2F6z8TeyrXoQe53/iC+H+mx8cTvY61jpbbGs8sAVqNmgDT6uAlWj6Ro8d5xciZi9s+V0vbElMSIMYhU6NO+7OQp5dd+BUwnG/rW+yyTXzxx+h4bdEEGncsxl9VTH8Q==
X-YMail-OSG: F2oAisMVM1k_EcV9_7tm3CJ18ORcEbLyrolKzPjhVFMHQ713Bu0TKk771S.dLO7
 Dr4pMg0Rb1695BX8B.scYPnZVua7H_bHrNyKxzVxvotHzhcQdIxpRR1SjgApdlwou_NTp8IGRWnj
 3AY_hsmVaLHzbhP2q9RgIsgnzIISOAy9YIQKrjgZWFzel_YmpwApYNv2MtlaW42HI7ZayH6YbOov
 9bPfDRWQXZ7xSCxJzZr4wAhxvrY7nKRTU0jwgp59v837HLgI8wnHaZIIhgi5OZTEo56WasiYsdrd
 pBnnYkY9kgQ7JcDFqHvMZYMM4ZbmsFLTUQTohVndYOSKoAde.QrVof0UZELAazw10umxK3NqQ4k5
 Ijs3qj7Tlesb1R0OrGwRNbWtTE7uSYpFpQpw5urcREbnZnt_JNEEXgc1qJGEBB7bPQI3TdALbuZK
 n7hAixozM_p7j20Gbr2oxKFrz7WFeNIne2aGzvKBYO5W3I4EolP4NgtOKzwzfhRc962hXTlK6oVJ
 01cBSTto8XoNIYSdGnP2bMiJBNQuor0k6pr3ZHeKGUOTi3iw2EA_J_22QD6iuRyeYNRi2OMgw36R
 DAbNi7gj7KAQdjfp0VmY7mRpx.RNSp1hpzcNU1iArDfiATq4Fi0vslBTLFyyzPEhIpnbEqBe3E9S
 djV7jJWEjWd9fyXenCVB.8kSjzOnGXsZaHq7qe3FyXvqYVVZlLCfhGOil0aux1Yd2hy9GK6py4L3
 GrreHNDWMCsvRDc7.YomvLBoG41mZTNos8.PVFYfZCEW5IpfP.xO1QojfuPV9bnJ41gM3Ph9R3D0
 JyvN.kgHK9NOOR1EL.VBf.xxZwN839rHZ9ourLJG7dP2cxeaiXh_HpDhggFWXIx5XmqnPXCuLjem
 BPbIDJYU2W3EQM7soEZh_D8y28dpwU5FqsLkXkxBfjNBSt6S0_QuXQKsE_xaxfyb4IvIvNb_N34Q
 agydZDcjVMtD4kHbrOcealkeRP5zGwJ4NfVCs9GLLltY9q9.xuU.3F5qJljiIGUMLO4_k4LZ3O.Y
 YdLw0bvNvgccC_gmOJCIkEfGqawkrXqjMAq7xeNyMVQb_Jspv6dtw7DJJnl.1HAU7adyxzcHNcFu
 QWj2QfqcNt4UT3ezr_4vDOzY7KO4gOCwtUZ7ieBUAGav_U6vBGPKi9df_W9QN6mSztuJRUzELBtw
 yFC8E3juVcW9WaWgq6vjm5Qq7OnVoWtU4UvRCh9ldkppspo0_z9iGpfqAfXBi4uvQ4h7fByKXxBj
 S_m0SBQBEK8VrRkaTLBdrH4Bs_uZNwAUrcNwxx1vBoe51l04TIDIP
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Dec 2019 08:26:07 +0000
Date:   Tue, 17 Dec 2019 08:26:04 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com
Cc:     linux-sh@vger.kernel.org
Message-ID: <1401968064.233432.1576571164188@mail.yahoo.com>
In-Reply-To: <1348932359.222850.1576570509794@mail.yahoo.com>
References: <2131872019.198149.1576568166106.ref@mail.yahoo.com> <2131872019.198149.1576568166106@mail.yahoo.com> <87a77rgzsi.wl-kuninori.morimoto.gx@renesas.com> <1348932359.222850.1576570509794@mail.yahoo.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Well, this will teach me to try and solve a problem at 3 AM. Please ignore my last message.

strncpy behaves like this: linux (dot) die (dot) net/man/3/strncpy

Which is exactly what you just wrote. So yes, strncpy is expected to write null bytes when the source is shorter than n.

-----Original Message-----
From: Karl Nasrallah <knnspeed@aol.com>
To: kuninori.morimoto.gx <kuninori.morimoto.gx@renesas.com>
Cc: linux-sh <linux-sh@vger.kernel.org>
Sent: Tue, Dec 17, 2019 3:15 am
Subject: Re: can someone solve string_32.h issue for SH ?


Hello,

I'm terribly sorry; I think I made a mistake. I looked at it again, double-checked the defined behavior of strncpy, and I think you actually just need to replace __src+__n with __dest+__n in your strncpy.
Additionally, I don't know what the linux kernel rules are on this, but maybe unsigned long __dummy; should be initialized to 0 explicitly for readability?

Sorry about that!


-----Original Message-----
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Karl Nasrallah <knnspeed@aol.com>
Cc: linux-sh <linux-sh@vger.kernel.org>
Sent: Tue, Dec 17, 2019 2:46 am
Subject: Re: can someone solve string_32.h issue for SH ?



Hi Karl


> This appears to be your culprit:
> 
> char vub_name[3 + (9 * 8) + 4 + 1];
> 
> in struct vub300_mmc_host on line 302 of the file /drivers/mmc/host/vub300.c.
> 
> This is the exact line triggering your warning, also in vub300.c:
> 
> 515 strncpy(vub300->vub_name, "EMPTY Processing Disabled", sizeof(vub300->vub_name));
> 
> And the fix would be to probably fix vub300.c, do a sizeof() on the string or hardcode the string size to 26 characters since the string is already hardcoded in as it stands.
> 
> The asm doesn't look wrong.
> 
> Hope this helps!
> (Sorry I can't do any pretty formatting: mail client and majordomo don't play very well together and html gets generated at even the slightest provocation, despite having disabled it...)


Oops, indeed
I got too many this kind of warning on SH.
I though, it is SH side issue.
(Why I don't get same warning on other CPU.. ??)

But anyway, Thanks a lot.
I will fixup driver side !!

Thank you for your help !!
Best regards
---
Kuninori Morimoto



