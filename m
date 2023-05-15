Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD4B703A93
	for <lists+linux-sh@lfdr.de>; Mon, 15 May 2023 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244772AbjEORwt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 15 May 2023 13:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244901AbjEORw3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 15 May 2023 13:52:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAFB14E64;
        Mon, 15 May 2023 10:50:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FA6C62F2A;
        Mon, 15 May 2023 17:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1097CC433A1;
        Mon, 15 May 2023 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684173018;
        bh=Nc25TSkVxVrXY64easAv0Dysj5N+r+hR4Ws0zUbzFD0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hjBBp9HhybFxUIezyrOPZKa4MmQB8QD5/bHDbsDkWTU8he+Rj1PheKgMRpNytcC95
         7PhpzBLVxl2ruK/o2BNe+BMA3DZqdsatJqQRuENxuQ049vYL7Xfi3MlKUaQMtVCrAb
         ErXmzdLAEWQXxnjt6o165M7/MvUUdwA3xjDYuLfc=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5.10 341/381] sh: math-emu: fix macro redefined warning
Date:   Mon, 15 May 2023 18:29:52 +0200
Message-Id: <20230515161752.265104703@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515161736.775969473@linuxfoundation.org>
References: <20230515161736.775969473@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

commit 58a49ad90939386a8682e842c474a0d2c00ec39c upstream.

Fix a warning that was reported by the kernel test robot:

In file included from ../include/math-emu/soft-fp.h:27,
                 from ../arch/sh/math-emu/math.c:22:
../arch/sh/include/asm/sfp-machine.h:17: warning: "__BYTE_ORDER" redefined
   17 | #define __BYTE_ORDER __BIG_ENDIAN
In file included from ../arch/sh/math-emu/math.c:21:
../arch/sh/math-emu/sfp-util.h:71: note: this is the location of the previous definition
   71 | #define __BYTE_ORDER __LITTLE_ENDIAN

Fixes: b929926f01f2 ("sh: define __BIG_ENDIAN for math-emu")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: lore.kernel.org/r/202111121827.6v6SXtVv-lkp@intel.com
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: stable@vger.kernel.org
Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Link: https://lore.kernel.org/r/20230306040037.20350-5-rdunlap@infradead.org
Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/sh/math-emu/sfp-util.h |    4 ----
 1 file changed, 4 deletions(-)

--- a/arch/sh/math-emu/sfp-util.h
+++ b/arch/sh/math-emu/sfp-util.h
@@ -67,7 +67,3 @@
   } while (0)
 
 #define abort()	return 0
-
-#define __BYTE_ORDER __LITTLE_ENDIAN
-
-


