Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAFD119188
	for <lists+linux-sh@lfdr.de>; Tue, 10 Dec 2019 21:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfLJUJL (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 10 Dec 2019 15:09:11 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40859 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJUJL (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 10 Dec 2019 15:09:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id i15so16687842oto.7
        for <linux-sh@vger.kernel.org>; Tue, 10 Dec 2019 12:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kognZ45tk4qO/P86hQbS96WxT6n71WykchkXlMFBnIA=;
        b=TBKwzP3rPMuiyrYGeU+8Gh1gU+oeYz7EGgcmGFtmp3RVEDItjmP2hYrWWig2KSTjx8
         YAVJwDK/ebiKeyKuOM+FxnV09DyEvdC/LqGYSNj1Op8gmbNmy1zeKDUNCLkB7jdBkc2L
         RaGklprLoUcMPg9RmoGOA/XPfuU2B1r5gCAgR3CpdDuHMZIND4AA+olWfvVuEsonX4AL
         ux5E5rABgwjDW3j8/Xbij9FlymvC4UE3k+LxIXlosNRbpn4zjgHGAcoOaohhdKB4dM0+
         jxsR2h/An8iwilkvvF4V53Koqf/uVu0dJ0g9oAIEkvhLdyo/NsjGvnwzvDx4X0APJOY3
         ayiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kognZ45tk4qO/P86hQbS96WxT6n71WykchkXlMFBnIA=;
        b=U9iDXkokDKL1aBxu501bNsRy2jOJ8OjURSuvO7m9RfS1OAU0owtUq0lSy5LLhweT0V
         7VEuL3xmfrw0J4OPg/KQ2UyVMooJ8fw/S7hbwgiE+6jdY78MBVADDsjGy1DCwrlJig91
         WQ3YaS7OglNgSkO1ft3Zkzn1T4sJSJHPdZi9xcYrtCMFTupM9qu+HDSvXEcT0pN4ZwXf
         oB9pWEIhGHmNlZKBQRT+IdbodF0pv3w2aZn0UOmTpczn/HEL6BSac6R0aqaox+VBUicd
         g/6L/MgKXgIpcuIK+MVQjOiN9hY4Hb2HBzln+hWACYy8mt9Rb3wSqo3eHRwuA/G221ww
         fNjw==
X-Gm-Message-State: APjAAAWpPLKHsUpxWoJ6kaIo+yZVn2jSiUordFl3eehz1ZqaIvCkAQTl
        Htzr6ifY5lqxkqCqZG60VmHzAw==
X-Google-Smtp-Source: APXvYqwKGb/fK6fceHg9HEOEr1/bA8SL5OZxSoJpcdtzXMBv+Jtg/rxvkC1QcDp2W9mTiHTqwOHi0A==
X-Received: by 2002:a05:6830:1af8:: with SMTP id c24mr26196068otd.362.1576008550671;
        Tue, 10 Dec 2019 12:09:10 -0800 (PST)
Received: from ?IPv6:2605:6000:e947:6500:6680:99ff:fe6f:cb54? ([2605:6000:e947:6500:6680:99ff:fe6f:cb54])
        by smtp.googlemail.com with ESMTPSA id j130sm1751309oia.34.2019.12.10.12.09.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 12:09:10 -0800 (PST)
Subject: Re: [PATCH][resend] sh: kgdb: Mark expected switch fall-throughs
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Paul Burton <paul.burton@mips.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <87o8wgy3ra.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <35e63e37-6ec8-8a47-8e18-639c954732e0@landley.net>
Date:   Tue, 10 Dec 2019 14:12:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87o8wgy3ra.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 12/10/19 2:38 AM, Kuninori Morimoto wrote:
> 
> Hi Andrew
> 
> I'm posting this patch from few month ago,
> but it seems SH maintainer is not working in these days...

Again, I dunno where you're getting that.

(Me, I removed the -Werror...)

Rob
