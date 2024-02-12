Return-Path: <linux-sh+bounces-379-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4C850F7C
	for <lists+linux-sh@lfdr.de>; Mon, 12 Feb 2024 10:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF722283E04
	for <lists+linux-sh@lfdr.de>; Mon, 12 Feb 2024 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB4E107B4;
	Mon, 12 Feb 2024 09:15:03 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A70111B2
	for <linux-sh@vger.kernel.org>; Mon, 12 Feb 2024 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729303; cv=none; b=FWrGgwydkum2BBt6F75zbbwfRTdq1v1b9IE1lOibTUhF6aP6ok61Vkkp6vwYvQzEuCu0osl/VWQPCH4BKa5p3WeSA3X+R5Ejy6i+luSanH7l8w3NlaA7ApVnWcgXrKqr9eCwVMtMszWJr4OK194nZbNJvZ37hukBUQim255dpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729303; c=relaxed/simple;
	bh=zGWJ7CeHBxVjZ9B3qCNOzyG/P8oC5JwCQJM1TQDuFiY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=htVSHqA9BTFXBQcD2ZuUMQ2HPKsyjAJkYD3k/ABiC0UK2WnfRxpPiaCjFshyK6qHWyD4k0tuJVflZKkGHHeIiDCT0fa+4/FZ4mKR12UvfRnqYPxmavirazlzncFIhFbjh3MK+/okcyKIBP56V1SRxLZw2dm4DUu8bcwjmU69qQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TYJgy2PBMz4wxyM
	for <linux-sh@vger.kernel.org>; Mon, 12 Feb 2024 10:14:54 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:47b8:b872:d87c:512])
	by laurent.telenet-ops.be with bizsmtp
	id m9En2B0011wMtyi019EnmE; Mon, 12 Feb 2024 10:14:47 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZSOk-000VTv-Ud;
	Mon, 12 Feb 2024 10:14:46 +0100
Date: Mon, 12 Feb 2024 10:14:46 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Furong Xu <0x1207@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
    netdev@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-sh@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.8-rc4
In-Reply-To: <20240212090741.3249554-1-geert@linux-m68k.org>
Message-ID: <8bc564c7-a9e8-e491-6cf2-808875c2d334@linux-m68k.org>
References: <CAHk-=wg1c4Q1Ve6BG71DikHu-AEoKUUQoj1QbVdjwGQyTExqCw@mail.gmail.com> <20240212090741.3249554-1-geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 12 Feb 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.8-rc4[1] to v6.8-rc3[3], the summaries are:
>  - build errors: +5/-18

   + /kisskb/src/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c: error: initializer element is not constant:  => 850:21, 845:20, 867:21, 838:20, 858:20, 849:21, 836:20, 856:20, 861:20, 863:21, 840:20, 864:21, 848:21, 855:20, 859:20, 839:20, 862:21, 846:21, 852:20, 865:21, 847:21, 854:20, 853:20, 851:21, 866:21, 844:20, 842:20, 837:20, 857:20, 860:20, 841:20, 843:20

arm64-gcc5/arm64-allmodconfig
mipsel-gcc5/mips-defconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/{ppc32,ppc64_book3e,ppc64le}_allmodconfig
sparc64-gcc5/sparc-allmodconfig

I.e. gcc5.

   + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_cleanup' [-Werror=missing-prototypes]:  => 594:6
   + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_init' [-Werror=missing-prototypes]:  => 566:5

sparc64-gcc12/sparc64-allmodconfig

   + {standard input}: Error: invalid operands for opcode: 935 => 940, 606
   + {standard input}: Error: missing operand: 935 => 940, 606

SH ICE crickets

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/841c35169323cd833294798e58b9bf63fa4fa1de/ (238 out of 239 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478/ (238 out of 239 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

