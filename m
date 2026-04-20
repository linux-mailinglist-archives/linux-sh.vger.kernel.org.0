Return-Path: <linux-sh+bounces-3701-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ2yFPVQ5mkDuwEAu9opvQ
	(envelope-from <linux-sh+bounces-3701-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 20 Apr 2026 18:14:45 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1642F302
	for <lists+linux-sh@lfdr.de>; Mon, 20 Apr 2026 18:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1486831CAE97
	for <lists+linux-sh@lfdr.de>; Mon, 20 Apr 2026 15:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19DA2BDC0B;
	Mon, 20 Apr 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="en4REYnY"
X-Original-To: linux-sh@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1529D287
	for <linux-sh@vger.kernel.org>; Mon, 20 Apr 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697949; cv=none; b=OGlvdYqFWmIxgi9UI4DwakIuLEPKLYhntAEWNB+mpllA7eJ9nEEXU+LkLqxnzo5x6/nqQEpi+gvtJsqRWt4+komUCtz1BrbWt9z72tDmz1M9o8Xt2wdPENPGPGRNrOmJ75msJxBdwz85jRKyUmoqwDxzNoZniVkTX3wgq+knYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697949; c=relaxed/simple;
	bh=Dj6bvQaaO1UHbvKK/2j4vDR7gL3u0KDiJ93YeAB3/EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdM1CjYaBdYlU+gFa+z3XC8wpfSyMF3tGzcKUcovZZw1o/uW9ZCnF65idmHayYSuE42RF6WdCS8K7dI4FYrJc1l1AKjOGY2LJzn3AjxWIDkIj1JlSVaIOserSYK4MPRHj9/3K3phTS0Mrpyy+wJmaX3NaVPDAI+ov8vG+WsKtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=en4REYnY; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776697946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDWl8JNbaIaWhNvsc6LDZsZJ0F11WG9DZVUZC6b19qI=;
	b=en4REYnY8vyyeDBTMu6arSg5BUCnxLRQ2AtQ6uuV86N0BweZZITiBUQi2EmUxVyNx6UO1M
	e9WXxutk2uXorchW0Yrw5x/OR7SH6EJ8ruzrZlwnGvpBPqPDDW7kEI+gWTByjTfpQqHbTk
	320sLwZw44ykj1WBT9fb6sCZcHocBZw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] sh: dma: drop redundant size argument from strscpy in request_dma
Date: Mon, 20 Apr 2026 17:10:00 +0200
Message-ID: <20260420150958.17072-7-thorsten.blum@linux.dev>
In-Reply-To: <20260420150958.17072-5-thorsten.blum@linux.dev>
References: <20260420150958.17072-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; i=thorsten.blum@linux.dev; h=from:subject; bh=Dj6bvQaaO1UHbvKK/2j4vDR7gL3u0KDiJ93YeAB3/EY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnPHM/7rSvOOVDP+G7OIsVn147mXjw46dJOz3UHPI7VS 6+fePDD745SFgYxLgZZMUWWB7N+zPAtrancZBKxE2YOKxPIEAYuTgGYSLIXw//SWR29u3e/fpTt X7H+/8wnz4sNe28/XxHoWSGm1aR7vHgzw//AJWWbTN83666dP2Wny4Qdc4NYG5uEFdf+n5A178W jUHdGAA==
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
	TAGGED_FROM(0.00)[bounces-3701-lists,linux-sh=lfdr.de];
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
X-Rspamd-Queue-Id: C6C1642F302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The strscpy() size argument is optional if the destination buffer has a
fixed length. Use the two-argument version of strscpy() to copy 'dev_id'
to simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/sh/drivers/dma/dma-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/drivers/dma/dma-api.c b/arch/sh/drivers/dma/dma-api.c
index 87e5a8928873..15e2c10c9805 100644
--- a/arch/sh/drivers/dma/dma-api.c
+++ b/arch/sh/drivers/dma/dma-api.c
@@ -96,7 +96,7 @@ int request_dma(unsigned int chan, const char *dev_id)
 	if (atomic_xchg(&channel->busy, 1))
 		return -EBUSY;
 
-	strscpy(channel->dev_id, dev_id, sizeof(channel->dev_id));
+	strscpy(channel->dev_id, dev_id);
 
 	if (info->ops->request) {
 		result = info->ops->request(channel);

