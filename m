Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97E41960C6
	for <lists+linux-sh@lfdr.de>; Fri, 27 Mar 2020 23:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgC0WAS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 27 Mar 2020 18:00:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39528 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC0WAS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 27 Mar 2020 18:00:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id x11so11424864otp.6
        for <linux-sh@vger.kernel.org>; Fri, 27 Mar 2020 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DSKGdPyxBzKTet6OZPsbuYDgffxpyrcZdumnd+aXm7Q=;
        b=mONkssnMfjyTuGgZGJjyXHpshgd5917UhKNPqhbvY5PQ6ZSGXske9llXyY10bucht4
         h1xs3bxMniJBIDOEc72mntjWBY8eMkrSAfgWw5CeSdrd1iG8+SYQGiYy4y8iKX6vMzCZ
         qHgJj8+4DonzUQOudd8hF/za5YbowsVKgmp3l/bttsnVh2wHdGsJHGCwXDtOMltl/rDG
         yhgQCmFYlGYPdGU1sCBrdj1/stkL7w//JFjxwWwPk+iQgNxQUfNq9c8pxRd/tVDQppBf
         vZup+xD2X8zxcgKXoczqfFho6L4uI58a/QZDj3QVVQ46jeRiNPkgmcbo2xbUu771jyRD
         qGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DSKGdPyxBzKTet6OZPsbuYDgffxpyrcZdumnd+aXm7Q=;
        b=d2rwjSeobcYquJrqrWGxubgjC0DCC2jn590skFGpy4bZkUYGo1jhZk3H5VtA6m6EBR
         lpQGwzJ+xkmI1LG8zFhbx+qEyx28uCDCJGi0fbFH7pi2VPrTIwcNZ+rcntaQwF3HBTNl
         0x+BJGG8jNHfglWH16GjeWji84L5hYC/gsXooEyWnOk80ID8eQQwcoLaTr+M2zuH4WgH
         wQbeL4uRoGP2jMouiKbtJW3V7gPLzLcQ62e7XVu/CSJ9tyIWWS3xVy78l5h71Z+bOJpm
         gvqyzUFCdJHo35xub9J34WgcZB6i5+pz1XpD2rl5lscFfj9WcUWXXntH6m/PsWWgoEoH
         4msQ==
X-Gm-Message-State: ANhLgQ3rhpnlQ0kFav28ESztH86sWgDyLjwgxzr42UpQC94IwcimsK25
        rfVoUOQhNIW08GRz7ddlda91+CcU48w=
X-Google-Smtp-Source: ADFU+vsSBAkZ2GsxzBQMwjTZaH/8Fikpu8U1C4+RVK+OgMmZdluSfvXK5qkQJPFzOsFM+tuK9KLUug==
X-Received: by 2002:a05:6830:18f4:: with SMTP id d20mr658366otf.91.1585346417076;
        Fri, 27 Mar 2020 15:00:17 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id m15sm2316715oof.28.2020.03.27.15.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 15:00:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
To:     Rich Felker <dalias@libc.org>,
        Romain Naour <romain.naour@gmail.com>
Cc:     linux-sh@vger.kernel.org, Alan Modra <amodra@gmail.com>,
        geert+renesas@glider.be
References: <20200315175108.9694-1-romain.naour@gmail.com>
 <20200315175108.9694-2-romain.naour@gmail.com>
 <20200326204240.GF11469@brightrain.aerifal.cx>
From:   Rob Landley <rob@landley.net>
Message-ID: <0f44cd31-a3e4-7b14-b9a8-28e4b0fd571e@landley.net>
Date:   Fri, 27 Mar 2020 17:05:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326204240.GF11469@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 3/26/20 3:42 PM, Rich Felker wrote:
> On Sun, Mar 15, 2020 at 06:51:08PM +0100, Romain Naour wrote:
>> Since the patch [1], building the kernel using a toolchain built with
>> Binutils 2.33.1 prevent booting a sh4 system under Qemu.
>> Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
>> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Alan Modra <amodra@gmail.com>
> 
> Acked-by: Rich Felker <dalias@libc.org>

Is there any way to get this into sunday's release?

Acked-by: Rob Landley <rob@landley.net>
