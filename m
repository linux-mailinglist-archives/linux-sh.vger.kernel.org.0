Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C906244842
	for <lists+linux-sh@lfdr.de>; Fri, 14 Aug 2020 12:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHNKsj (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 14 Aug 2020 06:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgHNKsj (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 14 Aug 2020 06:48:39 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AECC061384
        for <linux-sh@vger.kernel.org>; Fri, 14 Aug 2020 03:48:39 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id x6so4054059qvr.8
        for <linux-sh@vger.kernel.org>; Fri, 14 Aug 2020 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+qY/p17L/b9wcys0LJIj3GfU8fr/QhfqLZpFRNCOOJk=;
        b=IsBJVms94ikKKtkPU5RxzX2Oha/5O2Wq5hWOA9ORHTs0OhISf/LTZCySUuIJYu/1SL
         +5uD9jQmLDoGShikJQ4CBoL6uLBdRPz0ka7v7fIIjdN6ifRVt1WE+NYNvHiJxYO9XAF2
         CHNqt2nAsuzB4qVVJKzmP3eX1E1bZzHCz1zJ0kvy2WBbcYVqJsOsEnJake0kFISWWSl8
         JDQZFpt8mAJe4RttDxfXDyfzN8eMOesfW9C8Z+iyNtygd5zWI4E/Ge9epUWxLfpehYD4
         gx7Dn3B1/B1IX/Hj8eclm5Emx5vOSxuUbQhPN2ouSDLw98shovQXFtwPP+B+/0OXJMjl
         RnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+qY/p17L/b9wcys0LJIj3GfU8fr/QhfqLZpFRNCOOJk=;
        b=E0+vjlxzwd8zqk23LXK2PLhzV0AxrZsdk0dkmzblntl/5bp1+XPXc6SjrcSBchOhyw
         fY6tk47ZvGp04fgABeK0axtugMRK5ajhPZvGc3Fq5l6dm+uq6Vb++0+m/Fp1W5uRU//P
         jU4Vv9bPBM60Ov3yebQhudsWNQke6DkqFbDn1qUkViHPE4KZcFDfXUBGJqIQoTrfX32R
         DLFHqWC4Gm1yZjdPjh5RVJoJZgK2RgnTuDJVJSrwNkQsUAc1jU653XaXrNR25qGE1SR6
         9eEXmhnaS9gKEHIPxAduGqde+yYTK8Bxzvk93nhVbrwHoBkXwMh0PS7nYm8GvFPpGePo
         QZxw==
X-Gm-Message-State: AOAM533U7amhkL2CJMNUpAJ8QMVY3TxYIAgZSRalw0TIfXiZ9BVFEpMe
        xE1FapmF+NCe6xxfWMkwj6HbxQUXktDiLw==
X-Google-Smtp-Source: ABdhPJz4GPUvZl5OKlxp1aJ7sooGpBWKGc/vt/tYtocRhGq8uAtymXoPD6GGw8FttlnOn0mjLPReJw==
X-Received: by 2002:ad4:518b:: with SMTP id b11mr2085216qvp.139.1597402118146;
        Fri, 14 Aug 2020 03:48:38 -0700 (PDT)
Received: from ?IPv6:2607:fb90:d70:8fa3:8803:5cff:fe19:985f? ([2607:fb90:d70:8fa3:8803:5cff:fe19:985f])
        by smtp.gmail.com with ESMTPSA id k24sm10024815qtb.26.2020.08.14.03.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 03:48:37 -0700 (PDT)
Subject: Re: Ping: Pull Request for 5.9
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Rich Felker <dalias@libc.org>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
References: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <4900b0a5-dcd2-bd56-e4fa-c8522fc3e776@landley.net>
Date:   Fri, 14 Aug 2020 05:57:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 8/12/20 5:55 AM, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> Any chances you can send the PR for 5.9 to Linus this week?

I spoke to him on the phone wednesday evening and he said he was working on it,
but then I spoke to him on the phone a week earlier and he said he was working
on it then too.

*shrug* I've been pulling daily to see if it got merged. No luck yet...

Rob
