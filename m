Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E93CBB1D
	for <lists+linux-sh@lfdr.de>; Fri,  4 Oct 2019 15:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387764AbfJDNAf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 4 Oct 2019 09:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:36284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387593AbfJDNAe (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Fri, 4 Oct 2019 09:00:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7B73207FF;
        Fri,  4 Oct 2019 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570194033;
        bh=5Q/iWTgymOppj9DeDqpQWfy6Ic9FHuGC0vgACNbYbd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jeWNxAVjM4M9jRnwjBw1GFUCfukHqXGsDW5rJu7N0l04+zMSDtyZVPUWlR7BmlWPW
         Pf8rFwhCg6vy/1UMQMas0rybf6WEZzSjEubo9xj49BqcCMo8veo/EBye4ja8KOnHZd
         iPIwswtomqveq0U9KIpbFVNiWnUPXYYEX4JVu/C8=
Date:   Fri, 4 Oct 2019 15:00:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jslaby@suse.com>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 0/2] drivers: make early_platform code SuperH-specific
Message-ID: <20191004130031.GA596158@kroah.com>
References: <20191003092913.10731-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003092913.10731-1-brgl@bgdev.pl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Oct 03, 2019 at 11:29:11AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Some time ago I started a discussion about the need for a proper early device
> probing mechanism[1]. One that would be based on real platform drivers and
> support both platform data and device tree.
> 
> While we're far from reaching any consensus on the implementation, Arnd
> suggested that I start off by moving the SuperH-specific early platform
> drivers implementation to arch/sh[2].
> 
> This series is the first attempt at making way for a new, less hacky
> implementation.
> 
> The first patch moves all the early_platform code to arch/sh.
> 
> The second patch prefixes all early_platform symbols with 'sh_'.
> 
> [1] https://lkml.org/lkml/2018/4/26/657
> [2] https://lkml.org/lkml/2018/4/27/239
> 
> v1 -> v2:
> - certain drivers are compiled for arm/mach-shmobile too - we need to
>   add ifdefs for CONFIG_SUPERH around early_platform calls
> 
> v2 -> v3:
> - added a stub for is_early_platform_device() which always returns false
>   on non-SuperH architectures
> 
> v3 -> v4:
> - rebased on top of v5.4-rc1
> - removed patches that are already upstream from the series
> 
> Bartosz Golaszewski (2):
>   drivers: move the early platform device support to arch/sh
>   sh: add the sh_ prefix to early platform symbols

I like this, any objection from anyone if I take this in my driver-core
tree for 5.5-rc1?

thanks,

greg k-h
