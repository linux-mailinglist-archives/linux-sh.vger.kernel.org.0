Return-Path: <linux-sh+bounces-3612-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YVWXBgnazGliXAYAu9opvQ
	(envelope-from <linux-sh+bounces-3612-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Wed, 01 Apr 2026 10:40:41 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 677AA376F8C
	for <lists+linux-sh@lfdr.de>; Wed, 01 Apr 2026 10:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A7993103719
	for <lists+linux-sh@lfdr.de>; Wed,  1 Apr 2026 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E783ACA68;
	Wed,  1 Apr 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F/JjfJl+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JroWuT3/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TYWNo6GM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NRpqMqRC"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3425E3B3C0F
	for <linux-sh@vger.kernel.org>; Wed,  1 Apr 2026 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032371; cv=none; b=oNWEuqEaCxe+bixwwKoaaZpZn7umqKb1GtBvPZUTujb+UUnrs6+PQC0D/Q5nItZHo7HJJtGLgEA6GDvYuix990j5aiUE1zj9P1Xt3sDhnyqcdBQUoLJmtnB+YMiIJVCCpjVLHQfAwLLKn1+/XnPNBXbG8aeawrN8M2cgAMS7xV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032371; c=relaxed/simple;
	bh=zAZcmT5Cbrnqx+kVgfQumdm2Unc+201ePP1R+xC/yrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pU4bm9YqG3E8gV9b2rdBfAeKD1eL96FwtNJ3LDrNWbRGWL4P0N2N7yuZ4AaAM8OlfuDOnV2+hty0SbAaOu65ScQF1Bs/ZYVIZfAPT0EktN2p4jLPOiYqh+Hgb7nFSuEgTePekQ72spYnz/+MhX6GfRSJx/luyxYLFg74CgMg6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F/JjfJl+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JroWuT3/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TYWNo6GM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NRpqMqRC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5FB34D282;
	Wed,  1 Apr 2026 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775032366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7DQ7PreTDiaftRhaS42vmUDfpj962j1xAcBJ1gtvTw=;
	b=F/JjfJl+oJn94ACEgNHpAsrTgUNCa8iiuKMwLtEnL8c7W3QZ/jwTBeH77oma1kd+9FsUiE
	0wfKT4dETbtQdbwTbyVcyO7BBOgDlzMfD8ambH4iU2Jh/aR55PtdT7yUobBy63D/r947Or
	Zpwo0YSuifktZY+KV/qAEvxlTj2KCKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775032366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7DQ7PreTDiaftRhaS42vmUDfpj962j1xAcBJ1gtvTw=;
	b=JroWuT3/nfAmQUeiyYo4Ha0af4Q91ZuJ8vEiBpKQGQkFSR3qcIqr1KqZ1l8WU/a4Ny5M5q
	JsvFdgex8wSRDfCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TYWNo6GM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NRpqMqRC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775032365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7DQ7PreTDiaftRhaS42vmUDfpj962j1xAcBJ1gtvTw=;
	b=TYWNo6GM4Rg3Pni9+63CZVEK3EK5QpNqxFUc6vuldkrleAtsXgH+hilOh/CJ+ZZQRRA1Qc
	uK/oFDpVtzydUu6NOGk91u/nnivTQ990pPQDE7kJk3SJqPXzY+iOZ/3voLgd9vDGVZjEnh
	j4EhMM6c6csxKfFGDSz/ovuS6y6zFMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775032365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7DQ7PreTDiaftRhaS42vmUDfpj962j1xAcBJ1gtvTw=;
	b=NRpqMqRCIQr+yBSsuPxCi7R991qq4bu9jJzsDSSO2IzGv79Ropi5GkFh8+SuEMqyqzCZtZ
	YLaVj2Deg4l1P7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA8984A0B0;
	Wed,  1 Apr 2026 08:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e4VlKC3YzGndCwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Apr 2026 08:32:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	arnd@arndb.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] arch/sh: Drop CONFIG_FIRMWARE_EDID from defconfig files
Date: Wed,  1 Apr 2026 10:32:34 +0200
Message-ID: <20260401083242.214492-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3612-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Queue-Id: 677AA376F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
true here, so drop the lines from the defconfig files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/sh/configs/dreamcast_defconfig | 1 -
 arch/sh/configs/hp6xx_defconfig     | 1 -
 arch/sh/configs/se7343_defconfig    | 1 -
 arch/sh/configs/se7780_defconfig    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/sh/configs/dreamcast_defconfig b/arch/sh/configs/dreamcast_defconfig
index dd58797e8298..b31bf17fe112 100644
--- a/arch/sh/configs/dreamcast_defconfig
+++ b/arch/sh/configs/dreamcast_defconfig
@@ -50,7 +50,6 @@ CONFIG_HW_RANDOM=y
 CONFIG_WATCHDOG=y
 CONFIG_SH_WDT=y
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_PVR2=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FONTS=y
diff --git a/arch/sh/configs/hp6xx_defconfig b/arch/sh/configs/hp6xx_defconfig
index 04a9fcb4342a..b6116a203a27 100644
--- a/arch/sh/configs/hp6xx_defconfig
+++ b/arch/sh/configs/hp6xx_defconfig
@@ -35,7 +35,6 @@ CONFIG_SERIAL_SH_SCI_CONSOLE=y
 CONFIG_LEGACY_PTY_COUNT=64
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_HIT=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/sh/configs/se7343_defconfig b/arch/sh/configs/se7343_defconfig
index 2d4d1f974f14..b3ce8a502787 100644
--- a/arch/sh/configs/se7343_defconfig
+++ b/arch/sh/configs/se7343_defconfig
@@ -57,7 +57,6 @@ CONFIG_I2C=y
 CONFIG_I2C_SH_MOBILE=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_SH_MOBILE_LCDC=m
 CONFIG_SOUND=y
 CONFIG_SND=y
diff --git a/arch/sh/configs/se7780_defconfig b/arch/sh/configs/se7780_defconfig
index 13fa6a59b8f1..9e96b000cb99 100644
--- a/arch/sh/configs/se7780_defconfig
+++ b/arch/sh/configs/se7780_defconfig
@@ -60,7 +60,6 @@ CONFIG_SERIAL_SH_SCI_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_THERMAL=y
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_SH_MOBILE_LCDC=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-- 
2.53.0


