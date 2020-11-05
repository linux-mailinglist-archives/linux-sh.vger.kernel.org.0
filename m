Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23E62A8495
	for <lists+linux-sh@lfdr.de>; Thu,  5 Nov 2020 18:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgKERPi (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Nov 2020 12:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731759AbgKERPe (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Nov 2020 12:15:34 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45263C0613CF
        for <linux-sh@vger.kernel.org>; Thu,  5 Nov 2020 09:15:33 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id u62so2549684iod.8
        for <linux-sh@vger.kernel.org>; Thu, 05 Nov 2020 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MDVz0BYmGnQ2gofOIEnVxLEZI7aVyupKXOj2vDPWo3I=;
        b=u7+xVON+XlJJ4nFAqg3JBXRglp0YxYrevKYCVFFXCW7nImYygB+uiRpdan6vq2ld2y
         AGSRkuMjXAme8cWpE3LhJMyz666JLd18pX3UrQthUXf41qy8EeqFoXT5TuP25gt8E8VH
         3L2Ud1wB60qpt/84eJPbVNLHNBjScUjFrefAkvC9aBliJ1Iy4SjV+wzcUcwkd7o3+iuo
         ITlt85FrYUmyCOjC8tflccgEkgOnZFs2s1sbIfcrOtx4qWE2iwliTAUE9t1aVFtHo4L8
         xcM50t0trLvgbKeNfyQ5m2SxhAQ83JneT+HjCp1J1YC95hhnhUljPB+/BJOUefZ21DCn
         0jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MDVz0BYmGnQ2gofOIEnVxLEZI7aVyupKXOj2vDPWo3I=;
        b=MqvJREMkJ8aHgDBYatB/lmDGcqGvRsse1IvRB1goHR/rrpIf9/OiFMuDNC7urqmH9d
         eGif2MIcIowtmzeg7BD4fnYYHYlf75GMx0WW/oTXl20MNR57Joa1CIhptR4QKKH9kH8i
         DqYcC/zUyXtUsiPIo4PgBj5HJUkViz6szVYGLTzFICWPU0GPdFLz9468eXDU/yvLiqg0
         w7bxtGR9TCxE3cGcl0cX5UVMAZlHOdyO2DAsxcEJ/iTjt8B9Qg/HcMLkFYuEAbTiKcBx
         c6PdRekFgsmKPTR6oQlVcaz9VynSLByMUpouq+SRMkd+VceMq/Ear8VFtaRZ6+yVpcER
         XIig==
X-Gm-Message-State: AOAM530NrvUIRNL6vU/1t4xC5wD6q3ZnkPNVpgSc7icTt2XucqnJY/BY
        ZI+IJ86/Kqf+oebl+K8MODpSfg==
X-Google-Smtp-Source: ABdhPJx3e4RATqt5GiJBabS1KxGvzXuSeEPWRKTV8e65RVnozR1FkAI50It+3TAvulbrrP9HgvPwxg==
X-Received: by 2002:a02:b146:: with SMTP id s6mr1564252jah.10.1604596532605;
        Thu, 05 Nov 2020 09:15:32 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id k15sm1449425ils.87.2020.11.05.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:15:32 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
Date:   Thu, 5 Nov 2020 10:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 11/5/20 5:17 PM, Jens Axboe wrote:
>> Gentle nudge on this one.
> 
> I can build- and boot-test on SH and IA64.

That'd be great, thanks!

> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.

Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.

-- 
Jens Axboe

