Return-Path: <linux-sh+bounces-3862-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOW6B839Cmop/AQAu9opvQ
	(envelope-from <linux-sh+bounces-3862-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 18 May 2026 13:53:49 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74556C03E
	for <lists+linux-sh@lfdr.de>; Mon, 18 May 2026 13:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC12E3040D96
	for <lists+linux-sh@lfdr.de>; Mon, 18 May 2026 11:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63B33F86E2;
	Mon, 18 May 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjgYfL5F"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306933F7870
	for <linux-sh@vger.kernel.org>; Mon, 18 May 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104834; cv=none; b=exb2tc3CV2FSqHOG8xtsgdTJU88tfZV2nl2z35akKE+VVJkzw+JW4rgNCRoYMtFLLL5sQ3I5LQVzr/jnrtvNOuPk7G3hCVRT3/4j5zYDb29CAPjSWEzQ+LTz3KyLrGo2yQNBK264cvRCBoktOcqBKETtul96074crhuMrIudc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104834; c=relaxed/simple;
	bh=5agnIUk6zVfimPSXwREgWs2+7BJvB3+u1r1/4XX7nYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7V/9HdoWo3YleaGO5Q4qy9YaULLToiImGCcvYv6AWCFBAxercGDg6iXMjKYGbZvY9Qnwd9iovBcTRS8dVOIsR2al3uyFq3ajqaqHBwlet8BpAhwmurpJzQsUiYDDR/T13YI2FCnqs094O/bnLiPydppl+m+D1m85Pkvu9otK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjgYfL5F; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b0786beso15512515e9.1
        for <linux-sh@vger.kernel.org>; Mon, 18 May 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104832; x=1779709632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ud+sEG7q0wP0zBzQht1NZnMd2Z7mvrdCEOMs+je9r8=;
        b=rjgYfL5FT8Y1o3u0yih69Pwfleg9GBjPpfmtxGux1Cvq1QoWkOGqFThwh7BKJxVn05
         DOlyeMbO2coGZV38L6a5jnlD44UXWIK4H4yEj/GZloVa8y9RcwYSe6HZl9PRzb+fBtNl
         07zapUG5OZR+5muwvt4y9WyDOEMxOHVY/F7CLXIF3grK++weOyONBSvDbozwN+Md4fet
         ln0Az2uMRqVvg+BIY0hrCC43ZBNkEq3D/ywshjCfMeKggTHkfEOgIgRMDslVNXuqLhRx
         bPB3YtCZiUv9wImDzCM/Kjdd+4M+Uns+Hbib6vzD5iiWOSG2W4yDWx8I9PTWv+nVp24S
         NxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104832; x=1779709632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ud+sEG7q0wP0zBzQht1NZnMd2Z7mvrdCEOMs+je9r8=;
        b=c7e5TTqlosEnJB6JNHpu/yA3+4Kts2v3EKMuvw0HhNCrbQ29xzw3j2PkPnA/HAyNiL
         52PeSwXNwS+5UcprSuLbMl9x2H2/x9vffqZYFADj30Nz7nqPgbf6Y9l106aLZoAmhVVm
         75cA88b8VMxQRufunypuquGkjo4bRxtq6/6kRnriOi5v6rkqCN7Ew7d8cjSjzaAK699a
         7n2hkSn7HcqwYVbyZkUnvlO206iUkuW5sUzl5rkUKNe1x7wODKFt4Svql08+8cxvZ7nj
         faBtlRoU7YyMSpXWgAgUgQ4NSsHefebpNZ8ly0o6wiCLj92N4poE0AbNtVMJwwMLfc9L
         U1+A==
X-Gm-Message-State: AOJu0YzfWfLYkSUCHuABL+hxqgMnXMAjK0Nazhts1MPA6QaKoOz/pR90
	ohvEIWUJK74SvEHC6E+EQ57SslMK+H0R12Qc6KwAU1/7iriDN4aL8BM=
X-Gm-Gg: Acq92OG+hhuG3sWd6LXbi26IyiyeVMMpn7Kjzu7+DG/XcFJ2X8WzZUbX4L8cvUTdpT5
	TApcw53yy4r+WbK83rK8trBDqgohJrt1pBjgG5ASll1ziigeq4YYX2Inc0B6zvnUFhAEyIGXMJO
	2L7dYF2F5xN0OHYUsLF6n8Vi9s5i7WNZNIo4VvOcFbzSLcJ5n37mM1J0N50nvjbKT1KVWrYuBrQ
	a6Nj+u3bDME0rHibHOUyCejJiNoI4i+vNt9aaVdRS5j6K7nRhQFVdjXRQVf5K3PYd8m/ztYog+b
	8YELhlEWkEOWwLcJGf9tNXn73nIBm2g+joofy53YWjZ9jIbDMw0XMEiWd92xi05jVv7HpqmvGd7
	QN6HtfPiyuzFMhjvKv9Yv02qBCJqjaQqgMLL4LIT2oVQNiHxt1WI74iJ7ZgjOjT4pRD/PKKoEAV
	mND8yUbeX3bxj2yA/w5GJDd9GnVHXYuJfmj09hWo9WEdL/QsvcAULTdaSPRl2ddxefaZr6IBtxE
	vlQquHI/0hbEuuGz4/3Q7pLYLAg7Q==
X-Received: by 2002:a05:600c:3f1b:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48fe661db6dmr224835215e9.29.1779104831563;
        Mon, 18 May 2026 04:47:11 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:f15c:fd38:3fe1:9653])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48febe585absm82341205e9.19.2026.05.18.04.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:47:11 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrian@newgolddream.dyndns.info>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 2/3] mtd: maps: vmu-flash: fix fault in unaligned fixup
