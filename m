Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA321122C9
	for <lists+linux-sh@lfdr.de>; Wed,  4 Dec 2019 07:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfLDGHL (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 4 Dec 2019 01:07:11 -0500
Received: from sonic313-10.consmr.mail.ne1.yahoo.com ([66.163.185.33]:34856
        "EHLO sonic313-10.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725791AbfLDGHL (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 4 Dec 2019 01:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1575439630; bh=LdaBzZO/TscnK+07Ig700Kv8wr5mA2vays5RAO6stSs=; h=Date:From:To:Subject:References:From:Subject; b=EBO1y74D82b34Ou7NXnQc7sMh1lit5ztK7bX5M5OrIjcqQ3ZiEzaAZqe7PVbFFpk/XVro5zj+nTKDoxhHYSVSTU3Tpu7hMyPxbyLFatBTYj6wvteL/4XWrcckutQrfVWhyf3qRp8BmhF7khw6Lt29oGDI2dpmK6tKrvJ58T+f/9NHkfaLLrKANPpvCT/8xiAN2QZl434RLrN9gFshEgWJWVbMw9q5JNM7ZM1NxxsaYw3BjRikbHW7w+DSswkT0UG2htqtLGtXw2xvxfHeAFSfvXWWmOET4mefq+e0ye3cvSQgFiT7aYUAVoPjrO44R2HwjMKFf+hSUEbmjUxrh2OzQ==
X-YMail-OSG: tnbClJkVM1lG_iVzW.KZSAY3LF4lUmkPFocfOOjgibY551tjvd4O56B_uRd2Ldu
 zkWOG_DUQGxcwNMPwKiK2ZPBunUAcIw..b.M51nFc4Z8uB.UVaCZo5zceUpYfWlsrOEeAyPdXEDB
 dWisX13v.hBRpOAlTH1EGMLtDil7xF3agYzcsRQYJhnpRGiKg0HID2RtConjP5am23kVF91ex5UQ
 Nbz5XaRG8N_vA4qo.gphBqt72cbKO_jzffFlU25Z2ylHA1xbIBnM5igTYCG.GrejVXDSJes.ZVVo
 7uehlBF8KMD7vmloWoa3.JaGCb3WVENpTvIg6.rD2uhDtlvzDbB6S7Q11CcN7juKONj3gG30SiiK
 UybVOT.Mg4z1vcQLvyYQEH.pAVCju59_.mip8VYNsf_NaNPms2qDf5MZSWEAdMKEjJk.xWLz0Gk4
 MgyWTZaYEHP_XnUqYv.qfjW6rIKTiMV9xm9K36LNIi5jnjxSuTA7VYzPXwBWv24mBMadlcsPqgUR
 vx07iL3IHhBkL0Roj4RU8JgfUKCdMg_Y1SLpY0EmUTLDbdLLXDR1tjlrtfZI3.8v2TmkekwnC5T2
 TWwGg4btoC19MFj1UM.GOn6am4xC6CwUjhHNQAUQFrLrP9kj9_qLa2YBwCaqI1BrLyeHlA3iI4iP
 BodhBdJW.H5wUYjSXxKTdxobJKP4zGNcGa8rpZPgipULzCsr5q8mnDywbJWTwCTIRfEov4JdiCUM
 0QQrAbluJh137Y9arHOXtbIDTscmRQxGxN1rC4fpJMnzGrvwD8jcimMzO53vL0bHfdDnIRmYyNxt
 bH9LGf2ufva2g8eXCFDzWrIQq3Rqo46MXUa02z0ls2kAdo3A6O74f8NVsl0u0W3sKqNtput5DCnj
 M.EKvqs9tg0dGcrm2Q2VTqP8TlE7APh.zdmy.VkXDMzkruxbYitqOulw.rSxAV7WFj3QIT3y7kaP
 u_vivsx_f8MnaU6xoLJgwkw5SFnud0_Nvj4kjfJi15f.NN3aIhwS5gwv5jPd9uGu6r9Z8KTJ_LZd
 81kXSx1uWQhRN7BjBOAjDyMPUfC1EB_4CImhosqgmhZF8OUaTnKhLOeIlvhCHRJZMGKnOf6SGT8G
 y7m0EI.GBAHVpTH4QrxICSrCNc_jB5qxE6CEuJ1B6BbTIBqQRebcYZGBsaCg.5ZvDCsTZfiNqTf5
 29XC5vIaB7bpv0MBWsDN75jIQH8CSaP_QKQvGq6sB9h_31ExfD7wnSYGdvQv8p79HQww928uv0qv
 MAZDxNXFToiOaj2xaaEYtrC5bZn6dBG_.
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Wed, 4 Dec 2019 06:07:10 +0000
Date:   Wed, 4 Dec 2019 06:07:06 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     linux-sh@vger.kernel.org
Message-ID: <1686953279.8556109.1575439626669@mail.yahoo.com>
Subject: Strange SH7750/SH7750S-Style Performance Counters Behavior
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1686953279.8556109.1575439626669.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14728 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello,

Apologies if this is not the right place for this, but I have encountered some strange behavior with the SH7750-style performance counters that I have been trying to understand for nearly two weeks to no avail.

Essentially, I wrote a set of functions to control the counters in a way analogous to the SH4 linux kernel's perf_event.c, as that file is the only real documentation I could find on them. As far as I can tell, it all works, however every time I read the counters I get a value that according to my calculations is about 11.96988 times too fast.

I am using elapsed time mode (event code 0x23) and the exact CPU model I am running this on is an SH7091, which were used by SEGA in the early 2000s in their Dreamcast and NAOMI machines. As far as I can tell, they are largely identical to the SH7750/SH7750S processors. The maximum internal core/PLL frequency is 200MHz, so seeing the counters run at 12x PLL is extremely odd. I have two machines as well, and they both exhibit this behavior, although for some unknown reason every now and again one of them will turn on and count 200MHz core frequency cycles instead of 11.96988 x 200MHz core frequency cycles.

I have also measured that this 11.96988 number is actually extremely consistent to at least 3-4 decimal places; it is never 12 or 11.90.

Is there any chance that someone here has seen this behavior before?
Also, might anyone know what the definition PMCR_CLKF 0x100 in perf_event.c does? I have not seen this actually used anywhere.

Any insight would be very greatly appreciated!
