Return-Path: <linux-sh+bounces-478-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA686EACB
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 22:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327DD1C21F64
	for <lists+linux-sh@lfdr.de>; Fri,  1 Mar 2024 21:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F5556B68;
	Fri,  1 Mar 2024 21:02:49 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9056B79
	for <linux-sh@vger.kernel.org>; Fri,  1 Mar 2024 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709326969; cv=none; b=W2zT8+VeMCfNMFXfnLrxsnOM+ytrsGO0k20L2sCSCR0VbGDy+LFK0amDLb0il0n9WMwaLOhn4UF7Fl5Fzy4eqnOllnQ9Zv+v1D30u38PEC+d/btixO5ZbEykd887kX0+/2hJWH7U9GKvGSmTFKzhVyaxohLb1iBPbYStmSx2XZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709326969; c=relaxed/simple;
	bh=EZEhIwE/QBgRULd7GoitNkRuUOEqvN0i53K34hNtFRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cSfcfhC5/yKrZgKA4QjvbiZi0SItqUxuoeJfBnO5R+wtJyveitmOIU9a9uoA1Y7xseUfeyLlMpZHp3RnkuYsqfmquYScVDhksOQJ7t98Dm/74Q95lnBCZnih5kfB9/iWoMbobggYVdP5aXe915kfP8ApTXpIpIhNpMct51zF3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by andre.telenet-ops.be with bizsmtp
	id tZ2e2B0091TWuYv01Z2en1; Fri, 01 Mar 2024 22:02:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1T-0024h3-G7;
	Fri, 01 Mar 2024 22:02:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rgA1e-00D8sF-AS;
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
Subject: [PATCH 17/20] sh: kprobes: Make trampoline_probe_handler() static
Date: Fri,  1 Mar 2024 22:02:31 +0100
Message-Id: <42f30b7f767ee1293f6e687a605f7d907ae2daa6.1709326528.git.geert+renesas@glider.be>
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

arch/sh/kernel/kprobes.c:299:15: warning: no previous prototype for 'trampoline_probe_handler' [-Wmissing-prototypes]

There are no users outside this file, so make it static.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/kernel/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/kernel/kprobes.c b/arch/sh/kernel/kprobes.c
index 74051b8ddf3e7bf9..d8c2e399d6e50794 100644
--- a/arch/sh/kernel/kprobes.c
+++ b/arch/sh/kernel/kprobes.c
@@ -296,7 +296,7 @@ static void __used kretprobe_trampoline_holder(void)
 /*
  * Called when we hit the probe point at __kretprobe_trampoline
  */
-int __kprobes trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
+static int __kprobes trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
 {
 	regs->pc = __kretprobe_trampoline_handler(regs, NULL);
 
-- 
2.34.1


