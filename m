Return-Path: <linux-sh+bounces-3669-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pj7CJh04GmBhAAAu9opvQ
	(envelope-from <linux-sh+bounces-3669-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Thu, 16 Apr 2026 07:33:12 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC53440A660
	for <lists+linux-sh@lfdr.de>; Thu, 16 Apr 2026 07:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0755E302A539
	for <lists+linux-sh@lfdr.de>; Thu, 16 Apr 2026 05:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F41937881B;
	Thu, 16 Apr 2026 05:33:08 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B51361DAB;
	Thu, 16 Apr 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317588; cv=none; b=QOdnNk+Bs3nVpYj2R5OQNrrncaqjhY8saTBkPPECcBw1pff/JVns0ebzCi+l/Wio5tWXl/quuc+zeRp1KzlFxBGWcEkw+y7ur+Y+nI4Oox+CBpb1S9jk2W5hcV25AueXfbfcNFhnIFfs1KUC+8nw+fnHWLWiMpB9da82K094b74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317588; c=relaxed/simple;
	bh=Zj053W2L6VYyb24EkKRhlQyzYxJS34mO9Zw3VVawDiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1SA704CjjJ6B7wMqT3TNp3USsuvWpFs+qLjFHHDjCZw7ueaMxS+RVqLW8Ti59H2KLYSrXgzBzwXgXnyVAhcO5L+yjytkcWrmXo9FozqjlqPinnK4cuHEwg5Al854cu2rnvHmyNO1fqEb115cyHewIXOzREr4bD6ryrJ8SiazpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C21E76732A; Thu, 16 Apr 2026 07:33:03 +0200 (CEST)
Date: Thu, 16 Apr 2026 07:33:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Jeff Layton <jlayton@kernel.org>, lsf-pc@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-m68k <linux-m68k@vger.kernel.org>,
	linux-sh <linux-sh@vger.kernel.org>
Subject: Re: [LSF/MM/BPF TOPIC] Should we make inode->i_ino a u64?
Message-ID: <20260416053303.GA15238@lst.de>
References: <08f8444c7237566ffb4ba8c9eb0ab4b4a5f14440.camel@kernel.org> <1b340c4e635dcab3bed8c52d6381b4c341c0741a.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b340c4e635dcab3bed8c52d6381b4c341c0741a.camel@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spamd-Result: default: False [-0.36 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-3669-lists,linux-sh=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-sh];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-sh@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC53440A660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:11:32AM +0200, John Paul Adrian Glaubitz wrote:
> So, this went just over Phoronix [1] and as someone who is still invested
> in 32-bit architectures, I'm only notified about the performance impact on
> these systems now as the pull request has already been sent to Linus.

What performance impact do you see?  When using modern file systems
reducing the memory usage should eventually improve performance, although
this change will require additional file system changes to get there.
btrfs already has a series out, and I'm working on the XFS conversion
to remove the duplicate 64-bit inode information.

Either way 7.0 will reduce the inode size already, as the shrinking
mutex/rw_semaphore (and for the XFS inode semaphore) cuts a lot of space,
which even on 32-bit by far overshadows the increased size of i_ino.

I'm also not sure what personal notification you expect?  This has been
discussion in-and-out on linux-fsdevel.

