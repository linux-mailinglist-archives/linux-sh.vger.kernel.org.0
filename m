Return-Path: <linux-sh+bounces-1009-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E159A8C5B3A
	for <lists+linux-sh@lfdr.de>; Tue, 14 May 2024 20:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07752837FA
	for <lists+linux-sh@lfdr.de>; Tue, 14 May 2024 18:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD4617F39F;
	Tue, 14 May 2024 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3qcXb3t"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82053E15
	for <linux-sh@vger.kernel.org>; Tue, 14 May 2024 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715712112; cv=none; b=A+R8VeqGHRWnWK3snF6iLkt5/viHukEjleL8m6e2duuJzrk/V1aYrKy5i8bt58VzEdqXbCbmYCU3LzJwwjNoD0jAXD8zScLiQH9KCVZ9AVkCN/sY9JFg6D2wzKrmg65i7jmUgaJd1t6RGneUAdSUlCxAIink7vurY9zII3wzROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715712112; c=relaxed/simple;
	bh=mXF+cifl3numsAwZ1J5yBOk9m00YF7cMuvAepcG9aFc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JKoR9NHB2QonAYdl2b0FAsEVHmXeFUwWRzGmzDZfyAIpGonsSZQrIJGrPDPVFwhhYCm+mIs3K8YDXdxb3aCzivta79Gq1sF8zdADzjIN2VCaUntARQ7epDx9Re/NwQNO/ZywjNsE0KyPYWqK5ufqf3oOeXvSUFCiRO4Cy17YKa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3qcXb3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A39AC2BD10;
	Tue, 14 May 2024 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715712112;
	bh=mXF+cifl3numsAwZ1J5yBOk9m00YF7cMuvAepcG9aFc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n3qcXb3tb3wdYrh2fbUsQdV0mkx9GOD83YXKxDhUZlrGFKF6S0Ovy62g/DmtPbmQF
	 6Njd1ZpGDbtwIbw4w98OZVF6OodyBmX9pacHSRJyAWxaJ7/UhlvCMqF/qv26kxZXFC
	 UekBDQE9Q9KBPwCK14LhWK8FGSV4M0Le2r3DixnpqzjB44ADL5dFpkJ5iX6G5/sp4M
	 3UPVXGlaocaNfw8wlXA1DUEq31HGba2fnFXzDWobBLkcKFNYLIQQLPZ2th2T6p3Xkm
	 SkDB+QPTtGEurLstyQzFJ6/4mAfLpodS43ppPQlzf/hC24oU3XRgrp8ks9HWCnwDjd
	 BTbPpZyQ2Dn+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4355DC43339;
	Tue, 14 May 2024 18:41:52 +0000 (UTC)
Subject: Re: [GIT PULL] sh updates for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <80eaf34723abe96744f0a9b2859679cc88783433.camel@physik.fu-berlin.de>
References: <80eaf34723abe96744f0a9b2859679cc88783433.camel@physik.fu-berlin.de>
X-PR-Tracked-List-Id: <linux-sh.vger.kernel.org>
X-PR-Tracked-Message-Id: <80eaf34723abe96744f0a9b2859679cc88783433.camel@physik.fu-berlin.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v6.10-tag1
X-PR-Tracked-Commit-Id: efe976b7eecfa3f81e241da67d1a511e30a87779
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c59cebe8ff779df029d19e5525d4557fd70a769b
Message-Id: <171571211224.4202.18138972939250794765.pr-tracker-bot@kernel.org>
Date: Tue, 14 May 2024 18:41:52 +0000
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Artur Rojek <contact@artur-rojek.eu>, Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh <linux-sh@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 May 2024 00:31:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git tags/sh-for-v6.10-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c59cebe8ff779df029d19e5525d4557fd70a769b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

