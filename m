Return-Path: <linux-sh+bounces-3639-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH1MIXbK1mkLIQgAu9opvQ
	(envelope-from <linux-sh+bounces-3639-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Wed, 08 Apr 2026 23:36:54 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF713C4213
	for <lists+linux-sh@lfdr.de>; Wed, 08 Apr 2026 23:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A960300FEC3
	for <lists+linux-sh@lfdr.de>; Wed,  8 Apr 2026 21:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A66171BB;
	Wed,  8 Apr 2026 21:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTS6zmqJ"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57C3612FE
	for <linux-sh@vger.kernel.org>; Wed,  8 Apr 2026 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684208; cv=none; b=jYjYMIPg/M/5OqKoFY3UQR4Ccp17qI0JnlLGWTPvXZUidZgWucmL+aGhPOWmB3PHNsUeY+64XBH2H1Cbj27tKTErEpf+OA7/sxlAK/Qs1lkir7yMLHhekV+aCGEVGqNPFPnqzc5ReY98seX5SFWthCto8qoMkfS6jyJnfC9wki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684208; c=relaxed/simple;
	bh=U1470YJaT80+YzZNhB2zoGUiu7r+zEWF0Wm7E1xjjEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iImQJMSsmVHEOfuS8vRXghT9IWS2sqVT8NnocZ+JO3FIgUKkzkaK04eqVQPR1Pmo1vsst6dMgemL7W7MBbYrUV4PYWcxISYy8XP3z3NyFNM2a7SbLrhCw/A15g2T68Za7A3ab1kvwMPrHU7QotPVxP9OFQJIR7CLN7cr37A68gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTS6zmqJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so94046f8f.1
        for <linux-sh@vger.kernel.org>; Wed, 08 Apr 2026 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775684205; x=1776289005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVxWYOeFnQfJj1Uu8QEV+84w2reIr8oTpqTdhpQ/Ac=;
        b=YTS6zmqJoNDjiBA7YfDsKC3ssfF0WujQuyURO3G9JuUBwT9g7/y7aPMgB6Ca2EmCOr
         s9VZ9b7VUUQh1zbhrvm65gBMZbo7P9jZBboXXL+taVLAd51Db7Pqrl7BsTDhQbXM8Hf0
         EGbONrPRPDp08cv67hsxqrRAYIDIBbpDMKkgcGv+4jPIDcTSMnyAMVtYdPMabTUqTAW2
         Nsv4HhFTEQBRT95oUdRIeB+9wP5JM8TIM32X4eZDtb6ArOwhhHelyXPZK77XlSDGNBU7
         6OT0c6cKBxELcmM1wml8fBBlLDxmrVCW2rgDW1aSnrL4U8dhXI/0q5NkcRUk6tECaNa9
         AIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684205; x=1776289005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjVxWYOeFnQfJj1Uu8QEV+84w2reIr8oTpqTdhpQ/Ac=;
        b=FVB7bj7+eU4R8vdzQmTgCLnUyFrSIeNZ5UfYD+Ucof6GHHmc5vGs+nOukCN2g1YFBY
         6Cp4n4ZfcP02EbRnDXe/yIck4Dyow3Cv9MmjYD14dCoCY0iLyN2w9rpXXZc1At2gFwci
         gU5IIVUy12dYeO3pIZJ9kMDhvmwuugIBhGzV+Z6ZP0/NU7yGr/pMl88VPErcR39vQOo6
         eIBFMxvLlj1qlGjd9qrdg+JhjTseYpub+Ivf9/GYy72RbOBFrRkHNMpR19dfrlyQRXS9
         FUMQyrnQFEhUX4yfZifsV0xS8/Ft019OuxGRgKMOsSHz9L2WDz7Q15w9wmbvPCi6J0tx
         XILw==
X-Forwarded-Encrypted: i=1; AJvYcCWQnFYFoWlhtpTOYXDkwK+CY+H1DtT7Lg2ALvAb+ZoSW/qBXd5yZmoFTHcvtcJInFoh+oE+B+a37g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPAlRYcYNHsCZTxTL6KmjkxSAJ8y7nGpa6pXfW0SdAxHu40/N
	eYOn+c0FIoeVvMid8snotHNlCVKiDvucJfGlnfCEvDNCMZxUXoB2Wznm
X-Gm-Gg: AeBDiesXC1T9oikhLMuf4Bs4MYBqbXZu7nwa/pa50+TS9Trf6hIROGu2f0eXA7+5vBy
	tmGydrk0itLSDxE5iPcwMmGvbsVy1sXetOxkEtLy+ePBi9Zku7kl0ZZ0ygRrSWhanXN5+E3rpfT
	QHsJO2P0E5P/EGkV32iGxCXFcc/gaOvRiXocee6P52/d3nah1TvdFEnfqAPPyQZpemQOKkWG1Iw
	7g2PwPhU1KNr67mBZCuz8phPmIGrEZhSFwwWVBuCGN15sEOX9plLTOPbt3+j9wnadCRtFBnnJj9
	2vP7x6acwX0ltJ+7gZvijrUrSdW80DISoscSP37eBxUNCw7KsHzTzCnJmG0ctM35Xsgyij30ndJ
	5X7igpY6jCCF1MfXUICmxEqNaz4hujfFWPLkIo7pNVqDBP4azB9/KocS4A7Gcx0pMJkCHg6ARQQ
	L0wfSj8lu4/Vy1rgcc7rH7zhH8IhgdmZEVoCXc2Avr8inGgDHq2iLBvI4tpCkDnZIjQQG9ZjRyo
	THUMmGM65CtNZzZ31kB
X-Received: by 2002:a05:6000:1a8b:b0:43d:1df7:e3af with SMTP id ffacd0b85a97d-43d595bbe8emr1451289f8f.22.1775684205254;
        Wed, 08 Apr 2026 14:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:37d6:c100:cca3:7cee:f0b5:b56f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43d473b8c1esm21404661f8f.12.2026.04.08.14.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:36:44 -0700 (PDT)
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Adrian McMenamin <adrianmcmenamin@gmail.com>
Subject: [PATCH] mtd: maps: vmu: add include to ensure maple mtd code builds
Date: Wed,  8 Apr 2026 22:29:51 +0100
Message-ID: <20260408212950.275065-2-adrianmcmenamin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3639-lists,linux-sh=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrianmcmenamin@gmail.com,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-sh];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DF713C4213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


maple.h included in vmu-flash.c references struct device and struct
device_driver, so we should explicitly include linux/device.h to ensure
the code builds without error.


Include header file required for build.

Signed-off-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
---
 drivers/mtd/maps/vmu-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..e2a574a4b438 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/maple.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-- 
2.43.0


