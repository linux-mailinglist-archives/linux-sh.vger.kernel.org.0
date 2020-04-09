Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F3A1A30BE
	for <lists+linux-sh@lfdr.de>; Thu,  9 Apr 2020 10:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgDIIRA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 9 Apr 2020 04:17:00 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43614 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgDIIRA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 9 Apr 2020 04:17:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id n25so6996215otr.10
        for <linux-sh@vger.kernel.org>; Thu, 09 Apr 2020 01:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A19Z1m6SeceiRfz/kbDyLUJO2E9aoZH4sv9BhtJW+PM=;
        b=g4c1bE3Fo6i2k3szz5pG4SzOXOOrzFx4BZnYwsMlso3VwVI2hhIxPNJmWUWE+7Gaps
         vMbEqCSKFek5OWOtxIpL/Gbje5La+1aj/whsByrE9zq/yg7tHE6DYmt+IiYMbZHVmpRW
         NfEmq6BiPt7X46Pye64xhbDU2Sq+zBhW4RacudoD4WMNT5Po01YLGhwbgGwz3u9L8qVt
         WjiCutbHSOJh3RmUPYFL+wBzn9ibw/izDy0e1iicArgb+l5T6f+flTl/dzj0CRhNBn9l
         Nra4eoPJE07gi+xNZqnERwi0uMHQ2HiPpPDTMGyNEDi1wn56GL7dS4QIKh4ABrxVCeaB
         u/xA==
X-Gm-Message-State: AGi0PuYTPC+JTsHezB6PhfK3VG+ghsTfrcJ16DLjXoe9Iati82h/PCiF
        kod5KfWaiMwstg6NV3/iRmqdhKO4dTo8uoF4OgY3QtzF
X-Google-Smtp-Source: APiQypJlC6XowWVd+Gp7WwTmFAyK/8wuFP/5BETZCbW7/XRreY3nJooMtbBkL4sp8jCAVWxct04NrLzsIKFonQCPSuw=
X-Received: by 2002:a4a:e495:: with SMTP id s21mr8935732oov.79.1586420220266;
 Thu, 09 Apr 2020 01:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <1da19521-b70c-272c-51bb-9416ece62772@landley.net>
In-Reply-To: <1da19521-b70c-272c-51bb-9416ece62772@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Apr 2020 10:16:49 +0200
Message-ID: <CAMuHMdWUCtpP3_roXz4Mfb9pLGdhksUHzM8LbViWZZT2w1JfOg@mail.gmail.com>
Subject: Re: [PATCH] Fix verbose arch/sh panic messages.
To:     Rob Landley <rob@landley.net>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Rob,

On Thu, Apr 9, 2020 at 10:03 AM Rob Landley <rob@landley.net> wrote:
> From: Rob Landley <rob@landley.net>
>
> These days printk() adds a newline, so 8 lines of memory dump becomes 80.
>
> Signed-off-by: Rob Landley <rob@landley.net>

See also "[PATCH 2/7] sh: dump_stack: Fix broken lines and ptrval in
calltrace dumps" of series "[PATCH 0/7] sh: Modernize printing of kernel
messages"
https://lore.kernel.org/lkml/20191203162645.19950-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
