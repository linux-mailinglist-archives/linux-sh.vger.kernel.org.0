Return-Path: <linux-sh+bounces-2285-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247EA0A1A9
	for <lists+linux-sh@lfdr.de>; Sat, 11 Jan 2025 08:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ED123ABE9B
	for <lists+linux-sh@lfdr.de>; Sat, 11 Jan 2025 07:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3F21B3926;
	Sat, 11 Jan 2025 07:13:01 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286218859B;
	Sat, 11 Jan 2025 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736579580; cv=none; b=fCrh3uaNDYf5AH/lTvLwSBmWA4e0tvRvJYXtrOxVtWd1lhaHnuXuBK2TZQb3a1TjbF8tVh78jCabz6hCbghAtFldnwb4PS6RGI5pOw/jMKCqSUmAmzhO/ah9ScHdfuHntNV7QnVA1D8t+4I7/Ud1JHHmWdMdHIY6kBVRujkzaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736579580; c=relaxed/simple;
	bh=IdHQmWyFeAejWwE0EfX+57lJCHs3w51Kv+o9VdEPcQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vp4ptwcBAclSV/CZ2UeBR5YSd6Hn70RNEviZrTo1w0fhqTbQE4udEjSNRco4kJE2GGNZRdmkrIWNXLPtw1OvCV5U7FOOlYWxEndP03qoHkuC99brChtXCRqNFsEBm4l5XeuXhoEWKNiWY86IVj+JUTh46QKMpydlyxroHdZhacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YVV781PtbzrS4W;
	Sat, 11 Jan 2025 15:11:16 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 30F2E18010B;
	Sat, 11 Jan 2025 15:12:57 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemh100016.china.huawei.com
 (7.202.181.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 11 Jan
 2025 15:12:53 +0800
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
Subject: [PATCH v5 -next 11/16] sunrpc: simplify rpcauth_cache_shrink_count()
Date: Sat, 11 Jan 2025 15:07:46 +0800
Message-ID: <20250111070751.2588654-12-yukaixiong@huawei.com>
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

It is inappropriate to use sysctl_vfs_cache_pressure here.
The sysctl is documented as: This percentage value controls
the tendency of the kernel to reclaim the memory which is used
for caching of directory and inode objects.

So, simplify result of rpcauth_cache_shrink_count() to
"return number_cred_unused;".

Signed-off-by: Kaixiong Yu <yukaixiong@huawei.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: Anna Schumaker <anna.schumaker@oracle.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
v4:
 - Simplify result of rpcauth_cache_shrink_count().
---
---
 net/sunrpc/auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 04534ea537c8..5a827afd8e3b 100644
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -489,7 +489,7 @@ static unsigned long
 rpcauth_cache_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 
 {
-	return number_cred_unused * sysctl_vfs_cache_pressure / 100;
+	return number_cred_unused;
 }
 
 static void
-- 
2.34.1


