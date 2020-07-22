Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D06228E5E
	for <lists+linux-sh@lfdr.de>; Wed, 22 Jul 2020 05:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731846AbgGVDFK (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 21 Jul 2020 23:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731647AbgGVDFK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 21 Jul 2020 23:05:10 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB400C061794
        for <linux-sh@vger.kernel.org>; Tue, 21 Jul 2020 20:05:08 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id h17so617736oie.3
        for <linux-sh@vger.kernel.org>; Tue, 21 Jul 2020 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6MieE8lmMOcpJsnL6jFYWayQCDE3d86nUx4kERlpXZ4=;
        b=kyX/sWj9e/qtBQFI+uiHMwbSJLKlYYkIt5YoRunRsNFn0aPp4c87f5kSiPX2maXThl
         sbXmCOPkMmuSO8MVzaKlhGUdg/Zi0ZmnNWEqTnrQIQpuhnC4QUDD1ejHquj9/5ihQnoF
         L+6VdLi4tpPl7W21fDcPK7e1iLC8efQ56BmFi20+vOWkMFDBUIw3fhzDzw2ZAuug8FjF
         Pwg48ILcl4rEodoalMpMYscJD+Z4kKUuDqESwCdOeqvXv34iLThHnYqbXoOYQeVz27S8
         dhMnyETZeh9Zh1Of1Xd0jd2rYUt84YtRYeP4QWlgThhSHl7Z2RRqSvgSsaidk4ls45gS
         HgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6MieE8lmMOcpJsnL6jFYWayQCDE3d86nUx4kERlpXZ4=;
        b=ZNrmd8ky/91sAOwp29tUBt8JQYhFIS/rJHL9dtylbwUAqWjuBnwFeP5H+Ee/Fitigh
         2T2HSXNvtUhewTGM1u7gmgtdr5n6haaIgZXzxKd76yENExN5/SBbyKwbfGUwwubQfoeM
         ssTvJZMxNxUEuxT6s1Q5jt6NqwVErbRTei6qDsL+XdUNIgczro0+RrluG3IQew5hM+Bx
         l1++1nsbFec9do6W4PRu3XlAmDQbpSBJogWKDKCqIdJilqGE+d/vs3HMyIkMns1NgMDO
         7SjIXd2lvWdyk9pKi5NbbFlJRKuWtj3oCeNJAnSruGUYhiUX5WMuZ9fgIgim1mZNNFof
         laKA==
X-Gm-Message-State: AOAM533xGdrgfTP2sMkL++OVk7FEpqQPcoQa1x3bej7lDynYkvQaFxVE
        QE2tWu1b1/YVjFCnhNDOYLUoVTSbXVQZrQ==
X-Google-Smtp-Source: ABdhPJwxEvluKZRxez/AaPqdx14NA+Dgqc5RtNBjq9vsMTG1ygaY7HulHKsp1VxDFUhJvXR/+btZ8Q==
X-Received: by 2002:aca:fd45:: with SMTP id b66mr5395526oii.90.1595387106678;
        Tue, 21 Jul 2020 20:05:06 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id j12sm1083887otp.21.2020.07.21.20.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 20:05:06 -0700 (PDT)
Subject: Re: Adding support for SECCOMP_FILTER
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux-sh list <linux-sh@vger.kernel.org>
Cc:     debian-superh@lists.debian.org
References: <32f7f7a2-a186-a3cc-0d03-e3380c0d21fc@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <bd4f0ecf-d5f9-ee1e-d58e-85db2fdda25a@landley.net>
Date:   Tue, 21 Jul 2020 22:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <32f7f7a2-a186-a3cc-0d03-e3380c0d21fc@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 7/21/20 1:59 PM, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> I recently discovered that the kernel supports seccomp on Linux as support
> was added in 2.6.27 [1].
> 
> I consequently added SH support to libseccomp [2], only to discover that we
> are missing the SECCOMP_FILTER feature. Looking at the changes for PA-RISC [3]
> and RISC-V [4], the necessary changes in the kernel seem to be rather modest.
> 
> Would anyone be willing to help me to implement SECCOMP_FILTER for SH? From what
> I can see, we just need to implement the part to add syscall filtering.

I dunno how much help I'd be (never having used seccomp), but I can try to
reproduce what you do on a second setup? :)

Rob
