Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5152B7ADD
	for <lists+linux-sh@lfdr.de>; Wed, 18 Nov 2020 11:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgKRKA0 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Nov 2020 05:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgKRKA0 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Nov 2020 05:00:26 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C811C0613D4
        for <linux-sh@vger.kernel.org>; Wed, 18 Nov 2020 02:00:25 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id b63so1076014pfg.12
        for <linux-sh@vger.kernel.org>; Wed, 18 Nov 2020 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6xuSq4B++8/9a+r9fRnsYezDbymY4HUsQ9Ym8Zq5Fio=;
        b=yE+dAaVza6ulyZxz83j6cbuv6Cym+0PBPZltdcyrICaasO6Hk3E9YS2YEMhFsae+FJ
         YBGM0fDrWpXSqjYS8uPhJQU5gXh27G7hS4IB9i9VNogqCg3jW9vIYhNd0byIxC4jzZX6
         tw+YOrv0fGZMQC2LPsSIX78qCGavy8Lz/3/jCzwcM1XEApZ+o7VF0oafYlKyrlb3LC8p
         fNPAtQZiCdTn9drUThnm2QgD/ud/geMiw/40zfHkdS3WGP72V8DCHdNuL95XZyyZz2fL
         +Qfn6eYAvl5RbhsoV2iWz/+qCsRBqak0m972SRd5rWNpDA6pT8E20XG+CJ8HNA2ixPXM
         JsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6xuSq4B++8/9a+r9fRnsYezDbymY4HUsQ9Ym8Zq5Fio=;
        b=ODWCCVQdcP0zTLvY04CIkQEaJMOYB86OheRPqeDIuwA3ZMSBjAGnKArs9IJ83B22Pg
         ERqQlqZc4Kl4mdepodZ7VoWCh6H3qPLCrvSdGMW+c1j7Ql49iiagmy4RRcluAKHaAaI8
         h1I5bXS3Dn+1n0Pwje5ScYUkzGR9rndKtUhcH1Jf4UmdIvyvWAymJumYFPix2lLl+tXk
         oWlSVLOVGCI+XbVG25fP98S7n/Fk+S3f0A1yWjBMmy3nxoqwyYu4uj+gQKsyr8cXIbih
         LF/SxD9dLtR0NLahcj5EPKSGEqxIUO5Pshfhes1SZi0M1VJaut2BH40+G/Er/DNXIp5q
         iqhw==
X-Gm-Message-State: AOAM531uxUGm/0cOLgRYC7ooVABAXH9OaF5LFQzeYoW5DZ+BPK5IAoiE
        a7sWLMjCdppiHxAIVTpVyCOAxdAc0lOcNKC/gmE=
X-Google-Smtp-Source: ABdhPJyJ7hPeaZ9zov9dWKnVGMZYUKCoW8YXlsYYi4RClcwlTQt4jkcWPl+XI/WI7VXDLeIEuBQoQw==
X-Received: by 2002:a05:6a00:13a4:b029:18b:cfc9:1ea1 with SMTP id t36-20020a056a0013a4b029018bcfc91ea1mr3780059pfg.25.1605693624341;
        Wed, 18 Nov 2020 02:00:24 -0800 (PST)
Received: from [10.4.169.240] (137.140.5.103.wi-fi.wi2.ne.jp. [103.5.140.137])
        by smtp.gmail.com with ESMTPSA id j15sm1934243pjn.35.2020.11.18.02.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:00:23 -0800 (PST)
Subject: Re: Kernel crash when syncing to usb-storage
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <d89a074e-c0ed-5d8b-a58e-ce3d420f579e@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <3a807d90-44c6-7c97-ae1d-89a3f3414baf@landley.net>
Date:   Wed, 18 Nov 2020 04:11:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d89a074e-c0ed-5d8b-a58e-ce3d420f579e@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/17/20 3:39 PM, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> Recently, I have started to see crashes when I try to sync a FAT filesystem
> on a USB pen drive. The crash is reproducible and seems to have been introduced
> in the 5.10 development cycle. I have not bisected the issue yet.

Which board is this on? (Kernel config?) Is it immediate or a ways into the backup?

The stack trace says the idle tasks is handling an interrupt and crashing in the
interrupt controller code? Let's see...

git log --no-merges v5.9..master arch/sh drivers/irqchip drivers/sh drivers/dma/sh

This may not be a fat OR usb issue, there were some plumbing changes recently in
IRQ controllers and such, ala b388bdf2bac7 and f9ac7bbd6e45 and a7480c5d725c and
a00e85b581fd and 57733e009f0c and...

Rob
