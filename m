Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28040119185
	for <lists+linux-sh@lfdr.de>; Tue, 10 Dec 2019 21:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfLJUHc (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 10 Dec 2019 15:07:32 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40589 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfLJUHc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 10 Dec 2019 15:07:32 -0500
Received: by mail-oi1-f194.google.com with SMTP id 6so11019797oix.7
        for <linux-sh@vger.kernel.org>; Tue, 10 Dec 2019 12:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uQ5MRu7eBmHm6OUR1kwdbNENkUMzLBkNbzI6ewewfew=;
        b=QFhl7FGH4yA/EbDNh1tBvUtjp++JicNkBw3DI3RZqee01B04Au/qmKS3Xhe1MHcy4O
         ECOdiTwlIsP+XNKNVO15a4iowSTfQeQ/g2wtPzddiGndpmXwL30rHoIVk3OcgT5+KHFL
         mV4d4CyJIKaRjL6KBD6PxtcxGo8Lhq0fRDs6IWX5zPTuVPRGUAu2VvwLgMK7nSCpDgI5
         VvJ3FWJa/UsBY8xavAWhFP7VMuhS0FxHMiNEvEx6JRnEHKEG4odz+hhxRaKipFMLCNXF
         TJxFrCwWn8XjhXw+ZZHjWfv7ZBvqQTKMqpyfxyap6U7Ri+65xeqpPwIXvGcW1TLOg76b
         Y+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQ5MRu7eBmHm6OUR1kwdbNENkUMzLBkNbzI6ewewfew=;
        b=qwRLkn8JF32e3tdFVXap20zRQN86sZoTgHkJ0fgRQ7/Bm5K1ZAI2xK5oR0Iw2qKLpF
         LSKapGeIRS69OCB1y9z8h2Wg60udzfaOvMEEgawQN87a2QODZLxJObP1oTYUBgB4x+6R
         f8/8f9mZAkRga+YKo2F7vWZR2lICY6d67auGMLvliT8g6rdeg/gYdau/yXvgKGcJ1HN8
         viJc6wCD1MpPKKuBWQxc8G3hxpFqFChvQVQoKiLkDfUj9NCOYsBBxwzAwHGgJy5NZSQp
         wCeGKjhSS92/1QXFNLwvK8ZxgS4e0/NMBfN++J+SI7bHkOsCG2thLtSLEkIX9yg4IZPK
         ntZw==
X-Gm-Message-State: APjAAAW+fNU146qrEUHDmzpCCzt/vprTdQU09Q3+wsO1Kwu7MvaTA5Y/
        KapNzE5PzBoBZdmQNltApA7aAQ==
X-Google-Smtp-Source: APXvYqz5nQOo/8Xd2Gow6+zdGyPViUZp2xjc9+dGPEHwXmsSqAF5+nQC6/w6YTilfrBBZnw6M4SOTg==
X-Received: by 2002:a05:6808:210:: with SMTP id l16mr597004oie.95.1576008451827;
        Tue, 10 Dec 2019 12:07:31 -0800 (PST)
Received: from ?IPv6:2605:6000:e947:6500:6680:99ff:fe6f:cb54? ([2605:6000:e947:6500:6680:99ff:fe6f:cb54])
        by smtp.googlemail.com with ESMTPSA id m2sm1728359oim.13.2019.12.10.12.07.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 12:07:31 -0800 (PST)
Subject: Re: [PATCH][resend] sh: kgdb: Mark expected switch fall-throughs
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Paul Burton <paul.burton@mips.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <87muc1yqip.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <4b099e66-973a-8e75-9f62-801fc3b2f594@landley.net>
Date:   Tue, 10 Dec 2019 14:10:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87muc1yqip.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 12/9/19 6:26 PM, Kuninori Morimoto wrote:
> 
> Hi Greg
> 
> I'm posting this patch from few month ago,
> but it seems SH ML maintainer is not working in these days...

There's two of them and they both are? (I spoke to Rich on IRC last week?)

Rob
