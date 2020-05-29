Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D54D1E85D1
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2020 19:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgE2Rxj (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 May 2020 13:53:39 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:35954 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgE2Rxj (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 May 2020 13:53:39 -0400
Date:   Fri, 29 May 2020 13:53:38 -0400
From:   Rich Felker <dalias@libc.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Rob Landley <rob@landley.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] sh: remove sh5 support
Message-ID: <20200529175335.GK1079@brightrain.aerifal.cx>
References: <20200424221948.1120587-1-arnd@arndb.de>
 <20200507143552.GA28683@infradead.org>
 <20200528054600.GA29717@infradead.org>
 <20200528161416.GY1079@brightrain.aerifal.cx>
 <20200529143059.GA25475@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529143059.GA25475@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, May 29, 2020 at 07:30:59AM -0700, Christoph Hellwig wrote:
> On Thu, May 28, 2020 at 12:14:16PM -0400, Rich Felker wrote:
> > It is in active use. Please do not act on such a request. I would be
> > much quicker to ack things that actually need ack if I weren't CC'd on
> > hundreds of random non-arch-specific changes that don't need it, but I
> > understand that's how the kernel process works. If there are things
> > that need ack please feel free to ping.
> > 
> > Note that I specifically acked and requested the sh5 removal.
> 
> But you did not actually pick it up - because of that it still isn't
> in linux-next and thus most likely will miss Linux 5.8.

Arnd sent the pull request for this and I expected it to be pulled
from his tree, since he already had my approval for the change. Maybe
Linus was expecting it to come through me. This seems to have been a
miscommunication.

Frustratingly, I _still_ don't have an official tree on kernel.org for
the purpose of being the canonical place for linux-next to pull from,
due to policies around pgp keys and nobody following up on signing
mine. This is all really silly since there are ridiculously many
independent channels I could cryptographically validate identity
through with vanishing probability that they're all compromised. For
the time being I'll reactivate my repo on git.musl-libc.org.

Rich
