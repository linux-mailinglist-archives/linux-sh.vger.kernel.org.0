Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB8025BAED
	for <lists+linux-sh@lfdr.de>; Thu,  3 Sep 2020 08:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgICGRU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 3 Sep 2020 02:17:20 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:49160 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgICGRU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 3 Sep 2020 02:17:20 -0400
Date:   Thu, 3 Sep 2020 02:17:19 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 3/4] sh: Add SECCOMP_FILTER
Message-ID: <20200903061718.GZ3265@brightrain.aerifal.cx>
References: <20200722231322.419642-3-kernel@mkarcher.dialup.fu-berlin.de>
 <20200828155024.GX3265@brightrain.aerifal.cx>
 <20200828163057.GY3265@brightrain.aerifal.cx>
 <82b625c2-23cb-69a4-7495-39427430c306@physik.fu-berlin.de>
 <20200828170259.GZ3265@brightrain.aerifal.cx>
 <20200829004939.GB3265@brightrain.aerifal.cx>
 <b0e38ede-3860-eb83-615e-ad77f619a3a6@physik.fu-berlin.de>
 <20200903035603.GV3265@brightrain.aerifal.cx>
 <20200903054617.GW3265@brightrain.aerifal.cx>
 <c871e590-7027-0470-b112-667ec8437a25@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c871e590-7027-0470-b112-667ec8437a25@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Sep 03, 2020 at 08:04:44AM +0200, John Paul Adrian Glaubitz wrote:
> On 9/3/20 7:46 AM, Rich Felker wrote:
> > 
> > OK, I think I have an explanation for the mechanism of the bug, and it
> > really is a combination of the 2008 bug (confusion of r0 vs r3) and
> > the SECCOMP_FILTER commit. When the syscall_trace_entry code path is
> > in use, a syscall with argument 5 having value -1 causes
> > do_syscall_trace_enter to return -1 (because it returns regs[0], which
> > contains argument 5), which the change in entry-common.S interprets as
> > a sign to skip the syscall and jump to syscall_exit, and things blow
> > up from there. In particular, SYS_mmap2 is almost always called with
> > -1 as the 5th argument (fd), and this is even more common on nommu
> > where SYS_brk does not work.
> > 
> > I'll follow up with a new proposed patch.
> 
> I'm not sure whether we need another revision of your first patch. Your
> previous analysis was at least right regarding the tests 51 and 58
> but those have been fixed now.
> 
> But there were two other tests failing, weren't there?
> 
> I have to recheck later, I just got up (it's 8 AM CEST).

The first patch was surely not right; setting syscall_nr to -1 and
letting it -ENOSYS clobbered any return value set by the seccomp
filters. The one I've sent now should be right. I'll follow up after
testing with libseccomp test cases.

Rich
