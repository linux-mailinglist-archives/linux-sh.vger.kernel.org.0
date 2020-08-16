Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE1F2456B4
	for <lists+linux-sh@lfdr.de>; Sun, 16 Aug 2020 10:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgHPIex (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Aug 2020 04:34:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44467 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgHPIew (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 16 Aug 2020 04:34:52 -0400
Received: by mail-ot1-f65.google.com with SMTP id h22so11058016otq.11
        for <linux-sh@vger.kernel.org>; Sun, 16 Aug 2020 01:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dnehVfwEdHFEdLJ9GboYMJf7h32BUmzH1CqLIb5M+RQ=;
        b=Yv3/ZqfHPpGLp85OJt+JHkuP4rCgB2w98FW2mV64LELu1eIFCAQvAyc3KToT0D/3DE
         IzWdPMoE/wuT/+hJLEntxTmOsaFWm49bu4coCfDftsCAiInDvdrsEJLhNVmAVHG9PKp8
         +ThedJQDiZC619m9Erg6UZqfClfpuyaGtiXg+xhDut0liGrFq5pzokLs8TeD0l5+vxkH
         iTF4qfwdrTFd4z8Bqsdd8DfgKzJfcDRXOytjmXWuIfDYMH7XJ/8TLeGeW4wiMGOYwdtW
         NP7JE3fhYB1qtL0Kf8PNJ/bdteWH13R6vMkUhIPX5QK1VRklBtBDUUeVtQm+dwq5vv80
         mPFA==
X-Gm-Message-State: AOAM532iqTEHiYjLVuKDzV72RgSEj7fvGoAE//rRpyyY9QzfuFYIQHFn
        ToWp3AvcnvIV2mVl+xPDVtFqd8TUerKfuOL1Lx4zmo+H
X-Google-Smtp-Source: ABdhPJyNfwgzxP06fT+FS69hCqHmNkyoRh6zzep7gzpo4r/vDtgHqHWQA3CZTNpkE9pGNzLBBUAoMTBHT4eaz9GYmbk=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr7665692otn.250.1597566891474;
 Sun, 16 Aug 2020 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <b9ea23ec-4925-aee6-07a8-571971a42194@physik.fu-berlin.de>
 <6ad2b6e9-cd0c-5d31-1183-37fdfe2d3ff1@physik.fu-berlin.de>
 <20200815021754.GR3265@brightrain.aerifal.cx> <66205dc3-0193-9aad-b0c6-01d49655f8d3@physik.fu-berlin.de>
In-Reply-To: <66205dc3-0193-9aad-b0c6-01d49655f8d3@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Aug 2020 10:34:40 +0200
Message-ID: <CAMuHMdVunSe+2OPg3kSaeLoX-AUOWqHHNb=8AZi1x2DhNOeQeA@mail.gmail.com>
Subject: Re: Ping: Pull Request for 5.9
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Adrian,

On Sat, Aug 15, 2020 at 12:41 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> @Geert: What about that patch to fix the serial interface on LANDISK?

It's a fix for serial parity handling for SCIF, and thus not really needed for
a serial console.    No need to worry, as it's already in.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
