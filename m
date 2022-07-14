Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4F5574757
	for <lists+linux-sh@lfdr.de>; Thu, 14 Jul 2022 10:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiGNIlc (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 14 Jul 2022 04:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiGNIla (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 14 Jul 2022 04:41:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B5E13EA2;
        Thu, 14 Jul 2022 01:41:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A53DB823E0;
        Thu, 14 Jul 2022 08:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06660C34114;
        Thu, 14 Jul 2022 08:41:22 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH V2 1/3] MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
Date:   Thu, 14 Jul 2022 16:41:34 +0800
Message-Id: <20220714084136.570176-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
cpu_max_bits_warn() generates a runtime warning similar as below while
we show /proc/cpuinfo. Fix this by using nr_cpu_ids (the runtime limit)
instead of NR_CPUS to iterate CPUs.

[    3.052463] ------------[ cut here ]------------
[    3.059679] WARNING: CPU: 3 PID: 1 at include/linux/cpumask.h:108 show_cpuinfo+0x5e8/0x5f0
[    3.070072] Modules linked in: efivarfs autofs4
[    3.076257] CPU: 0 PID: 1 Comm: systemd Not tainted 5.19-rc5+ #1052
[    3.084034] Hardware name: Loongson Loongson-3A4000-7A1000-1w-V0.1-CRB/Loongson-LS3A4000-7A1000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V2.0.04082-beta7 04/27
[    3.099465] Stack : 9000000100157b08 9000000000f18530 9000000000cf846c 9000000100154000
[    3.109127]         9000000100157a50 0000000000000000 9000000100157a58 9000000000ef7430
[    3.118774]         90000001001578e8 0000000000000040 0000000000000020 ffffffffffffffff
[    3.128412]         0000000000aaaaaa 1ab25f00eec96a37 900000010021de80 900000000101c890
[    3.138056]         0000000000000000 0000000000000000 0000000000000000 0000000000aaaaaa
[    3.147711]         ffff8000339dc220 0000000000000001 0000000006ab4000 0000000000000000
[    3.157364]         900000000101c998 0000000000000004 9000000000ef7430 0000000000000000
[    3.167012]         0000000000000009 000000000000006c 0000000000000000 0000000000000000
[    3.176641]         9000000000d3de08 9000000001639390 90000000002086d8 00007ffff0080286
[    3.186260]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1c
[    3.195868]         ...
[    3.199917] Call Trace:
[    3.203941] [<98000000002086d8>] show_stack+0x38/0x14c
[    3.210666] [<9800000000cf846c>] dump_stack_lvl+0x60/0x88
[    3.217625] [<980000000023d268>] __warn+0xd0/0x100
[    3.223958] [<9800000000cf3c90>] warn_slowpath_fmt+0x7c/0xcc
[    3.231150] [<9800000000210220>] show_cpuinfo+0x5e8/0x5f0
[    3.238080] [<98000000004f578c>] seq_read_iter+0x354/0x4b4
[    3.245098] [<98000000004c2e90>] new_sync_read+0x17c/0x1c4
[    3.252114] [<98000000004c5174>] vfs_read+0x138/0x1d0
[    3.258694] [<98000000004c55f8>] ksys_read+0x70/0x100
[    3.265265] [<9800000000cfde9c>] do_syscall+0x7c/0x94
[    3.271820] [<9800000000202fe4>] handle_syscall+0xc4/0x160
[    3.281824] ---[ end trace 8b484262b4b8c24c ]---

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/kernel/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 4184d641f05e..33a02f3814f5 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -172,7 +172,7 @@ static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	unsigned long i = *pos;
 
-	return i < NR_CPUS ? (void *) (i + 1) : NULL;
+	return i < nr_cpu_ids ? (void *) (i + 1) : NULL;
 }
 
 static void *c_next(struct seq_file *m, void *v, loff_t *pos)
-- 
2.31.1

