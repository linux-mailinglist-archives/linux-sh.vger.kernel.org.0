Return-Path: <linux-sh+bounces-3627-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vWt6EBIc0mkDTgcAu9opvQ
	(envelope-from <linux-sh+bounces-3627-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Sun, 05 Apr 2026 10:23:46 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B605F39DD6B
	for <lists+linux-sh@lfdr.de>; Sun, 05 Apr 2026 10:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93EC23009992
	for <lists+linux-sh@lfdr.de>; Sun,  5 Apr 2026 08:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B1936B05E;
	Sun,  5 Apr 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9N7/zuw"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C019995E
	for <linux-sh@vger.kernel.org>; Sun,  5 Apr 2026 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775377419; cv=none; b=O+pKRQASE0LNpWC/a9tgprCUvKto5p0tdWOEYH6uX8P6eaWhJ7LIXmakWxRGK8fST28wIRegGQVtC09Nwr87VMRnvhX/0EJX55UKBOJRfm5nyjC7c+cKEArwpreBVYiICflzGjxx1+6Aro8qUJ891ko2moltGkDR3PA13TVYjh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775377419; c=relaxed/simple;
	bh=nXBjZxNx6v+haxpqtgK9dTYC9jljC5QXCpRVk0Qc8tU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsEa7lRTvRb5O9rVi6NQc64qamGdB4fpwsYiCrQD6VOcj7/UOyjlUMXMHRAfWmCAUft+iZiqhhXvi3o53qBR6synw7jCiLb2VugwXNnNyLLfZPB/egfVVyg6bHqeRyr+aPTgx6/1ytrfMAWBsxzTc8wkfEFd2rmjsAEvFUF/NpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9N7/zuw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso43885875e9.1
        for <linux-sh@vger.kernel.org>; Sun, 05 Apr 2026 01:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775377416; x=1775982216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EeApORW9P5wsQN32+c+u+c+Fc4o6NHbe1Tb7fJ/q/g=;
        b=J9N7/zuwINLYe505xQXBsS8Pxto2b9DnbELq3QoBiPvBEVMUiCSauVaS8+tyl+oFej
         ZY7DaOV1V8lFtXpkIA2cx3pw3Es0b99HtrZOjXP5+Xr3zMMbKyDkCSUhmpKAQSAFOWdM
         G5kIccjX2IedjmuIIbVy0h2ZCCSIyPnNiOSiXtR0SziyLHDUn29ufthYPfu7GmukdfjG
         IDKL1Q17RlJdJW0i9EH1HnJH3kUTvis0XPIpj1FtKycpSgDXir5VpUtU+4T5FGqyK0No
         1fG8kKGYKHvk3P2mXGjCOvOugXwQh/XXVkwaCg0GF8PIUPMmT+4lNfINsWFCNTv6/53p
         Rk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775377416; x=1775982216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EeApORW9P5wsQN32+c+u+c+Fc4o6NHbe1Tb7fJ/q/g=;
        b=EGCu4Hkb/eVD7KwqZD7rPQXcKvFyB6zXsH3dc0TxTI8yEE27WflGMg3qUHmFyeDxwZ
         TDx6xD8uxBlBAXWFTR0eYM3tOzACPY//N4H5eZkersLUe4oSD0D279EAq/4HJtu0oDfN
         u6s6OkYU8ltOTCZwnvyRZd0fiT5jDRY0I1cELWoyj5wPi64KUsiVv9CQtsK1rNqZo8IM
         i9HBzCqgxnuR5N5RUVO3ZF6tTB5EDowhDM4oxJ3t6LS/eX0/hcOT9mX2APOgf1ZSc5Ez
         2rJFURzzr/tDBEnZLFbAcTFXGCFB/tKY89E5DwJ5ACI9JMEj6CCpFWiKF9z7/N8JUKfe
         BaLQ==
X-Gm-Message-State: AOJu0YzB3TNdDfJV5ILD5+iGZNl6xNiMNkCxy7jxB3T/ZaNRM8l7pchU
	cfpzqNp42cjUI8HdN5gXKtmFuPmIFvYB0io5l6W44JK6dLLDWb4ItRMUwsRK0uw=
X-Gm-Gg: AeBDiesafmnuH1XsOjDuPEtu/nsc7zNgq8cYqnAdSlI9FlQp8cGe5fnCXeLhILtkf1J
	35xIYYOqlBBFrKBl6rmhqlBIv4tR2dhd6Ut1yG0EvNaRFB7CHLT55dpYytV2PKQE6qmQ4x5sI2S
	HtDcVoDx5y3MJcKy3X8yWF13EAonTC98X76r9ePqKT6cUzfVWp8IJbD74XjEmcA3mJwLfRbWKaC
	W2U/+7jsXT6wD5oW31t2D5wGEbkHVVGo3VWBykh05dnaHkfUN0/AR9p5fe/2kMwNro60hRcgpKo
	WvbNHXW5wyljLEjY5gRukjKJ5TsomiI6fb2+ZjW0kT6nqfCn0BTnd9RH47H17vYROrufBnYL4cb
	9Muh9yDnPhtbjStuMoUy9rCjLL+S51WURfnlsjgY31KUqYXE/cah9vi9yxq2ISVdFfzSd10VQyI
	0BNpH/OF0mVf7rh1C2mnpKmB/HzdFC/srR7MKEKoiWfOOg3fI5f71GlmRZX4XqS3xBWjUWoQmbC
	h5PgBpW
X-Received: by 2002:a05:600c:4188:b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-488a2aca466mr35331975e9.12.1775377415719;
        Sun, 05 Apr 2026 01:23:35 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:4382:4d9a:caac:a8d9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48899d3a4e9sm119425445e9.6.2026.04.05.01.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 01:23:35 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: linux-sh@vger.kernel.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Artur Rojek <contact@artur-rojek.eu>
Cc: Adrian McMenamin <adrianmcmenamin@gmail.com>,
	linux-kernel@vger.kernel.org,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH 0/2] cdrom: gdrom: fix block I/O and capacity setting
Date: Sun,  5 Apr 2026 10:23:28 +0200
Message-ID: <20260405082330.4104672-1-fuchsfl@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3627-lists,linux-sh=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuchsfl@gmail.com,linux-sh@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-sh];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B605F39DD6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series fixes a gdrom driver Oops due to bad MMIO register access and
fixes the missing updates of the block layer gendisk capacity that
prevented ISO9660 mounts from working.

The change was tested on real Sega Dreamcast devices (PAL-E, NTSC-J)
with physical CD-R discs and with GDEMU emulated discs. Before: Oops on
mount and an unusable drive. After: Successfully able to mount and use
the inserted medium.

Thanks,
Florian

Florian Fuchs (2):
  cdrom: gdrom: replace port I/O with MMIO accessors
  cdrom: gdrom: update gendisk capacity on open

 drivers/cdrom/gdrom.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


