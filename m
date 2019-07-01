Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D502B2DE
	for <lists+linux-sh@lfdr.de>; Mon, 27 May 2019 13:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfE0LMb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 May 2019 07:12:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726887AbfE0LMa (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 27 May 2019 07:12:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B17DE88319;
        Mon, 27 May 2019 11:12:30 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-89.ams2.redhat.com [10.36.117.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD3919C7F;
        Mon, 27 May 2019 11:12:27 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-mm@kvack.org
Cc:     linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        akpm@linux-foundation.org, Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Igor Mammedov <imammedo@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v3 05/11] drivers/base/memory: Pass a block_id to init_memory_block()
Date:   Mon, 27 May 2019 13:11:46 +0200
Message-Id: <20190527111152.16324-6-david@redhat.com>
In-Reply-To: <20190527111152.16324-1-david@redhat.com>
References: <20190527111152.16324-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 27 May 2019 11:12:30 +0000 (UTC)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

We'll rework hotplug_memory_register() shortly, so it no longer consumes
pass a section.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index f180427e48f4..f914fa6fe350 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -651,21 +651,18 @@ int register_memory(struct memory_block *memory)
 	return ret;
 }
 
-static int init_memory_block(struct memory_block **memory,
-			     struct mem_section *section, unsigned long state)
+static int init_memory_block(struct memory_block **memory, int block_id,
+			     unsigned long state)
 {
 	struct memory_block *mem;
 	unsigned long start_pfn;
-	int scn_nr;
 	int ret = 0;
 
 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
 	if (!mem)
 		return -ENOMEM;
 
-	scn_nr = __section_nr(section);
-	mem->start_section_nr =
-			base_memory_block_id(scn_nr) * sections_per_block;
+	mem->start_section_nr = block_id * sections_per_block;
 	mem->end_section_nr = mem->start_section_nr + sections_per_block - 1;
 	mem->state = state;
 	start_pfn = section_nr_to_pfn(mem->start_section_nr);
@@ -694,7 +691,8 @@ static int add_memory_block(int base_section_nr)
 
 	if (section_count == 0)
 		return 0;
-	ret = init_memory_block(&mem, __nr_to_section(section_nr), MEM_ONLINE);
+	ret = init_memory_block(&mem, base_memory_block_id(base_section_nr),
+				MEM_ONLINE);
 	if (ret)
 		return ret;
 	mem->section_count = section_count;
@@ -707,6 +705,7 @@ static int add_memory_block(int base_section_nr)
  */
 int hotplug_memory_register(int nid, struct mem_section *section)
 {
+	int block_id = base_memory_block_id(__section_nr(section));
 	int ret = 0;
 	struct memory_block *mem;
 
@@ -717,7 +716,7 @@ int hotplug_memory_register(int nid, struct mem_section *section)
 		mem->section_count++;
 		put_device(&mem->dev);
 	} else {
-		ret = init_memory_block(&mem, section, MEM_OFFLINE);
+		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
 		if (ret)
 			goto out;
 		mem->section_count++;
-- 
2.20.1

