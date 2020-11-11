Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35FF2AF69F
	for <lists+linux-sh@lfdr.de>; Wed, 11 Nov 2020 17:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgKKQem (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 11 Nov 2020 11:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKKQem (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 11 Nov 2020 11:34:42 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09BBC0613D1
        for <linux-sh@vger.kernel.org>; Wed, 11 Nov 2020 08:34:42 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id g21so955150pjv.2
        for <linux-sh@vger.kernel.org>; Wed, 11 Nov 2020 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=E7tdJv/SATHNIn829RMc3Dy+9UyApMjdjMPVfkBbrsk=;
        b=hPFx5IuHaxeJELBn8a/6FXoQzTXaA4P6tVtDUuOMW7GWbi/yCgDUL4CxbD/v/ZLoEY
         bXoK2++cjH2Vhueb9F+BbvmMNatQ0ewQJlwl1qYaPPMSIEAjp27k2+WyOzw4KlI6gDcx
         bYX9md2+Qj3Gt+SPwymjGN6H3BdlhJR4ODuBJolA3wI4RTCMWhvOMbzIYmAAKVUETcUs
         vds6cOLcU/hn80WNIrGekNePOFbil8DXeRki9yUyoaH7Rd0rlchLbG2w5/ZZaBEIZGE2
         4u2jsaraD9+VBKlMk+YxeOW4R1d89oHt7Lcjz3CTF3tQ2byluEl630iCBM9sTbHnchx/
         6LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E7tdJv/SATHNIn829RMc3Dy+9UyApMjdjMPVfkBbrsk=;
        b=O/isyaLmsHVIJPD+Ul00aP6tl1g77iJVJIL1L50uhOfYjACFaxh2MONJX2z/5zYMIv
         ZUtFD44g5u0R7cyNLaNVF54dmy7xu49WRFepspei+pTWbIAH400NEyOhP7DjLnf7rZb/
         AdrVN8lqujRpCQld+FiGNLihLzOKIVhQWg9wG7o8c3AhHRb/0y6nVwvfaEaq5UcBEXMp
         7oU1hD0+EUi+OFreKKcV/9xYrN3bI/3QDQ26KJCrCFnYxdOXxuz1nsNJsqb9IoH/XPq/
         ZBcq+wfX00GLzaNY5Cu0I9J9p+je+4B7yConeVBGuSt86o2koYMR58CFTn8MCOb81Ji1
         gGwA==
X-Gm-Message-State: AOAM533SQW0a5KEBugBTWb7q8/IKBQa6BLtR+vUHJoszAzxIWhIRinFS
        eqV/yd77BKI8tVhMPGMt9BV8/Q==
X-Google-Smtp-Source: ABdhPJzyEEZSr7GhXUEQUpmvkSfKa89fHU8pKhjajrQ6W0i7H1mIgobF6AVYHVPEtFAPv4icFmZPug==
X-Received: by 2002:a17:90a:1d09:: with SMTP id c9mr4619291pjd.80.1605112482289;
        Wed, 11 Nov 2020 08:34:42 -0800 (PST)
Received: from [192.168.11.16] (softbank126112255110.biz.bbtec.net. [126.112.255.110])
        by smtp.gmail.com with ESMTPSA id b142sm3120743pfb.186.2020.11.11.08.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:34:41 -0800 (PST)
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
 <20201109121333.GC4077@smile.fi.intel.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <10b4dc8e-db87-3f78-3ab7-e08469b9fe55@landley.net>
Date:   Wed, 11 Nov 2020 10:45:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109121333.GC4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/9/20 6:13 AM, Andy Shevchenko wrote:
> On Mon, Oct 12, 2020 at 06:40:50PM +0300, Andy Shevchenko wrote:
>> The default by generic header is the same, hence drop unnecessary definition.
> 
> Any comment on this?

Acked-by: Rob Landley <rob@landley.net>

It's in the stack I forwarded to Rich to look at this weekend.

Rob
