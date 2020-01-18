Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC19141679
	for <lists+linux-sh@lfdr.de>; Sat, 18 Jan 2020 09:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgARIOO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Jan 2020 03:14:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:46502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbgARIOO (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Sat, 18 Jan 2020 03:14:14 -0500
Received: from localhost.localdomain (unknown [194.230.155.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDB4B24683;
        Sat, 18 Jan 2020 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579335253;
        bh=fGG701Ps8Rdb3kHwiYwVKSPobmo7g1hXU5nsiVSANLE=;
        h=From:To:Subject:Date:From;
        b=KY5w8CLNqGQ3jRvODbYqiK/DWa7RCHyhrOceWLALoHAfkVRlp5iPVa8ZkucekaMkw
         kw1HGu2m77C5YOdWy2WWyL1br13FczHym4gmV7LYf9Fk51nTlsnCWbPXjjYCIs0sD+
         onIj4zDYp+y1iNbY8cB5QSGpL7LHmEY/G7+BpTmw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] sh: sh4a: Bring back tmu3_device early device
Date:   Sat, 18 Jan 2020 09:13:56 +0100
Message-Id: <20200118081356.22167-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Commit 1399c195ef50 ("sh: Switch to new style TMU device") converted
tmu3_device platform device to new style of platform data but removed it
from sh7786_early_devices array effectively removing last three timers
and causing a warning:

    arch/sh/kernel/cpu/sh4a/setup-sh7786.c:243:31:
        warning: ‘tmu3_device’ defined but not used [-Wunused-variable]

Fixes: 1399c195ef50 ("sh: Switch to new style TMU device")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add tmu3_device to early device list, as suggested by Geert.
2. Add Fixes tag.
---
 arch/sh/kernel/cpu/sh4a/setup-sh7786.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/cpu/sh4a/setup-sh7786.c b/arch/sh/kernel/cpu/sh4a/setup-sh7786.c
index 4b0db8259e3d..74620f30b19b 100644
--- a/arch/sh/kernel/cpu/sh4a/setup-sh7786.c
+++ b/arch/sh/kernel/cpu/sh4a/setup-sh7786.c
@@ -391,6 +391,7 @@ static struct platform_device *sh7786_early_devices[] __initdata = {
 	&tmu0_device,
 	&tmu1_device,
 	&tmu2_device,
+	&tmu3_device,
 };
 
 static struct platform_device *sh7786_devices[] __initdata = {
-- 
2.17.1

