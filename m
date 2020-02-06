Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD41154AB9
	for <lists+linux-sh@lfdr.de>; Thu,  6 Feb 2020 19:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgBFSDx (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 6 Feb 2020 13:03:53 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41189 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbgBFSDx (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 6 Feb 2020 13:03:53 -0500
Received: by mail-pl1-f193.google.com with SMTP id t14so2641117plr.8
        for <linux-sh@vger.kernel.org>; Thu, 06 Feb 2020 10:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BwIKsPgXZWaTOJFZBnavo0icI1hPDmuKqae+K4+TPB8=;
        b=RS7LGVFdAs6N8Fl2CGH7TGGrAnROcBRFLnCGCuWovmOIGajsXjcAwwl7mU03A8cwiq
         UOtgc3nNqsjkTInIAG6ZROGsk/0LHmCHAsMVtw9V+BkvaLoil4cJVIur8SpR5wdCxv32
         afsdOaBdlLUjomBLOqvlJg75CZH5pXYAPrMZyaC3na53Gy7FuiZXohzQB1g6pOBvlFNm
         8QgbSaYVr93RizGDqewAY7CNMUv1XFdCwBLh9qnbYKqQRC5P2lm1xleuTWCaXzXt5+Vu
         60LcrsTpFbGQyV2QKcRwbVwtfUtxSZ8n8LhLzqmM/cnC82md1UGjGh1Qu+O2h0z/nPxD
         nPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BwIKsPgXZWaTOJFZBnavo0icI1hPDmuKqae+K4+TPB8=;
        b=DgpYdKRmmcuhfH0nxTDZJ72Q8Gi2ptChGjpr4CO/qBxDS/hwu2VXn+QKdPxF0sGulJ
         4qQ/ovyvx8DweJvTSFhDdjiwIWWVf5DuL6mlWjqj/Euupm24zbUWWNdUkvFhTpiHH9uP
         yDnbsdX2fdKxUGTecdHzHi05j4RlKCoCM9d2GT1J2Ob1sX82LIYm7Oo/ZYM3Ufv04RSx
         dHuk5CaKSK/vhTiOUvuYO2AUak2SEvkNrergDaxaLQr2ks8NXRJ9ihy4xJOSe0b9BS5A
         rFpGBh1YXVyBOzy6Kn6E0TSJyTwD/Pyy2eXK5FtH+VlSUrOV/774XfBBP5CaYBcAP1m8
         ciiA==
X-Gm-Message-State: APjAAAUqPGlpAeCyGPmIM50+tMv7sCUSm+x90UGTfwY11caWs1uoAIca
        hmabp++c1rDLzvEsWfYBDRBzRft2QMk=
X-Google-Smtp-Source: APXvYqz28wW5ZCEOdpc5Svg4MKOAEU4VZOBSfUZN5g6ITRIgJ/o8TMd+sifggP3b+abUG6jbK95RxA==
X-Received: by 2002:a17:90a:1785:: with SMTP id q5mr5989277pja.143.1581012230814;
        Thu, 06 Feb 2020 10:03:50 -0800 (PST)
Received: from [192.168.43.9] (M111108020211.v4.enabler.ne.jp. [111.108.20.211])
        by smtp.googlemail.com with ESMTPSA id o19sm11642209pjr.2.2020.02.06.10.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 10:03:50 -0800 (PST)
Subject: Re: No newer system calls for SuperH64?
To:     Rich Felker <dalias@libc.org>,
        Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
References: <939c9260-213f-cfd7-f81a-e9b635a6aa10@juszkiewicz.com.pl>
 <20200204142358.GT1663@brightrain.aerifal.cx>
From:   Rob Landley <rob@landley.net>
Message-ID: <8944a60f-26a9-5880-6498-a782d16074db@landley.net>
Date:   Thu, 6 Feb 2020 12:08:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204142358.GT1663@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 2/4/20 8:23 AM, Rich Felker wrote:
>> Note: I do not own nor plan to own SuperH64 hardware. I do not even
>> remember where it was used. Just noticed weird state of it.
> 
> One reason you don't own it is that it essentially doesn't exist. :-)
> GCC dropped SH64 support a few years ago because the arch essentially
> never materialized and keeping it around was a lot of cruft. It should
> be removed from the kernel too; I just haven't gotten around to
> figuring out how to do that.

To elaborate: sh1-sh4 were developed by Hitachi in 1990's, and it was the best
selling chip line in the world for about 3 years. But after the 1997 asian
economic crisis Hitachi cut funding to its chip business (as in they didn't even
bother to pay for die shrinks to move existing designs to a new fab process at
higher clock speeds), and a few years later they spun their chip business off as
a new company "Renesas" (in partnership with NEC I think).

Renesas inherited the old designs but did _not_ get most of the design engineers
who'd made them, so they hired new guys and had them try to produce a new 64 bit
superh chip (sh5), and in doing so they made the same mistake Intel made with
the Itanium. They bolted a whole second processor on to the side of superh with
a completely different instruction set, instead of the x86-64 approach of making
a mode bit that changes register size with otherwise mostly the same circuitry
implementing mostly the same instructions for 32 bit and 64 bit modes.

The resulting sh5 design was completely uninteresting, nobody who bought the few
prototype systems they made wound up liking it, and Renesas abandoned sh5
instead of going into mass production.

Rob

P.S. The j-core guys have talked about a x86-64 mode bit style approach for
extending their superh clone into "j64". They haven't shipped that yet either,
but it's at least further confirmation that sh5 isn't coming back.
