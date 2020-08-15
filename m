Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0AD2452DF
	for <lists+linux-sh@lfdr.de>; Sat, 15 Aug 2020 23:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbgHOV4E (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 15 Aug 2020 17:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729041AbgHOVwO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 15 Aug 2020 17:52:14 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Aug 2020 19:33:03 PDT
Received: from brightrain.aerifal.cx (unknown [IPv6:2002:d80c:560d::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA716C061361
        for <linux-sh@vger.kernel.org>; Fri, 14 Aug 2020 19:33:03 -0700 (PDT)
Date:   Fri, 14 Aug 2020 22:17:54 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Ping: Pull Request for 5.9
Message-ID: <20200815021754.GR3265@brightrain.aerifal.cx>
References: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
 <6ad2b6e9-cd0c-5d31-1183-37fdfe2d3ff1@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad2b6e9-cd0c-5d31-1183-37fdfe2d3ff1@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, Aug 15, 2020 at 01:13:37AM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> On 8/12/20 12:55 PM, John Paul Adrian Glaubitz wrote:
> > Hi Rich!
> > 
> > Any chances you can send the PR for 5.9 to Linus this week?
> 
> Would it be possible to include Geert's fix for the IDE interface
> of the LANDISK USL-5P devices [1]?

Yep, I'm preparing the pull request and was just about to ask if it
should be included. Anything else not in next already that should be?

Rich
