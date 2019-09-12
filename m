Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2B9B0C7B
	for <lists+linux-sh@lfdr.de>; Thu, 12 Sep 2019 12:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731107AbfILKSC (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 12 Sep 2019 06:18:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33204 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730811AbfILKSB (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 12 Sep 2019 06:18:01 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 01CAE14800DBA7180C95;
        Thu, 12 Sep 2019 18:17:57 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Sep 2019 18:17:55 +0800
From:   Yunsheng Lin <linyunsheng@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
CC:     <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <rafael@kernel.org>,
        <mhocko@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH v3 2/8] x86: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for x86
Date:   Thu, 12 Sep 2019 18:15:28 +0800
Message-ID: <1568283334-178380-3-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
References: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

When passing the return value of dev_to_node() to cpumask_of_node()
without checking the node id if the node id is NUMA_NO_NODE, there is
global-out-of-bounds detected by KASAN.

From the discussion [1], NUMA_NO_NODE really means no node affinity,
which also means all cpus should be usable. So the cpumask_of_node()
should always return all cpus online when user passes the node id
as NUMA_NO_NODE, just like similar semantic that page allocator handles
NUMA_NO_NODE.

But we cannot really copy the page allocator logic. Simply because the
page allocator doesn't enforce the near node affinity. It just picks it
up as a preferred node but then it is free to fallback to any other numa
node. This is not the case here and node_to_cpumask_map will only restrict
to the particular node's cpus which would have really non deterministic
behavior depending on where the code is executed. So in fact we really
want to return cpu_online_mask for NUMA_NO_NODE.

Also there is a debuging version of node_to_cpumask_map(), which only
is used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this patch changes
it to handle NUMA_NO_NODE as the normal node_to_cpumask_map(). And "fix"
a sign "bug" since it is for debugging and should catch all the error
cases.

[1] https://lore.kernel.org/patchwork/patch/1125789/
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
Suggested-by: Michal Hocko <mhocko@kernel.org>
---
V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
    for NUMA_NO_NODE case, and change the commit log to better justify
    the change.
---
 arch/x86/include/asm/topology.h | 3 +++
 arch/x86/mm/numa.c              | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 4b14d23..7fa82e1 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -69,6 +69,9 @@ extern const struct cpumask *cpumask_of_node(int node);
 /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return node_to_cpumask_map[node];
 }
 #endif
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index e6dad60..c676ffb 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
  */
 const struct cpumask *cpumask_of_node(int node)
 {
-	if (node >= nr_node_ids) {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
+	if ((unsigned int)node >= nr_node_ids) {
 		printk(KERN_WARNING
-			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
+			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
 			node, nr_node_ids);
 		dump_stack();
 		return cpu_none_mask;
-- 
2.8.1

