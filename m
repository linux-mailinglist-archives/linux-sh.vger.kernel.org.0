Return-Path: <linux-sh+bounces-133-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBC824D81
	for <lists+linux-sh@lfdr.de>; Fri,  5 Jan 2024 04:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 875C51F22778
	for <lists+linux-sh@lfdr.de>; Fri,  5 Jan 2024 03:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7E45397;
	Fri,  5 Jan 2024 03:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b="ISfzcR9B"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB795392
	for <linux-sh@vger.kernel.org>; Fri,  5 Jan 2024 03:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=landley.net
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-67ff241c2bcso5893846d6.1
        for <linux-sh@vger.kernel.org>; Thu, 04 Jan 2024 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704426265; x=1705031065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=ISfzcR9BnwRG+BMUqFv+HxFq0Ft4DyBEVuhBYPv/62Ji70SOa0LiOgUwacUngf7fOL
         xqCVAMsnyuwLzNrUzu5CFox8ZZLQd2kgVbgJrZVqWFrunwR0HIkkz4EHmEQNytFr89IJ
         0sWarKvfRaM2sYZ6/8mS3PU5SE4ymKCyL8jZz+R2D416y/dQ11l1etZVRhMr4hJy+8hy
         DSlTD7A4DHUpSq7m1bRulT4UE9yRbUF/ogjr5NnBohGkJpEPU5zTDhoCQrNhKRVM8+Zp
         HnwShVo5Y+/22/UzSYfdnvkRT38aLs0TPSoWMrbVHn3QL2AB2L7Sov+xrVvlsPKCUlUS
         9OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704426265; x=1705031065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=bwAuzyx67Ze0JieMaD9mdfNfeBYAP2Aspdn0gFbjtufYrKMKmg6ka2TRljAodTZHuD
         oQPraU0Q5p9SsvpqbuER1WGxq/HMduwYze/3hf0vIvcy0dpl5vypx3L1lOkULe/umPsV
         TNUnGExP4tqxU4rBWbUo8N3lL63cNIeWoszAIcwDxB9+T09yY3uezWhwSRh4N5mF8mGE
         mtpYe4nDkL4P4C9VBXk96yMxJMAQNNAMtomrD90T38yO2UIJDAmKR/e+a/KJTH+kgovI
         4QxeIvzzufQb2s0DCDiRVHPMtI6Um9Z+k48+P37vjwcaBWMaqrjq0c8EQDYAhF6vZ8T3
         G+iw==
X-Gm-Message-State: AOJu0YweouWC+1ZbyG1j9yHnN1NaDBoT/u2xBRpfmAP/xTzogcWtNbjw
	5nwUjU3I1iKGt16ARjFvRwoAhDslTA8F2A==
X-Google-Smtp-Source: AGHT+IE5c+alCyX1IwIj3VnIvG0UA9lij+ign+WLiqw65B1fGZND/Aeym1T7qiFm3gDYxSCgN4CMSg==
X-Received: by 2002:a05:6214:2602:b0:67f:5660:3e4 with SMTP id gu2-20020a056214260200b0067f566003e4mr1707272qvb.67.1704426264997;
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id eh17-20020a056214187100b0067f70cc986asm297636qvb.92.2024.01.04.19.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Message-ID: <8131b56d-937d-d7a9-0bab-99599617ad74@landley.net>
Date: Thu, 4 Jan 2024 21:50:51 -0600
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/3/24 03:46, Geert Uytterhoeven wrote:
> Hi Petr,
> 
> CC other uClinux arch lists
> 
> On Wed, Jan 3, 2024 at 2:52 AM Petr Vorel <pvorel@suse.cz> wrote:
>> UCLINUX is broken in LTP and nobody really cares. Actually I dare to
>> say UCLINUX is dead. Therefore I prepared patchset to remove UCLINUX
>> from LTP. We have been actively removing UCLINUX from LTP during rewrite
>> tests to new LTP API. This removes the rest from the old tests (which
>> will be sooner or later rewritten to new API).
>>
>> Because the patchset is quite big, I did not want to send it to mailing
>> lists (but I can do it if you want).
>>
>> Can you please have look at my fork on gitlab, branch: remove-UCLINUX
>> https://gitlab.com/pevik/ltp/-/commits/remove-UCLINUX?ref_type=heads
>>
>> Build test:
>> https://github.com/pevik/ltp/actions/runs/7392470215
> 
> Thanks for your series!
> 
> I see you only CCed linux-m68k, but AFAIK, uClinux is not restricted
> to m68k/coldfire, but also available on arm32, riscv, sh, and xtensa.

Do you mean "nommu support", or do you mean the ancient distro Jeff Dionne
stopped maintaining in 2003?

Because I've been doing nommu musl-libc systems for a few years now. Works for me...

Rob

