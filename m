Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2623A1F6314
	for <lists+linux-sh@lfdr.de>; Thu, 11 Jun 2020 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgFKH6k (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 11 Jun 2020 03:58:40 -0400
Received: from outpost5.zedat.fu-berlin.de ([130.133.4.89]:36077 "EHLO
        outpost5.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgFKH6j (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 11 Jun 2020 03:58:39 -0400
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jjI6a-000srZ-Jy; Thu, 11 Jun 2020 09:58:32 +0200
Received: from z6.physik.fu-berlin.de ([160.45.32.137] helo=z6)
          by relay1.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jjI6a-00291r-Hm; Thu, 11 Jun 2020 09:58:32 +0200
Received: from glaubitz by z6 with local (Exim 4.94)
        (envelope-from <glaubitz@physik.fu-berlin.de>)
        id 1jjI6R-00COLg-3t; Thu, 11 Jun 2020 09:58:23 +0200
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     linux-sh@vger.kernel.org
Cc:     Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        NIIBE Yutaka <gniibe@fsij.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3] sh: Implement __get_user_u64() required for 64-bit get_user()
Date:   Thu, 11 Jun 2020 09:58:10 +0200
Message-Id: <20200611075811.2949870-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: 160.45.32.137
X-ZEDAT-Hint: R
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi!

This is version 3 of my patch to implement __get_user_u64() for SH.

I have asked both Yutaka Niibe and Yoshinori Sato to look over my changes and they
both agreed that an entry in __ex_tables for the second access was missing, so I
add the missing ".long 1b+2, 3b\n\t".

The changes should be correct now and will hopefully get a positive review by
the SH maintainers.

Thanks,
Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


