Return-Path: <linux-sh+bounces-492-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD34986EADF
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 22:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689DDB2229C
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 21:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C768056B63;
	Fri,  1 Mar 2024 21:02:55 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599556B77
	for <linux-sh@vger.kernel.org>; Fri,  1 Mar 2024 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709326975; cv=none; b=a+qT9PmygEzLHqv/o7Fd+knbfLcEg77rmvVKkQZcmre6/fWrtrK7i4AHsVuG5RbHx+rU0+4VE3iumMiCPoLNopMOSgjjOqi+kmvO0gCo7lF4YStWjaJdgotj6nyWNRAF2580HAiKZu3BCzcySvZgZcc+GW4aXwJvNOYxViv8qh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709326975; c=relaxed/simple;
	bh=XQY+hwm/pWBlN5cYBxNabpimlfOZYJcYfzShDnZXI5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEWq257CpG5vcuSnXcSKudl/ppq5knWvQk0JGeuA1guORm5yvIZZOPeUCG2zD//XR+XMBy9OsJMsxYjl7LYYFlUAs9N3mW+5hBBdFqZq6DeNlFGSxqH7o90/wsPRt5uvnMXYWYUQ35GWRD0kbJo41AXUDCwpIkre/WKhnt4WFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by baptiste.telenet-ops.be with bizsmtp
	id tZ2e2B0041TWuYv01Z2eXk; Fri, 01 Mar 2024 22:02:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1T-0024gJ-80;
	Fri, 01 Mar 2024 22:02:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1e-00D8rG-2I;
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
Subject: [PATCH 05/20] sh: return_address: Add missing #include <asm/ftrace.h>
Date: Fri,  1 Mar 2024 22:02:19 +0100
Message-Id: <45685f62c9132aca5dc3c028471218393b51f34c.1709326528.git.geert+renesas@glider.be>
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

arch/sh/kernel/return_address.c:49:7: warning: no previous prototype for ‘return_address’ [-Wmissing-prototypes]

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/kernel/return_address.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/kernel/return_address.c b/arch/sh/kernel/return_address.c
index 8838094c9ff9444f..2ce22f11eab37839 100644
--- a/arch/sh/kernel/return_address.c
+++ b/arch/sh/kernel/return_address.c
@@ -7,7 +7,9 @@
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
+
 #include <asm/dwarf.h>
+#include <asm/ftrace.h>
 
 #ifdef CONFIG_DWARF_UNWINDER
 
-- 
2.34.1


