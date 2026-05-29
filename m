Return-Path: <linux-sh+bounces-3939-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIodIYlQGWrzuQgAu9opvQ
	(envelope-from <linux-sh+bounces-3939-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2026 10:38:33 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D342A5FF502
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2026 10:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF6B231D8A9E
	for <lists+linux-sh@lfdr.de>; Fri, 29 May 2026 08:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728A63B38A2;
	Fri, 29 May 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TV+/R2Zq"
X-Original-To: linux-sh@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D202E3AD50B;
	Fri, 29 May 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043526; cv=none; b=KcXkrAF9OJs/h0dmNgRL+9W4bEaV91q/GEhZE4y4rlCrLDEitboI85lGRkoDrilt+Z7fNCc7AFGW6+4H1rGOsp+FazcOS1p2RHLN8ftFoYf1EWSmTnPIjHMcEOw8+tYHf929FSlHcA8JnJDStutZ+AhXDxMxXYeP/jLnIu8dF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043526; c=relaxed/simple;
	bh=6FINnAeejbCpxEsJKKtRLyzzbDAImuU1hMJl2QkGje0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yslul9YccomjmzasTYdejlDmQf56hQwLtDGD7801ShSVO3rgmtfhdmPK589gPC3htSasU+Cu37Mrq2wNbsd50CR/lIlPQzmaoHypfZ2bKUZRYrHOs2dUTX90CEMbQFn4fjHtKXAjNDb29q0h6oQOt6Lip/X6q+w4jnRaDfFAScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TV+/R2Zq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40E3C201B;
	Fri, 29 May 2026 01:31:59 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 273AF3F632;
	Fri, 29 May 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780043524; bh=6FINnAeejbCpxEsJKKtRLyzzbDAImuU1hMJl2QkGje0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TV+/R2ZqySGE36yEvr5DLTOVlwuwSWVBVD3mZtBpqf8v0rbiwgfcbKu6cuFovDtpi
	 GaHm0tH/kehwWUycIvD+JGIA723f23KKbNPAGoLtZw8LFIA0m7DdkzlVGMwTtlPKMn
	 fsVLYwoh7j6HcLdUiAn+UEYC9Fs7vc4gZXqUTNVU=
Message-ID: <3b2d27ee-28d5-43ef-9d45-038b147d04b1@arm.com>
Date: Fri, 29 May 2026 10:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] arm64: Unmap linear alias of kernel data/bss
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3939-lists,linux-sh=lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh,git];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D342A5FF502
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 19:58, Ard Biesheuvel wrote:
> Changes since v5:
> - Reorder series in ascending order of impact, so that the first few can
>   be merged earlier if desired. This also makes the patch that remaps
>   the data/bss linear alias as tagged redundant, which is therefore
>   dropped.

Definitely makes the series easier to review as well, it's all looking
pretty good now :)

- Kevin

