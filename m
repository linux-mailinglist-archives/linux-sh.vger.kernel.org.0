Return-Path: <linux-sh+bounces-3-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D77F22E3
	for <lists+linux-sh@lfdr.de>; Tue, 21 Nov 2023 02:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907162812EB
	for <lists+linux-sh@lfdr.de>; Tue, 21 Nov 2023 01:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DFD4C75;
	Tue, 21 Nov 2023 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hfRhuW4N"
X-Original-To: linux-sh@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8034C71
	for <linux-sh@vger.kernel.org>; Tue, 21 Nov 2023 01:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA76C433C7;
	Tue, 21 Nov 2023 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528942;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=hfRhuW4NIuDZKodti5dOfdb/EP0YBaIVIMjwISByJavzgRoMCGV/mz3V5VGDe5IuY
	 IPDWlVATAS4PZLUuOP1T/wV35jqfETPLkpwxpjv+fVUYJD5q8OzNfbSqHY+1Hg8BqK
	 BrS2aibVyA9mRP5yasPAcFZtDQFUbtaCjvvzgOvg=
Date: Mon, 20 Nov 2023 20:09:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-sh@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-dangerous-vegan-tody-bbfb2a@nitro>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

