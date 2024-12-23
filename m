Return-Path: <linux-sh+bounces-2081-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241D9FAF97
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 15:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAF1C7A38A8
	for <lists+linux-sh@lfdr.de>; Mon, 23 Dec 2024 14:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235461D5CDB;
	Mon, 23 Dec 2024 14:20:10 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF71AF0B0;
	Mon, 23 Dec 2024 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963610; cv=none; b=Vm/Voqhq75kTJnOgPJOcfBAu+CHs3Htd2gF+YEcovownuhvc5c38No5e2d3XVJlRWZex7oEAEFfQCkCKGUFNiS2HBvOInZ86vGDwxIN9AR892T5rNO87qWqhbWdwvXG8+EVDNOWC5EmqNxWJl4lu34EJGdwZus9r+7TYyEN/7Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963610; c=relaxed/simple;
	bh=fAeSG8GX2vLrPZYjKh64LRtiL1F/nvMSmcxJk9KJfNI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=adNwA4zuTV4e5mMS0oPW2YEcZRiOye7immAlPT7ZkKsrA32XQX48qO6RVSp0EpnbrO1Mzn+9Kk+4LkIqo2UWjs87JMnDM8tyEWShAVe4d/Q6xcqL93idPGuhEa/giEEs2ZIcQP0z88uUS+4/NEzK0pGHws8Q0qqtvdNlvN5sx0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YH0Vf5Nw9zrRn0;
	Mon, 23 Dec 2024 22:18:18 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E6C31800D1;
	Mon, 23 Dec 2024 22:20:03 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemh100016.china.huawei.com
 (7.202.181.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Dec
 2024 22:20:00 +0800
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
Subject: [PATCH v4 -next 09/15] fs: fs-writeback: move sysctl to fs/fs-writeback.c
Date: Mon, 23 Dec 2024 22:15:28 +0800
Message-ID: <20241223141550.638616-10-yukaixiong@huawei.com>
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

The dirtytime_expire_interval belongs to fs/fs-writeback.c, move it to
fs/fs-writeback.c from /kernel/sysctl.c. And remove the useless extern
variable declaration and the function declaration from
include/linux/writeback.h

Signed-off-by: Kaixiong Yu <yukaixiong@huawei.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
v4:
 - const qualify struct ctl_table vm_fs_writeback_table
v3:
 - change dirtytime_expire_interval to static type
 - change the title
---
---
 fs/fs-writeback.c         | 30 +++++++++++++++++++++---------
 include/linux/writeback.h |  4 ----
 kernel/sysctl.c           |  8 --------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 5980ac24c7a4..4f907e8dbfff 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -65,7 +65,7 @@ struct wb_writeback_work {
  * timestamps written to disk after 12 hours, but in the worst case a
  * few inodes might not their timestamps updated for 24 hours.
  */
-unsigned int dirtytime_expire_interval = 12 * 60 * 60;
+static unsigned int dirtytime_expire_interval = 12 * 60 * 60;
 
 static inline struct inode *wb_inode(struct list_head *head)
 {
@@ -2435,14 +2435,7 @@ static void wakeup_dirtytime_writeback(struct work_struct *w)
 	schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
 }
 
-static int __init start_dirtytime_writeback(void)
-{
-	schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
-	return 0;
-}
-__initcall(start_dirtytime_writeback);
-
-int dirtytime_interval_handler(const struct ctl_table *table, int write,
+static int dirtytime_interval_handler(const struct ctl_table *table, int write,
 			       void *buffer, size_t *lenp, loff_t *ppos)
 {
 	int ret;
@@ -2453,6 +2446,25 @@ int dirtytime_interval_handler(const struct ctl_table *table, int write,
 	return ret;
 }
 
+static const struct ctl_table vm_fs_writeback_table[] = {
+	{
+		.procname	= "dirtytime_expire_seconds",
+		.data		= &dirtytime_expire_interval,
+		.maxlen		= sizeof(dirtytime_expire_interval),
+		.mode		= 0644,
+		.proc_handler	= dirtytime_interval_handler,
+		.extra1		= SYSCTL_ZERO,
+	},
+};
+
+static int __init start_dirtytime_writeback(void)
+{
+	schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
+	register_sysctl_init("vm", vm_fs_writeback_table);
+	return 0;
+}
+__initcall(start_dirtytime_writeback);
+
 /**
  * __mark_inode_dirty -	internal function to mark an inode dirty
  *
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index d11b903c2edb..caf4f0b12235 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -327,12 +327,8 @@ extern struct wb_domain global_wb_domain;
 /* These are exported to sysctl. */
 extern unsigned int dirty_writeback_interval;
 extern unsigned int dirty_expire_interval;
-extern unsigned int dirtytime_expire_interval;
 extern int laptop_mode;
 
-int dirtytime_interval_handler(const struct ctl_table *table, int write,
-		void *buffer, size_t *lenp, loff_t *ppos);
-
 void global_dirty_limits(unsigned long *pbackground, unsigned long *pdirty);
 unsigned long wb_calc_thresh(struct bdi_writeback *wb, unsigned long thresh);
 unsigned long cgwb_calc_thresh(struct bdi_writeback *wb);
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 97f9abffff0f..c5527f59e3f2 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2014,14 +2014,6 @@ static struct ctl_table kern_table[] = {
 };
 
 static struct ctl_table vm_table[] = {
-	{
-		.procname	= "dirtytime_expire_seconds",
-		.data		= &dirtytime_expire_interval,
-		.maxlen		= sizeof(dirtytime_expire_interval),
-		.mode		= 0644,
-		.proc_handler	= dirtytime_interval_handler,
-		.extra1		= SYSCTL_ZERO,
-	},
 	{
 		.procname	= "drop_caches",
 		.data		= &sysctl_drop_caches,
-- 
2.34.1


