Return-Path: <linux-sh+bounces-3822-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FweL2N/92lsiQIAu9opvQ
	(envelope-from <linux-sh+bounces-3822-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Sun, 03 May 2026 19:01:23 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC54B6B71
	for <lists+linux-sh@lfdr.de>; Sun, 03 May 2026 19:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A043300D84B
	for <lists+linux-sh@lfdr.de>; Sun,  3 May 2026 17:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E057A37DEB3;
	Sun,  3 May 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ryf8h9MA"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E541E1024;
	Sun,  3 May 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827626; cv=none; b=Q8MycOtMa57+jxmeUghhN7xto+CwfjbiAIQEcIhuPUGuhfLTw6toL0bp+uvPH5goVHMCcz1gVdOH9uE5xnrnpZ8QLdBSgKuZ6vMn6nZ6LrE+eXfkvVtCM5rlYKG1OLX01mD1X5k6W5Xqp0SqJJG+552LwVe3rLMbDSLcUC0fk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827626; c=relaxed/simple;
	bh=C9H/xzG2QHqVjvvkJpOYE+v1OpxT4bukAI1pdvP8hO8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WOL8PhdP+Mje8CQ4ArC88S30ZhqWETSo1aBr34v3UpVyJ/X1n5x5fOMOFvwWB/RK6w4O8xvjOUn8AMTG5bsgorJqo2TbLkGo1zcXx6jSTxIBHNEPux8puqYM0OxbyZoEFrF/V6eHHFgiBwipGf4Z/X5ELvtt+htHLbvNt/EjDdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ryf8h9MA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C696C2BCB4;
	Sun,  3 May 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777827625;
	bh=C9H/xzG2QHqVjvvkJpOYE+v1OpxT4bukAI1pdvP8hO8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ryf8h9MAzq76qmNNFhi6mDpYCiaXlXDIrMhsya2OC7ZjA7x8i3G++NinnCU9jD+um
	 jrceWbPOl45Lw9hJ3J96qObNpWQSAeKTJ2Un6v01ZLays4kMidLuRVIeUSiKK9K4NF
	 vGW257OKgaFzLKSXAW0kUVu+21yBb/RBy8VFaWU/6iUYjwPFEZzQPO/T3NcgAMgR24
	 o/NwHvlhkTUCwymvk7OqW1dDb5MQ3Z5pbVbn5hjVL5/TIW2OFUbK17W6UzXEVKrqdu
	 VATtAkHYdM1N+3tjBxitbSSrfdIDyVlZLCfZq0nAJznB/64ekwxM/IoezPRxlGWffi
	 3p0Ufbb+zCzkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 40079392FFCA;
	Sun,  3 May 2026 16:59:38 +0000 (UTC)
Subject: Re: [GIT PULL] sh fixes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <052fc1373d143466c745b01b4803cae950cca6af.camel@physik.fu-berlin.de>
References: <052fc1373d143466c745b01b4803cae950cca6af.camel@physik.fu-berlin.de>
X-PR-Tracked-List-Id: <linux-sh.vger.kernel.org>
X-PR-Tracked-Message-Id: <052fc1373d143466c745b01b4803cae950cca6af.camel@physik.fu-berlin.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v7.1-tag2
X-PR-Tracked-Commit-Id: b0aa5e4b087b686575f1b31ce54048b4d059b7b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f377d0025eb00c0590466f5be9f50decf9b9180e
Message-Id: <177782757694.4174759.1535307208942829663.pr-tracker-bot@kernel.org>
Date: Sun, 03 May 2026 16:59:36 +0000
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh <linux-sh@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 19AC54B6B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3822-lists,linux-sh=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-sh@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The pull request you sent on Sun, 03 May 2026 17:02:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v7.1-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f377d0025eb00c0590466f5be9f50decf9b9180e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

