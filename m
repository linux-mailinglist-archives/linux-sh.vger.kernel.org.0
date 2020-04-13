Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001D51A6176
	for <lists+linux-sh@lfdr.de>; Mon, 13 Apr 2020 04:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgDMCSM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 12 Apr 2020 22:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbgDMCSM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 12 Apr 2020 22:18:12 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41DDC0A3BE0
        for <linux-sh@vger.kernel.org>; Sun, 12 Apr 2020 19:18:12 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id i27so4885334ota.7
        for <linux-sh@vger.kernel.org>; Sun, 12 Apr 2020 19:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1Bqub2fmBp5sDDaD1qf86S4AgY4tx3PoXDURHmBO2fs=;
        b=0Oxjw1j162bBnx+8UTs64lXIU3nJGzaAMd7mVQXTI3c1Lp9ETxrwy3OgXT2Vqj5o6D
         H+OO9vPJcnW8WCeDFqLgc8jg/iyMRzRQWhefLkS3Mjq+xPFb2SUZ9zj3e0GImvWfPt/O
         zh5+4Xu8AYfOf871BMtKZpnBSOSkhgwx8qH0kWT7MTXowyv/sf1qquNhR+kc9lpb/7au
         JVLwM7cTDtc/rXN9sdL0yLrL4V6wWJbNcBbEkyBnfA6WRo7mpDp7FSjfU+uRPjfzdGsK
         7TS0HEguMvh51ecK5d/lr283SIw6gaWLX/fdtTB/YcxdURdrAMqqlND4H5PPL+/KgrPo
         1hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Bqub2fmBp5sDDaD1qf86S4AgY4tx3PoXDURHmBO2fs=;
        b=Hl+9sVAdrHLeCMYGJoml6lTL6QEKCyJ/Wa5HvoKi7mcEkELPvtVGhP6mA7hP2zwIwW
         Grf28AM8qv1f6CQe04cz9Y/pyKKyZimahlkatl23pIkjPadfQt6RMWIPTHPXcJsqA4A9
         oSvasiF1q2t00Ua1pXNtqZGBEoEncbtp3/rxyWLQWW2IkmwI+i9HYcN0CwNyp8tKJPcs
         4BX8T3U2hhV0JldHtneVSQRi0ILu7lWHw6zLOnqFBSqkCFW/wGrraTmjlgSTcoJkIAEA
         ABF9HSke82ZJ+4C1dMo+nrj3CBvCRfpVs/gHtko1VnQ/qgNnJ0g5JqgfVpyNMkP8CBKC
         +pZA==
X-Gm-Message-State: AGi0PubUW23s1hiHYBoMOQiSh3uHQ6mqa71+1lFLylY+CWdoIcOqeDuv
        RRYIJ+QDanEVl6AAZCIVqjjGV0ov4zk=
X-Google-Smtp-Source: APiQypKsllWvQEIfZAWPOlIxgvvjFZ7mU7mCgr87FfccxBTgklfGAgjlDl2H9NQnHnYqgEAXuhkj6A==
X-Received: by 2002:a4a:850d:: with SMTP id k13mr10024212ooh.7.1586744291922;
        Sun, 12 Apr 2020 19:18:11 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id d23sm4407607ote.70.2020.04.12.19.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 19:18:11 -0700 (PDT)
Subject: Re: v5.6 is still throwing a stack trace on boot.
To:     Rich Felker <dalias@libc.org>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
 <20200404000730.GE11469@brightrain.aerifal.cx>
 <2491f2c0-14f9-a4d0-17a0-25695e25671a@landley.net>
 <20200404005125.GF11469@brightrain.aerifal.cx>
 <cc602220-8000-a6ba-5b7f-5b00c7faa0ff@landley.net>
 <20200407152112.GK11469@brightrain.aerifal.cx>
From:   Rob Landley <rob@landley.net>
Message-ID: <06d2a875-1bdf-7748-41d1-50413e86ee8b@landley.net>
Date:   Sun, 12 Apr 2020 21:24:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407152112.GK11469@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 4/7/20 10:21 AM, Rich Felker wrote:
> On Tue, Apr 07, 2020 at 09:21:26AM -0500, Rob Landley wrote:
>> On 4/3/20 7:51 PM, Rich Felker wrote:
>>> On Fri, Apr 03, 2020 at 07:28:27PM -0500, Rob Landley wrote:
>>>>>> ---[ end trace 76213c1325250d90 ]---
>>>>>
>>>>> Which hardware is this on? The qemu emulated board you're using?
>>>>
>>>> Yes, qemu -M r2d. Built with attached miniconf, and run via:
>>>>
>>>> qemu-system-sh4 -M r2d -serial null -serial mon:stdio -nographic -no-reboot \
>>>>   -m 256 -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" -kernel zImage \
>>>>   -initrd sh4.cpio.gz
>>>
>>> OK. This is nbd, it's just some pedantry added in commit
>>> 128227e7fe4087b60f1bd31f762e61237eb23790. Essentially it's complaining
>>> that something requested zero-filled slab memory when it's about to
>>> run a constructor to fill in the memory. The backtrace is (as usual)
>>> somewhat bogus looking and grep isn't helping me find where it's being
>>> called from. I'll keep looking and see if I can track it down.
>>
>> Did you?

[crickets]

>> Also, https://marc.info/?l=linux-sh&m=158544749818664&w=2 still doesn't seem to
>> be upstream?
> 
> See Geert's reply,
> 
> Message-ID: <CAMuHMdVm-871S5tOdQw0KbRao+L0Wg46Rk3yNRyW45zJf3qt4w@mail.gmail.com>

404 error from
https://lkml.kernel.org/lkml/CAMuHMdVm-871S5tOdQw0KbRao+L0Wg46Rk3yNRyW45zJf3qt4w@mail.gmail.com/

No idea what else I'm supposed to do with a message ID other than that. I tried
googling for the message ID string and there were zero hits.

Do you mean Geert's March 15 message forwarding the alignment issue to arnd and
linux-arch, which predated my message cc-ing Linus before rc6 came out (I.E. not
the memory dump issue)? Are you saying "Geert forwarded it to somebody else last
month, therefore there's nothing to follow up on?" Because I just checked and
still nobody's replied to it on linux-arch:

  https://www.spinics.net/lists/linux-arch/

I'm not sure anybody saw it. And he only forwarded them the 2/2 patch, not the
first one.

> I think the patch is correct but still don't thoroughly understand it
> (in terms of where these functions are used and whether it preserves
> the property that everything that needs zero-fill gets it).

Do you still mean the two added align directives? If so, how is zeroing
involved? (Because if Geert replied about the stack dump issue, it was either
before March 1, or neither I nor the list were cc'd.)

> Will follow up soon.

Ok, I'll wait until -rc1 closes to send this reply...

Rob
