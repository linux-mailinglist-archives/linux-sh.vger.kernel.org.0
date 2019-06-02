Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2E832325
	for <lists+linux-sh@lfdr.de>; Sun,  2 Jun 2019 13:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfFBL3Q (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 2 Jun 2019 07:29:16 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:49501 "EHLO
        mail02.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfFBL3Q (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 2 Jun 2019 07:29:16 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp [61.195.96.97])
        (Authenticated sender: PQ4Y-STU)
        by mail02.asahi-net.or.jp (Postfix) with ESMTPA id F02EF3ED0A;
        Sun,  2 Jun 2019 20:29:09 +0900 (JST)
Received: from yo-satoh-debian.ysato.ml (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 51A19240085;
        Sun,  2 Jun 2019 20:29:09 +0900 (JST)
Date:   Sun, 02 Jun 2019 20:29:08 +0900
Message-ID: <87y32kp6nv.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Sasha Levin (Microsoft)" <sashal@kernel.org>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: Re: [linux-stable-rc:linux-5.0.y 1434/2350] arch/sh/kernel/cpu/sh2/clock-sh7619.o:undefined reference to `followparent_recalc'
In-Reply-To: <20190602174314.09f5f337@canb.auug.org.au>
References: <201905301509.9Hu4aGF1%lkp@intel.com>
        <92c0e331-9910-82e9-86de-67f593ef4e5d@infradead.org>
        <20190531100004.0b1f4983@canb.auug.org.au>
        <871s0cqx33.wl-ysato@users.sourceforge.jp>
        <20190602174314.09f5f337@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL/10.8 EasyPG/1.0.0 Emacs/25.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, 02 Jun 2019 16:43:14 +0900,
Stephen Rothwell wrote:
> 
> [1  <text/plain; US-ASCII (quoted-printable)>]
> Hi Yoshinori,
> 
> On Sun, 02 Jun 2019 16:13:04 +0900 Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
> >
> > Since I created a temporary sh-next, please get it here.
> > git://git.sourceforge.jp/gitroot/uclinux-h8/linux.git tags/sh-next
> 
> I have added that tree to linux-next from tomorrow.  However, thet is
> no sh-next tag in that tree, so I used the sh-next branch.  I don't
> think you need the back merge of Linus' tree.

Oh sorry. I created sh-next branch in this git repository.

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
> -- 
> Cheers,
> Stephen Rothwell 
> sfr@canb.auug.org.au
> [2 OpenPGP digital signature <application/pgp-signature (7bit)>]
> No public key for 015042F34957D06C created at 2019-06-02T16:43:14+0900 using RSA

-- 
Yosinori Sato
