Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357CD43CC14
	for <lists+linux-sh@lfdr.de>; Wed, 27 Oct 2021 16:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbhJ0O1V (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 27 Oct 2021 10:27:21 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:40206 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238214AbhJ0O1U (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 27 Oct 2021 10:27:20 -0400
Date:   Wed, 27 Oct 2021 10:24:51 -0400
From:   Rich Felker <dalias@libc.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Kees Cook <keescook@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH 06/20] signal/sh: Use force_sig(SIGKILL) instead of
 do_group_exit(SIGKILL)
Message-ID: <20211027142450.GV7074@brightrain.aerifal.cx>
References: <87y26nmwkb.fsf@disp2133>
 <20211020174406.17889-6-ebiederm@xmission.com>
 <CAHk-=whjqWwo16jtLduxb+0nbNetp8jNAz+go01wB4HGKX=jEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whjqWwo16jtLduxb+0nbNetp8jNAz+go01wB4HGKX=jEQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Oct 20, 2021 at 09:57:58AM -1000, Linus Torvalds wrote:
> On Wed, Oct 20, 2021 at 7:44 AM Eric W. Biederman <ebiederm@xmission.com> wrote:
> >
> > +                       force_sig(SIGKILL);
> 
> I wonder if SIGFPE would be a more intuitive thing.
> 
> Doesn't really matter, this is a "doesn't happen" event anyway, but
> that was just my reaction to reading the patch.

I think SIGKILL makes more sense unless there's a way the process
could handle the resulting SIGFPE and recover. I'd actually like to
see the lazy allocation of FPU state just removed (the amount of space
saved is tiny relative to the complexity cost and the negative aspects
of unrecoverable late failure) but for now let's just go with this.

Rich
