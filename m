Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA12D151EE6
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 18:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgBDRFj (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 12:05:39 -0500
Received: from malenstwo.juszkiewicz.com.pl ([37.187.99.30]:36612 "EHLO
        malenstwo.juszkiewicz.com.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727339AbgBDRFi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Feb 2020 12:05:38 -0500
Received: from localhost (localhost [127.0.0.1])
        by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTP id 88A49C0246;
        Tue,  4 Feb 2020 18:05:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from malenstwo.juszkiewicz.com.pl ([127.0.0.1])
        by localhost (mail.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1--ZqLH3aa_v; Tue,  4 Feb 2020 18:05:34 +0100 (CET)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
        by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTPSA id 149ECC0139;
        Tue,  4 Feb 2020 18:05:33 +0100 (CET)
Subject: Re: No newer system calls for SuperH64?
To:     Rich Felker <dalias@libc.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
References: <939c9260-213f-cfd7-f81a-e9b635a6aa10@juszkiewicz.com.pl>
 <20200204142358.GT1663@brightrain.aerifal.cx>
From:   Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Message-ID: <a5028764-d365-92a1-0459-0a9712ce0c42@juszkiewicz.com.pl>
Date:   Tue, 4 Feb 2020 18:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200204142358.GT1663@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

W dniu 04.02.2020 o 15:23, Rich Felker pisze:
> On Tue, Feb 04, 2020 at 03:13:23PM +0100, Marcin Juszkiewicz wrote:
>> I am maintaining system calls table [1] which shows which system
>> call has which number on all architectures supported by Linux
>> kernel (including those removed in last years).
>> 
>> 1. https://fedora.juszkiewicz.com.pl/syscalls.html
>> 
>> Today I have noticed that SH64 supports system calls up to 393
>> which is pwritev2() one. None of later calls is supported in
>> mainline 5.6-rc tree.
>> 
>> Is it an error in kernel headers or it is true? Or maybe it is an
>> error in my script but it works fine for other architectures.
>> 
>> Note: I do not own nor plan to own SuperH64 hardware. I do not
>> even remember where it was used. Just noticed weird state of it.
> 
> One reason you don't own it is that it essentially doesn't exist.
> :-) GCC dropped SH64 support a few years ago because the arch
> essentially never materialized and keeping it around was a lot of
> cruft. It should be removed from the kernel too; I just haven't
> gotten around to figuring out how to do that.

Thanks!

I moved sh64 to the part where I keep architectures removed from kernel.

