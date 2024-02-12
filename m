Return-Path: <linux-sh+bounces-382-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D6851CAA
	for <lists+linux-sh@lfdr.de>; Mon, 12 Feb 2024 19:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 706E8B24120
	for <lists+linux-sh@lfdr.de>; Mon, 12 Feb 2024 18:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4453FE5B;
	Mon, 12 Feb 2024 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EddX1/Gg"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C088B3FE3E
	for <linux-sh@vger.kernel.org>; Mon, 12 Feb 2024 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707762367; cv=none; b=s9CtWjrDhvp15L/VtcinnU6P6r8CYZxx3mbo1up+Ui4BpxnlvmpZBoA9EW8/e4symV8KXBiIwnNhemKDoBrpNJ/dbQ0V8oqAeOmu5U6o0vp/nLqWaguHZric1NWxFjZBMrR/J/5WhXavmb+/4f1doH9IqY03uhDpzkh1LhFTwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707762367; c=relaxed/simple;
	bh=yAUHypRlpeoME/JqFNQ6+yrqIWhow/SYsyub6kJOuL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig1ccow7FI+pPUj6wdJLuqN0HrIUFUfajQxM8hYlBtaUrTlrnJh1m04MlWNDi7yKpxMCP1ZtPVLYpTqwXJzvr8AcOq+quVrPiQo8el43WRRMGZkpjC8q8dcv2WlPqOge9jCM0J05Z3Cu/BYvuJGCn4esw+aNczLy3a5Gn53XjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EddX1/Gg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e09493eb8eso2036619b3a.1
        for <linux-sh@vger.kernel.org>; Mon, 12 Feb 2024 10:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707762365; x=1708367165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kelddDkBCW+g7SFvND6ka4Ang08zpm8PxHIejMLmNTs=;
        b=EddX1/GgAbEeDtEik8j732OAX1GG6mqLZtclhFqcdrWHYPFo8uRuaTgLmC6EN8s1Xm
         yjaS0Qr0GnJvXBOvtBsaWomiMvHmKolRP6NZJQdMi12UfCRcUYQ8yQvpJd7zAYf6nKC0
         8ZlTTuEq3m8rJaWpUwYs6m352PJQjeMUZKanM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707762365; x=1708367165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kelddDkBCW+g7SFvND6ka4Ang08zpm8PxHIejMLmNTs=;
        b=u3RHF6qlJ3F3ZHVZJ2WB47M7+V0+FGWkJ9Qbxp0mgibN3ygxjIDAnQ6bNV2fVLohiq
         atggFIjG49ApcxaF1NyP1rLSeiCNGaHZMGMRE8Srlc7FL5/cL4mVvq3X/8kphvMW/KdJ
         q6Kge5OgB6epNync04k6I7VhIdlkJtY4fV5NOd3HH+Y7pf29BknfSl0dcuezONupYUi7
         ekc1sZ157c58KfNsxWnR6uSv6V/oJjggOE1J8W4L+VMTIWsjvKN/+GFULn/v6JBPzzWL
         ZslEiRDO6FQnDkIgI0gMZTOiHwjCYPVdHnob16L+PRw2I+7KHSrnLOYoN49cY23kTUpZ
         VnYw==
X-Forwarded-Encrypted: i=1; AJvYcCXGdiIJfxSDxSsD9IlWOl8K0heelGuwtusOXpPgKxJ+UTH3a6RD7vZ8zlCrF+16ZCFTgHLmW4ARvDCCWWos+TWrqqpA47aWEVw=
X-Gm-Message-State: AOJu0YxWSvWOUVGdmXzysmcNlZZP1bKmgWkLZs31LGoBopNr61kUcVFH
	7xb1TyYk+YcEuCa86zzwCgNnmVrYRzh9B1ChN+wmqDWVKLKitNiVcAIjxJO0sg==
X-Google-Smtp-Source: AGHT+IHm5PSmStcCD2PbOKmO9HvYx5jctVUpwg+mA5CidbOqS112sDrGysxA8yytheZf5F/8il7XBA==
X-Received: by 2002:a05:6a21:1788:b0:19d:e644:7c9 with SMTP id nx8-20020a056a21178800b0019de64407c9mr294312pzb.22.1707762364941;
        Mon, 12 Feb 2024 10:26:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtL7E/Ga3300LiXSPhQpKnlGv08BNISJBi/jBmB7YmHJiNT6YrIQwiAH9I8vBkaTBnDjziwBfcfr/PRvJMQEI8SyNDGq1QbgjzYxA4X2r9uBkF/UY/uZQ3V5lh4HO3EpicV3EyoRKeTXLxIIbov/L8ZEWORYZO7ID1Et7cPita3g01WnaoCTcRtV6KzD1U8GLFhX2Ha8muf8PRlXkVwUWaCzIxmISUdN05pQZSnlU2BQJq7yf2C0SNBCfe+oknwnOhWh64uJgcdqSJ36FShA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u189-20020a6385c6000000b005d8c1ce4443sm743664pgd.88.2024.02.12.10.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 10:26:04 -0800 (PST)
Date: Mon, 12 Feb 2024 10:26:03 -0800
From: Kees Cook <keescook@chromium.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	kernel test robot <lkp@intel.com>, Rich Felker <dalias@libc.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] sh: Fix build with CONFIG_UBSAN=y
Message-ID: <202402121025.B0B6E47@keescook>
References: <20240130232717.work.088-kees@kernel.org>
 <494586ed5a0871cf7cfd005f513577952306a0bc.camel@physik.fu-berlin.de>
 <fe057f57aba0f8a9040d4700d27f5bd478032925.camel@physik.fu-berlin.de>
 <202402020228.BBEF7DAC@keescook>
 <9fda57fc1b1ba6ad9bd6f7df3fb12674d0f4f940.camel@physik.fu-berlin.de>
 <cd1a36a234c8fc61c5febe646ae0f05ed20ae32a.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd1a36a234c8fc61c5febe646ae0f05ed20ae32a.camel@physik.fu-berlin.de>

On Sun, Feb 11, 2024 at 11:39:49AM +0100, John Paul Adrian Glaubitz wrote:
> Hi Kees,
> 
> On Fri, 2024-02-02 at 12:06 +0100, John Paul Adrian Glaubitz wrote:
> > > When I use GCC 13.2 (I'm specifically on Ubuntu 23.10) and the randconfig
> > > linked from the report:
> > > https://download.01.org/0day-ci/archive/20240131/202401310416.s8HLiLnC-lkp@intel.com/config
> > > (which is notably enabling CONFIG_UBSAN=y and CONFIG_UBSAN_SHIFT=y) then I
> > > see at the final link stage:
> > > 
> > > /usr/bin/sh4-linux-gnu-ld: arch/sh/boot/compressed/misc.o: in function `zlib_inflate_table':
> > > misc.c:(.text+0x650): undefined reference to `__ubsan_handle_shift_out_of_bounds'
> > > ...
> > > 
> > > After the patch, it's solved.
> > 
> > OK, let me test with gcc 13.x. My build host is currently running openSUSE Leap 15.5.
> 
> I just wanted to try reproduce the problem again with the reproducer in [1] as well
> as with gcc-13.2.0, but your branch devel/overflow/ubsan-only no longer exists.
> 
> Can you tell me where to find the patches now?

Sure, they're in -next, but for an -rc2 based tree, see:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/kspp

-- 
Kees Cook

