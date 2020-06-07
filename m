Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5321F0958
	for <lists+linux-sh@lfdr.de>; Sun,  7 Jun 2020 04:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgFGCaQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 6 Jun 2020 22:30:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:50940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728887AbgFGCaP (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Sat, 6 Jun 2020 22:30:15 -0400
Subject: Re: [GIT PULL] arch/sh updates for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591497015;
        bh=G6BymnbdBsD/JJs8b0wJ6785JOEGHc0OlTzh/snpPlo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=pi0JGz7tXMEGXsx1a93cmPtodSb1H5dhfny0eSU59uHhS5nslG++X1KI3/6WzM9kl
         oildrnbC56738CmtzYLQtbBH1qsiG8Mnj6DESlanTQMUjWjb4cUwhyNijLfC9OutFR
         w9GMWbgmdwb1lWGSqk5WzggQfbm/J91M2L/+454U=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200606165610.GA28637@brightrain.aerifal.cx>
References: <20200606165610.GA28637@brightrain.aerifal.cx>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200606165610.GA28637@brightrain.aerifal.cx>
X-PR-Tracked-Remote: git://git.libc.org/linux-sh tags/sh-for-5.8
X-PR-Tracked-Commit-Id: 37744feebc086908fd89760650f458ab19071750
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b69e8b4571125bec1f77f886174fe6cab6b9d75
Message-Id: <159149701541.1383.17799463700548438864.pr-tracker-bot@kernel.org>
Date:   Sun, 07 Jun 2020 02:30:15 +0000
To:     Rich Felker <dalias@libc.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The pull request you sent on Sat, 6 Jun 2020 12:56:22 -0400:

> git://git.libc.org/linux-sh tags/sh-for-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b69e8b4571125bec1f77f886174fe6cab6b9d75

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
