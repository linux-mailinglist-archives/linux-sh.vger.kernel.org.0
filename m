Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABF31A0EF6
	for <lists+linux-sh@lfdr.de>; Tue,  7 Apr 2020 16:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgDGOPi (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Apr 2020 10:15:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42707 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728966AbgDGOPi (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 Apr 2020 10:15:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id z5so3227445oth.9
        for <linux-sh@vger.kernel.org>; Tue, 07 Apr 2020 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gP4BTE5Ot8wy02xgCFAtqdKsONZgXOrsLloDPwgt8X0=;
        b=t0HrRlB0oZOhVJiW0QdPbKDqh4gLwG+PSQ37PQaPgFXGy8AY6IcuvauisH/TsKWYBP
         YV6owKQ5A4zMZXupSfsjSQpwhnxYPxyxHPEP4q2Z7xFkDLQfxc1k1z5qE8mrOpUNhtzi
         4R7sGyjZD9waJ5xVHXF0qjtJJw/6yJq1dXqffPAAONKrfHGntEjTl0jBVzBwtJT75ZKR
         aTuH0S+0EFJe9WZuqAf1Yi65tgEmQu7mkEf0liBBhg2qQ4vYh9u4FXLQCiyO+3qrWkkd
         4eGY4A4IkYBguBKWEBib0qrtUNLW6EDlvkHiUyCHh+pLvyBMD/WUVHvbC7JPkxsGA7qj
         m4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gP4BTE5Ot8wy02xgCFAtqdKsONZgXOrsLloDPwgt8X0=;
        b=iuhEhyXbIjMBTK+crm6Nge+2n0355KJNq/9cnv4VPLUmEcAWt/AA6jso+OdtI2yDkg
         EOQiH9zPVvdF5ZMJR//ihbZKoyolvs1nXtXDflp6GnFTdo1vSS3zwikakcJefz8TqyeM
         Hf50Wn9lFuiUCLmKxL2YRALgfQI3V5bC4pJdJsBCm9Xw6ENoy6ySI2FnvLGSbHG3h+ic
         yjM6ejf8MceFmmq3pLsG2RiJO0vByUYNZntTBfW5rJRbl5c+wRurBYVw8/XSLMfG/VvH
         Xo6bktgShyRV6Lgq72ImLgRzdxOM/HY0K1SNOWeFROd6oYDVkiMXRmtf5ApdokxubSz9
         OVbg==
X-Gm-Message-State: AGi0PuYoOp/VmPv8E0b91r8cQkxrWRAfmIwy0kkTdWTU0K5Pc1Ezbd+Q
        o2xKJ7e8vIDX2KdFPvOh70V+XYS4qOg=
X-Google-Smtp-Source: APiQypKiMcw4uHeBy6DP7gcM1d99dJhK/u3BXp3Nqe8eUKxNUhWYSA8orrpVEQbQE3A20IqeriSszQ==
X-Received: by 2002:a9d:6944:: with SMTP id p4mr1752826oto.220.1586268936891;
        Tue, 07 Apr 2020 07:15:36 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id r2sm5283975oom.22.2020.04.07.07.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 07:15:36 -0700 (PDT)
Subject: Re: v5.6 is still throwing a stack trace on boot.
To:     Rich Felker <dalias@libc.org>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
References: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
 <20200404000730.GE11469@brightrain.aerifal.cx>
 <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
 <20200404005125.GF11469@brightrain.aerifal.cx>
From:   Rob Landley <rob@landley.net>
Message-ID: <cc602220-8000-a6ba-5b7f-5b00c7faa0ff@landley.net>
Date:   Tue, 7 Apr 2020 09:21:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200404005125.GF11469@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 4/3/20 7:51 PM, Rich Felker wrote:
> On Fri, Apr 03, 2020 at 07:28:27PM -0500, Rob Landley wrote:
>>>> ---[ end trace 76213c1325250d90 ]---
>>>
>>> Which hardware is this on? The qemu emulated board you're using?
>>
>> Yes, qemu -M r2d. Built with attached miniconf, and run via:
>>
>> qemu-system-sh4 -M r2d -serial null -serial mon:stdio -nographic -no-reboot \
>>   -m 256 -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" -kernel zImage \
>>   -initrd sh4.cpio.gz
> 
> OK. This is nbd, it's just some pedantry added in commit
> 128227e7fe4087b60f1bd31f762e61237eb23790. Essentially it's complaining
> that something requested zero-filled slab memory when it's about to
> run a constructor to fill in the memory. The backtrace is (as usual)
> somewhat bogus looking and grep isn't helping me find where it's being
> called from. I'll keep looking and see if I can track it down.

Did you?

Also, https://marc.info/?l=linux-sh&m=158544749818664&w=2 still doesn't seem to
be upstream?

Rob
