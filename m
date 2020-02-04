Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301A8151C14
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 15:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgBDOYL (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 09:24:11 -0500
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:50274 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgBDOYL (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Feb 2020 09:24:11 -0500
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1iyz7O-00052u-00; Tue, 04 Feb 2020 14:23:58 +0000
Date:   Tue, 4 Feb 2020 09:23:58 -0500
From:   Rich Felker <dalias@libc.org>
To:     Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
Subject: Re: No newer system calls for SuperH64?
Message-ID: <20200204142358.GT1663@brightrain.aerifal.cx>
References: <939c9260-213f-cfd7-f81a-e9b635a6aa10@juszkiewicz.com.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939c9260-213f-cfd7-f81a-e9b635a6aa10@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Feb 04, 2020 at 03:13:23PM +0100, Marcin Juszkiewicz wrote:
> I am maintaining system calls table [1] which shows which system call
> has which number on all architectures supported by Linux kernel
> (including those removed in last years).
> 
> 1. https://fedora.juszkiewicz.com.pl/syscalls.html
> 
> Today I have noticed that SH64 supports system calls up to 393 which is
> pwritev2() one. None of later calls is supported in mainline 5.6-rc tree.
> 
> Is it an error in kernel headers or it is true? Or maybe it is an error
> in my script but it works fine for other architectures.
> 
> Note: I do not own nor plan to own SuperH64 hardware. I do not even
> remember where it was used. Just noticed weird state of it.

One reason you don't own it is that it essentially doesn't exist. :-)
GCC dropped SH64 support a few years ago because the arch essentially
never materialized and keeping it around was a lot of cruft. It should
be removed from the kernel too; I just haven't gotten around to
figuring out how to do that.

Rich
