Return-Path: <linux-sh+bounces-306-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0283FBF7
	for <lists+linux-sh@lfdr.de>; Mon, 29 Jan 2024 02:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCDD1F22A68
	for <lists+linux-sh@lfdr.de>; Mon, 29 Jan 2024 01:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A49EAFA;
	Mon, 29 Jan 2024 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HldyJnld"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213BDDC7
	for <linux-sh@vger.kernel.org>; Mon, 29 Jan 2024 01:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706493486; cv=none; b=Jfg6L9YQyiOPeZZPot+41zIvUeNW4EvTL2EaG+4no8D9xIejR2Cq8Cj0rQCa1jLb0pjyXTNZC4ID7UGPBXBjLVFNO1uNq/IrSiKtWWlh7q7yqlgDsMxjcZJGpekug+DVr31HR/76j3B9sQ2whpSr9AEHV7Z9fo9ChzdphJvIwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706493486; c=relaxed/simple;
	bh=0mhzEdT5ZWQobZjqIOBxffQqKPXOl3ltg0R2BB5HqAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L80/H/eG8iCfee1fUQ4yXCDwfsHPe1INYkVPpZYdxejbZAacSR/axqd8cl1sV5MFu/WIDWvNHolTEo4ybqu4bmcHnDvzKX0yorzf/L/9xY5TmP1kTTucce/GH8J3+mjAq3CvD967RczydkPGvzmCGj3m+jXh4jGtIZ/RWp/POZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HldyJnld; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706493482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5X+7+XPWD/yMamo09E+vqa8mLL0GiWmMXKBvuKtVnc=;
	b=HldyJnldYktsGJXzXsYhHlfh+jKE7A/OqYtPNfMAp4HyrdlrMtBnR0u/n8Cj3j2xj0W/Ar
	ZjLtKTOTVIQ6MFP5yMRxtznFQVS0pRPXIrZIGaOSL8sv5xPdIUtAGN/VpT3RmlzRsU4lHM
	NlHxmYUiWgnz1jYdFxGVhQIXx/Jnldw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-9WvTuAhnPa6eorfNUQwX4g-1; Sun,
 28 Jan 2024 20:57:58 -0500
X-MC-Unique: 9WvTuAhnPa6eorfNUQwX4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 255BC1C05AF0;
	Mon, 29 Jan 2024 01:57:57 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085BB492BE2;
	Mon, 29 Jan 2024 01:57:55 +0000 (UTC)
Date: Mon, 29 Jan 2024 09:57:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, akpm@linux-foundation.org,
	ebiederm@xmission.com, hbathini@linux.ibm.com, piliu@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH linux-next v3 01/14] kexec: split crashkernel reservation
 code out from crash_core.c
Message-ID: <ZbcGHoLZfqro7i8g@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-2-bhe@redhat.com>
 <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

On 01/28/24 at 02:28am, Klara Modin wrote:
> Hi,
> 
> On 2024-01-24 06:12, Baoquan He wrote:
> > And also add config item CRASH_RESERVE to control its enabling of the
> > codes. And update config items which has relationship with crashkernel
> > reservation.
> > 
> > And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
> > when those scopes are only crashkernel reservation related.
> 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 502986237cb6..a9243e0948a3 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
> >   	def_bool y
> >   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > -	def_bool CRASH_CORE
> > +	def_bool CRASH_RESEERVE
> >   config PHYSICAL_START
> >   	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
> 
> CRASH_RESEERVE is probably a typo and should be CRASH_RESERVE (with the
> former ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION isn't defined in my .config
> and `crashkernel=...` parameter has no effect).

You are right, thanks a lot. Will fix that.


