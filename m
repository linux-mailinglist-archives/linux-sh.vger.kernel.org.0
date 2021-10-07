Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ABF4249F1
	for <lists+linux-sh@lfdr.de>; Thu,  7 Oct 2021 00:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239792AbhJFWk2 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 6 Oct 2021 18:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239859AbhJFWkX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 6 Oct 2021 18:40:23 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E81BC06177C;
        Wed,  6 Oct 2021 15:37:43 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id np13so3309234pjb.4;
        Wed, 06 Oct 2021 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
        b=FIrtOed5QowKUvESH0rG0wvV+3jKddQCuuIuBfhHRTk8T8VmPDFwv1/sTJAAFMgoXe
         HXkN7YWXjhF/zrR2F/U+/MkjdMr28Eiiif61PM8lgdzeGlwKVNoy3cZO3oVwxlf1y4Qq
         ML0Zxd6olLxMEd7tbUGjRpK/R7cb1ynklKOEnOsKGuHS+AR9eM3gQhrSgwrpbIXxDltH
         O/Ru0l0Mwm5WP0mW7srNV2jrlVjnmHbcXmHAwvScFtyDBwPixATxWKZZPvwE9Leemq7b
         /FuyLrO0jdPkAaWnvyISUJPK4unL1H92dmReVh6yyqBPX6EVv7yFmcldM3IfxchdNGsR
         dHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
        b=jr36hr+unBUX+e4+RGzWWTFxCJhgO3Fr69AyfZx0/qnL4AbdGpovcQmx8qb+mq2qcx
         zaqEsjAKpMQwuJBDRxngvfagIQKGHCXSsSW026teLJ1VwBgRfsNoUbtKubJmfBCR0Xbd
         CFzI0tgly7kWIzDUEAz5NLN84DkgRBefTqfQMCLIqMbeck2l+qrbojF+qbDm1aXfMdyc
         hTfwIC54m1LMYnmv1ndvJWx8Bwmq7lNsTxEV1SCOlpmdtpIv1j3zb5Kn03Xl+VuJM4g6
         sEoPQ8OQQ4t8IDWVMQMbpIUIKA+l4lPz8euC7x2pibF6qUxshVDJczhQYfwAVaVAHCf3
         Nokg==
X-Gm-Message-State: AOAM533cszsY5tQvaPc/ZDtulmvXyNRfQjXtjZdAknV81ul7zdb5AUNB
        TEIL3CKgB2QhRf7H4HajJe4=
X-Google-Smtp-Source: ABdhPJz4BaWTMOr4ZP31Nn4C5AszSnkpRS3L0Y1gfKAehJA2FRUXByCD1kztbcVi2shP0MV6GW1oQQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id lw4mr830200pjb.174.1633559862671;
        Wed, 06 Oct 2021 15:37:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id c18sm20848814pge.69.2021.10.06.15.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:37:41 -0700 (PDT)
Date:   Thu, 7 Oct 2021 07:37:39 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Rob Herring <robh@kernel.org>, Rich Felker <dalias@libc.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
        Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Yoshinori Sato <ysato@users.osdn.me>, linux-sh@vger.kernel.org,
        x86@kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Catalin Marinas <catalin.marinas@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Ray Jui <rjui@broadcom.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        James Morse <james.morse@arm.com>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4lM/YJ4V4EAlZb@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org>
 <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Segher,

On Wed, Oct 06, 2021 at 04:27:28PM -0500, Segher Boessenkool wrote:
> On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> > You have defined of_get_cpu_hwid to return u64, will this create compiler
> > warnings when since we are storing a u64 into a u32?
> > 
> > It seems only if we make with W=3.
> 
> Yes.  This is done by -Wconversion, "Warn for implicit conversions that
> may alter a value."

Yeah, that is what I found out when I looked into it.

> > I thought we usually warned on this.
> 
> This warning is not in -Wall or -Wextra either, it suffers too much from
> false positives.  It is very natural to just ignore the high bits of
> modulo types (which is what "unsigned" types *are*).  Or the bits that
> "fall off" on a conversion.  The C standard makes this required
> behaviour, it is useful, and it is the only convenient way of getting
> this!

Thanks for the background, It does make sense. I guess I was confused with java
which requires casting when you store to a smaller size.  I.e.

    Test.java:5: error: incompatible types: possible lossy conversion from int to short
	s = i;

-Stafford
