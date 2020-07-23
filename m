Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6810722B53E
	for <lists+linux-sh@lfdr.de>; Thu, 23 Jul 2020 19:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgGWRwM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 23 Jul 2020 13:52:12 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:35284 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgGWRwM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 23 Jul 2020 13:52:12 -0400
Date:   Thu, 23 Jul 2020 13:52:11 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: Suggested patches for merging
Message-ID: <20200723175210.GA6949@brightrain.aerifal.cx>
References: <8538a950-8e21-29c7-dd0e-fa6e49e2bcef@physik.fu-berlin.de>
 <a5df1180-d440-8157-18a5-0d35afda2a6a@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5df1180-d440-8157-18a5-0d35afda2a6a@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Jul 23, 2020 at 02:34:31PM +0200, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> On 7/17/20 9:11 AM, John Paul Adrian Glaubitz wrote:
> > After updating my SH kernel to the latest git version and applying various proposed
> > patches on top, my machines runs very stable. I suggest merging the following patches:
> 
> I have collected all patches that I am currently using on my SH-7785LCR in a repository
> on github, see [1].
> 
> These contain all patches by Geert, Christoph, my patch, Michael's patches and the
> two fixes by Peter Zijlstra and Matthew Wilcox.
> 
> One patch by Peter Zijlstra (sh_tlb: Fix __pmd_free_tlb()) did not apply, I assume
> because it must be committed with the whole series [2].
> 
> Adrian
> 
> > [1] https://github.com/glaubitz/linux/commits/sh-queue
> > [2] https://marc.info/?l=linux-mm&m=159498447020445&w=2

Have you checked my for-next? It already has all of these except the
new seccomp series.

Rich
