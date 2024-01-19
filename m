Return-Path: <linux-sh+bounces-259-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC480832BD7
	for <lists+linux-sh@lfdr.de>; Fri, 19 Jan 2024 15:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF9A7B25200
	for <lists+linux-sh@lfdr.de>; Fri, 19 Jan 2024 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857B553E3F;
	Fri, 19 Jan 2024 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0ImHIRm"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2E54BE7
	for <linux-sh@vger.kernel.org>; Fri, 19 Jan 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676044; cv=none; b=ZfrDphQ0Q5lwkSIqPyn9rEP6IpfUCOejFvLgB6uIfOobG3ajPK+PwMu/ETbooStwYVaSVl1hRSyx3iqWJ8WUrizpB1lJW/0qf7U9NX5UPtI6B1uDTYSjm9jAAVNk+Oi+pN+peFieksabCNTDk+1092wSqMSI7MFFvw0e9VuI9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676044; c=relaxed/simple;
	bh=rpUH0q7+qhjgM4ADyrT0mqsrvcjN/GEMuVc7I8p0QC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=W5ZpcSoZF3TMoLRCLbT19fnzFneQ+rx3Pt9UoCS4b40N4hPsJE9KH+thDF0S+KD8IOJdVnFAlVE1VuFYQOsrZNfjOhv2QiE/4c6hBrJnk7yFSl97K3Tll1d34U8ESRRliUk8pA34mWNuASKC+IuABseqewc4WWwI6TDH0lM6CDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0ImHIRm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlnghyw81CpGwF6moUBtvugzcbNEO3VWIFUoR7h2Ajk=;
	b=L0ImHIRmUs5BWSvCM0O9feFAwDohIbWdRQ3HetPYcBS+LOnBh+CN3yH5lLD1hCr94sZTal
	Vj7OuQA2BDqWxvTHqBa+xwHkqH1Fd390nqagX2GNyMAhwoYGXolnoIEmKjxn2s1rhZvn5q
	zAQCzNbGgwGKl4UcHYxQO5cfB1fAwMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-pami_hTRMLW5sk65b-Os0Q-1; Fri, 19 Jan 2024 09:53:55 -0500
X-MC-Unique: pami_hTRMLW5sk65b-Os0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B550480007C;
	Fri, 19 Jan 2024 14:53:54 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 674B951D5;
	Fri, 19 Jan 2024 14:53:47 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 08/14] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
Date: Fri, 19 Jan 2024 22:52:35 +0800
Message-ID: <20240119145241.769622-9-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

In PowerPC, the crash dumping and kexec reboot share code in
arch_kexec_locate_mem_hole(), in which struct crash_mem is used.

Here enfoce enforce KEXEC and KEXEC_FILE to select CRASH_DUMP for now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1cdb8fdd3735..fc3cd7f4bb73 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -608,6 +608,10 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 config ARCH_SUPPORTS_KEXEC
 	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	select CRASH_DUMP
+
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool PPC64
 
@@ -618,6 +622,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
 	select KEXEC_ELF
+	select CRASH_DUMP
 	select HAVE_IMA_KEXEC if IMA
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-- 
2.41.0


