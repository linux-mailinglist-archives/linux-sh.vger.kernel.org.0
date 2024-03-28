Return-Path: <linux-sh+bounces-560-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C72879E07
	for <lists+linux-sh@lfdr.de>; Tue, 12 Mar 2024 23:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4131C20B3E
	for <lists+linux-sh@lfdr.de>; Tue, 12 Mar 2024 22:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B765143C4A;
	Tue, 12 Mar 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1LTVNlx"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B82143737
	for <linux-sh@vger.kernel.org>; Tue, 12 Mar 2024 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280929; cv=none; b=j6oloWFxzf1PH6clRj7nEnqlhi15Fp6nyjPrQWeH4wq+3+JhLIQV7jjQ3kmco/gcvXduTxKN0+AKCv0K/AbbCFU812fKJMoaQ6lBZpMefcoaHuJI/Ww75tftW0ilCD6FeeQtDPzWbE8ahcYM4PweNXmuyRlymRjq1EIXafL8GZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280929; c=relaxed/simple;
	bh=Icdql7YMVD0wcn4SegJGmiR0d0RGpgg+yMW7x3+7qcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQQ5859Rr8wyI6LIeS93LqdR2cWlgC71/6cMmK3RIwFJN3uzSPA6yyaPp7JXCrYX9AReiB8ip6HZjeFTmTdfkxPINsbd5eMMY3Ok1u7tzpK2/e0VoKf2JrI87UraWdfknINlzFc9fNZFHg5EUmSONfSQLlR82TcoQAX6idjjGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1LTVNlx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6ac58fceaso902073b3a.1
        for <linux-sh@vger.kernel.org>; Tue, 12 Mar 2024 15:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280927; x=1710885727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=I1LTVNlxsuMBJ2j4LU+gzdBv+pU46ZvF4ZB2cdUUX3GsWgRLZhw945loIfB8mMLp1N
         qSCcVfvmUVoYlOdXdb9FTQpwNcjS/u7yAl1rONNLvhRBJCxaUS3tcQ6muPqMqF7G7B0Z
         78DfWg6YX7LA5vZM0iDp2sOI7EHi1pL2ZIKoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280927; x=1710885727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=wjBIYiRkiyFbHpnJy20tog4tsQ/KLpaddeowMiD5QXN456hYQWbGn+43FtcnAjXDlE
         k3Ms17Lgclyep26YxKFL5eiDxJZCXLYhaQx/39F5B11njk89ZF2tdGwin3+2hWnQYKmZ
         KOKxYfXcfOwBf91OkbvFpn2I9kiCK1UVhI6f1rV61KD2F30xQ0MqYhv5jhF7B0q1ZTV6
         Mrh1MNInz0f14bOl7vI2k+J4a3NbbqqS4fAn2FopYBr+IFCdeqRfuIl/oKSHMIF02bRv
         uSRC+OCBnpWr4ljg0QDnAhJDq7CB7EfPJ3nVzZe+7KDf642EzLZGTtIdqqdigKH8xhS4
         kpig==
X-Forwarded-Encrypted: i=1; AJvYcCUq4bkbhM6p+7IGaPSi2vJST3h1+jOKWBd/NK1m0wY6T4JeZmcdvJUJEIQMZufA6V3dtGzWwJ+MSgqoA0sTwN/3mEW7qbqv0HA=
X-Gm-Message-State: AOJu0YxL0jO2qz+2ScFYke1aEGzPTPP046POlY/iMj8lacnWaGxEHzJg
	LYcFUwjBpimtu5UjRe3JJegKeGRNmmoXKT99yumLAJBMN+zO7ongJjqAXsInkg==
X-Google-Smtp-Source: AGHT+IFaAzHiJbVMwydAnFUAbBGgB4TiVXgXXf4Bmn7UNMuMdpujdzLwHr5uC0yhXwauRYk5a8qmzQ==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:afa3:7b32 with SMTP id le11-20020a056a004fcb00b006e6afa37b32mr865695pfb.6.1710280926942;
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p35-20020a056a000a2300b006e6ab799457sm1315765pfh.110.2024.03.12.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Message-ID: <202403121501.F7CA06C@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-3-linux@roeck-us.net>

On Tue, Mar 12, 2024 at 10:02:57AM -0700, Guenter Roeck wrote:
> Count suppressed warning backtraces to enable code which suppresses
> warning backtraces to check if the expected backtrace(s) have been
> observed.
> 
> Using atomics for the backtrace count resulted in build errors on some
> architectures due to include file recursion, so use a plain integer
> for now.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  include/kunit/bug.h | 7 ++++++-
>  lib/kunit/bug.c     | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> index 1e34da961599..2097a854ac8c 100644
> --- a/include/kunit/bug.h
> +++ b/include/kunit/bug.h
> @@ -20,6 +20,7 @@
>  struct __suppressed_warning {
>  	struct list_head node;
>  	const char *function;
> +	int counter;

Thanks for adding a counter!

>  };
>  
>  void __start_suppress_warning(struct __suppressed_warning *warning);
> @@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)	\
>  	struct __suppressed_warning __kunit_suppress_##func = \
> -		{ .function = __stringify(func) }
> +		{ .function = __stringify(func), .counter = 0 }
>  
>  #define START_SUPPRESSED_WARNING(func) \
>  	__start_suppress_warning(&__kunit_suppress_##func)
> @@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
>  #define IS_SUPPRESSED_WARNING(func) \
>  	__is_suppressed_warning(func)
>  
> +#define SUPPRESSED_WARNING_COUNT(func) \
> +	(__kunit_suppress_##func.counter)
> +
>  #else /* CONFIG_KUNIT */
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)
>  #define START_SUPPRESSED_WARNING(func)
>  #define END_SUPPRESSED_WARNING(func)
>  #define IS_SUPPRESSED_WARNING(func) (false)
> +#define SUPPRESSED_WARNING_COUNT(func) (0)
>  
>  #endif /* CONFIG_KUNIT */
>  #endif /* __ASSEMBLY__ */
> diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> index f93544d7a9d1..13b3d896c114 100644
> --- a/lib/kunit/bug.c
> +++ b/lib/kunit/bug.c
> @@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
>  		return false;
>  
>  	list_for_each_entry(warning, &suppressed_warnings, node) {
> -		if (!strcmp(function, warning->function))
> +		if (!strcmp(function, warning->function)) {
> +			warning->counter++;
>  			return true;
> +		}
>  	}
>  	return false;
>  }
> -- 
> 2.39.2
> 

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

