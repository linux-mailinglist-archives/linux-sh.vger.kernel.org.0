Return-Path: <linux-sh+bounces-2277-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF82A0A17B
	for <lists+linux-sh@lfdr.de>; Sat, 11 Jan 2025 08:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A11A8188DCD5
	for <lists+linux-sh@lfdr.de>; Sat, 11 Jan 2025 07:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A1719068E;
	Sat, 11 Jan 2025 07:12:34 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812D18E37B;
	Sat, 11 Jan 2025 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736579554; cv=none; b=MfPXC8HXVpKs4+Ij1lC92MatTJ5GG+f/tdtEImI3Mly35oV4FC+0aNAqU56jCEO7zsFCXKC9ZVKuyiKDrbaGpxWRAJnE6K9fTHoHRYSFTbtQYkD/D37SM5eMN9U9jbAOfIJ2BkUW93ctAs57+sLfS+ADrXWtBHqpA5UlweNYsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736579554; c=relaxed/simple;
	bh=yqq0o6Y7elY/pyZf6BPhmMUsEoELhpYxXsuHE6Fe2fQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldnmJlO4aFpHNwv6JZhzhd9TRqU7Ej64bZkAR2MWW0McP6v/+pqD1/38dGJpYjF/P7mkrYP7URImY9xKspYNc3WGitBu78U7W6JmakbMcVK5upSbtNfka276WxfjD+FnpVqaxSYZ/ijTGIKENfa53JRarvSKrfO3Ct5CLCTT32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YVV4s40hhzbjqn;
	Sat, 11 Jan 2025 15:09:17 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 10BBC1401F3;
	Sat, 11 Jan 2025 15:12:24 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemh100016.china.huawei.com
 (7.202.181.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 11 Jan
 2025 15:12:20 +0800
From: Kaixiong Yu <yukaixiong@huawei.com>
To: <akpm@linux-foundation.org>, <mcgrof@kernel.org>,
	<joel.granados@kernel.org>
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
Subject: [PATCH v5 -next 02/16] mm: filemap: move sysctl to mm/filemap.c
Date: Sat, 11 Jan 2025 15:07:37 +0800
Message-ID: <20250111070751.2588654-3-yukaixiong@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250111070751.2588654-1-yukaixiong@huawei.com>
References: <20250111070751.2588654-1-yukaixiong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh100016.china.huawei.com (7.202.181.102)

This moves the filemap related sysctl to mm/filemap.c, and
removes the redundant external variable declaration.

Signed-off-by: Kaixiong Yu <yukaixiong@huawei.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
v4:
 - const qualify struct ctl_table filemap_sysctl_table
v3:
 - change the title
---
---
 include/linux/mm.h |  2 --
 kernel/sysctl.c    |  8 --------
 mm/filemap.c       | 18 +++++++++++++++---
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 75c9b4f46897..b9a63a6c960f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -41,8 +41,6 @@ struct user_struct;
 struct pt_regs;
 struct folio_batch;
 
-extern int sysctl_page_lock_unfairness;
-
 void mm_core_init(void);
 void init_mm_internals(void);
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index f1ab251fc2d0..23c8db80da5d 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2079,14 +2079,6 @@ static struct ctl_table vm_table[] = {
 		.extra1		= SYSCTL_ONE,
 		.extra2		= SYSCTL_FOUR,
 	},
-	{
-		.procname	= "page_lock_unfairness",
-		.data		= &sysctl_page_lock_unfairness,
-		.maxlen		= sizeof(sysctl_page_lock_unfairness),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-	},
 #ifdef CONFIG_MMU
 	{
 		.procname	= "max_map_count",
diff --git a/mm/filemap.c b/mm/filemap.c
index 9a1aad0c66b9..29c131b84294 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -47,6 +47,7 @@
 #include <linux/splice.h>
 #include <linux/rcupdate_wait.h>
 #include <linux/sched/mm.h>
+#include <linux/sysctl.h>
 #include <linux/fsnotify.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
@@ -1078,6 +1079,19 @@ static wait_queue_head_t *folio_waitqueue(struct folio *folio)
 	return &folio_wait_table[hash_ptr(folio, PAGE_WAIT_TABLE_BITS)];
 }
 
+/* How many times do we accept lock stealing from under a waiter? */
+static int sysctl_page_lock_unfairness = 5;
+static const struct ctl_table filemap_sysctl_table[] = {
+	{
+		.procname	= "page_lock_unfairness",
+		.data		= &sysctl_page_lock_unfairness,
+		.maxlen		= sizeof(sysctl_page_lock_unfairness),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+	}
+};
+
 void __init pagecache_init(void)
 {
 	int i;
@@ -1086,6 +1100,7 @@ void __init pagecache_init(void)
 		init_waitqueue_head(&folio_wait_table[i]);
 
 	page_writeback_init();
+	register_sysctl_init("vm", filemap_sysctl_table);
 }
 
 /*
@@ -1233,9 +1248,6 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 	return true;
 }
 
-/* How many times do we accept lock stealing from under a waiter? */
-int sysctl_page_lock_unfairness = 5;
-
 static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
 {
-- 
2.34.1