Date: Mon, 18 May 2026 13:45:20 +0200
Message-ID: <20260518114521.81564-3-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com>
References: <20260518114521.81564-1-fuchsfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8C74556C03E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,libc.org,physik.fu-berlin.de,newgolddream.dyndns.info,gmail.com,artur-rojek.eu];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3862-lists,linux-sh=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuchsfl@gmail.com,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Use kzalloc_obj() / kzalloc_objs() to allocate the memcard structs,
instead of kmalloc_obj() / kmalloc_objs() to prevent access to
uninitialized data.

Fixes runtime error: Fault in unaligned fixup: 0000 [#1] at
mtd_get_fact_prot_info.

Fixes: 47a72688fae7 ("mtd: flash mapping support for Dreamcast VMU.")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v2->v3: no functional change, add Fixes, Cc tag according to feedback
v1->v2: no functional change, just rebased.

v2: https://lore.kernel.org/lkml/20260427114750.2480900-3-fuchsfl@gmail.com/
v1: https://lore.kernel.org/lkml/20251117224408.498449-3-fuchsfl@gmail.com/

 drivers/mtd/maps/vmu-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..b76d0609d1b7 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -609,7 +609,7 @@ static int vmu_connect(struct maple_device *mdev)
 
 	basic_flash_data = be32_to_cpu(mdev->devinfo.function_data[c - 1]);
 
-	card = kmalloc_obj(struct memcard);
+	card = kzalloc_obj(struct memcard);
 	if (!card) {
 		error = -ENOMEM;
 		goto fail_nomem;
@@ -627,13 +627,13 @@ static int vmu_connect(struct maple_device *mdev)
 	* Not sure there are actually any multi-partition devices in the
 	* real world, but the hardware supports them, so, so will we
 	*/
-	card->parts = kmalloc_objs(struct vmupart, card->partitions);
+	card->parts = kzalloc_objs(struct vmupart, card->partitions);
 	if (!card->parts) {
 		error = -ENOMEM;
 		goto fail_partitions;
 	}
 
-	card->mtd = kmalloc_objs(struct mtd_info, card->partitions);
+	card->mtd = kzalloc_objs(struct mtd_info, card->partitions);
 	if (!card->mtd) {
 		error = -ENOMEM;
 		goto fail_mtd_info;
-- 
2.43.0


