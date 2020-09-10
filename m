Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B6426521C
	for <lists+linux-sh@lfdr.de>; Thu, 10 Sep 2020 23:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgIJVIf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 10 Sep 2020 17:08:35 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:52348 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731025AbgIJOfP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 10 Sep 2020 10:35:15 -0400
Date:   Thu, 10 Sep 2020 10:19:36 -0400
From:   Rich Felker <dalias@libc.org>
To:     linux-sh@vger.kernel.org
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH] sh: remove spurious circular inclusion from asm/smp.h
Message-ID: <20200910141934.GF3265@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Commit 0cd39f4600ed4de8 added inclusion of smp.h to lockdep.h,
creating a circular include dependency where arch/sh's asm/smp.h in
turn includes spinlock.h which depends on lockdep.h. Since our
asm/smp.h does not actually need spinlock.h, just remove it.

Fixes: 0cd39f4600ed4de8 ("locking/seqlock, headers: Untangle the spaghetti monster")
Signed-off-by: Rich Felker <dalias@libc.org>
---
 arch/sh/include/asm/smp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/include/asm/smp.h b/arch/sh/include/asm/smp.h
index 1a0d7cf71c10..100bf241340b 100644
--- a/arch/sh/include/asm/smp.h
+++ b/arch/sh/include/asm/smp.h
@@ -8,7 +8,6 @@
 
 #ifdef CONFIG_SMP
 
-#include <linux/spinlock.h>
 #include <linux/atomic.h>
 #include <asm/current.h>
 #include <asm/percpu.h>
-- 
2.21.0

