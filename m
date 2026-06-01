Return-Path: <linux-sh+bounces-3968-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBzFBShAHWq8XgkAu9opvQ
	(envelope-from <linux-sh+bounces-3968-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 01 Jun 2026 10:17:44 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D961B569
	for <lists+linux-sh@lfdr.de>; Mon, 01 Jun 2026 10:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9C623019061
	for <lists+linux-sh@lfdr.de>; Mon,  1 Jun 2026 08:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D547C388E6F;
	Mon,  1 Jun 2026 08:12:02 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C2385D8A
	for <linux-sh@vger.kernel.org>; Mon,  1 Jun 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301522; cv=none; b=EhjfxrdIOFBPuMANSGRhfk7W04JIJNgD7NGe+QZ/k5xB7IhLjm+9QtJ+mdTZiVY+a80Lwp4GKnreIInLbpDGtoW2BfyGBnGav0LBnilYQ1LulKTRyT4W9uuX2fXM8q1uheslXTkgePzDIEVB3iRDfuexLDxAXe1AOD++JrqA1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301522; c=relaxed/simple;
	bh=nnuOMcbYOCL4y+N/0eemC5pbxvM0uxdM9ZqpwqEbLSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0iEZq4nZ1XDZcJVhnRjQeY6p2WFEzcO4fg8U6rZEvRwl59qmdpw+2OHbJqeK+lW8h8l0Jfof7wMRMdNX3p6dP4GrS7VJVzOKiHJ0RAcdnd/gHxz/TmBNLkN0aDqmxOGRAI0djdmy0z5muVDGbKhTZCYd3H0RvBdmhGRUHeUzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59cd803792aso1094519e0c.3
        for <linux-sh@vger.kernel.org>; Mon, 01 Jun 2026 01:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780301520; x=1780906320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6bsjRyMlYCGVZWYk2Y60sUCqRedkIR0Vi6kAvx0wUs=;
        b=NtoFNVzgNCHkfXpbOZ9NlOzmh8afwc1Zf76rMeS5eXv+3iGwWaJTi2HUUfXc6ryPZQ
         JS2bK4yshe6zMR5em2y+K2LsS7ZbjbfR/SC9aMVeNjLKRFDfTGRiAfDVY10Ps4cdfkEZ
         baxx7ooL8AfGSLdu0dvDBKJcjsG8pNrybfFBpZLPiQq5FRRgwnNBs6pLyb6TMQ0l4kn2
         qxX4g1YuTKMrFJ+FAvvOttVDd2E/8SsBrsCy6Em/D/D4dlNV4ygdRtQKgG9uVEgDVh3X
         WYP1F9kceJnTCnGBPdttIM3dpeW4nwBr9iJnPnJzT1t0lBG0tCC4N2oeA83cbvHy6CqV
         g7RA==
X-Forwarded-Encrypted: i=1; AFNElJ/6oysDuKHy21kgLHPUmEfrxqCCF9IJMOVau/nts82NYOOov1XvdccOHp96B22kqfZZogYmtZNjkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSsg/ifZJ2ariHIewfmz8z1NUlIwqG8WKrOZZngY2QCzvE4Fz
	gjqTl+osaYSeAhtgrR1bhV7omxyxiwd7RXRCnIkPahfRAToayasUPDMQ4+Boll1r
X-Gm-Gg: Acq92OEH2bAk1dMQeywJYHudKVr+XXDUXB3Ss6Bs2OBi41mogxSqEl24tv7ay6lPtKF
	BTm1ZViZvSuqk4Kh7SaBEeY9H/Bm5bWgsSZ2ujvMkulFPEjVdIZzziD2Ft7KjCsaeHBMgNDzr4j
	Ve6gBmXtIVnxschStERRr/EklRm76Gr0BpkNR29TemGxVPPAFepnOyRb13uJhI09HmVuxU/8xMQ
	p/KUUJnxJX46RRTq1symxJXqvw+58D6yeLIKfeDz4CpioDWN4jQfL0igSKKCuU9ypqlB9k0Zc1D
	x2qo9y7T9QCjP4d/1TrvROYLxmvpqFo2KEipBKQNUTzPiKGxP1ir65vPONk3QMAAouEn8UWvJf7
	SweSwgzepLIFc4Y5/8KXZFkqfL551Dknei6xsKnUb1+XiVsTspdeO33RHM1lMjn/GHF7wqH7lA8
	7D+uL6BnHrj/Q2JeGDSuypUoXkntEOc4/WUi6l0TMF4Lzt2/Ah86Xk8OBP8/RIeUkjtvbAn2A=
X-Received: by 2002:a05:6122:d05:b0:572:353f:be2d with SMTP id 71dfb90a1353d-59bf6957331mr4102060e0c.13.1780301520327;
        Mon, 01 Jun 2026 01:12:00 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a16abe3769sm1372187e0c.18.2026.06.01.01.11.58
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:11:59 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9639aa8ca17so2385000241.3
        for <linux-sh@vger.kernel.org>; Mon, 01 Jun 2026 01:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5YJnPJKfIe8lSLRziUxHYE5SRfkIZ/Hp0HKcGk4g3/1feTwxI+Q0IYFATIDDYOIGsCg+hoLmjLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3ed4:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-6c67682807bmr3734166137.3.1780301518249; Mon, 01 Jun 2026
 01:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com> <20260529150150.1670604-29-ardb+git@google.com>
In-Reply-To: <20260529150150.1670604-29-ardb+git@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 10:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXp0qp38vHJTDFMrY-AUDXPSJtc5Dds_qu58FSeS_242w@mail.gmail.com>
X-Gm-Features: AVHnY4I0grL2HGASleAgF6ybT4VX0NqDy8gokQJ4KkNhvH_ouOMg7ryFWIbyvcA
Message-ID: <CAMuHMdXp0qp38vHJTDFMrY-AUDXPSJtc5Dds_qu58FSeS_242w@mail.gmail.com>
Subject: Re: [PATCH v7 12/15] sh: Drop cache flush of the zero page at boot
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-3968-lists,linux-sh=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-sh@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-sh,git,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:email,sourceforge.jp:email,mail.gmail.com:mid,libc.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 670D961B569
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 at 17:02, Ard Biesheuvel <ardb+git@google.com> wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> SuperH performs cache maintenance on the zero page during boot,
> presumably because before commit
>
>   6215d9f4470f ("arch, mm: consolidate empty_zero_page")
>
> the zero page did double duty as a boot params region, and was cleared
> separately, as it was not part of BSS. The memset() in question was
> dropped by that commit, but the __flush_wback_region() call remained.
>
> As empty_zero_page[] has been moved to BSS, it can be treated as any
> other BSS memory, and so the cache flush can be dropped.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

