Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3297245AEA
	for <lists+linux-sh@lfdr.de>; Mon, 17 Aug 2020 05:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgHQDJF (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Aug 2020 23:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgHQDJA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 16 Aug 2020 23:09:00 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FACC061388
        for <linux-sh@vger.kernel.org>; Sun, 16 Aug 2020 20:09:00 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id u24so12492113oic.7
        for <linux-sh@vger.kernel.org>; Sun, 16 Aug 2020 20:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VUwWPfMFaK7Ua27x+BYsqt8qSqzZlNaS/aMpIL7yuSw=;
        b=utWOu3oN3/U852PBbErO0/SQKSZMtH2sdGg1SUoskWjy9SksHhb0eu0x0JYcfw1POE
         ayUgUEDG1Jsc1X/GUVJQs9A4GiSI2wEPEw+F9b1Dp4PwLgNCerDA2M37LxkEnYO3mAJp
         DWiqaJB88/LLC5nEz68evEbKCN2vW82kQvA4UIaAYcWHHi0QS3trlukqHjPO0Tlyfdh5
         t9GG7oWgpbHDgjH9eyPmP3IkpprYSY55PgPRT83d+BY/Udgy7SDispFvkXeK8qy/w3Jv
         S20hk8VzedN5H9DYESHpm6qJQO9h0Rs2AfYMyvUEx8XDUGQ4+4uLb/pkuRb5Zwy5WGhr
         9x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VUwWPfMFaK7Ua27x+BYsqt8qSqzZlNaS/aMpIL7yuSw=;
        b=WF6R7WBI8r6PkGuJarBmw7+/HQkzp/K09cC/ILrxLa0zg4tH0ZDClP2Qtm4HdMtOJz
         1kBpIpLHZhIdVXNLjZMfNvn4RxV0EJXN2AoJ5ZFQrNRBliKjjeUUJ8WI/sDN+Sly877n
         0CrQ5MGjsULi3E58Xd/rcrc1Di5IybPKP6x1lfqnKFspUEJCXrvbgFxnvj1z8/W4m+L4
         TigY7ozpsZRrXoMbkV6PpXZ9kHWK/P2aKsw3/bu90gs4Z0IpZ8b8nCF7DUEVXxXoOIP0
         PYKiT+m7Mfwl7o7iUugsFtWAzgKQ+QaAcoXTlZfbIpXVk1kPHsthSYqOxO5mQhwaiqXt
         wA3w==
X-Gm-Message-State: AOAM532Hqd7YHdx+DTVBi8G/R4rw0WABkfvo99x7Q5Mk7r6fzzBkx8uL
        2pfghZOa4CFkVor9/AVob9iHLw==
X-Google-Smtp-Source: ABdhPJySdNxP09FGzCeHqqHEHRixrNk5nzHWEtuld881QXLgXnsHG18H633vGJGzwpOn5PQv38Bznw==
X-Received: by 2002:aca:eb84:: with SMTP id j126mr8262398oih.30.1597633740038;
        Sun, 16 Aug 2020 20:09:00 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id g34sm1701273ooi.31.2020.08.16.20.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 20:08:59 -0700 (PDT)
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hao Bui <hao.bui.yg@renesas.com>,
        KAZUMI HARADA <kazumi.harada.rh@renesas.com>,
        Sasha Levin <sashal@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
 <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
 <CAMuHMdWc9q9NjQuAuy5M=v_x=i8XxVg5JZHswjvPsgNzhHfO0w@mail.gmail.com>
 <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
 <CAMuHMdU0EiQuk_bWx1yrmbBTXg8mL-PeN2=P61xQ5Ucb5QmYYg@mail.gmail.com>
 <OSBPR01MB50485F5DA2F82E455DCA6B56AA5E0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <b384543f-c80d-aa63-63a6-1b5dbc47885d@landley.net>
Date:   Sun, 16 Aug 2020 22:17:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB50485F5DA2F82E455DCA6B56AA5E0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 8/16/20 11:22 AM, Prabhakar Mahadev Lad wrote:
>> FTR, I gave it a try on the SH7751R-based I-O DATA USL-5P aka Landisk:
>> SCIF is affected, and fixed by commit 3dc4db3662366306 ("serial: sh-sci:
>> Make sure status register SCxSR is read in correct sequence").
>>
> Thank you Geert.
> 
> Cheers,
> Prabhakar

Did we ever figure out how to get linux to talk to the _first_ serial port on
the qemu-system-sh4 r2d board? I'm still doing:

  qemu-system-sh4 -M r2d -serial null -serial mon:stdio

Because I can only get a working console on the _second_ serial port. (SCI vs
SCIF I think?)

Rob
