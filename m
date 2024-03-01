Return-Path: <linux-sh+bounces-475-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44586EAD0
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 22:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4450FB21F47
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 21:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B31E56B63;
	Fri,  1 Mar 2024 21:02:48 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDBA56B66
	for <linux-sh@vger.kernel.org>; Fri,  1 Mar 2024 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709326968; cv=none; b=LT6UlzVOrxDSGQrl+IhwMDriSXTGNJkjZ/H1Lj0lv/SMRP45Lfeke6nj+7Fr1FWrEW0T3VPxLDrDXdkhYVgHR5EuZA33Fg9Sbebp2oHh/35a/iT8aZsf6+XtrlHucpMiMOxDscQPQ+N9Hgh2x+of0A4sSmLgBG7R+QMFT4DwHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709326968; c=relaxed/simple;
	bh=rBxoEAWdBSYWw6guM59u0mev4vtFqxQLPZ9mMn81aww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s8mAxFdpljbrBigs9EuHXftAcHYa45fuBw36HnaNeYYokXsV7f6TCu+fGYt5bhFZdVNkolmQT/0h9Fq2h79G+TkQ08ScN6w//UjfmLVuKjhvQzyKeVSJ+oCucA/+5f1YqK/1yI1UJ2x8xW7uGMpWrb6bjTRWBdCb41bimYcKP/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by michel.telenet-ops.be with bizsmtp
	id tZ2e2B00B1TWuYv06Z2ewy; Fri, 01 Mar 2024 22:02:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1T-0024ge-Bc;
	Fri, 01 Mar 2024 22:02:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1e-00D8rf-5i;
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
Subject: [PATCH 10/20] sh: nommu: Add missing #include <asm/cacheflush.h>
Date: Fri,  1 Mar 2024 22:02:24 +0100
Message-Id: <d4b2a43fcedddee3d27cfd87ff2e0bf511588aa0.1709326528.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709326528.git.geert+renesas@glider.be>
References: <cover.1709326528.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/sh/mm/nommu.c:76:13: warning: no previous prototype for 'kmap_coherent_init' [-Wmissing-prototypes]
arch/sh/mm/nommu.c:80:7: warning: no previous prototype for 'kmap_coherent' [-Wmissing-prototypes]
arch/sh/mm/nommu.c:86:6: warning: no previous prototype for 'kunmap_coherent' [-Wmissing-prototypes]

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/mm/nommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/mm/nommu.c b/arch/sh/mm/nommu.c
index 78c4b6e6d33ba3af..fa3dc9428a737ffe 100644
--- a/arch/sh/mm/nommu.c
+++ b/arch/sh/mm/nommu.c
@@ -10,6 +10,8 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/mm.h>
+
+#include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <linux/uaccess.h>
-- 
2.34.1


