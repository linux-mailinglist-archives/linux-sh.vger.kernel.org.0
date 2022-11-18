Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522B962EC14
	for <lists+linux-sh@lfdr.de>; Fri, 18 Nov 2022 03:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240484AbiKRCsF (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 17 Nov 2022 21:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiKRCsE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 17 Nov 2022 21:48:04 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C36A8DA47
        for <linux-sh@vger.kernel.org>; Thu, 17 Nov 2022 18:48:03 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ND1N2685rzJnnT;
        Fri, 18 Nov 2022 10:44:50 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 10:48:01 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <lethal@linux-sh.org>, <linux-sh@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH 0/2] sh: intc: Fix UAF and compile error problems
Date:   Fri, 18 Nov 2022 02:46:09 +0000
Message-ID: <20221118024611.112732-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This series fix servel compile errors and an UAF problem in
drivers/sh/intc/core.c.

Yuan Can (2):
  sh: intc: Fix compile errors about casting
  sh: intc: Fix possible UAF in register_intc_controller()

 drivers/sh/intc/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.17.1

