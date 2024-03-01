Return-Path: <linux-sh+bounces-486-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB086EAD5
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 22:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBA8D1F2115F
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 21:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942F55677F;
	Fri,  1 Mar 2024 21:02:52 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F856B77
	for <linux-sh@vger.kernel.org>; Fri,  1 Mar 2024 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709326972; cv=none; b=loIzdTJl2otMkV2hZMwKFDnZHoyQ68lp8Tdd+sYWfm25HDpv4ngWTt+Jco0Mr56AfgcCBoz0OgdIGYvvHzrFdoJGl7kCTAj2kz7LP4UQ9hhuIHQwYI8hOthALJ40HAwGU/fsiwHSGQFfWsRtIlu7Q/JZRDpYbi1wXhJQpBiCc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709326972; c=relaxed/simple;
	bh=+1TX2uH6QO5tL1EOUSBU0x1mpJCfTuOWxVFI4K9w8AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHT53UMJtw1V/l6Bl/KCSNlx1nQwj+PU5i1qsuqS/Q3akMHtqImrfcdfu4Z+HPRDCPXHAZhZ2aOnDHJtKg/Cd82huq94zn7w7ni9SGRH6f08wGrdOUcReUrdyjtSwKzkG3jmygtxT98ZdMBs+RrduxWEWPq7koWwVasZ4EQixIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by andre.telenet-ops.be with bizsmtp
	id tZ2e2B0041TWuYv01Z2emy; Fri, 01 Mar 2024 22:02:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1T-0024gD-7H;
	Fri, 01 Mar 2024 22:02:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1e-00D8rC-1c;
	Fri, 01 Mar 2024 22:02:38 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-sh@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/20] sh: tlb: Add missing forward declaration for handle_tlbmiss()
Date: Fri,  1 Mar 2024 22:02:18 +0100
Message-Id: <23ec2c88168bd5b7e294828221531eed2f3eede8.1709326528.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709326528.git.geert+renesas@glider.be>
References: <cover.1709326528.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

arch/sh/mm/tlbex_32.c:22:1: warning: no previous prototype for ‘handle_tlbmiss’ [-Wmissing-prototypes]

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/include/asm/tlb.h | 4 ++++
 arch/sh/mm/tlbex_32.c     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/sh/include/asm/tlb.h b/arch/sh/include/asm/tlb.h
index aeb8915e92549609..ddf324bfb9a09721 100644
--- a/arch/sh/include/asm/tlb.h
+++ b/arch/sh/include/asm/tlb.h
@@ -24,6 +24,10 @@ static inline void tlb_unwire_entry(void)
 	BUG();
 }
 #endif /* CONFIG_CPU_SH4 */
+
+asmlinkage int handle_tlbmiss(struct pt_regs *regs, unsigned long error_code,
+			      unsigned long address);
+
 #endif /* CONFIG_MMU */
 #endif /* __ASSEMBLY__ */
 #endif /* __ASM_SH_TLB_H */
diff --git a/arch/sh/mm/tlbex_32.c b/arch/sh/mm/tlbex_32.c
index 1c53868632ee4c69..7d58578c15f4ef55 100644
--- a/arch/sh/mm/tlbex_32.c
+++ b/arch/sh/mm/tlbex_32.c
@@ -14,6 +14,7 @@
 #include <linux/kdebug.h>
 #include <asm/mmu_context.h>
 #include <asm/thread_info.h>
+#include <asm/tlb.h>
 
 /*
  * Called with interrupts disabled.
-- 
2.34.1


