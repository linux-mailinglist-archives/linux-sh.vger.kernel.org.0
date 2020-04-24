Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AB01B7EA8
	for <lists+linux-sh@lfdr.de>; Fri, 24 Apr 2020 21:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgDXTOI (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 24 Apr 2020 15:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726793AbgDXTOH (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 24 Apr 2020 15:14:07 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F938C09B048
        for <linux-sh@vger.kernel.org>; Fri, 24 Apr 2020 12:14:06 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id i27so14310801ota.7
        for <linux-sh@vger.kernel.org>; Fri, 24 Apr 2020 12:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PEzBoGPEV6Lu6Co+kILdLV3vmqdpd3yNs85Y1/dT2Ho=;
        b=l3Iqz5A2VKt0oeAI9Nuw4Zbnp656/szZTkqkRyHoji4r1WuWOP3MhmbTTJkkymjnRa
         hsXJV16CwRunqLfN/XMmqfEiOzYpr8HRA9D4JgnS14lyqud6/gaQ4x0mPwjUF00rU/Fw
         TVP/TplXdDfnjs/lsXf1Z9p17JTcldc0s5KK/wx6JLfU8gKuyRCXFCT9LMRENC75ZAVf
         /+bM/bGMwNXcypgC/HFAiGQQLkF92ncBm8wCJ+Gww0JfPXYAj+Vr5TGCjiCEyXZXf0ms
         aLXexzwfDa/ZZtj4QZ0NMfGkPOTjjnhGmEUUkPItCknQ+ecgzp4kUOAsV6YrqjGIq3Mu
         KWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PEzBoGPEV6Lu6Co+kILdLV3vmqdpd3yNs85Y1/dT2Ho=;
        b=HSSI5BrzmoFiOBI190KVnNfAOPdyd+T/F9KcDIg3tHSJCV/fD62hxAVzuFFeouqFVP
         XRuEXPNTVrbCifgZU4FHGdngXsQ79E9UObbEA51X0kwJ7ee1ofER3heBo9+Z2smG5y++
         2rABJFbuvC4QHFX1nuIEINn4/96YHw9cmWZEUmQLFi2A+6tON7ekEVppWket+rPghHKI
         /cpjDC4Oda81At4cTn17p8sr0542+soNDOGOHAmjvltThtflz6FBBZ9Op9mxELlnoQoP
         BFFJMfWbmLV7c8HPBeTVgVzyNVq6YLkqK7CbqhcVksLQJjN9Wec9VNQ+rrFzVDlPZ57K
         St9Q==
X-Gm-Message-State: AGi0PuYxLQ3I6Y13SpGwpWVc9U0FadlposYEVU70Qt5C303ZgOfjDy/5
        jzzyk6UkJNdvNoSRgRrV9/3I6AUx1U4=
X-Google-Smtp-Source: APiQypKy1+rlgl4BXVYFsN1EXihIFDIRpRxt8hDV7QHVF1E1uLiX/STN2GU7AVIPiFIcmTs/DDH9Fg==
X-Received: by 2002:aca:df45:: with SMTP id w66mr8089402oig.76.1587755645263;
        Fri, 24 Apr 2020 12:14:05 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id q187sm1852489oih.48.2020.04.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 12:14:04 -0700 (PDT)
Subject: Re: [PATCH 1/2] sh: remove sh5 support
To:     Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org
Cc:     ysato@users.sourceforge.jp, dalias@libc.org
References: <20200420123844.3998746-1-arnd@arndb.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <f25e9217-f1b7-ca8f-7a80-9dfb2d340908@landley.net>
Date:   Fri, 24 Apr 2020 14:20:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420123844.3998746-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 4/20/20 7:38 AM, Arnd Bergmann wrote:
> sh5 never became a product and has probably never really worked.
> 
> Remove it by recursively deleting all associated Kconfig options
> and all corresponding files.
> 
> For review purposes, this leaves out the files that can now be
> removed, in particular
> 
>  arch/sh/drivers/pci/*-sh5.c
>  arch/sh/include/asm/*_64.h
>  arch/sh/include/uapi/asm/*_64.h
>  arch/sh/include/cpu-sh5/*
>  arch/sh/kernel/cpu/sh5/*
>  arch/sh/lib64/*
>  arch/sh/mm/*-sh5.c
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked in principle, I'll try to test that it doesn't break any of my configs
this weekend.

(There are plans for 64 bit j-core that have nothing to do with SH5, and we can
submit brand new infrastructure for j64 when we get there.)

Rob
