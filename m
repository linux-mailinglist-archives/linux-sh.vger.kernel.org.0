Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD94A2A5BA
	for <lists+linux-sh@lfdr.de>; Sat, 25 May 2019 19:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfEYRH4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 25 May 2019 13:07:56 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:36780 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfEYRHx (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 25 May 2019 13:07:53 -0400
Received: by mail-lj1-f173.google.com with SMTP id z1so5806584ljb.3
        for <linux-sh@vger.kernel.org>; Sat, 25 May 2019 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5ktK9kr4E0UpbbeaHLRBxZcSjVJhVPG4g8QF69sVmY=;
        b=blWPgG96+VVQqIzaWJtzwSPl1QZ1S0Z04iNWgu72UYrrEMJjAjb0uL1VklvosGRad1
         QjwqdkB2pvLto1OJmIjJxoAO0TOZpQ+qmzwwgKrs9zICCkP//YwaeBtPKJ0BOb1W3+mo
         iEJkOggeA90YvBtGTsZFgAObtE+OMxPecZ/Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5ktK9kr4E0UpbbeaHLRBxZcSjVJhVPG4g8QF69sVmY=;
        b=a4NYJc6gCU+lYt9G5Z3cLsjtAeHx60fxmE/bdbxTD2yHGAXjC3SVQOJNPPEhZix8o8
         DLL6OzkqTwGiOk/6NpJ8tf5Jj/6zXn+46Su//cBrvn5l3Y6zLtPui9PC/LhYWINzz7RH
         m+lTehWjv18/r7GY8lz9BDUE+L9wHhrQrf0tB+H/Kf+QVr24d0vZwtT+uSbFAemSrZ4l
         vdQWhQ4uJgGGQSkQ1Z3dXUxXI6ThHbbHadqpn3J9Ska0aosPLzgptbBpxoan0HeG+3KM
         Io4qO4dTkWb+zSgH9GsKwDxDwDJOElphu/eRN6LWSOMgEZyWmVzaXdJl14arhnDdQvpd
         BuwA==
X-Gm-Message-State: APjAAAWSjQYvtvwia+vn8EpvCpMAsyOa2QT89BnHnIjnO+fgs9gbTQTk
        Sd5uRTruBBbpPKEZ+FNOI8fEnwH3OOw=
X-Google-Smtp-Source: APXvYqxQeAdPiLDls57Z4ds63qmFfF0AEOjuFdc9uQiEk5j0J6DjDCAhWyISIcSxc0whKoZ1El6Tnw==
X-Received: by 2002:a2e:6109:: with SMTP id v9mr3560561ljb.205.1558804070298;
        Sat, 25 May 2019 10:07:50 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id r27sm1247217lfp.73.2019.05.25.10.07.48
        for <linux-sh@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 10:07:49 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id m15so8664654lfh.4
        for <linux-sh@vger.kernel.org>; Sat, 25 May 2019 10:07:48 -0700 (PDT)
X-Received: by 2002:a19:be17:: with SMTP id o23mr28987773lff.170.1558804068519;
 Sat, 25 May 2019 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190525133203.25853-1-hch@lst.de>
In-Reply-To: <20190525133203.25853-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 May 2019 10:07:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7=yxWUwao10GfUvE1aecidtHm8TGTPAUnvg0kbH8fpA@mail.gmail.com>
Message-ID: <CAHk-=wi7=yxWUwao10GfUvE1aecidtHm8TGTPAUnvg0kbH8fpA@mail.gmail.com>
Subject: Re: RFC: switch the remaining architectures to use generic GUP
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Looks good to me apart from the question about sparc64 (that you also
raised) and requesting that interface to be re-named if it is really
needed.

Let's just do it (but presumably for 5.3), and any architecture that
doesn't react to this and gets broken because it wasn't tested can get
fixed up later when/if they notice.

              Linus
