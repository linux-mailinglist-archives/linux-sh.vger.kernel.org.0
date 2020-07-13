Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8525D2195E3
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jul 2020 04:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgGICGr (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 8 Jul 2020 22:06:47 -0400
Received: from foss.arm.com ([217.140.110.172]:52366 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgGICGr (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 8 Jul 2020 22:06:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87FBE31B;
        Wed,  8 Jul 2020 19:06:46 -0700 (PDT)
Received: from localhost.localdomain (entos-thunderx2-02.shanghai.arm.com [10.169.212.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 363C73F887;
        Wed,  8 Jul 2020 19:06:36 -0700 (PDT)
From:   Jia He <justin.he@arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        David Hildenbrand <david@redhat.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Kaly Xin <Kaly.Xin@arm.com>, Jia He <justin.he@arm.com>
Subject: [PATCH v3 0/6] Fix and enable pmem as RAM device on arm64
Date:   Thu,  9 Jul 2020 10:06:23 +0800
Message-Id: <20200709020629.91671-1-justin.he@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This fixies a few issues when I tried to enable pmem as RAM device on arm64.

To use memory_add_physaddr_to_nid as a fallback nid, it would be better
implement a general version (__weak) in mm/memory_hotplug. After that, arm64/
sh/s390 can simply use the general version, and PowerPC/ia64/x86 will use
arch specific version.

Tested on ThunderX2 host/qemu "-M virt" guest with a nvdimm device. The 
memblocks from the dax pmem device can be either hot-added or hot-removed
on arm64 guest. Also passed the compilation test on x86.

Changes:
v3: - introduce general version memory_add_physaddr_to_nid, refine the arch
      specific one
    - fix an uninitialization bug in v2 device-dax patch
v2: https://lkml.org/lkml/2020/7/7/71
    - Drop unnecessary patch to harden try_offline_node
    - Use new solution(by David) to fix dev->target_node=-1 during probing
    - Refine the mem_hotplug_begin/done patch

v1: https://lkml.org/lkml/2020/7/5/381


Jia He (6):
  mm/memory_hotplug: introduce default dummy
    memory_add_physaddr_to_nid()
  arm64/mm: use default dummy memory_add_physaddr_to_nid()
  sh/mm: use default dummy memory_add_physaddr_to_nid()
  mm: don't export memory_add_physaddr_to_nid in arch specific directory
  device-dax: use fallback nid when numa_node is invalid
  mm/memory_hotplug: fix unpaired mem_hotplug_begin/done

 arch/arm64/mm/numa.c | 10 ----------
 arch/ia64/mm/numa.c  |  2 --
 arch/sh/mm/init.c    |  9 ---------
 arch/x86/mm/numa.c   |  1 -
 drivers/dax/kmem.c   | 21 +++++++++++++--------
 mm/memory_hotplug.c  | 15 ++++++++++++---
 6 files changed, 25 insertions(+), 33 deletions(-)

-- 
2.17.1

