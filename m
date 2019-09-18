Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74DECB67AE
	for <lists+linux-sh@lfdr.de>; Wed, 18 Sep 2019 18:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbfIRQDR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Sep 2019 12:03:17 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:46815 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726077AbfIRQDR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Sep 2019 12:03:17 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1iAcQF-0027dh-K0>; Wed, 18 Sep 2019 18:03:15 +0200
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by inpost2.zedat.fu-berlin.de (Exim 4.85)
          with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1iAcQF-0046Yx-EK>; Wed, 18 Sep 2019 18:03:15 +0200
To:     "j-core@lists.j-core.org" <j-core@lists.j-core.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Pull request for SH Linux changes
Message-ID: <9c582fea-5c4f-a973-181c-28716ea06151@physik.fu-berlin.de>
Date:   Wed, 18 Sep 2019 18:03:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: 160.45.32.140
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi!

Now that J-Core has picked up some traction again, it would be nice if the changes
that have accumulated in Yoshinori Sato's SH Linux tree [1] could actually be sent
to Linus' upstream kernel tree.

Could someone initiate that? These changes actually contain some important fixes.

Thanks,
Adrian

> [1] https://osdn.net/projects/uclinux-h8/scm/git/linux/

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
