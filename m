Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E45251516F
	for <lists+linux-sh@lfdr.de>; Fri, 29 Apr 2022 19:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379453AbiD2RTp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 Apr 2022 13:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379452AbiD2RTp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 Apr 2022 13:19:45 -0400
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB89887A1
        for <linux-sh@vger.kernel.org>; Fri, 29 Apr 2022 10:16:25 -0700 (PDT)
Date:   Fri, 29 Apr 2022 13:16:24 -0400
From:   Rich Felker <dalias@libc.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] sh: avoid using IRQ0 on SH3/4
Message-ID: <20220429171623.GQ7074@brightrain.aerifal.cx>
References: <2584ba18-9653-9310-efc1-8b3b3e221eea@omp.ru>
 <11021433-66c0-3c56-42bd-207a5ae8d267@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11021433-66c0-3c56-42bd-207a5ae8d267@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Apr 29, 2022 at 04:24:04PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Sergey!
> 
> On 4/27/22 20:46, Sergey Shtylyov wrote:
> > Using IRQ0 by the platform devices is going to be disallowed soon (see [1])
> > and even now, when IRQ0 is about to be returned by platfrom_get_irq(), you
> > see a big warning.  The code supporting SH3/4 SoCs maps the IRQ #s starting
> > at 0 -- modify that code to start the IRQ #s from 16 instead.
> > 
> > The patch should mostly affect the AP-SH4A-3A/AP-SH4AD-0A boards as they
> > indeed use IRQ0 for the SMSC911x compatible Ethernet chip...
> 
> Maybe try getting it landed through Andrew Morton's tree?

Hi. I'm alive and looking at it. If it needs to go in for this cycle I
will send a pull request for just this and anything else critical. Was
trying to get to it last night but had some unpleasant surprises come
up that took me away from the computer.

Rich
