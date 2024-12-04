Return-Path: <linux-sh+bounces-1966-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839E9E386A
	for <lists+linux-sh@lfdr.de>; Wed,  4 Dec 2024 12:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DAE82820AE
	for <lists+linux-sh@lfdr.de>; Wed,  4 Dec 2024 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3FE1B3939;
	Wed,  4 Dec 2024 11:07:23 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E233B1B4137;
	Wed,  4 Dec 2024 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310443; cv=none; b=VLJRZvQ1f6+DL+7Fj2bl7T1PXksD4D3RTeHbSWCGg5Tm1hllXxMrVTX4eu2t71JcGZ4VtM2VL542jy1oSNHX92r6T1VWMaSt7ExNtIyMnYvOlC6HRuTM6RKZo+GtXJ99LZWF1Cn8hhqH2YSpDu67uJ5CPWYvm2X1DpWmnsGbHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310443; c=relaxed/simple;
	bh=V7S8v7FRRaZPxqOkrfpHiv5Q1mhTOu53PrGd5PxYvBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M4zsge3hbfE93gkaH5WuXup58tWAiO1UzLq/CH/34yB+U4ezImmYjAQLx673MW0DUtTIRNK8sGAZvF9Mfq5UqtzfzbdYf8YlMjcPafsuQ0fI+CYT+rbVzd17fCy4Et7eJdWv+JhZL/Ji2Xv2nAiDq9nIdCARsdm96ILXoQ7Lcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee5675037da885-cc89c;
	Wed, 04 Dec 2024 19:07:08 +0800 (CST)
X-RM-TRANSID:2ee5675037da885-cc89c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from 192.168.28.197 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee3675037da8d7-69a28;
	Wed, 04 Dec 2024 19:07:08 +0800 (CST)
X-RM-TRANSID:2ee3675037da8d7-69a28
From: liujing <liujing@cmss.chinamobile.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] sh: pci: Fix the wrong format specifier
Date: Wed,  4 Dec 2024 19:07:06 +0800
Message-Id: <20241204110706.6776-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make a minor change to eliminate a static checker warning. The type
of port->index is unsigned int, so the correct format specifier should be
%u instead of %d.

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie-sh7786.c
index a78b9a935585..9ccc602d7f86 100644
--- a/arch/sh/drivers/pci/pcie-sh7786.c
+++ b/arch/sh/drivers/pci/pcie-sh7786.c
@@ -219,7 +219,7 @@ static int __init pcie_clk_init(struct sh7786_pcie_port *port)
 	 * on. clock lookups don't help us much at this point, since no
 	 * dev_id is available this early. Lame.
 	 */
-	snprintf(fclk_name, sizeof(fclk_name), "pcie%d_fck", port->index);
+	snprintf(fclk_name, sizeof(fclk_name), "pcie%u_fck", port->index);
 
 	port->fclk = clk_get(NULL, fclk_name);
 	if (IS_ERR(port->fclk)) {
-- 
2.27.0




