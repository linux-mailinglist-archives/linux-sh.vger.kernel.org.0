Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2996D540053
	for <lists+linux-sh@lfdr.de>; Tue,  7 Jun 2022 15:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243723AbiFGNoD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 Jun 2022 09:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244870AbiFGNn7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 Jun 2022 09:43:59 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D594DAE25C
        for <linux-sh@vger.kernel.org>; Tue,  7 Jun 2022 06:43:57 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h5so24296567wrb.0
        for <linux-sh@vger.kernel.org>; Tue, 07 Jun 2022 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x4IJbeSPwqHNNzv96I29/orNZTpYQPQuyaBORkJUAzg=;
        b=XlTRtdAks6FyNUJd2ckhu1c5pagq2qIDjS5WoYMfF8F/GzNkTOGIRee+NWovA3egqG
         FLKHASNpirn/UlLG3ZAyDRDYJRzLIoqPa2VOSQsO/pnUIRKTo2FatbwU5AN+8a98G+bI
         rILYCsPCDfbhcAaQTDUz6Z0bpVEwrjjd678IOahbAX1ktBr2VBSVvT4Q22Zq/oJ0gIvB
         gLFBcHndCp7mXuXnrTrJ5ol0TaqYaNK1yM+q+L+MLEFH7U9tjlgO9MMK7/IQqfI6vNk3
         XKf5sJfrUYjASIsJfQuT+NOtyQD4MTgpt1oQl38IcOdgvDLq5htBD62P6yCDZtdjrpI/
         Nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x4IJbeSPwqHNNzv96I29/orNZTpYQPQuyaBORkJUAzg=;
        b=NZxeM7nGHpbUcP6q5gA72lSfNUFi1+WT6hg4Kv5JW20D+s7Z6bfOkQv5Dqn+HeAKn3
         Ff82L1F5sT6QqSsAq/BqkTWlwCeB8pEUoXIPw6unUxlfuvRsDq00kyAQvVA6+Iv5q3IO
         W0SpO5/tt3xRz25jovVMCd7XXpVKAdv2OTA5VWOSRk4FySBvnMvp/v6v7uZlwsDJT/LE
         voBsMfj28lC0u8/6TVzt0Uv4qPu4jhh8bxNokV2eQGHgQ31e8vSLDv+QuEHs1upjd7V8
         wenjsGQNJ34nKW/doDG7O/nGIHGrrdAvBZ0Vy/k88u6wydgM66FWmQGsDMYUr/wvAbYR
         D42w==
X-Gm-Message-State: AOAM531QUFK2gV2kz0V7TIazLLNg5oEviZo/PJ0epDZa179wtDrAqfsm
        bF6n35TvWgH+FGfUJuCTChOY9g==
X-Google-Smtp-Source: ABdhPJzV/rczdwKiQFWRaJo7rMbHUKT0bXbfMPoGXdv8T0Fj/pZ6hEfQLyACkUiu9UuxvjPxgKjstQ==
X-Received: by 2002:adf:eb42:0:b0:20f:ebc5:cb0f with SMTP id u2-20020adfeb42000000b0020febc5cb0fmr27945814wrn.355.1654609436139;
        Tue, 07 Jun 2022 06:43:56 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:cd40:f1bd:cd2c:953c])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b0020c5253d8fcsm17787769wrv.72.2022.06.07.06.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:43:55 -0700 (PDT)
Date:   Tue, 7 Jun 2022 15:43:49 +0200
From:   Marco Elver <elver@google.com>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>, Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] bitops: define gen_test_bit() the same way as the
 rest of functions
Message-ID: <Yp9WFREfdfkho0hm@elver.google.com>
References: <20220606114908.962562-1-alexandr.lobakin@intel.com>
 <20220606114908.962562-4-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606114908.962562-4-alexandr.lobakin@intel.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jun 06, 2022 at 01:49PM +0200, Alexander Lobakin wrote:
> Currently, the generic test_bit() function is defined as a one-liner
> and in case with constant bitmaps the compiler is unable to optimize
> it to a constant. At the same time, gen_test_and_*_bit() are being
> optimized pretty good.
> Define gen_test_bit() the same way as they are defined.
> 
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---
>  include/asm-generic/bitops/generic-non-atomic.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/bitops/generic-non-atomic.h b/include/asm-generic/bitops/generic-non-atomic.h
> index 7a60adfa6e7d..202d8a3b40e1 100644
> --- a/include/asm-generic/bitops/generic-non-atomic.h
> +++ b/include/asm-generic/bitops/generic-non-atomic.h
> @@ -118,7 +118,11 @@ gen___test_and_change_bit(unsigned int nr, volatile unsigned long *addr)
>  static __always_inline int
>  gen_test_bit(unsigned int nr, const volatile unsigned long *addr)
>  {
> -	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
> +	const unsigned long *p = (const unsigned long *)addr + BIT_WORD(nr);
> +	unsigned long mask = BIT_MASK(nr);
> +	unsigned long val = *p;
> +
> +	return !!(val & mask);

Unfortunately this makes the dereference of 'addr' non-volatile, and
effectively weakens test_bit() to the point where I'd no longer consider
it atomic. Per atomic_bitops.txt, test_bit() is atomic.

The generic version has been using a volatile access to make it atomic
(akin to generic READ_ONCE() casting to volatile). The volatile is also
the reason the compiler can't optimize much, because volatile forces a
real memory access.

Yes, confusingly, test_bit() lives in non-atomic.h, and this had caused
confusion before, but the decision was made that moving it will cause
headaches for ppc so it was left alone:
https://lore.kernel.org/all/87a78xgu8o.fsf@dja-thinkpad.axtens.net/T/#u

As for how to make test_bit() more compiler-optimization friendly, I'm
guessing that test_bit() needs some special casing where even the
generic arch_test_bit() is different from the gen_test_bit().
gen_test_bit() should probably assert that whatever it is called with
can actually be evaluated at compile-time so it is never accidentally
used otherwise.

I would also propose adding a comment close to the deref that test_bit()
is atomic and the deref needs to remain volatile, so future people will
not try to do the same optimization.

Thanks,
-- Marco
