Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8FB12266F
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 09:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfLQIPQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 03:15:16 -0500
Received: from sonic314-22.consmr.mail.ne1.yahoo.com ([66.163.189.148]:34696
        "EHLO sonic314-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726167AbfLQIPN (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 03:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576570512; bh=YH+eA8H98kF7S7AFDnLmqvL2JDejRuXYxrPlgYqDmTA=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=MXkJCsbbucFfnqgl/XII2SvaS6RVMbTG95szKNpdFSAez4fflKshx3+xYc55L/tPqtd6Ti4jVUrXSZsyFDpHDemsdL4elF8zWGXZo958y9qFOqcDmQ9Yt2ZW0/0QxppN2A6hKnZnZb3uOoS4dJ07gYd474Z2uzYR/LzrYBHQ/v3kjhWeFyl39NAu0mKS7RLFQ+25RWJAQ3okobXtJEWuMnQ3T1QviRPzSDCBfbNcx7/wF3OxXSSct3TOrLrFU2OS1khtfs4YrD53izEKn2j5pm4CImT7f4jp5iKLpi2O+Fho12QYuYOMB+oQ4VXJ8TNC5JEV5a07/qKAga6518GnlQ==
X-YMail-OSG: b0ksG20VM1mMDaXRMI5o9mo3m7ofAIT9aDvhuqYJZn.9g6IVaLQ6BmnOVVfCFJD
 N8tz2q4cwIvbsEzS6iJftidErpwwD8jrU8TbeG4vss38gNIuOQWCNvsDOLvtAI3.opbcL2xDENjA
 QC7HPvg21amWAf9s2ttdVxgJvauFVA1_l2pxdLyz2ULGw7fK6RaM1Tj5WGJttU.lzLo.NyeMkZ_F
 V8BDvO_5GBwXeLramw2znWRVqx.mDrLC0NYfSgq4lmjYUjKhx5knCYOfeQb2wAkXgekHwloyoCrO
 bP6b400w5xPpAwXrUT9GsuYSihsVbR5DtvN2wxMLmJv5UX4E5HZI190VY3qyg2KNFjbptW2gBcWF
 wo7DDBYAD.IGhXd06YNgTLeaNIHVsFbNynRMVnImhBA0ILQwuqKWrExt80l7E53PyXtUQF7t2uPF
 ZVHiC24oz2Y2dY2OkbczEkXvJ5PFTH9lcAVVCT6kLRcKtXxugyxh0SqVlygNsCVepFmSlIv8dlG5
 EaZNdtiVGL0_Cz84vta.VlQOkdk3zwaSqhLSWCOqiJ6w17BF.BauPPsC66JIHinkdRyjvnwmeU1y
 KCkLP8XlLgSaSw8ZeT7fZm0ld9C4pvwriV.rbxPNFBGMcJZa8P0loXiM83FnGtcOlbm_mTX92D07
 xxOuhlD77Fyitgs63UngqnzIT9YC5THybjHwYnjVWyUgbCRvmazQ0bQcHAWdAl06Ve0q6XZA5t0v
 CAJrgpsOmWJzYnmyVpFKcMoLowYGvjzSpbAC_jQal1mkXC1srTctWHj7lC.NOy._9Vuju9.b0lpq
 .vA_lE_uf9t0GNKUsIsnQrkpn7WqGl2u2KP0J8zfINb11ipq1hwSnXR.DR2g.n.tKKhj9Nn8aNJZ
 69o.jG556nlbtz9Pj42_07teLzAGvMEttyZGmq590gDsS5qxVuXUwy0NpV2Z8rlNR3VSJLy.Appe
 XheoItGayPFmE7xgU8sAYD8OsYI1iKRYc5cEhDhXUxJP_AC5ZruHqzV0Ts0bPOM6e0vyRRGBffQ7
 TRKmyS48KbaPajb.qLF8oTTwB8w1g7fUxLGJp.MvAoj8XINoFjVTBoBkP0QFGMJL6t0sNpeaINZ7
 JX5usdsQyLzosVN.VxdvYaKfEYWUvv60tnc.X2n.uiBPJxOEpcGN.nmjedwvlJRBA0Zt76rSoIo7
 zB_5aFFS_agXOLwBTzh6j16ZqGHYbGojGc3jdjg2c87z5JIKrSPFF.bHmRyUP_y607NLm4QlAZsp
 MJSnudrdt_s.iRK99d.d8JvwuSDyy8P27OS8L.azsdwbbrHaMFg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Dec 2019 08:15:12 +0000
Date:   Tue, 17 Dec 2019 08:15:09 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com
Cc:     linux-sh@vger.kernel.org
Message-ID: <1348932359.222850.1576570509794@mail.yahoo.com>
In-Reply-To: <87a77rgzsi.wl-kuninori.morimoto.gx@renesas.com>
References: <2131872019.198149.1576568166106.ref@mail.yahoo.com> <2131872019.198149.1576568166106@mail.yahoo.com> <87a77rgzsi.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

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


