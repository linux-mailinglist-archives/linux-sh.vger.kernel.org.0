Return-Path: <linux-sh+bounces-2091-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F89FAFE0
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 15:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E82E3188A0D6
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 14:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2B71DED45;
	Mon, 23 Dec 2024 14:20:45 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070A1DE8B2;
	Mon, 23 Dec 2024 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963645; cv=none; b=Z4y2sfsGKz0WixB0Syk8iLq2ewYGfDi4Dt0uTKq4i2M35SmnKao3Qe+l4+zf2u71eKv5aU/AanCm2A4aPaskTC+KOLQM0uDNc/3eq5s+0Xe98fEKtypQ3ZqfX0iubJWDiAVBuRzmz7izIFnrdCjO0cRIFV3euyqf8OHKdmWa6i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963645; c=relaxed/simple;
	bh=q/KVGBiB0aB2oN3QIjJSYPFAB3w9t/SpKmFvlSoJm8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZ3sQ8W/OrsnVGl+3nMpw0fz8xISpuvUvSwGEKKNVr3eH/7/v/o5JmLnXammHjB4R5xhqpNXlhmTb+CImSadDInuDRxU7Y7ijCIbHxcQZNn9Y87rpB09BG0Qpjg/cP0KMluNi0C2h/pZswLeI9Fdj2yJj9kpLcNJGkKu/lEoohA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YH0WM6TXvzrRr1;
	Mon, 23 Dec 2024 22:18:55 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id A1CF51800D1;
	Mon, 23 Dec 2024 22:20:40 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemh100016.china.huawei.com
 (7.202.181.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Dec
 2024 22:20:37 +0800
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
Subject: [PATCH v4 -next 04/15] mm: vmscan: move vmscan sysctls to mm/vmscan.c
Date: Mon, 23 Dec 2024 22:15:39 +0800
Message-ID: <20241223141550.638616-21-yukaixiong@huawei.com>
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

This moves vm_swappiness and zone_reclaim_mode to mm/vmscan.c,
as part of the kernel/sysctl.c cleaning, also moves some external
variable declarations and function declarations from include/linux/swap.h
into mm/internal.h.

Signed-off-by: Kaixiong Yu <yukaixiong@huawei.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
v4:
 - const qualify struct ctl_table vmscan_sysctl_table
v3:
 - change the title
---
---
 include/linux/swap.h |  9 ---------
 kernel/sysctl.c      | 19 -------------------
 mm/internal.h        | 10 ++++++++++
 mm/vmscan.c          | 23 +++++++++++++++++++++++
 4 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 187715eec3cb..db1a28683e10 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -427,19 +427,10 @@ extern int vm_swappiness;
 long remove_mapping(struct address_space *mapping, struct folio *folio);
 
 #ifdef CONFIG_NUMA
-extern int node_reclaim_mode;
 extern int sysctl_min_unmapped_ratio;
 extern int sysctl_min_slab_ratio;
-#else
-#define node_reclaim_mode 0
 #endif
 
-static inline bool node_reclaim_enabled(void)
-{
-	/* Is any node_reclaim_mode bit set? */
-	return node_reclaim_mode & (RECLAIM_ZONE|RECLAIM_WRITE|RECLAIM_UNMAP);
-}
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index ab5d94f07e53..cb6ca272fe9f 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2051,15 +2051,6 @@ static struct ctl_table vm_table[] = {
 		.proc_handler	= dirtytime_interval_handler,
 		.extra1		= SYSCTL_ZERO,
 	},
-	{
-		.procname	= "swappiness",
-		.data		= &vm_swappiness,
-		.maxlen		= sizeof(vm_swappiness),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO_HUNDRED,
-	},
 	{
 		.procname	= "drop_caches",
 		.data		= &sysctl_drop_caches,
@@ -2107,16 +2098,6 @@ static struct ctl_table vm_table[] = {
 		.extra1		= SYSCTL_ZERO,
 	},
 #endif
-#ifdef CONFIG_NUMA
-	{
-		.procname	= "zone_reclaim_mode",
-		.data		= &node_reclaim_mode,
-		.maxlen		= sizeof(node_reclaim_mode),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-	},
-#endif
 #ifdef CONFIG_MMU
 	{
 		.procname	= "mmap_min_addr",
diff --git a/mm/internal.h b/mm/internal.h
index 39227887e47b..ea2623dc414a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1095,9 +1095,13 @@ static inline void mminit_verify_zonelist(void)
 #define NODE_RECLAIM_SUCCESS	1
 
 #ifdef CONFIG_NUMA
+extern int node_reclaim_mode;
+
 extern int node_reclaim(struct pglist_data *, gfp_t, unsigned int);
 extern int find_next_best_node(int node, nodemask_t *used_node_mask);
 #else
+#define node_reclaim_mode 0
+
 static inline int node_reclaim(struct pglist_data *pgdat, gfp_t mask,
 				unsigned int order)
 {
@@ -1109,6 +1113,12 @@ static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
 }
 #endif
 
+static inline bool node_reclaim_enabled(void)
+{
+	/* Is any node_reclaim_mode bit set? */
+	return node_reclaim_mode & (RECLAIM_ZONE|RECLAIM_WRITE|RECLAIM_UNMAP);
+}
+
 /*
  * mm/memory-failure.c
  */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 39886f435ec5..10cc05b5952d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7351,6 +7351,28 @@ void __meminit kswapd_stop(int nid)
 	pgdat_kswapd_unlock(pgdat);
 }
 
+static const struct ctl_table vmscan_sysctl_table[] = {
+	{
+		.procname	= "swappiness",
+		.data		= &vm_swappiness,
+		.maxlen		= sizeof(vm_swappiness),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_TWO_HUNDRED,
+	},
+#ifdef CONFIG_NUMA
+	{
+		.procname	= "zone_reclaim_mode",
+		.data		= &node_reclaim_mode,
+		.maxlen		= sizeof(node_reclaim_mode),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+	}
+#endif
+};
+
 static int __init kswapd_init(void)
 {
 	int nid;
@@ -7358,6 +7380,7 @@ static int __init kswapd_init(void)
 	swap_setup();
 	for_each_node_state(nid, N_MEMORY)
  		kswapd_run(nid);
+	register_sysctl_init("vm", vmscan_sysctl_table);
 	return 0;
 }
 
-- 
2.34.1


