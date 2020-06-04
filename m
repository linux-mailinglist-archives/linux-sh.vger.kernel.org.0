Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87511EE14A
	for <lists+linux-sh@lfdr.de>; Thu,  4 Jun 2020 11:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgFDJ2s (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 4 Jun 2020 05:28:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44552 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgFDJ2s (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 4 Jun 2020 05:28:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id e5so4215493ote.11
        for <linux-sh@vger.kernel.org>; Thu, 04 Jun 2020 02:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0C12uHZ7QWFEGCbbL5AMTLsGJh9G6T8ZwkKGPQcLowc=;
        b=Y3vHnVzqONXD8FoVx6IqaiS7BQvp63K+uKrZR8VovmU+b40jRvs6P4e4KBvOKw4Sfy
         UgqnxsuWZXr3pyCr+m23ODFD49xBYx9U2tLlJIUGVdc6ojYXjgPMhSDvF92d8wyo3wef
         P9KaF/0cFI7qlPwSKXUl/KzQsOdAB3ccQQe6gppttP2ArzkT97w6I9d5k4tOy4tIAH30
         BVSa55hWRXUw3WhgTBiWQr1FPBApk+l5z34TgYM1EP7Wc+wF7QXtQw2UR3P0bdADL0dG
         IFwgc4VO0x9ebpWrGh+UjXwEsG3vbXKkquidGiOev5LdyTQ4SZlNbLvSCWHTELrGSdQ4
         0msQ==
X-Gm-Message-State: AOAM5312wfrJRa7gJz761XbBCb+oNdz7ZfFtIY53OmTL8cwO/vchw5+Z
        CXhQZFF+QWk9mmcKWxyo9XsVSFNXxmsD5U8w5d765+3G
X-Google-Smtp-Source: ABdhPJxWUpJBd7LPO5uPS0cmAAp49BIHlXf56tsDO6/BrJMJlKZTPQxjBTEtrGzTfEg24oeiwQRAj13haosVwlZ47uw=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr2812842otr.107.1591262927576;
 Thu, 04 Jun 2020 02:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <364fae0d-6030-6741-d38a-3e6fd15fc4ca@physik.fu-berlin.de>
In-Reply-To: <364fae0d-6030-6741-d38a-3e6fd15fc4ca@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Jun 2020 11:28:36 +0200
Message-ID: <CAMuHMdXeEUoZVDDK5QWuLDw6Spav3w0mzC2Ev6tN_8W3guptoA@mail.gmail.com>
Subject: Re: Kernel doesn't boot on qemu-sh4
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Adrian,

On Thu, Jun 4, 2020 at 10:54 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Has anyone had any success booting a current kernel on qemu-sh4?

Yes, I booted my local tree, based on renesas-drivers[*], on emulated
rts7751r2d 2 days ago.

> I have built a Debian kernel with both my patch to add __get_user_u64() as
> well as the two patches by Romain Naour [1,2] but the kernel still doesn't
> boot for me.
>
> Am I missing anything?

My local tree also has:
  1. https://marc.info/?l=linux-arch&m=153337991312146&w=2
  2. https://lore.kernel.org/linux-mm/20191204133454.GW2844@hirez.programming.kicks-ass.net/

If it still fails after that, I'll have a deeper look.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2020-06-02-v5.7

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
