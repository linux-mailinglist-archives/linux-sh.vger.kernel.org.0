Return-Path: <linux-sh+bounces-2623-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63267A72C43
	for <lists+linux-sh@lfdr.de>; Thu, 27 Mar 2025 10:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 142D1175B30
	for <lists+linux-sh@lfdr.de>; Thu, 27 Mar 2025 09:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D77020C03C;
	Thu, 27 Mar 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iQzMr/OM"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC11BE23F
	for <linux-sh@vger.kernel.org>; Thu, 27 Mar 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067191; cv=none; b=P6zOfvMTzamFDoqfNZVOsTqoxiwGvQpfOGXbgIXQfdi0oTXrf/YoHZKGDwCQpeIyDgwFwvHtrGtftl1asadftK4wmN27FHBNLKyVS69FEDMBOPRxbNh6+g/w7C10cpr9A1LLheyjsdk5vn83yVyhfDUNhRcWhjNGo+N56lgEHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067191; c=relaxed/simple;
	bh=4Uqg1XG05HdJPsxOwRpf2Ggurmvyrn6hqtvAxIbW18E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Nm1crORTaq76Xma1LD7w8Inw3otDr4SBFfRjK3GJ4nta0TvUsv6BTaDb7NwfStP6xCthZynxMfyEpIlZ/UCQ7BkzW94jNQBcgBU2fnlIX84NtpkPxIL5G+Qlvb5fPITKRfyXSI2MyaHFap2fwekBcyGekhF6XqdVvKKyamEVWoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iQzMr/OM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743067187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
	b=iQzMr/OM1L4aNusLYBgfkJoA3gTJ2s5f90gNNeYwdCAOVSTM5N4m4GTdCbsVNR4ip9RXs/
	g0BlL5Wj7M6PR2RkF7SLpiHJsyuIxXn64AqMiSJpbdv6kTxseeRlTScltu74yeRs7tvW/3
	UmNakEj6wZtqSjLgZ2yBVIMKpSCS93w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-3vTsK8mdO0a7pOgv7PLrDw-1; Thu, 27 Mar 2025 05:19:46 -0400
X-MC-Unique: 3vTsK8mdO0a7pOgv7PLrDw-1
X-Mimecast-MFC-AGG-ID: 3vTsK8mdO0a7pOgv7PLrDw_1743067185
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e67df8c373so840837a12.0
        for <linux-sh@vger.kernel.org>; Thu, 27 Mar 2025 02:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067185; x=1743671985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
        b=W49VxaEUVNg9nU3YmWKMPVHCTWIjzpu2KmOK00Je0tKDL6GhsszZRXkheuFOt5jPj2
         djARB/JSSXxKkE5GPF9eLrKb6TStS7DxIaBBD8/CBwbyoWtgkcyxXkUtBAWAlv8pbM4J
         xtMMqj20aG3mPzt7jiYp5cjCph/5W7UrmtIfyNsvn0nOmUURrVIrlvoV3ML5Kzee/B/A
         CycqIVdBcBPgEUmYY0nShnwF4iYeZ/XVyhj3zyYnbpNZMdGwYU2OsI4JTuVnH2Hb/NeQ
         qC2BKhLp9DnoxcjtbYawCOWDfuFkHZ/9wyb8oMG1yYi9FuARQiMZR8HbmbyXrNklWZMW
         Mxlg==
X-Forwarded-Encrypted: i=1; AJvYcCV8inurB+TE43SdF3LY+nRS6VqQhIqwkeoJSLTO7K8SgMp+VjUd77jyd+Kv6gMGtbkHYIN2bOd8rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZz03U53EbV9JrnjSz8ZsXvHrZ+GvQ+73G8vhjzb5PhzIBU0u/
	C1l6+LwCjGe3DMaAKuqMW0dLW13LjWwi/KiEIAiHD3JvIN/Vpna+inN5cfKY0b6cypdV3Jcjy+9
	do19qQ+/C8Q3KjA/0v0RZMDKoLZPqM3Ygf//kkqyH54jA4thqe4aXUYg=
X-Gm-Gg: ASbGncvEExtXGFa2hakv124gKEpBmku/CIgrZROXfn5HuHawkHTk1LaX28NLP7OcqfK
	dni4QXE5vjVTC3LYpEl6bewKnfI6m/UygFVvMyJOhRmORKg5Yoqo9GKJvpmYBPLyi6mVEwTdENt
	8G13+5VyqEOTjgzpi7eFlcQOub5o9VaIJPJW6ZV55ksYrgoe7SFoOy5vfaF3AYS59tJUc9dS//9
	jgiIfslWoC2kHu5rbqOOW0g4HOUDTZgeN2IcouOU9afHknchSZ1rxNI8+kbhVryfHQWxaHEUyqC
	tmdUWrQmzhZeSzr8ZoFRF6g6mhAId9DDzrs=
