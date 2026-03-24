Return-Path: <linux-sh+bounces-3597-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKwBBsXIwmmIlgQAu9opvQ
	(envelope-from <linux-sh+bounces-3597-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Tue, 24 Mar 2026 18:24:21 +0100
X-Original-To: lists+linux-sh@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB16319F50
	for <lists+linux-sh@lfdr.de>; Tue, 24 Mar 2026 18:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 899F03027532
	for <lists+linux-sh@lfdr.de>; Tue, 24 Mar 2026 17:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA33F6605;
	Tue, 24 Mar 2026 17:12:57 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3113914F4
	for <linux-sh@vger.kernel.org>; Tue, 24 Mar 2026 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372377; cv=none; b=Nmgn6eOno2QEUdE27KFO1A4fYxTEIn0li0Gas+ODqAVSQwgpO6oEQ57kgk/k/3FtIkl9rc9NWltVBARwJCg/tHg9kERQ0nku6p5BHKf5K1qmepMGEc0YLjcNy3I4UBoCqn/1fJ8lwMqSWamMp0PwkmdJG6zygFQAfaQPq9klV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372377; c=relaxed/simple;
	bh=3GEJwPfpmz1HAcFqPqDcCHr7DP7fs2OA9k1TBgcroIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oD3luBHHi7AnvbvLJXUD3B5jginbDTZlp0ToOyCbIPRa2ecpj9BEsZKejdG9RH/p5Vr583XnOfO/zKeq5CbPK3uvQPEvdxWTjg6LOOQo2K4DY562Rns6qQYx3IiDxjNRvoP05od6omc/zDZrWcil6Wly3n/qgfnHF83to5zNbDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2420618a91.3
        for <linux-sh@vger.kernel.org>; Tue, 24 Mar 2026 10:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372376; x=1774977176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=oFreMSo4u7xOiej3keHMH/XBrKZu8Xl8xem+Jtor5ALd/1wBgpXUGbH6vodZW2Ucvt
         noDblbfsUn8cKY75xd88v1Huj9/NkCwp1sT5vUi2L6tSWyYGMos7mnWFYIUjbHA6AEyi
         X/7UBA/CzJF3U96AgpPbO4n+pEmDos7WBCe0wXNb3f/NYL7mTehfaHbgIk3k+g6cyLQH
         Yvr00lFt0u7KmDZSbLoU9vfqBaDyZ28W7bkPgwC2lAriaAmiS6uYEDg5SRuSIvFvwF2Z
         uBECbMYnq1Gsuf1fleAzkWiPqSg1aYCJ1fXKA+J0ui7SeZ7Xk5kfMFPBPCM29sjaVEv0
         kRUA==
X-Forwarded-Encrypted: i=1; AJvYcCXzMdwtZFSaIa+BXgvMNyGh3C411CX1ph6XUC57ft2qACEoUqiWkqyBfzYqxAFl1EG9PrAe15HpNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFC1PgEuiIWPbOpNFUNsusTHNnDVD4N4VUJcTE0XAgSoguuH/a
	CV/7ogYztlz0WNZrQsaYq2RSF0hEf9KNoGxhd/aWa2cFhf/yFJbSBTOSTktqF/00df4=
X-Gm-Gg: ATEYQzzuLX725GH3NS29nFdswfwx59eCN45BMiKQ0Ir+rP/0GJJNC//dofUX0eX/kJx
	s3+rSU1v48+6mwR1v9/SbSFrvT/CuB1ZGGL9CvgHY3yfKpwDwOuiOZzplgRA9bI4TZXQWxzT2dV
	7EQ+VSYxu+XymSY3XQYWbLDjMo471ZbTuqWrhWY2QtU6IaHswzLXYE8x36SPu7h8Us0H8msRlqD
	9QBeC0b4ii6VWohqb7h2aSXxRiIGiHQjQNXTfg58jo/aH7q6Q+Or8u2800EhC/F3Dxteqcto8bE
	h3e/7FC4ng68x4GPHjK1zrWQcY23eFfyk9d7kIflfotID0W37DzNwGcf2k0hcEsBL/b+oaH40wA
	1hbL/K31thaNHE2W6XgHUWlv3j5tsz8rKRLz+d2ezE8EJzoD0gs6JMomZLYzauGyCeaSaDM10MH
	QTmE6HV94GKgjhdNmhI8pGR2nV9Xd/A53VG1ME/mW0D5y2c/XmFT3YPRv2cSWz/A+js660zw==
X-Received: by 2002:a17:90b:1e0d:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35c0dcc6e84mr142300a91.13.1774372375896;
        Tue, 24 Mar 2026 10:12:55 -0700 (PDT)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c031403e4sm3624283a91.6.2026.03.24.10.12.55
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:12:55 -0700 (PDT)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4e9694so10566730c88.1
        for <linux-sh@vger.kernel.org>; Tue, 24 Mar 2026 10:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFTZ9y09A6K9E+rO6vuEbXZqmkYsRy3ISmiWedSsq/WYIXdI4mpENWo2w3gyhivLhhdIyqzxedHA==@vger.kernel.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,alpha.franken.de,hansenpartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-3597-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-sh];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EB16319F50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5

