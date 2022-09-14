Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533E25B8204
	for <lists+linux-sh@lfdr.de>; Wed, 14 Sep 2022 09:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiINH1w (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 14 Sep 2022 03:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiINH1v (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 14 Sep 2022 03:27:51 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29516A492
        for <linux-sh@vger.kernel.org>; Wed, 14 Sep 2022 00:27:50 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSBdF3Q3SzNmHB;
        Wed, 14 Sep 2022 15:23:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 15:27:48 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <ysato@users.sourceforge.jp>, <dalias@libc.org>, <arnd@arndb.de>,
        <cuigaosheng1@huawei.com>
CC:     <linux-sh@vger.kernel.org>
Subject: [PATCH] sh: remove unused fake_swapper_regs declaration
Date:   Wed, 14 Sep 2022 15:27:48 +0800
Message-ID: <20220914072748.1339205-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

All uses of fake_swapper_regs were removed by
commit 37744feebc08 ("sh: remove sh5 support"),
so remove the declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/sh/include/asm/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 85a6c1c3c16e..8a0ae2e955cd 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -101,8 +101,6 @@ void stop_this_cpu(void *);
 struct seq_operations;
 struct task_struct;
 
-extern struct pt_regs fake_swapper_regs;
-
 extern void cpu_init(void);
 extern void cpu_probe(void);
 
-- 
2.25.1

