Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB801BEC62
	for <lists+linux-sh@lfdr.de>; Thu, 30 Apr 2020 01:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgD2XDv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 Apr 2020 19:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgD2XDu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 29 Apr 2020 19:03:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AA6C03C1AE
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 16:03:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l19so4426158lje.10
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ur9jfHYBxvOMHwCSyzgCuO4pNPy1puU85FIa2ankgiI=;
        b=DrKHR3jwpIzSm+/wrDYjisbgySATaGLQu0oa0TojG2F2InX9rTKCVNl6/HZqurU3pj
         UJIyVXdxk5hO/DdTXuKDLWUrdoodxV3U8YTqMXkuAyOg5qLHqAdR8oZRRYrFIzlXyC4k
         sCR1zfwZ36sLzjhZCni2LVoS/XzTKFMv0dEak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ur9jfHYBxvOMHwCSyzgCuO4pNPy1puU85FIa2ankgiI=;
        b=oKsrgRgrt5VUmpgk1b/4wl4H2BB/zc88AQoU79IjDZpPo1DZcLcSGUzt+5UtaPrKc5
         p5Oqoxd2cM03sv37vZlJd8JSPHkbp4Cu1edBlIXJjhvmzTTzE2ovv7hvfgnaeETl3wuU
         9m78Z+n5V6YF10j+gRXw49wXIwmtmQQKhcBCEYfHom/b21IZ2EmXeXcw4Uez0AzQtWxj
         o1quEL4US6qB/w0Z7LW3gZ9hMsvU3G2HFCQlotUS6O+GZfUK8ZKz3Hzm+YKBu/qsmvxL
         UU+ABWrstnpD1/nW/iuzfojvJbpV2Zg0IkUxFlpNSN6GnwelvowPHWWAiBM7iDLm4Uej
         YcEA==
X-Gm-Message-State: AGi0PubTMEm+ltRmSS4G58NscdqCfaRJ6FAOcyW6OmrVAJ+fS1WP5wVD
        HdO6g8slbkvRbrk1UI2lAiIXvP3DXp4=
X-Google-Smtp-Source: APiQypLlPeW8xzMkNyHs4jgcZoxfRAEgqdv6/aDz/JX5N6UtbGzC0e9Nic6e2g1U0gSLmA0i/RG4eQ==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr315935ljj.105.1588201427117;
        Wed, 29 Apr 2020 16:03:47 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id l25sm2474948lfh.71.2020.04.29.16.03.45
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 16:03:46 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id t11so3143582lfe.4
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 16:03:45 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr119932lfk.30.1588201425482;
 Wed, 29 Apr 2020 16:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200429214954.44866-1-jannh@google.com> <20200429215620.GM1551@shell.armlinux.org.uk>
In-Reply-To: <20200429215620.GM1551@shell.armlinux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Apr 2020 16:03:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpoEr33NJwQ+hqK1dz3Rs9jSw+BGotsSdt2Kb3HqLV7A@mail.gmail.com>
Message-ID: <CAHk-=wgpoEr33NJwQ+hqK1dz3Rs9jSw+BGotsSdt2Kb3HqLV7A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix ELF / FDPIC ELF core dumping, and use mmap_sem
 properly in there
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Jann Horn <jannh@google.com>, Nicolas Pitre <nico@fluxnic.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Apr 29, 2020 at 2:57 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> I've never had any reason to use FDPIC, and I don't have any binaries
> that would use it.  Nicolas Pitre added ARM support, so I guess he
> would be the one to talk to about it.  (Added Nicolas.)

While we're at it, is there anybody who knows binfmt_flat?

It might be Nicolas too.

binfmt_flat doesn't do core-dumping, but it has some other oddities.
In particular, I'd like to bring sanity to the installation of the new
creds, and all the _normal_ binfmt cases do it largely close together
with setup_new_exec().

binfmt_flat is doing odd things. It's doing this:

        /* Flush all traces of the currently running executable */
        if (id == 0) {
                ret = flush_old_exec(bprm);
                if (ret)
                        goto err;

                /* OK, This is the point of no return */
                set_personality(PER_LINUX_32BIT);
                setup_new_exec(bprm);
        }

in load_flat_file() - which is also used to loading _libraries_. Where
it makes no sense at all.

It does the

        install_exec_creds(bprm);

in load_flat_binary() (which makes more sense: that is only for actual
binary loading, no library case).

I would _like_ for every binfmt loader to do

        /* Flush all traces of the currently running executable */
        retval = flush_old_exec(bprm);
        if (retval)
                return retval;

   .. possibly set up personalities here ..

        setup_new_exec(bprm);
        install_exec_creds(bprm);

all together, and at least merge 'setup_new_exec()' with 'install_exec_creds()'.

And I think all the binfmt handlers would be ok with that, but the
flat one in particular is really oddly set up.

*Particularly* with that flush_old_exec/setup_new_exec() being done by
the same routine that is also loading libraries (and called from
'calc_reloc()' from binary loading too).

Adding Greg Ungerer for m68knommu. Can somebody sort out why that
flush_old_exec/setup_new_exec() isn't in load_flat_binary() like
install_exec_creds() is?

Most of that file goes back to pre-git days. And most of the commits
since are not so much about binfmt_flat, as they are about cleanups or
changes elsewhere where binfmt_flat was just a victim.

               Linus
