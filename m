Return-Path: <linux-sh+bounces-3044-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C59B8BE9E
	for <lists+linux-sh@lfdr.de>; Sat, 20 Sep 2025 05:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0631BC2E3E
	for <lists+linux-sh@lfdr.de>; Sat, 20 Sep 2025 03:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834C122B594;
	Sat, 20 Sep 2025 03:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFPKZ+Oq"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84612222580
	for <linux-sh@vger.kernel.org>; Sat, 20 Sep 2025 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758340539; cv=none; b=gqQQkq2d9ck87dGAl/d9MwjDLGSSAJuAJ3RUgInQENx5l8kdyfSN2kLdoUZ2YHsSqAdJ9D7ITOHAxh0j0k3cO4I7LnEloUBthonxwXuDSuQF65s8A7K5ERhIDraUCXB6lPzCEu/OUWsPQYzM+NF5g//XJTE7WOxbWTy1TAL1PeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758340539; c=relaxed/simple;
	bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sps9oXZXlnblEITZmO5YKYd25Z4wGhRazs+J2a0MNg5PkhQ/+udVe82NELRGLlZ06Ni4OHR/oKzjfqEjx3PL/HqJNMT2vZqwmJsqdTvHzK8mA+jUpk7AOQe4hlHplI5QnRMT0DWMBQ+0E/D7/nQYdH3daT6QmeKsWP6g1zxdr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFPKZ+Oq; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea669836e8dso1444137276.3
        for <linux-sh@vger.kernel.org>; Fri, 19 Sep 2025 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758340534; x=1758945334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=ZFPKZ+OqAAj1VhKugky3kjemp/VIqd75of38HGEmt1IOj91W4b7jLe+Myfu3ent1n8
         I+OsNztO7baVS7SDNqQDhsKyRcudzp5fPl2dQ3EsKmIi5TGzzTSREF9BOYtdvwLtcCQ9
         lX8BgfQDKyo0m2JfxIC+zD4CzDFgLzCucCTNnl0sqYXFOybMgodTGPU/RxeED3KpD6Ge
         7yQG/mA18ZVwa9TAvZspdmtVMoFft3MmApalEp7/PJVnD7pAqdNfemDIdWOkktS1fK7N
         5MIan1ZBYEJnEUm4lD9oNaRI/NjfTi3RIA4zVC5lAmPgo6eel/h/B86mXEMgdrCKJemE
         DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340534; x=1758945334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=QP+Iq0cBiolyYrm93AX7FabY64gUVmHoLJ9gd8OGqI1OTbkrUhICLsNuUcLc7xF2QV
         x3QiWcfv69+tpQnDhA4JWh7XX2WVv+uH9RO2YAXmzVpSSRXEd6HRyGDXD620NnefCueN
         rbVgAwwl2QAzHdCXRYOrUjxf3umv6TKaxVqUVmQ+MjO6d4lmGHqYzgaHiFq9H5Fz3Dnp
         S8RDbTl7rX2F5M0KO+MBGYFwNL6luzPK2hC7d4iTkhTjVN4QFpldUgYZyHMW5j/Stv6L
         7IKvhveE24Mai+J+j+Vg9MY3aNgYeA839hBef6vsSq4eE2MtK2YKcpCuLyEl5ZJJY5S7
         VXmA==
X-Forwarded-Encrypted: i=1; AJvYcCXo+rv49rBv1pzGEBZUbZfji1GlmKizkXSN5f2WEhPb32Mv5v2/f0FW8uwVCDi2TouLsmq5KCCtVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wPciX7RfnNpElD0OcSwGDLbf+S8b9e59zjA7KouBtQXKSVLI
	+A6CHQCCUuXwbgo0ham/i/2U7ZZhELU6xAcgqkfDYfWuvFkkThbyV09K/z91u6J3Ugq/hLj5i/+
	JSsazsloKT24DVjBiSCCJvDlYxteAjr4=
X-Gm-Gg: ASbGnctzMnpELwhWJm2FH2V/GkD1fykbsYpRoiDct8KKjNVTrjsJqO8bciyZ/4R5FDD
	KIdr7kLZanYzOYlMmyXUg724lfHEZdZ2X66kOS3dRH6wjLKDHMDXXOnVYjyG4PcZnnqcjIRE7+h
	oEmY5enCD8FpjwaEOnlBzvjyfzXAtXJ7a3XWThh30e5/TF1di8ybCK4xsr3ST15v4R73fQUfQvk
	LmbjEA=
X-Google-Smtp-Source: AGHT+IH7cxRQcDAWrx6iopGK0fgAvvotX/SwRt/T/KElvH4XQULrd96czgOrVv1CSvA0vDpbRNCMKcVlhfdowxEBryU=
X-Received: by 2002:a53:b3c5:0:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6347f610c7emr3546092d50.37.1758340534336; Fri, 19 Sep 2025
 20:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
In-Reply-To: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 20 Sep 2025 06:54:58 +0300
X-Gm-Features: AS18NWCqg0xtU5KiNe17DWjmiPCEbBI_FSj5NCOyDGZFj_7oFaRqSu7O_vUKCrA
Message-ID: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 6:25=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> Considering that the deprecation message didn't get displayed in some
> configurations, maybe it's a bit early at the very least.

I changed my opinion.
Breaking users, who did not see a deprecation message at all,
is unfair.
I will send a patchset soon, which will remove initrd codepath,
which currently contains deprecation notice. And I will put
deprecation notice to
other codepath.

Then in September 2026 I will fully remove initrd.

> SMTP server I used wasn't authenticated to google, so all gmail
> recipients were dropped. Hopefully this work better today.

Yes, this time I got your email

--=20
Askar Safin

