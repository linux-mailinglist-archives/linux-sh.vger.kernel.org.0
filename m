Return-Path: <linux-sh+bounces-740-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114B897EF1
	for <lists+linux-sh@lfdr.de>; Thu,  4 Apr 2024 07:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2076D1F22E4D
	for <lists+linux-sh@lfdr.de>; Thu,  4 Apr 2024 05:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF78745DC;
	Thu,  4 Apr 2024 05:01:19 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B528C73535
	for <linux-sh@vger.kernel.org>; Thu,  4 Apr 2024 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.127.30.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712206879; cv=none; b=ikERKFcqDaHEQM/k2zTqGJioT6IODhsYTvuhzrL76jsgyTODKYYLJd2V/tvRKn4bF1Rz08IcTSs407S6pqehOMzv6HMHWS1rAE6AI6Lc4IEDYd7hAnOQnB+kp5HwWKLv06BGXQosf4VwQ5K/YZKzJAIELNYrOvpRSRzllJ/b2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712206879; c=relaxed/simple;
	bh=RfBIVerSVY5ro3iClkCuqoyBsbZfPpMYmGiZieoqKAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ETXKmAn9tXVTQG/pcL2vnQztUAnUp+b/RHXuVxgx/GK5JFCK5zOF2Obef5qgnjltOgU0BAwEcdD6KqXt+Syr2dcpV2r/X0niOq6D340Sn8SFj18E/g56jaD1QDKLjgmhRQdvkvZyULwdXz/gQi7Gaz1UJk3Yxl1FCdUm57EhtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp; spf=fail smtp.mailfrom=users.sourceforge.jp; arc=none smtp.client-ip=153.127.30.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=users.sourceforge.jp
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
	by sakura.ysato.name (Postfix) with ESMTPSA id AE36D1C0BD1;
	Thu,  4 Apr 2024 14:01:16 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [DO NOT MERGE v7 22/36] dt-bindings: display: sm501 register definition helper
Date: Thu,  4 Apr 2024 14:00:00 +0900
Message-Id: <fc3dcd495dd2a01ffb92c7eb00158ebb3ff52414.1712041249.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712041249.git.ysato@users.sourceforge.jp>
References: <cover.1712041249.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Miscellaneous Timing and Miscellaneous Control registers definition.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/dt-bindings/display/sm501.h | 76 +++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 include/dt-bindings/display/sm501.h

diff --git a/include/dt-bindings/display/sm501.h b/include/dt-bindings/display/sm501.h
new file mode 100644
index 000000000000..a6c6943642e4
--- /dev/null
+++ b/include/dt-bindings/display/sm501.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef __DT_BINDING_DISPALY_SM501__
+#define __DT_BINDING_DISPALY_SM501__
+
+/* Miscellaneous Conntrol */
+#define SM501_MISC_CONTROL_PAD_24	0
+#define SM501_MISC_CONTROL_PAD_12	1
+#define SM501_MISC_CONTROL_PAD_8	2
+
+#define SM501_MISC_CONTROL_USBCLK_XTAL	0
+#define SM501_MISC_CONTROL_USBCLK_96MHZ	1
+#define SM501_MISC_CONTROL_USBCLK_48MHZ	2
+
+#define SM501_MISC_CONTROL_RFSH_8US	0
+#define SM501_MISC_CONTROL_RFSH_16US	1
+#define SM501_MISC_CONTROL_RFSH_32US	2
+#define SM501_MISC_CONTROL_RFSH_64US	3
+
+#define SM501_MISC_CONTROL_HOLD_EMPTY	0
+#define SM501_MISC_CONTROL_HOLD_8TR	1
+#define SM501_MISC_CONTROL_HOLD_16TR	2
+#define SM501_MISC_CONTROL_HOLD_24TR	3
+#define SM501_MISC_CONTROL_HOLD_32TR	4
+
+/* Miscellaneous timing */
+#define SM501_MISC_TIMING_EX_HOLD_0	0
+#define SM501_MISC_TIMING_EX_HOLD_16	1
+#define SM501_MISC_TIMING_EX_HOLD_32	2
+#define SM501_MISC_TIMING_EX_HOLD_48	3
+#define SM501_MISC_TIMING_EX_HOLD_64	4
+#define SM501_MISC_TIMING_EX_HOLD_80	5
+#define SM501_MISC_TIMING_EX_HOLD_96	6
+#define SM501_MISC_TIMING_EX_HOLD_112	7
+#define SM501_MISC_TIMING_EX_HOLD_128	8
+#define SM501_MISC_TIMING_EX_HOLD_144	9
+#define SM501_MISC_TIMING_EX_HOLD_160	10
+#define SM501_MISC_TIMING_EX_HOLD_176	11
+#define SM501_MISC_TIMING_EX_HOLD_192	12
+#define SM501_MISC_TIMING_EX_HOLD_208	13
+#define SM501_MISC_TIMING_EX_HOLD_224	14
+#define SM501_MISC_TIMING_EX_HOLD_240	15
+
+#define SM501_MISC_TIMING_XC_INTERNAL	0
+#define SM501_MISC_TIMING_XC_HCLK	1
+#define SM501_MISC_TIMING_XC_GPIO	2
+
+#define SM501_MISC_TIMING_SM_DIV1	0
+#define SM501_MISC_TIMING_SM_DIV2	1
+#define SM501_MISC_TIMING_SM_DIV4	2
+#define SM501_MISC_TIMING_SM_DIV8	3
+#define SM501_MISC_TIMING_SM_DIV16	4
+#define SM501_MISC_TIMING_SM_DIV32	5
+#define SM501_MISC_TIMING_SM_DIV64	6
+#define SM501_MISC_TIMING_SM_DIV128	7
+#define SM501_MISC_TIMING_SM_DIV3	8
+#define SM501_MISC_TIMING_SM_DIV6	9
+#define SM501_MISC_TIMING_SM_DIV12	10
+#define SM501_MISC_TIMING_SM_DIV24	11
+#define SM501_MISC_TIMING_SM_DIV48	12
+#define SM501_MISC_TIMING_SM_DIV96	13
+#define SM501_MISC_TIMING_SM_DIV192	14
+#define SM501_MISC_TIMING_SM_DIV384	15
+
+#define SM501_MISC_TIMING_DIV336MHZ	0
+#define SM501_MISC_TIMING_DIV288MHZ	1
+#define SM501_MISC_TIMING_DIV240MHZ	2
+#define SM501_MISC_TIMING_DIV192MHZ	3
+
+#define SM501_MISC_TIMING_DELAY_NONE	0
+#define SM501_MISC_TIMING_DELAY_0_5	1
+#define SM501_MISC_TIMING_DELAY_1_0	2
+#define SM501_MISC_TIMING_DELAY_1_5	3
+#define SM501_MISC_TIMING_DELAY_2_0	4
+#define SM501_MISC_TIMING_DELAY_2_5	5
+
+#endif
-- 
2.39.2


