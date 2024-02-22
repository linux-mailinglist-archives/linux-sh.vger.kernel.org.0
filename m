Return-Path: <linux-sh+bounces-418-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449C85F1BD
	for <lists+linux-sh@lfdr.de>; Thu, 22 Feb 2024 08:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E3E2829A6
	for <lists+linux-sh@lfdr.de>; Thu, 22 Feb 2024 07:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E63517743;
	Thu, 22 Feb 2024 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EOGZLfG0"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD5168BD
	for <linux-sh@vger.kernel.org>; Thu, 22 Feb 2024 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708585637; cv=none; b=jFKmkEbCOQhOEnG+oQrM2X0Y5uV0MdjZcSgsXQTC9cPKiO2p8HQe1oVhlFGwzTwQ6T0KPCDNoQGiHjSk4M1Ie2Y/2W1sjhONS/16igWpCAOkhBbIlZVSb6AOaDuRgWajxsP0mvj4eHiVpg1rEOi8ko55ro8oyfv6pbbtcbQmcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708585637; c=relaxed/simple;
	bh=XPKVLBy6UQC9Sn82UWX+PNOQ0fEBJPFiiwTcFZ/REG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhjwUd7fRuRsjZsjNVrbP4+b1JIev0CgjtaeoAqNHiA+roP+v48sXqULH2WQ+31qHyd5fjniCK81vNIn23i/aI20VTm2zJX0Fqzt/2mOh/NVZNL1J7mTF80nPAUJMYVxmIo8EQRmdK5uhpdeU5ZajiTBqdhpVTGDSeKCtCyXHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EOGZLfG0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708585633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j88KzvyAQZThT6aCL8ZS+o2FWYKBFq83FjUT4vcsoNg=;
	b=EOGZLfG0fkQ7pxJbnch/iPovlGvDc+PAzkMzwOk+JvZ0tC9V5h5AoAU0YO7VGwzFIZam0b
	fBnvYMdHwG6rdv9egNjNxZwWrqthfKJgAKKZao1llIjaGoUCEMwGXe1ltJWhYk591LTa32
	zEhSYXxB1cmN2WyUJqIPohrzoJNkX5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-MaV-uow3NFqRm-_MOPABCw-1; Thu, 22 Feb 2024 02:07:12 -0500
X-MC-Unique: MaV-uow3NFqRm-_MOPABCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B19A185A787;
	Thu, 22 Feb 2024 07:07:11 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B5A492BC8;
	Thu, 22 Feb 2024 07:07:08 +0000 (UTC)
Date: Thu, 22 Feb 2024 15:07:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linux-s390@vger.kernel.org,
	piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, ebiederm@xmission.com,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
Message-ID: <Zdbymex3ABImSwI3@MiWiFi-R3L-srv>
References: <20240119145241.769622-1-bhe@redhat.com>
 <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
 <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
 <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
 <20240221125752.36fbfe9c307496313198b60f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221125752.36fbfe9c307496313198b60f@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On 02/21/24 at 12:57pm, Andrew Morton wrote:
> On Wed, 21 Feb 2024 11:15:00 +0530 Hari Bathini <hbathini@linux.ibm.com> wrote:
> 
> > On 04/02/24 8:56 am, Baoquan He wrote:
> > >>> Hope Hari and Pingfan can help have a look, see if
> > >>> it's doable. Now, I make it either have both kexec and crash enabled, or
> > >>> disable both of them altogether.
> > >>
> > >> Sure. I will take a closer look...
> > > Thanks a lot. Please feel free to post patches to make that, or I can do
> > > it with your support or suggestion.
> > 
> > Tested your changes and on top of these changes, came up with the below
> > changes to get it working for powerpc:
> > 
> >  
> > https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/
> 
> So can we take it that you're OK with Baoquan's series as-is?
> 
> Baoquan, do you believe the patches in mm-unstable are ready for moving
> into mm-stable in preparation for an upstream merge?

Yeah, I think they are ready to go for merging.

For Hari's patchset, the main part was planned before. And I am not
familiar with fadump in powerpc, the Kconfig fix from Hari is a good
guarantee with the expertise. Surely, I will await Hari's comment on
that.


