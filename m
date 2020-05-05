Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EC71C54AC
	for <lists+linux-sh@lfdr.de>; Tue,  5 May 2020 13:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgEELpD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 5 May 2020 07:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728584AbgEELpC (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 5 May 2020 07:45:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D2BC061A0F
        for <linux-sh@vger.kernel.org>; Tue,  5 May 2020 04:45:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b2so1264820ljp.4
        for <linux-sh@vger.kernel.org>; Tue, 05 May 2020 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIfWdRq9yyjwaPNLBB1WhcLPviYtpHs1y/6Em0UoQzc=;
        b=N4hxmyzj9lyf6o8bph0ivG/R3yiX7+7av0Z3hbRgE3G1P9nJfWcbLP48L+DmBUPdRL
         iS7tdHnci9lYc5jibCU27M9cIyiBouV3TGfHBxmomzZlTAA+K4jvmlfO+0PUY5gOJwWk
         INzBNV9RdyU4hz+KA3qMcbJKjE4Nef1pYkIpykiFiNhgkJ8IjX1SCD4/KaX9gsrjw7UM
         PqB5v5UISICWvKpUwJeHeWlT+kuUlYh2Fy7unW4FPr071vxBMvN/2bqL0KNaC/NHAxF/
         T4cTLz3YQkpT0ozMLHkIMjfiTRUu5z91/BjdSvFzNbqdymSh9Jx5aHZO1PEyCLvLAOi3
         ZMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIfWdRq9yyjwaPNLBB1WhcLPviYtpHs1y/6Em0UoQzc=;
        b=J7G3KHvX/StSJUHgKGx0pCljY5S/jo31gSALAfcXT6Yplj9lxaPM30HHyPipmiJ717
         CrojBwxjCRo3fmhYQzOELg29A62KhRYlXzP76RHPmmdt+hOUtg23EGYBS1UdgwOSuRdr
         1yAREuMl9O2DAQ9WelYTNIx6Xb54EuGuemGBy/Qsho5zvYoTyizoJStb6E6OWChG8v9f
         gi/0IwZnOGHeSAp7ip5zm3pjHUAXoChP68vokZj7r2MrGXc6QIMCSm2I0r6RDjeMoQMg
         0ShaEkcs+XUh2l9X415oNIuw5qIgtzjPJR8GsKX4Ja8SoA6AbYqWpBeFJ+iNeOdWRRUu
         /PIw==
X-Gm-Message-State: AGi0PuZdOy+fVoCw4DTk3k9Ah9829A5IVbTeiER4SHKd8NBGg7eyqxlO
        xL5rHBPFJ2BBk2EM7AmqZu9oXZ5VjmpBJLRnzJKPtA==
X-Google-Smtp-Source: APiQypJYtnxQWEbjes9DIO+nQO7CpHNG6KYJaneU9CBZe2/UNds1SHP++W+raV03+mh53wSUVZj+nsFewgw6YpANntc=
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr1481524ljm.215.1588679100508;
 Tue, 05 May 2020 04:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200429214954.44866-1-jannh@google.com> <20200429214954.44866-4-jannh@google.com>
 <20200505105023.GB17400@lst.de>
In-Reply-To: <20200505105023.GB17400@lst.de>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 5 May 2020 13:44:34 +0200
Message-ID: <CAG48ez26DT2v7QQEbbur8LL+tQskrTBLCW+eW__RTOpezte6rw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] coredump: Refactor page range dumping into common helper
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
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

On Tue, May 5, 2020 at 12:50 PM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Apr 29, 2020 at 11:49:52PM +0200, Jann Horn wrote:
> > Both fs/binfmt_elf.c and fs/binfmt_elf_fdpic.c need to dump ranges of pages
> > into the coredump file. Extract that logic into a common helper.
> >
> > Any other binfmt that actually wants to create coredumps will probably need
> > the same function; so stop making get_dump_page() depend on
> > CONFIG_ELF_CORE.
>
> Why is the #ifdef CONFIG_ELF_CORE in gup.c removed when the only
> remaining caller is under the same ifdef?

Oh, whoops, good point - I should go put that back.
