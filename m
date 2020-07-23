Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3ED22B557
	for <lists+linux-sh@lfdr.de>; Thu, 23 Jul 2020 20:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgGWSCd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 23 Jul 2020 14:02:33 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:35288 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgGWSCd (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 23 Jul 2020 14:02:33 -0400
Date:   Thu, 23 Jul 2020 14:02:32 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: Suggested patches for merging
Message-ID: <20200723180231.GB6949@brightrain.aerifal.cx>
References: <8538a950-8e21-29c7-dd0e-fa6e49e2bcef@physik.fu-berlin.de>
 <a5df1180-d440-8157-18a5-0d35afda2a6a@physik.fu-berlin.de>
 <20200723175210.GA6949@brightrain.aerifal.cx>
 <113e68d5-f322-ca48-0fd3-659161e94fa9@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <113e68d5-f322-ca48-0fd3-659161e94fa9@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Jul 23, 2020 at 07:56:24PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> On 7/23/20 7:52 PM, Rich Felker wrote:
> > Have you checked my for-next? It already has all of these except the
> > new seccomp series.
> 
> I haven't checked yet as last time I did a check-out the connection
> was rather slow to me.
> 
> Might be better if you get a tree on kernel.org.

I would love to have one, and was trying to get it for years, but the
ridiculous stone-age PGP policy and flakiness of folks who said they'd
sign keys but never did has prevented it. This is 2020 and I can
easily publish a fingerprint through multiple channels I'm known
through in a way that couldn't plausibly be fake on all of them.
Getting a key trusted should not depend on meeting people in person
and trusting them to follow up with signing.

In the mean time, I recommend a "git fetch --tags" from linus's main
tree followed by pull from mine to keep the volume of the latter down.

Rich
