Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2762E19E187
	for <lists+linux-sh@lfdr.de>; Sat,  4 Apr 2020 01:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgDCXnR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 3 Apr 2020 19:43:17 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:36615 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgDCXnR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 3 Apr 2020 19:43:17 -0400
Received: by mail-oi1-f180.google.com with SMTP id k18so7772644oib.3
        for <linux-sh@vger.kernel.org>; Fri, 03 Apr 2020 16:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=R7WT6XueUSISbgPLsdKZLhvgz0vYqtrpRO3Hwj+RKJo=;
        b=ljRTM8gBnBfKqsgGU+3J9PclDfIYv1FT9ns3ZgCXvtefI0A15DdIQiDOB3pOgzDhAi
         FpNmfCeFaJPYZ6Fb+UecN0Ojn4X6ym1AY/AvE71uyt7gDCz1Q+CwhSKUnfgQTy+/14oh
         9JzsW5igErypgKSwIf3Tz+jDM3c0Cs5qVUUEpPe3ewim1vui0BGyo2G7DQiKAFci2bGu
         mJL6DEOWknLtvb2f4yOJUYLfN/FLxrL7TVWYRLUaziyE70ns4DGxLZRV9vfMHNn8ayH8
         9HFHEVEggPM6ncUlYh/mhoSQbvarWcvO+zwgnNCfP/VWl6egWh6a03AXEz9RAseqYj1G
         f1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=R7WT6XueUSISbgPLsdKZLhvgz0vYqtrpRO3Hwj+RKJo=;
        b=n3MxKC6EXF5QBV5HZ7N1CBVYz7ol2qIr0vO4lg1RcXs2d5b68FQZlb8usdi9u4yWls
         YJMKZ6K/opuVEXoMYl8XxQTD5kNZJZJscoQGNVt7mbEhcn6V5rRPY+2kcGXTChKRXOu6
         WK+Tj3uULPj60OeA3vCwsCzrjpzPe1t9eRIH4z132hbA5/1n9amRzvzpHlmJgzO+KT9b
         ui8VWzeeGnNXqT2Y2SoaMiKfCLZQhf6GALq/46Hp6s9FYly52j3C6lJQMlvWyGMQNasi
         pw6YC6beSrQ7bmOS9Nd+wILpR5203OW1ebW/0S03oePPJbqoNizh+rsb89DaGAJud/eF
         rctw==
X-Gm-Message-State: AGi0PuYIQRAzEnF8SAqNfkALS2Docdeqdew6Dxbf9ASdo2SwZMjq/oLA
        1NgAULf3+xnyUED+/HgMZ9KQpxn+LWA=
X-Google-Smtp-Source: APiQypKZf2ZuBBjlmrHV+ViXG52kbDsk8UJPM/cFcJ0ztzjcrVYcOASQ8MPcVGkh/89AoBrlUHDxWg==
X-Received: by 2002:a05:6808:103:: with SMTP id b3mr5306376oie.46.1585957394230;
        Fri, 03 Apr 2020 16:43:14 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id 26sm2495849oot.25.2020.04.03.16.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 16:43:13 -0700 (PDT)
To:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
From:   Rob Landley <rob@landley.net>
Subject: v5.6 is still throwing a stack trace on boot.
Message-ID: <24dbbbc2-644a-1f9e-4e82-b7b726a4ce42@landley.net>
Date:   Fri, 3 Apr 2020 18:49:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Run /init as init process
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at mm/slub.c:2468 ___slab_alloc.constprop.0+0x1f0/0x290

CPU: 0 PID: 1 Comm: swapper Not tainted 5.6.0 #2
PC is at ___slab_alloc.constprop.0+0x1f0/0x290
PR is at __slab_alloc.constprop.0+0x2e/0x54
PC  : 8c0a76c4 SP  : 8f829ea0 SR  : 400080f0
TEA : c0001240
R0  : 8c0a74d4 R1  : 00000100 R2  : 00000100 R3  : 00000000
R4  : 8f8020a0 R5  : 00000dc0 R6  : 8c01d678 R7  : 8fff5180
R8  : 8f8020a0 R9  : 8fff5180 R10 : 8c01d678 R11 : 80000000
R12 : 00007fff R13 : 00000dc0 R14 : 8f8020a0
MACH: 0000008b MACL: 0ae4849d GBR : 00000000 PR  : 8c0a7792

Call trace:
 [<(ptrval)>] mm_alloc+0xe/0x48
 [<(ptrval)>] do_IRQ+0x0/0x50
 [<(ptrval)>] __slab_alloc.constprop.0+0x2e/0x54
 [<(ptrval)>] arch_local_irq_restore+0x0/0x24
 [<(ptrval)>] mm_init.isra.0+0xdc/0x138
 [<(ptrval)>] kmem_cache_alloc+0xd0/0x15c
 [<(ptrval)>] mm_init.isra.0+0xdc/0x138
 [<(ptrval)>] mm_init.isra.0+0xdc/0x138
 [<(ptrval)>] memset+0x0/0x8c
 [<(ptrval)>] __do_execve_file+0x22e/0x5d8
 [<(ptrval)>] kmem_cache_alloc+0x0/0x15c
 [<(ptrval)>] do_execve+0x16/0x24
 [<(ptrval)>] arch_local_irq_restore+0x0/0x24
 [<(ptrval)>] printk+0x0/0x24
 [<(ptrval)>] kernel_init+0x34/0xe8
 [<(ptrval)>] ret_from_kernel_thread+0xc/0x14
 [<(ptrval)>] schedule_tail+0x0/0x5c
 [<(ptrval)>] kernel_init+0x0/0xe8

---[ end trace 76213c1325250d90 ]---
