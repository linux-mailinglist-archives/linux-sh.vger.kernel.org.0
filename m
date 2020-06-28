Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDAA20C50C
	for <lists+linux-sh@lfdr.de>; Sun, 28 Jun 2020 02:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgF1Axt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 27 Jun 2020 20:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgF1Axs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 27 Jun 2020 20:53:48 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC85C061794
        for <linux-sh@vger.kernel.org>; Sat, 27 Jun 2020 17:53:48 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k15so12182862otp.8
        for <linux-sh@vger.kernel.org>; Sat, 27 Jun 2020 17:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nsJk0nfkSz2k8aqVeyIdgKyPII2GCP1n1XDCy7YehbI=;
        b=F5wASf8Fri/sqqZ7S2mvoeuV0cp88s2puvIaVhgk9pu0s3AK85cOQNvQmuJFXIXbP0
         K5O0fqTjeahCeeR4H5+T8jsxwb9p45cXU4aPr58kx3XQr0xPZfF0VGCTCRb4XXKXYzHG
         fTn9dh/vejm9BxHLOygA1x9Ij9n1HqRbvbjyHcNJ7l7tVJnj91fp5IQOwWtatuViqJn1
         jlQv/3C20RVn7epNlE4V/jRuilY8ncA9VhUwahS6YW7s0cm6CGLafzuTNc8N9GQwMA2D
         79GJTsnSiE2fMqtSVkfzse8n4EY1ATIwlNMXzf5a1RBLzxpBEL68NexetNvHfFTEUh3n
         0rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nsJk0nfkSz2k8aqVeyIdgKyPII2GCP1n1XDCy7YehbI=;
        b=TWPdzkGwGTCxebMgOOELqIAVtC3Rq6HJFXAn+jTWL//zYii3EN3b/blNyzyGwlho9j
         OmHF8m8mjMLpBi+kz1bLpI0lh5hIwnzYF/fQ915XmeCPrNnyYsqF6gXTwkjxkyafjlj4
         Q5z4AwwMOItXesGG41DxQLh+lx8B+pjrLDtrsYFM6h5+RDL+rudYf79uiQMqhXyr9HZq
         Oy3fSHR7QmcP0OkAfSxluuIjnr6+j+yaNqj6B8/grOoQY3E0A1u9WO78xrtz0CILlyP1
         1ca34HYlt+Pu+eckH1SEiwA+7Yjnpf+iNYS1JJNjMQy8vEB8vlF9W+xDNhAqBLaDcfwq
         gsYw==
X-Gm-Message-State: AOAM532JPzvubjvWgSaiTpQd24ubogyOVeSRHVIGEaC6yRZrfIWA9qAd
        0/Z8Eb/gM5HHhNkKj5BRM1bcpQ==
X-Google-Smtp-Source: ABdhPJyBBcuzNGLXgjXTTaFdvlSaAnU4ny+EPV2T61ymbabLc9jUaNqol49OUnUhrbe5fsPKNwvoOQ==
X-Received: by 2002:a9d:6e8a:: with SMTP id a10mr8226679otr.220.1593305628000;
        Sat, 27 Jun 2020 17:53:48 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id 62sm1639011ooa.25.2020.06.27.17.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2020 17:53:47 -0700 (PDT)
Subject: Re: [PATCH 09/10] sh: don't allow non-coherent DMA for NOMMU
To:     Christoph Hellwig <hch@lst.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200626080717.1999041-1-hch@lst.de>
 <20200626080717.1999041-10-hch@lst.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <e908f620-62b8-f106-a1a8-9887f50216fd@landley.net>
Date:   Sat, 27 Jun 2020 20:01:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626080717.1999041-10-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 6/26/20 3:07 AM, Christoph Hellwig wrote:
> The code handling non-coherent DMA depends on being able to remap code
> as non-cached.  But that can't be done without an MMU, so using this
> option on NOMMU builds is broken.

I'm working on a nommu j-core board that's doing DMA behind the OS's back at the
moment, which I have a todo item to teach the kernel about. The DMA does not go
through the cache, there's currently a cache flush before looking at the result
instead.

How should this be wired up after your patch?

Rob