X-Received: by 2002:a05:6402:84f:b0:5ed:5554:7c3b with SMTP id 4fb4d7f45d1cf-5ed8f01bf27mr2519909a12.32.1743067184659;
        Thu, 27 Mar 2025 02:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DbC1eDv4uqQP1EBxN610IysnB9dK2feEI/zaqXDqyNyHZNke1rzsRI6Nd8rV/ipuBURwEg==
X-Received: by 2002:a05:6402:84f:b0:5ed:5554:7c3b with SMTP id 4fb4d7f45d1cf-5ed8f01bf27mr2519867a12.32.1743067184134;
        Thu, 27 Mar 2025 02:19:44 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0e0470sm10684007a12.77.2025.03.27.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:19:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:19:40 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v4 1/3] lsm: introduce new hooks for setting/getting
 inode  fsxattr
Message-ID: <gsg4crfqqc7xmvaadcaqiztsr2ngstswmax4aourvc7iuu3tew@mluhff6a2ip5>
References: <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
 <e2d5b27847fde03e0b4b9fc7a464fd87@paul-moore.com>
 <20250324.aThi9ioghiex@digikod.net>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250324.aThi9ioghiex@digikod.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VXbt5CTn0aSrzgScrQZwUvOV2tAJMZsgWwRudWFh59g_1743067185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2025-03-24 20:27:02, Micka�l Sala�n wrote:
> On Fri, Mar 21, 2025 at 05:32:25PM -0400, Paul Moore wrote:
> > On Mar 21, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > 
> > > Introduce new hooks for setting and getting filesystem extended
> > > attributes on inode (FS_IOC_FSGETXATTR).
> > > 
> > > Cc: selinux@vger.kernel.org
> > > Cc: Paul Moore <paul@paul-moore.com>
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > ---
> > >  fs/ioctl.c                    |  7 ++++++-
> > >  include/linux/lsm_hook_defs.h |  4 ++++
> > >  include/linux/security.h      | 16 ++++++++++++++++
> > >  security/security.c           | 32 ++++++++++++++++++++++++++++++++
> > >  4 files changed, 58 insertions(+), 1 deletion(-)
> > 
> > Thanks Andrey, one small change below, but otherwise this looks pretty
> > good.  If you feel like trying to work up the SELinux implementation but
> > need some assitance please let me know, I'll be happy to help :)
> > 
> > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > index 638a36be31c14afc66a7fd6eb237d9545e8ad997..4434c97bc5dff5a3e8635e28745cd99404ff353e 100644
> > > --- a/fs/ioctl.c
> > > +++ b/fs/ioctl.c
> > > @@ -525,10 +525,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
> > >  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
> > >  {
> > >  	struct inode *inode = d_inode(dentry);
> > > +	int error;
> > >  
> > >  	if (!inode->i_op->fileattr_get)
> > >  		return -ENOIOCTLCMD;
> > >  
> > > +	error = security_inode_getfsxattr(inode, fa);
> > > +	if (error)
> > > +		return error;
> > > +
> > >  	return inode->i_op->fileattr_get(dentry, fa);
> > >  }
> > >  EXPORT_SYMBOL(vfs_fileattr_get);
> > > @@ -692,7 +697,7 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> > >  			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
> > >  		}
> > >  		err = fileattr_set_prepare(inode, &old_ma, fa);
> > > -		if (!err)
> > > +		if (!err && !security_inode_setfsxattr(inode, fa))
> > >  			err = inode->i_op->fileattr_set(idmap, dentry, fa);
> > >  	}
> > >  	inode_unlock(inode);
> > 
> > I don't believe we want to hide or otherwise drop the LSM return code as
> > that could lead to odd behavior, e.g. returning 0/success despite not
> > having executed the fileattr_set operation.
> 
> Yes, this should look something like this:
> 
>  		err = fileattr_set_prepare(inode, &old_ma, fa);
>  		if (err)
>  			goto out;
>  		err = security_inode_setfsxattr(dentry, fa);
>  		if (err)
>  			goto out;
>  		err = inode->i_op->fileattr_set(idmap, dentry, fa);
>  		if (err)
>  			goto out;
> 
> > 
> > --
> > paul-moore.com
> > 
> 

Sure, thanks for noticing, will switch to dentries and handle error
code it in v5

-- 
- Andrey


