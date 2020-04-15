Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C441AB41C
	for <lists+linux-sh@lfdr.de>; Thu, 16 Apr 2020 01:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbgDOXPN (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 15 Apr 2020 19:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388412AbgDOXPI (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 15 Apr 2020 19:15:08 -0400
Received: from mail-oo1-xc43.google.com (mail-yw1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FE4C061A41
        for <linux-sh@vger.kernel.org>; Wed, 15 Apr 2020 16:15:08 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id i9so261054ool.5
        for <linux-sh@vger.kernel.org>; Wed, 15 Apr 2020 16:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3OjUG2BuSmqAZb0WXRtXD4dSg3ZpvowTxplHgaVM3Q8=;
        b=F35xhtgPpx/jIbkJJBdV5g5+ruNOIXKelQQyX5bbrTqVnC7gIyw7HrbOzu3enHe323
         sFh/bnS27E/omhCaw3SCfbMWoJSFeUQFPCmwybIdj/Q6kAkzUGA5GqDzLPUCYJkgaK60
         YUzH1qXFrk8Hl+LTNeS1g3snqHA6YPHoqMUETupiyQq6He/GVwNeYMbC/+XOUEjIheHx
         prQCsPkvd5m7qWUcj9ByTl9O+MQYBgcDHCdvJF0ifM2LIRt7ZUQEBF+XifKq05a0jumF
         Z59n5r7F1PhddLmxE5Nb8oZa2Xj6Bd+y2gvlnhlQOzm9foLtxRLQ07xOLRDmBpBVoTc/
         L8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3OjUG2BuSmqAZb0WXRtXD4dSg3ZpvowTxplHgaVM3Q8=;
        b=ifewNM4rViaDIAPCmBYcm+ZJDmizTMaIXkGohiwR6A9UgnVW0qudU4KrvRJsDAsKO5
         D7a5rsvno9oPWwtYZFU550xKsvYo6vaG490m9gItYV2KVV3fJomDh8mG7ccz9ViXa4nc
         lhBx4X8JYkvTyEDA9sKO9yNNDs4L0GWRZhhcmy34jtwhdXSxDnKI0SoG9qi818QHy8lT
         lP8aMR6xv+I0Nf3HJmEtPO3Fe4szRzzS+Egu2ukMPrmqZk7wlG3gKA/C59hQ/qV3bnAD
         Bt+9RY1guN1qmqXRatakfW4VjXUAR0xy7qBf5DH2Ts16JHvv3Ad+y3wullGYnO6GS7Iy
         9QAg==
X-Gm-Message-State: AGi0PuaADa1SkMhCSs9u3bphPILPfHxiSJWFrrfkFea6G/r0vW1DSz8h
        FDvEpCkGCG2WeiKJBfZyuJOZZw==
X-Google-Smtp-Source: APiQypJX4BQ8dde+gIq4uYB2s5OItvEplprtWtCefc9av8Gy6HUjt41wXcWpqBb6biLoaS77Egd/0g==
X-Received: by 2002:a4a:874f:: with SMTP id a15mr14836132ooi.8.1586992507739;
        Wed, 15 Apr 2020 16:15:07 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id o23sm7330628oos.36.2020.04.15.16.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:15:07 -0700 (PDT)
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
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
From:   Rob Landley <rob@landley.net>
Message-ID: <67d1a3a0-a160-f707-b7c5-ba610a3f76c8@landley.net>
Date:   Wed, 15 Apr 2020 18:21:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 4/15/20 7:36 AM, Geert Uytterhoeven wrote:
>> Let's wait a bit, we're in the middle of the merge window anyway.
>> Probably we can get it tested on SuperH during the coming weeks.
> 
> Anyone with a real (not qemu) SuperH system who can do the basic "stty evenp"
> tests above, and report back to us?
> Thanks a lot!
The j-core boards use either uartlite or 16550a for serial, and neither of my
legacy sh4 boxes is easily accessible right now. But if nobody manages to test
this before next merge window poke me and I can set one up.

Rob
