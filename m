Return-Path: <linux-sh+bounces-3702-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAK0EqrF5mmW0gEAu9opvQ
	(envelope-from <linux-sh+bounces-3702-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Tue, 21 Apr 2026 02:32:42 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8364351B6
	for <lists+linux-sh@lfdr.de>; Tue, 21 Apr 2026 02:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DC20301ABA7
	for <lists+linux-sh@lfdr.de>; Tue, 21 Apr 2026 00:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1BF1BD9CE;
	Tue, 21 Apr 2026 00:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwIe0y02"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC2619067C;
	Tue, 21 Apr 2026 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776731522; cv=none; b=gHAhR400jCmVitBIUFUFkV8cwRGYTDVOkncK9S2S2PZtH9n0EHe3XPPqtHR9jhLzB9+mRZHZkgRxOcdLm6K+unPjeLGCvy9bm47gASGdacLDYU2bhAPd4EtAevmdRdpLT9m4JXpQNhYmN2K/mp0T5xbvV6k1XFbY9brBM5J5uY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776731522; c=relaxed/simple;
	bh=GUKfSyxtjIRgN+w91PW1qbX4CymGFvR79K/GAe5ZTIU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pANOjisgRzhE6ew8YCnFIlZwuvXUyI+4EMOmMvYIecj4TwDJTDqPHKm+Z0hb8utoBR57hwWVSPeswXHflwNvY0l5WSXp0lDtw4iKqcfVQp+Wvtk2FX4fEGTOG7+qt5AYtigzORZ2ntPgJJd0b1hUwDGMSDXTSyMh/mSgM76Fkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwIe0y02; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A82C2BCB3;
	Tue, 21 Apr 2026 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776731522;
	bh=GUKfSyxtjIRgN+w91PW1qbX4CymGFvR79K/GAe5ZTIU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AwIe0y02+D4gusb5sB3JJGcUNxjvk5ws+ppvVFJd6CCiDCWy1lqvtKSMAHdGhYJOp
	 WUeh9W6U6mfzpelgINqISiFxGYiWVXv1/tfNyUUwAfazVo+eYo/R+BNBMP3N0UpUFd
	 rVU1WD86WP/b7RxkvthF8TlHBXxm0ternFY4tqczCXgI/ceLoin1f7Tx3skYohdrwT
	 cuq7YOQ3o++D67OEl++Rs4y85QaeNhz9Ty2An1nrIry45t30LrzjERedRLlC4oATjS
	 ecC4pTQOX3xcpQDMROa0OJY2Og12af5BqZLIGmoWLFtm+oHQgij7FVLThApmMv36xK
	 VQNyuD/U48ArQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE623930023;
	Tue, 21 Apr 2026 00:31:28 +0000 (UTC)
Subject: Re: [GIT PULL] sh updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <6fd0b00bde4213ae0006a98f517212a7803f69fc.camel@physik.fu-berlin.de>
References: <6fd0b00bde4213ae0006a98f517212a7803f69fc.camel@physik.fu-berlin.de>
X-PR-Tracked-List-Id: <linux-sh.vger.kernel.org>
X-PR-Tracked-Message-Id: <6fd0b00bde4213ae0006a98f517212a7803f69fc.camel@physik.fu-berlin.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v7.1-tag1
X-PR-Tracked-Commit-Id: 647b43f65357673a9ee4fe8a99247a7549bdb368
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce9e93383ad71da468dafb9944a539808bf91c06
Message-Id: <177673148673.2145745.10105680556707732446.pr-tracker-bot@kernel.org>
Date: Tue, 21 Apr 2026 00:31:26 +0000
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tim Bird <tim.bird@sony.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Rich Felker <dalias@libc.org>, "<ysato@users.osdn.me>" <ysato@users.osdn.me>, linux-sh <linux-sh@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3702-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-sh@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-sh];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD8364351B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Mon, 20 Apr 2026 14:57:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v7.1-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce9e93383ad71da468dafb9944a539808bf91c06

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

