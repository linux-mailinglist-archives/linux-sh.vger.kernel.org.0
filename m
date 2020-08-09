Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68E323FFDB
	for <lists+linux-sh@lfdr.de>; Sun,  9 Aug 2020 21:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgHITWR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 9 Aug 2020 15:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgHITWR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 9 Aug 2020 15:22:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50CAC061756
        for <linux-sh@vger.kernel.org>; Sun,  9 Aug 2020 12:22:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w25so7313975ljo.12
        for <linux-sh@vger.kernel.org>; Sun, 09 Aug 2020 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xc+Z+0lsHKSAn5QFQ32TjlYE4pcyYc/9qjSRlqBK+g8=;
        b=E296t1eWcYSGF3gH+4bFJTtB+NdTGY3gBmPSUExO/KnpAA4RUD1q6K5qDaHE7dIFiE
         rT2EFMmfOFLD5aY7MBl4GP4+ii6AOPjZFGGsdnz8py87zLp2RPy4gZjt5xb8FtMSIXkd
         AeCGRym3WTkVJyJ9Mu/0ScpKSTlHKlQqZm4zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xc+Z+0lsHKSAn5QFQ32TjlYE4pcyYc/9qjSRlqBK+g8=;
        b=dB0ZRUsBrQDY/8ylaGfTJp6EFwKWuh3GITVPqH9yMRazQea7citaYzQHX51s9vBba/
         Xybp6tnP53FgNfHBFdteklxZHnFFqjf1kJlbjkx5pdwNxxLGpDsUUoSoM+L03MtL5Lzy
         q6ZVIpoFUpVl5a0rjqzpHNLoZsY4mzybVyDoDi8B76/0rJjgwLMNIJVl3AztWHzZTUjM
         tDG3Vw27N7Z2ZDNuHjtKG2eRA34kAxCsCFSjS3+R9sLepnlMoU3BS6AZ0KmvLgq2amqn
         6Bp+ttcQvQ2GZSomFHwhkAN5AfSaURT4WwRYuJ02wWz6nKgSE169sKKl/NeHOQ8PMx2k
         vy6w==
X-Gm-Message-State: AOAM532bVAZ9OETkU2ykLYCYyT6Wv9nGvxvzrNQKtcvM31dfH+MRLu5f
        DUVmxLwUA27vLtLpjHdfYoRRzKALe78=
X-Google-Smtp-Source: ABdhPJx63JXjB0TKh2sCnbOzcSkCB25ApLojFMIEphr/BS0HEXExtBOpEgNv2a7UZ4OghW6wIP8h9g==
X-Received: by 2002:a2e:3802:: with SMTP id f2mr9520960lja.212.1597000934811;
        Sun, 09 Aug 2020 12:22:14 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 5sm9392057lfz.35.2020.08.09.12.22.13
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 12:22:14 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id j22so3608160lfm.2
        for <linux-sh@vger.kernel.org>; Sun, 09 Aug 2020 12:22:13 -0700 (PDT)
X-Received: by 2002:a19:c206:: with SMTP id l6mr11270363lfc.152.1597000933418;
 Sun, 09 Aug 2020 12:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <9c2d391c-6463-398e-95a1-8f238d739340@physik.fu-berlin.de>
 <20200809161438.GZ1236603@ZenIV.linux.org.uk> <20200809174508.GA3026725@ZenIV.linux.org.uk>
In-Reply-To: <20200809174508.GA3026725@ZenIV.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 9 Aug 2020 12:21:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1ocV0dk=DXLgT01Eqg0Xnm65Hfq44=8p5yPu8=jrt5A@mail.gmail.com>
Message-ID: <CAHk-=wi1ocV0dk=DXLgT01Eqg0Xnm65Hfq44=8p5yPu8=jrt5A@mail.gmail.com>
Subject: Re: [regression fix] Re: "sh: convert to ->regset_get()" breaks
 linux-sh build
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sun, Aug 9, 2020 at 10:45 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, there are several ways to handle that.  One is to pull vfs.git#fixes -
> that's the first commit of #regset.followups.  Another is to cherry-pick
> the same.  And the minimal fix would be the subset of that commit as below.
> Linus, what would you prefer?

Mind just sending me a proper pull request for the fixes branch with
that one commit?

               Linus
