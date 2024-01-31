Return-Path: <linux-sh+bounces-313-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D90538443E8
	for <lists+linux-sh@lfdr.de>; Wed, 31 Jan 2024 17:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A131C26184
	for <lists+linux-sh@lfdr.de>; Wed, 31 Jan 2024 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCCC12BF20;
	Wed, 31 Jan 2024 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gaEmT0Ct"
X-Original-To: linux-sh@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6212BE97
	for <linux-sh@vger.kernel.org>; Wed, 31 Jan 2024 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717777; cv=none; b=EyDs4kCXF+8s2uFa9wBr1BrU/TwWZG4H3K/Z2+4tct1CPr4hTgU/0uCmesN8BGQgdHzV3KUzT8euKfgxp28DwjCMN2Z12T3mVLzGzNZt8b9QRFIJHQ2QMsKZu7ORsryaF4UJvRkzmS4D0bob9WW5ocSQihR+BYkZRXKHm4xRdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717777; c=relaxed/simple;
	bh=ibwsPIor3wbGYQD/hLtasMF6cDDIw9FflDn5f05clPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n/iJ8ErjZeC5UBwBEavz6BZSFq0+6gk8EWVtnyrxMj/D9Jv13SDfk3yx6DJQXy+oLS0eD5tQc8ZURxFQuyzYcvtVFBE4eFK9jeNlXXnRRPkI3tfF2UwooKu28Ub7FKsYiHF8Mw7s5HD6M/q14gP+OkC5SQ3i76etnwC/BEd6Dj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gaEmT0Ct; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706717774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
	b=gaEmT0CtyoHcMhcU+u1bgOGRqYS8qF2Qj/aDvIstRYxWD+701JqmzZKAgGwt3rw+AWu4Vt
	/ixd4lwSbdWD6ve90b3dn7GBtG28E/P1YiFREQqsZTH3LxxkfaNa+piUfLte4xKWoyXy7L
	kaFvOUO0AL0QOhoG45v07TFZerj8nYc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-KplqiG-QNjyav5NQVgNUOQ-1; Wed, 31 Jan 2024 11:16:13 -0500
X-MC-Unique: KplqiG-QNjyav5NQVgNUOQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40ef9dea0d1so17562795e9.1
        for <linux-sh@vger.kernel.org>; Wed, 31 Jan 2024 08:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717771; x=1707322571;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
        b=WM0KbgTOTkjGx3b6K6QoqCkjjjfu30WrMhwliv95aanhHwr9u7rnTnUumrmV5Qz1K1
         kzM+bXQPh/lPbGNsJIdFbpxeXdTIKrXBRefQfDMZ3iIrkiGgs+qW1OdctFjIu1QzN68y
         hA6u7LMcFrXUHwgCK/qugyKfIqH6rHt8f3ik+cesJlbJiw+77mlrJc67A46cOYba9ngE
         KnNfapvh4b6oWI/KByeml9SPdyFObK476Q7O2stqRVCCR+vx4MCzEYR2IF64sfEQWZ4L
         bzFByvGWwMY2AYKi3SwEgm34PCZdJJKhh7vGTUZLIp5BIV0Ge6wZGut5VKmXZ1UZORND
         ex7Q==
X-Gm-Message-State: AOJu0YzIQa7rXwrHX2O0mZB7+AGKiB4CrGkVgJt5ESDM9yMnTblMu7uN
	0FyBNNOC9UmQENioi3FfInC3/TdhJkIynwg94e6LEEFBYF9STpBLSeu0Dx5M1CglPP7qTnZS9OJ
	hLVuNZHsFbLW3hf98DMoZQ73nkvAukjdCXOp89oQauaY77swrpSZ7JVGV
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id v13-20020a05600c470d00b0040ef656039fmr1666487wmo.6.1706717771196;
        Wed, 31 Jan 2024 08:16:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPXw3WDi2GZ1H+C0qsa/dAVaPD3o3y3lXbF7MCxjdMESWq9m8J99FGcFCWR0modxgMLsxfUA==
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id v13-20020a05600c470d00b0040ef656039fmr1666465wmo.6.1706717770812;
        Wed, 31 Jan 2024 08:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUoDac0RvNodMCJs3PaWqqtOE+9dEzyxDlMMZNkLN+9Z6E/nFbEkkxrIHwfc+hSWJaNnVK7xR3Ed0cbCzcSkOg4wsj64PDZBzGJ55TAIfdOQUqkLN7RXdt8LS5U2xv19hTM73ntChGiMk6enpZZ1799Gz8DaC8PIbxx5EGjzmWMMj3MWkjDnr4A5WCVoTdePcahln+DYWmWWFW6nyhu9pxhcWV/Frc73YIhpQ==
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c044600b0040faf410320sm1939660wmb.20.2024.01.31.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:16:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
Date: Wed, 31 Jan 2024 17:16:09 +0100
Message-ID: <87r0hxtr5i.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit f402f7a02af6956d is in staging-next (next-20240129 and later).
> ---

Makes senes to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


