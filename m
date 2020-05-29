Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D538B1E855A
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2020 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgE2Rlq (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 29 May 2020 13:41:46 -0400
Received: from outpost5.zedat.fu-berlin.de ([130.133.4.89]:56487 "EHLO
        outpost5.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726974AbgE2Rlq (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 29 May 2020 13:41:46 -0400
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 May 2020 13:41:45 EDT
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jeitp-002w2B-Im; Fri, 29 May 2020 19:34:29 +0200
Received: from z6.physik.fu-berlin.de ([160.45.32.137] helo=z6)
          by relay1.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jeitp-001GCj-Ga; Fri, 29 May 2020 19:34:29 +0200
Received: from glaubitz by z6 with local (Exim 4.93)
        (envelope-from <glaubitz@physik.fu-berlin.de>)
        id 1jeiti-00HZGa-MO; Fri, 29 May 2020 19:34:22 +0200
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     linux-sh@vger.kernel.org
Cc:     Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        linux-kernel@vger.kernel.org
Subject: 
Date:   Fri, 29 May 2020 19:34:18 +0200
Message-Id: <20200529173419.4185337-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: 160.45.32.137
X-ZEDAT-Hint: R
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org


Hi!

This is my attempt of implementing a 64-bit get_user() for SH to address the
build problem when CONFIG_INFINIBAND_USER_ACCESS is enabled.

I have carefully looked at the existing implementations of __get_user_asm(),
__put_user_asm() and the 64-bit __put_user_u64() to come up with the 64-bit
__get_user_u64().

I'm admittedly not an expert when it comes to writing GCC contraints, so the
code might be completely wrong. However, it builds fine without warnings
and fixes the aforementioned issue for me.

Hopefully someone from the more experienced group of kernel developers can
review my code and help me get it into proper shape for submission.

Thanks,
Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
