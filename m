Return-Path: <linux-sh+bounces-3706-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNU8K9mV6GmENAIAu9opvQ
	(envelope-from <linux-sh+bounces-3706-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Wed, 22 Apr 2026 11:33:13 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28464444082
	for <lists+linux-sh@lfdr.de>; Wed, 22 Apr 2026 11:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA3F9301F78C
	for <lists+linux-sh@lfdr.de>; Wed, 22 Apr 2026 09:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC5579CD;
	Wed, 22 Apr 2026 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VaouCp31"
X-Original-To: linux-sh@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62893C345B
	for <linux-sh@vger.kernel.org>; Wed, 22 Apr 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850241; cv=none; b=XrbQhHkS+NY3yjfd1Iezf5ROXyni7sTiu1YBbKzUjCtjvm/f31I9DEP3C7hmb8FKP15df9hrPD5Bu8jIPlitaV+TpTFKs0EOU1DgHQnXT/g2Ywkfg9rDkG6wWThG6vsEoy4F48st3j+j83lFdFvEZWEFfId2nAW0qzsKdJ+TnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850241; c=relaxed/simple;
	bh=QnXi8TW7gv6VMwXsbt6D9GHGFYS5nnsKWugS68fFTHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIxYtrT0IZomXfQNQP6SKAr+OloQeohe8hRnCauiJhJ079T+sfy+YIKBlZKsAA44jsMNQlxBxle7ouXPYwH90DV1vrwKyZMDUMsrCF1P9OHfh4R/ShPFfvyp5VG3NDXPPG0wBEqbzA02PtFd7GhJKSI8lJO6ycy+8+iw4PLFVUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VaouCp31; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776850237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vBjuMp/wOerKnK0nAlIlD0P66ezXIixo6qaL8XBTLnM=;
	b=VaouCp31bn3Hmi7um0hiSNknNBmHO+VgtL8qju9kGToxpTmSAMwUNweUzM8QPC9m4R332C
	eiufVpw0gdctlBi4qB4I5sme3DoidMycooGLfCuvE8E5n1hulDhBiRnEocgjt0iboDy9Tx
	TVBb37IEGet1HhPg0e3wC3LL66KI81s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sh: simplify setup_arch command line handling
Date: Wed, 22 Apr 2026 11:30:28 +0200
Message-ID: <20260422093029.69042-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=thorsten.blum@linux.dev; h=from:subject; bh=QnXi8TW7gv6VMwXsbt6D9GHGFYS5nnsKWugS68fFTHg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkvppoa7LQMORcubFT3b8f1xGPbthc+8m+5ErbbZfOOj Ak9Bg5yHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRpPmMDKd6zj7Rb50w3UU6 bPU1bq1Du6oV7MqUnyXK3jew3pC8i4vhr1xRoVL53vWHfm1YvTrndRrnlg1bndyXVJytei9wUMu 9jBsA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3706-lists,linux-sh=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-sh];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28464444082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Handle CONFIG_CMDLINE_EXTEND explicitly in its own branch and build the
command line string with a single snprintf(), instead of first copying
COMMAND_LINE and then appending a space and CONFIG_CMDLINE using two
strlcat() calls.

This keeps the logic aligned with the mutually exclusive Kconfig options
and makes the three cases easier to read.

Also use the two-argument version of strscpy() for the fixed-size
'command_line' buffer in the overwrite and bootloader-only cases.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/sh/kernel/setup.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 039a51291002..d8c19a3d2801 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -299,14 +299,13 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = virt_to_phys(__bss_start);
 	bss_resource.end = virt_to_phys(__bss_stop)-1;
 
-#ifdef CONFIG_CMDLINE_OVERWRITE
-	strscpy(command_line, CONFIG_CMDLINE, sizeof(command_line));
+#if defined(CONFIG_CMDLINE_OVERWRITE)
+	strscpy(command_line, CONFIG_CMDLINE);
+#elif defined(CONFIG_CMDLINE_EXTEND)
+	snprintf(command_line, sizeof(command_line), "%s %s", COMMAND_LINE,
+		 CONFIG_CMDLINE);
 #else
-	strscpy(command_line, COMMAND_LINE, sizeof(command_line));
-#ifdef CONFIG_CMDLINE_EXTEND
-	strlcat(command_line, " ", sizeof(command_line));
-	strlcat(command_line, CONFIG_CMDLINE, sizeof(command_line));
-#endif
+	strscpy(command_line, COMMAND_LINE);
 #endif
 
 	/* Save unparsed command line copy for /proc/cmdline */

