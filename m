Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C4721C907
	for <lists+linux-sh@lfdr.de>; Sun, 12 Jul 2020 13:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgGLLWP (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 12 Jul 2020 07:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728850AbgGLLWO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 12 Jul 2020 07:22:14 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67909C061794
        for <linux-sh@vger.kernel.org>; Sun, 12 Jul 2020 04:22:14 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id e11so9664207qkm.3
        for <linux-sh@vger.kernel.org>; Sun, 12 Jul 2020 04:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=E8uIIGdZhBbt4P5nnZk6uO1gBzr10gvYnt0IgsMFtwA=;
        b=iDNr7lScSy5HSPnOIvGjT67vtn/XV/mjkEMKKL9E+H+Sokl1bQU7aUHIXX/MWVY3jg
         nNVrzTs7NVEFiNEt1QE45o9yOzxHr/CD9VbXiZDMYDMbCVIl66/VGhwot2HmJ6V5IOQo
         wE9kY9jsu9gMIenWCc4Jf9InVdIxwpKQue8q1MMxrJn5evdxNHTLXH1yJA8y6tpmlyBD
         bICbKgfL2ou6wrIVzODfEoxlLGqVhzx0xZh1yFMYIhhhsPMLlCMr0VuNYhkRaQw9coid
         al5MOsPTf9ZMUJZ99HfoShOVJhs9OOY9zJKwgA5lsaxnLgrZuG8IbiAH3+zWH0hAqOR4
         7BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E8uIIGdZhBbt4P5nnZk6uO1gBzr10gvYnt0IgsMFtwA=;
        b=Ych4Kf74zvL8XeZF4G85Hts4VaYw4Nj/eroA07+IPvBx0rJL8E8M04GjnizSBRuJcA
         BN5wuK2MmTe8adxIVoXhXhyItZEeBBHOtDiawWqdnbfHHqJUjqyeTNzMbSrr6D1wpyb0
         hdPaCxoygsww6ZVLOEp6xjZmfO6NqYjJ8eKKiYWLxivWKwjGrRm2c3+F3vMq//L9H4Ci
         OU2Wlg9HKbT345j4gS8OQRrSaHYhGZ1KFW5roSFQuK5rYuV75+NhfAJkxmNwqyXH/fB0
         +8ELY3kOEMrCyQVSQBvuZozYmwcCwokpvkVWUS2HLOKLpMl3l66XYIZ2JwOUTRoC/QUv
         EMYg==
X-Gm-Message-State: AOAM530ikCLpqmFigOrBcE/Mw19yEpFrzcZ1A6ybzKmRyrbNL8g8gohB
        veSCTdvOHvNBHkB0n7DtYFErQ/U4+01Tjw==
X-Google-Smtp-Source: ABdhPJwXIX/5PdSBHlaLzL5ZpjQeaRL0vF/bU9bzDwuxMCHJrW33wRDReDTH1nuTtATOSSmmX1BSSg==
X-Received: by 2002:a37:451:: with SMTP id 78mr49538711qke.117.1594552933707;
        Sun, 12 Jul 2020 04:22:13 -0700 (PDT)
Received: from ?IPv6:2607:fb90:95b7:945a:fceb:31ff:fed3:9377? ([2607:fb90:95b7:945a:fceb:31ff:fed3:9377])
        by smtp.gmail.com with ESMTPSA id g1sm16012505qkl.86.2020.07.12.04.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 04:22:12 -0700 (PDT)
Subject: Re: [PATCH] sh: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        ysato@users.sourceforge.jp, dalias@libc.org,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8b008a69-e73a-43cc-3dba-c1bce90c9902@landley.net>
 <20200712111118.24916-1-grandmaster@al2klimov.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <14fdab51-0197-1784-9ebb-356a0fd39952@landley.net>
Date:   Sun, 12 Jul 2020 06:30:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200712111118.24916-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 7/12/20 6:11 AM, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.

Trimmed just to the one site without the self-signed certficate: check.

> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Acked-by: Rob Landley <rob@landley.net>

Rob
