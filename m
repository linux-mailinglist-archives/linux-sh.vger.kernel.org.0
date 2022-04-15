Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170DB502EFA
	for <lists+linux-sh@lfdr.de>; Fri, 15 Apr 2022 21:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348666AbiDOTLk (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 15 Apr 2022 15:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348679AbiDOTLS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 15 Apr 2022 15:11:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E5ADB2EC;
        Fri, 15 Apr 2022 12:08:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E101C61CB7;
        Fri, 15 Apr 2022 19:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD7CC385B7;
        Fri, 15 Apr 2022 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650049722;
        bh=II6OEIXWBm46BUBaioGDbgMZ+vUKj+RzIpjwlTwoobY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mucLjtHZlTlqn2DfNqXglYqlzQSZRXHg7K3buWgwJ6TRmRLexMpb/3xdYzYZVnJs+
         gvBVNpEgyW88VKmUYBkUJbakIu5PdplrUxVwEyeu9N/5FtduwCXjlc6s+6XwFWAL7a
         J3hnMLdtA0dszo+jHajTb12P1IDdZL9y+8tQ9AM1qXC1DXvSJv/qQ6bqPGDCQJxN9s
         8SuiW1RQrqkyjOH5CKiSXg68i99swwTacX+KoAEKHxEuVCAvdKmn+ZTzSKf8SCV95w
         qZvkONpo92Q8EjiphevANVfZ7bTf5QgoMcAuHZJkuE3BCcOyhiGmvRmV3bWHD9MpWP
         RuPfTe7QgwUPw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Chas Williams <3chas3@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 6/7] ia64: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
Date:   Fri, 15 Apr 2022 14:08:16 -0500
Message-Id: <20220415190817.842864-7-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/ia64/include/asm/io.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/ia64/include/asm/io.h b/arch/ia64/include/asm/io.h
index 6d93b923b379..1069e1730b2e 100644
--- a/arch/ia64/include/asm/io.h
+++ b/arch/ia64/include/asm/io.h
@@ -23,10 +23,6 @@
 #include <asm/unaligned.h>
 #include <asm/early_ioremap.h>
 
-/* We don't use IO slowdowns on the ia64, but.. */
-#define __SLOW_DOWN_IO	do { } while (0)
-#define SLOW_DOWN_IO	do { } while (0)
-
 #define __IA64_UNCACHED_OFFSET	RGN_BASE(RGN_UNCACHED)
 
 /*
-- 
2.25.1

