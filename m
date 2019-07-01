Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B256F2EA75
	for <lists+linux-sh@lfdr.de>; Thu, 30 May 2019 04:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfE3CC3 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 May 2019 22:02:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:18046 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726535AbfE3CC2 (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 29 May 2019 22:02:28 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 491669DC652AB73E43F7;
        Thu, 30 May 2019 10:02:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Thu, 30 May 2019 10:02:19 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, <linux-sh@vger.kernel.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] sh: configs: remove CONFIG_LOGFS from defconfig
Date:   Thu, 30 May 2019 10:10:32 +0800
Message-ID: <20190530021032.190639-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

After commit 1d0fd57a50aa ("logfs: remove from tree"),
logfs was removed, drop CONFIG_LOGFS from all defconfigs.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 5209889765ad..49a29338789b 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -191,7 +191,6 @@ CONFIG_CONFIGFS_FS=y
 CONFIG_JFFS2_FS=m
 CONFIG_JFFS2_FS_XATTR=y
 CONFIG_UBIFS_FS=m
-CONFIG_LOGFS=m
 CONFIG_CRAMFS=m
 CONFIG_SQUASHFS=m
 CONFIG_ROMFS_FS=m
-- 
2.20.1

