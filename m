Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1DBA42C4
	for <lists+linux-sh@lfdr.de>; Sat, 31 Aug 2019 08:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfHaGSs (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 31 Aug 2019 02:18:48 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40562 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725953AbfHaGSr (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Sat, 31 Aug 2019 02:18:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F0A4275DC8D547CF3F21;
        Sat, 31 Aug 2019 14:00:41 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Sat, 31 Aug 2019 14:00:33 +0800
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
        <linux-alpha@vger.kernel.org>, <nfont@linux.vnet.ibm.com>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v2 0/9] check the node id consistently across different arches
Date:   Sat, 31 Aug 2019 13:58:14 +0800
Message-ID: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

According to Section 6.2.14 from ACPI spec 6.3 [1], the
setting of proximity domain is optional, as below:

This optional object is used to describe proximity domain
associations within a machine. _PXM evaluates to an integer
that identifies a device as belonging to a Proximity Domain
defined in the System Resource Affinity Table (SRAT).

When enabling KASAN and bios has not implemented the proximity
domain of the hns3 device, there is a global-out-of-bounds error
below:

[   42.970381] ==================================================================
[   42.977595] BUG: KASAN: global-out-of-bounds in __bitmap_weight+0x48/0xb0
[   42.984370] Read of size 8 at addr ffff20008cdf8790 by task kworker/0:1/13
[   42.991230]
[   42.992712] CPU: 0 PID: 13 Comm: kworker/0:1 Tainted: G           O      5.2.0-rc4-g8bde06a-dirty #3
[   43.001830] Hardware name: Huawei TaiShan 2280 V2/BC82AMDA, BIOS TA BIOS 2280-A CS V2.B050.01 08/08/2019
[   43.011298] Workqueue: events work_for_cpu_fn
[   43.015643] Call trace:
[   43.018078]  dump_backtrace+0x0/0x1e8
[   43.021727]  show_stack+0x14/0x20
[   43.025031]  dump_stack+0xc4/0xfc
[   43.028335]  print_address_description+0x178/0x270
[   43.033113]  __kasan_report+0x164/0x1b8
[   43.036936]  kasan_report+0xc/0x18
[   43.040325]  __asan_load8+0x84/0xa8
[   43.043801]  __bitmap_weight+0x48/0xb0
[   43.047552]  hclge_init_ae_dev+0x988/0x1e78 [hclge]
[   43.052418]  hnae3_register_ae_dev+0xcc/0x278 [hnae3]
[   43.057467]  hns3_probe+0xe0/0x120 [hns3]
[   43.061464]  local_pci_probe+0x74/0xf0
[   43.065200]  work_for_cpu_fn+0x2c/0x48
[   43.068937]  process_one_work+0x3c0/0x878
[   43.072934]  worker_thread+0x400/0x670
[   43.076670]  kthread+0x1b0/0x1b8
[   43.079885]  ret_from_fork+0x10/0x18
[   43.083446]
[   43.084925] The buggy address belongs to the variable:
[   43.090052]  numa_distance+0x30/0x40
[   43.093613]
[   43.095091] Memory state around the buggy address:
[   43.099870]  ffff20008cdf8680: fa fa fa fa 04 fa fa fa fa fa fa fa 00 00 fa fa
[   43.107078]  ffff20008cdf8700: fa fa fa fa 04 fa fa fa fa fa fa fa 00 fa fa fa
[   43.114286] >ffff20008cdf8780: fa fa fa fa 00 00 00 00 00 00 00 00 fa fa fa fa
[   43.121494]                          ^
[   43.125230]  ffff20008cdf8800: 01 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
[   43.132439]  ffff20008cdf8880: fa fa fa fa fa fa fa fa 00 00 fa fa fa fa fa fa
[   43.139646] ==================================================================

As suggested [2] by Michal Hocko:
"if the specification really allows to provide NUMA_NO_NODE (-1) then
the code really has to be prepared for that. And ideally all arches
should deal with that."

This patchset checks the node id with the below case consistently
across different arches in order to be compliant with spec and
backward compatible as much as possible:
1. if node_id < 0, return cpu_online_mask
2. if node_id >= nr_node_ids, return cpu_none_mask
3. if node_to_cpumask_map[node_id] is NULL, return cpu_online_mask

Note:
1. Only arm64 has been compile tested and tested on real board.
2. x86 has been compile tested with defconfig.
3. Other arch has not been compile tested or tested on real board.

Changelog:
V2: Change commit log as suggested by Michal Hocko, and make the change to
    other arches as well.

[1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
[2] https://patchwork.kernel.org/patch/11122823/

Yunsheng Lin (9):
  arm64: numa: check the node id consistently for arm64
  x86: numa: check the node id consistently for x86
  alpha: numa: check the node id consistently for alpha
  powerpc: numa: check the node id consistently for powerpc
  s390: numa: check the node id consistently for s390
  sh: numa: check the node id consistently for sh
  sparc64: numa: check the node id consistently for sparc64
  mips: numa: check the node id consistently for mips ip27
  mips: numa: check the node id consistently for mips loongson64

 arch/alpha/include/asm/topology.h                |  7 +++++--
 arch/arm64/include/asm/numa.h                    |  6 ++++++
 arch/arm64/mm/numa.c                             |  2 +-
 arch/mips/include/asm/mach-ip27/topology.h       | 15 ++++++++++++---
 arch/mips/include/asm/mach-loongson64/topology.h | 12 +++++++++++-
 arch/powerpc/include/asm/topology.h              | 13 ++++++++++---
 arch/s390/include/asm/topology.h                 |  6 ++++++
 arch/sh/include/asm/topology.h                   | 14 +++++++++++++-
 arch/sparc/include/asm/topology_64.h             | 16 +++++++++++++---
 arch/x86/include/asm/topology.h                  |  6 ++++++
 arch/x86/mm/numa.c                               |  2 +-
 11 files changed, 84 insertions(+), 15 deletions(-)

-- 
2.8.1

