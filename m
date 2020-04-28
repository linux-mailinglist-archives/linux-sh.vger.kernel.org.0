Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E469E1BB4BC
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2020 05:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgD1DgF (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 Apr 2020 23:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgD1DgE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 27 Apr 2020 23:36:04 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68993C03C1A9
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:36:04 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so15655111lfg.9
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q1Hl4EoAQeecS6RJeMB353EzxseO3r7Hp2yIzNObp3I=;
        b=SplrAUntYpA62B1N75YvHPdEO4shjtitO6O7fp81NGqZCL/liBkn4YGhS2ufiW89mA
         6QRtLc38lw6xNb2vgvLJDvqC9mE3aqUJAqwD+PeOfBSBP94LeZ1hMSN6COmTdIaxaQpS
         UpK5WWl4Kpc44DM72q0SRTuLkDG5Cy7pTFjlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q1Hl4EoAQeecS6RJeMB353EzxseO3r7Hp2yIzNObp3I=;
        b=GONNa9S3MR1cFgOrSCEhPf8vCmSuK2quw52OVfaYpoY8/aN3E1yYB1ogAV7wse2sGE
         oGAzE1MSN4+4i2qw/rPHwHCgBpSvMS5rKjJ3cZmbRiwvHCVxl1l65cvaHN2/QWndKUku
         ui9qIzK8KrB0yQ9hGwn0P5u9HVfLVzakDc3R7ee0Tk6h4zJoHWef0BiUz+86ZJz3xGaE
         YKelwv6rJnT8hR6loOzjsKaUKOTzrp4hk3iUXbjOsgjq8oL9PJxrIx7cFbd+wwdYMzo/
         7+DwCvvxCCkVNg+d/mJJnhfmqWTogt316ghse0YQ84c9fC7fGji7NOSoPTz96+3ymoYG
         SLjQ==
X-Gm-Message-State: AGi0PuYcsQ+rIL8KUJ4PbQPGw48ywQh2qBE5W08nczFC5hOV0ym4YbXq
        1sRqJ+xWTErVvOseK03XUm/ENq7NsvQ=
X-Google-Smtp-Source: APiQypKGsd5kYGWlEK5vU73nWJ0+M2aZ0m+7Htyc912WdUEjaIRJEplIvvcjhhuE75ZP5jocX5xVig==
X-Received: by 2002:ac2:5109:: with SMTP id q9mr17374243lfb.145.1588044962839;
        Mon, 27 Apr 2020 20:36:02 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id j8sm12794698lfk.88.2020.04.27.20.36.02
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 20:36:02 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id d25so734092lfi.11
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:36:02 -0700 (PDT)
X-Received: by 2002:a19:9109:: with SMTP id t9mr18095968lfd.10.1588044961861;
 Mon, 27 Apr 2020 20:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200428032745.133556-1-jannh@google.com> <20200428032745.133556-3-jannh@google.com>
In-Reply-To: <20200428032745.133556-3-jannh@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 27 Apr 2020 20:35:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSYTpTH0X8EcGGJD84tsJS62BN3tC6NfzmjvXdSkFVxg@mail.gmail.com>
Message-ID: <CAHk-=wjSYTpTH0X8EcGGJD84tsJS62BN3tC6NfzmjvXdSkFVxg@mail.gmail.com>
Subject: Re: [PATCH 2/5] coredump: Fix handling of partial writes in dump_emit()
To:     Jann Horn <jannh@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Apr 27, 2020 at 8:28 PM Jann Horn <jannh@google.com> wrote:
>
> After a partial write, we have to update the input buffer pointer.

Interesting. It seems this partial write case never triggers (except
for actually killing the core-dump).

Or did you find a case where it actually matters?

Your fix is obviously correct, but it also makes me go "that function
clearly never actually worked for partial writes, maybe we shouldn't
even bother?"

             Linus
