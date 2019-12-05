Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3721A11477C
	for <lists+linux-sh@lfdr.de>; Thu,  5 Dec 2019 20:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfLETJy (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Dec 2019 14:09:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46527 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLETJy (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Dec 2019 14:09:54 -0500
Received: by mail-ot1-f66.google.com with SMTP id g18so3537573otj.13
        for <linux-sh@vger.kernel.org>; Thu, 05 Dec 2019 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=20d5qRXT4h3Aj7j6m3duNxsgBzhRlyKJh3IbvE+5Fho=;
        b=J/6Yuz7JdXcqnJPvChPIerIDa9QROqY9XuceIxTRIJYYxh0OtF8Bs4JZnx0/QW2Y2S
         BbFuV06qeMU3tgcS62zJvmuFrVIhzkb+fuDi9EjVNwSImzsQEdytIrM+8Q6jT2r4tya7
         qWiq61aneCmrFauYqz/1bKBg+3etIBaBaNsvvlAWGojYSV69Nfwph6Ccxu2ufaTavIl6
         yadjiSHnPL7JHQEuK8fIkXV6+kFV/DoZOQUWISJArjne/MIGYEX/+gDHUiKS9vKfkcYV
         4fssLTr58W6Y55iv2a1Lj5UzVrvDtTEb+tX5Eqt1nu7YCCjadB1dj1e1krgSYocY4mKh
         bKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=20d5qRXT4h3Aj7j6m3duNxsgBzhRlyKJh3IbvE+5Fho=;
        b=E6OehIWypfE2qgaHbev5o6FFVkonyIOGsLOwzNCvq62jgRg4Bd5A9euOI65DqDfihe
         gri59AyjYyGx5ZLRcQSFmIUZx19/DS0RFK5EOu4u3aL+6A1Yxlbxbxa1gzRTDTh8oChq
         cpAPXxajbP5csXkEfBtk+hmT66ccI82alwBacThAn5Pw+TOxlcF/KmziUjnbolALv3tU
         abreGemAvJLzkOPqLj1DPO58bc5F1CZZX159y3pBTQa/vVAHUmx+rfbsBUfgNjrcNMMC
         +/9830Ameyx5vOPGTKfusTsDU87Iol4kTObVRpDrateweZe28Zm38imDO4/2lRCvdGEb
         33UQ==
X-Gm-Message-State: APjAAAUy56gnMfVXYXT1iNO1bMiL8J15dCePAxiCsmbPmlzxlJqtvRbt
        gP159Mch8TlDTQrb7v8c/trx9dRc3vA=
X-Google-Smtp-Source: APXvYqzy1b6I1gohEeph6A4mtcIpvgBmIa8dfuXZRwioA7rXlcOMM5/Kec8/oh+PMQB4dB5OSG2BEA==
X-Received: by 2002:a9d:3af:: with SMTP id f44mr7708161otf.332.1575572993685;
        Thu, 05 Dec 2019 11:09:53 -0800 (PST)
Received: from ?IPv6:2607:fb90:d77:c7b2:6680:99ff:fe6f:cb54? ([2607:fb90:d77:c7b2:6680:99ff:fe6f:cb54])
        by smtp.googlemail.com with ESMTPSA id o2sm3853709oih.19.2019.12.05.11.09.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 11:09:53 -0800 (PST)
Subject: Re: [PATCH v2] drivers: Fix boot problem on SuperH
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <20191203205852.15659-1-linux@roeck-us.net>
From:   Rob Landley <rob@landley.net>
Message-ID: <4e06aa64-59e1-888d-184a-0cb49ac175d5@landley.net>
Date:   Thu, 5 Dec 2019 13:13:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203205852.15659-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 12/3/19 2:58 PM, Guenter Roeck wrote:
> SuperH images crash too eearly to display any console output. Bisect
> points to commit 507fd01d5333 ("drivers: move the early platform device
> support to arch/sh"). An analysis of that patch suggests that
> early_platform_cleanup() is now called at the wrong time. Restoring its
> call point fixes the problem.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Yup, I need this too.

Acked-by: Rob Landley <rob@landley.net>

Rob
