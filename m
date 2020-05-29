Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9672D1E7B9F
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2020 13:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2LVl (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 May 2020 07:21:41 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43039 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgE2LVk (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 May 2020 07:21:40 -0400
Received: by mail-oi1-f194.google.com with SMTP id i22so2215408oik.10
        for <linux-sh@vger.kernel.org>; Fri, 29 May 2020 04:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OLEMbhd1kk0E2I4YvfI5BfmNer7ltStZvU+aza4VEsg=;
        b=D/Ub/wLlm9HY+ZRHLzLnr3CigBYj8mNB1rFa9reeSgzbrfKU9ZReRfTN3QUS2w8WfS
         wX4CtgzXg6yR1VG0mIzsIoAbWKqy9rdi8g6257vjs2G/QJJzvuks4q0ISj3eXDUkLgQ1
         fT2dzZjLMd24PtSy81riDIkLaW2Zy2DXYU89R46AQtQaa57SUjmZr37MkmhS7s4wu67U
         GnAXdU2V7mX2rcfk3Yy5kp6D1uuS4ioyg76F2Ptu5qMu7hKmdWRULF4BzyAVpnr1HasE
         9R2t8QrSIzXFtrVd8maQlPbl6R8TTISp8gMIih6XsAfb+mam9OIV+con6bDQ7314NHUB
         o0uQ==
X-Gm-Message-State: AOAM531/UJzyL9g7kFUZr9QwHdf7YoBh8SVDD/XJWNdPPKHnp3tq46uX
        fUfJmsZ83IkWTY5GU5dFjcvWWYA8T3Fa3Wiw2SY=
X-Google-Smtp-Source: ABdhPJwe1N+Qbk01CyqKVFO32e/bvTW1BuhxGGhjFc94I6QcVsJEc4LK9ODsSYHaEo0QdcbgskqruCL/adGOUz6iQvU=
X-Received: by 2002:aca:210a:: with SMTP id 10mr5035891oiz.153.1590751298625;
 Fri, 29 May 2020 04:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <8945f9b7-d4d3-851e-dc4f-2d05ed94c169@physik.fu-berlin.de>
 <CAMuHMdXnbCtRUFvJ=JUWjgO2O8h=tHfKB30HQCdZrnhwtWgG8g@mail.gmail.com>
 <11913b96-0a05-7fca-e744-dd29eddf5327@physik.fu-berlin.de>
 <CAMuHMdVep67j96taE6aaBO3r+Vo2kBXn-zt653YU0iTiDnH8Xg@mail.gmail.com> <60c9b069-0287-5d28-bb6c-6fdf7560f8e8@physik.fu-berlin.de>
In-Reply-To: <60c9b069-0287-5d28-bb6c-6fdf7560f8e8@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 13:21:26 +0200
Message-ID: <CAMuHMdV2F-RqeG7ZgO3jJy+_JobkCnYnZ_PWm__dtPRKQY2gVQ@mail.gmail.com>
Subject: Re: Build fails with unknown symbol __get_user_unknown with
 InifiniBand enabled
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Adrian,

On Fri, May 29, 2020 at 12:35 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 5/29/20 12:21 PM, Geert Uytterhoeven wrote:
> >> Would this be fixed by Arnds patch series to remove SH-5 support by any chance?
> >
> > No, it won't. As this is uaccess_32.h, i.e. for sh32.
> > All architectures are supposed to implement 64-bit get_user() accesses.
>
> Ok, I assume we need an implementation like this then [1]?
>
> Adrian
>
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2f680380ddf2f003882e59e00acd6c1952f91fc

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
