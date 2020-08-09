Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67C023FFEF
	for <lists+linux-sh@lfdr.de>; Sun,  9 Aug 2020 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgHIUIX (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 9 Aug 2020 16:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgHIUIX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 9 Aug 2020 16:08:23 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FE0C061756
        for <linux-sh@vger.kernel.org>; Sun,  9 Aug 2020 13:08:22 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k4rc8-00CkdZ-OJ; Sun, 09 Aug 2020 20:08:16 +0000
Date:   Sun, 9 Aug 2020 21:08:16 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [regression fix] Re: "sh: convert to ->regset_get()" breaks
 linux-sh build
Message-ID: <20200809200816.GA1236603@ZenIV.linux.org.uk>
References: <9c2d391c-6463-398e-95a1-8f238d739340@physik.fu-berlin.de>
 <20200809161438.GZ1236603@ZenIV.linux.org.uk>
 <20200809174508.GA3026725@ZenIV.linux.org.uk>
 <CAHk-=wi1ocV0dk=DXLgT01Eqg0Xnm65Hfq44=8p5yPu8=jrt5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi1ocV0dk=DXLgT01Eqg0Xnm65Hfq44=8p5yPu8=jrt5A@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Aug 09, 2020 at 12:21:57PM -0700, Linus Torvalds wrote:
> On Sun, Aug 9, 2020 at 10:45 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > FWIW, there are several ways to handle that.  One is to pull vfs.git#fixes -
> > that's the first commit of #regset.followups.  Another is to cherry-pick
> > the same.  And the minimal fix would be the subset of that commit as below.
> > Linus, what would you prefer?
> 
> Mind just sending me a proper pull request for the fixes branch with
> that one commit?

Sure.

Fixing regression from unnoticed bisect hazard in regset series.
A bunch of old (aout, originally) primitives used by coredumps became
dead code after fdpic conversion to regsets.  Removal of that dead code
had been the first commit in the followups to regset series; unfortunately,
it happened to hide the bisect hazard on sh (extern for fpregs_get()
had not been updated in the main series when it should have been; followup
simply made fpregs_get() static).  And without that followup commit
this bisect hazard became breakage in the mainline.

Please, pull that followup commit in - all it does is dead code removal, so
it should be safe enough.  And it deals with regression.  One trivial conflict
in nios2 - addition of nios2_clone() in mainline vs. removal of dump_fpu()
in this commit, both in the very end of arch/nios2/kernel/process.c.

The following changes since commit ce327e1c54119179066d6f3573a28001febc9265:

  regset: kill user_regset_copyout{,_zero}() (2020-07-27 14:31:13 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git fixes

for you to fetch changes up to bb1a773d5b6bf018bf84fdb3fbba01d3ef54e2c9:

  kill unused dump_fpu() instances (2020-07-27 14:33:10 -0400)

----------------------------------------------------------------
Al Viro (2):
      Merge branch 'work.fdpic' into regset.followup
      kill unused dump_fpu() instances

 arch/arc/kernel/process.c      |  5 ----
 arch/arm/kernel/process.c      | 15 ----------
 arch/hexagon/kernel/process.c  |  9 ------
 arch/ia64/kernel/process.c     | 34 ----------------------
 arch/nios2/kernel/process.c    |  8 -----
 arch/openrisc/kernel/process.c |  7 -----
 arch/parisc/include/asm/elf.h  |  3 --
 arch/parisc/kernel/process.c   | 19 ------------
 arch/s390/kernel/process.c     | 18 ------------
 arch/sh/include/asm/fpu.h      |  5 ----
 arch/sh/kernel/process_32.c    | 18 ------------
 arch/sh/kernel/ptrace_32.c     |  2 +-
 arch/sparc/kernel/process_32.c | 49 -------------------------------
 arch/sparc/kernel/process_64.c | 66 ------------------------------------------
 14 files changed, 1 insertion(+), 257 deletions(-)
