Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA3523F2CE
	for <lists+linux-sh@lfdr.de>; Fri,  7 Aug 2020 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGSen (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 7 Aug 2020 14:34:43 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:39900 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGSen (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 7 Aug 2020 14:34:43 -0400
Date:   Fri, 7 Aug 2020 14:34:42 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: Pull Request for 5.9
Message-ID: <20200807183442.GB3265@brightrain.aerifal.cx>
References: <16a9b527-e05c-dcac-86bd-b79be140c053@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16a9b527-e05c-dcac-86bd-b79be140c053@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Aug 07, 2020 at 09:36:07AM +0200, John Paul Adrian Glaubitz wrote:
> Hi Rich!
> 
> Any chance you can send the pull request to Linus for 5.9?
> 
> I would like to see my get_user() patch merged as otherwise libsecomp upstream
> won't allow me to open the PR to get the userland changes merged for SECCOMP
> support.

Yep, it's on my todo for this week. I'll try to get to it today. Does
everything in next look good to you?

Rich
