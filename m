Return-Path: <linux-sh+bounces-2086-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE359FAFC3
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 15:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A744C188AC42
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 14:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8BC1DC9AB;
	Mon, 23 Dec 2024 14:20:25 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4F1DACB1;
	Mon, 23 Dec 2024 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963625; cv=none; b=oddb0LqDv/YyPR+6Br3dpAxkqY9axwANAWKr4tzKOfvV2t2UENi2fm8XVlYEp831ZTw+kEdteWgy3juCjB5TZkHlzk6uPxSHYhaoWZ4DJsPE34H/Xo95T2FjQkHldvhejqHS0LoIMBLEiYj/8ZsBcm+fUpY7g8usmPjQusAgXtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963625; c=relaxed/simple;
	bh=mVynxR4ENQ8pwt669iVIuxHpk/Ejk3/+P2N16D+TN5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K92vg1z+k1uZJqUGfTItfWUSg7vd3K/aYxtMzcaKSFvi7NFGDS82PucNdezN0tTV3K0/DNcOPUQmR6iyWYrvzbWUBYYZc6x4pA3/Tw2shTYr3nDvjPX/UbxLc3ChaEPLPg7/TOk4acXyiNRs5U5yW1q1gJlwdapIIjb5CTi4724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YH0T62Ssrz1V74N;
	Mon, 23 Dec 2024 22:16:58 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id A0242140391;
	Mon, 23 Dec 2024 22:20:19 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemh100016.china.huawei.com
 (7.202.181.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Dec
 2024 22:20:16 +0800
From: Kaixiong Yu <yukaixiong@huawei.com>
To: <akpm@linux-foundation.org>, <mcgrof@kernel.org>
CC: <ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <luto@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <viro@zeniv.linux.org.uk>, <brauner@kernel.org>,
	<jack@suse.cz>, <kees@kernel.org>, <j.granados@samsung.com>,
	<willy@infradead.org>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<lorenzo.stoakes@oracle.com>, <trondmy@kernel.org>, <anna@kernel.org>,
	<chuck.lever@oracle.com>, <jlayton@kernel.org>, <neilb@suse.de>,
	<okorniev@redhat.com>, <Dai.Ngo@oracle.com>, <tom@talpey.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <paul@paul-moore.com>, <jmorris@namei.org>,
	<linux-sh@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-nfs@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-security-module@vger.kernel.org>, <dhowells@redhat.com>,
	<haifeng.xu@shopee.com>, <baolin.wang@linux.alibaba.com>,
	<shikemeng@huaweicloud.com>, <dchinner@redhat.com>, <bfoster@redhat.com>,
	<souravpanda@google.com>, <hannes@cmpxchg.org>, <rientjes@google.com>,
	<pasha.tatashin@soleen.com>, <david@redhat.com>, <ryan.roberts@arm.com>,
	<ying.huang@intel.com>, <yang@os.amperecomputing.com>,
	<zev@bewilderbeest.net>, <serge@hallyn.com>, <vegard.nossum@oracle.com>,
	<wangkefeng.wang@huawei.com>
Subject: [PATCH v4 -next 14/15] sh: vdso: move the sysctl to arch/sh/kernel/vsyscall/vsyscall.c
Date: Mon, 23 Dec 2024 22:15:33 +0800
Message-ID: <20241223141550.638616-15-yukaixiong@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223141550.638616-1-yukaixiong@huawei.com>
References: <20241223141550.638616-1-yukaixiong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh100016.china.huawei.com (7.202.181.102)

When CONFIG_SUPERH and CONFIG_VSYSCALL are defined,
vdso_enabled belongs to arch/sh/kernel/vsyscall/vsyscall.c.
So, move it into its own file. After this patch is applied,
all sysctls of vm_table would be moved. So, delete vm_table.

Signed-off-by: Kaixiong Yu <yukaixiong@huawei.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
v4:
 - const qualify struct ctl_table vdso_table
v3:
 - change the title
---
---
 arch/sh/kernel/vsyscall/vsyscall.c | 14 ++++++++++++++
 kernel/sysctl.c                    | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/sh/kernel/vsyscall/vsyscall.c b/arch/sh/kernel/vsyscall/vsyscall.c
index add35c51e017..898132f34e6a 100644
--- a/arch/sh/kernel/vsyscall/vsyscall.c
+++ b/arch/sh/kernel/vsyscall/vsyscall.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/elf.h>
 #include <linux/sched.h>
+#include <linux/sysctl.h>
 #include <linux/err.h>
 
 /*
@@ -30,6 +31,17 @@ static int __init vdso_setup(char *s)
 }
 __setup("vdso=", vdso_setup);
 
+static const struct ctl_table vdso_table[] = {
+	{
+		.procname	= "vdso_enabled",
+		.data		= &vdso_enabled,
+		.maxlen		= sizeof(vdso_enabled),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+		.extra1		= SYSCTL_ZERO,
+	},
+};
+
 /*
  * These symbols are defined by vsyscall.o to mark the bounds
  * of the ELF DSO images included therein.
@@ -55,6 +67,8 @@ int __init vsyscall_init(void)
 	       &vsyscall_trapa_start,
 	       &vsyscall_trapa_end - &vsyscall_trapa_start);
 
+	register_sysctl_init("vm", vdso_table);
+
 	return 0;
 }
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 7ff07b7560b4..cebd0ef5d19d 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2012,23 +2012,9 @@ static struct ctl_table kern_table[] = {
 #endif
 };
 
-static struct ctl_table vm_table[] = {
-#if defined(CONFIG_SUPERH) && defined(CONFIG_VSYSCALL)
-	{
-		.procname	= "vdso_enabled",
-		.data		= &vdso_enabled,
-		.maxlen		= sizeof(vdso_enabled),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
-		.extra1		= SYSCTL_ZERO,
-	},
-#endif
-};
-
 int __init sysctl_init_bases(void)
 {
 	register_sysctl_init("kernel", kern_table);
-	register_sysctl_init("vm", vm_table);
 
 	return 0;
 }
-- 
2.34.1


