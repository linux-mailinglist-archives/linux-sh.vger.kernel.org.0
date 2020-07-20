Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5992271F8
	for <lists+linux-sh@lfdr.de>; Tue, 21 Jul 2020 00:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGTWGE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 20 Jul 2020 18:06:04 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33747 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726109AbgGTWGE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 20 Jul 2020 18:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595282762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ui4TgDlV8SNq6AEy7rMKlPf4tS22AT8vC1X2BWWDx3M=;
        b=CozcxmpXZ6Q9oVbAZUbsVqv5HvyHZW6LWa6YqjpuaxkEOXC7WzgWuwp6AQicMEMRZnHxG4
        hbVbDzNU6mAq8rl+K8tPNInnQKIOW0EyktguhF1WHmBubgogc5IURNq3mIi4pf/k/pW/p2
        t34yvzdxkayEn9kP9cZ5dHE8G9LfQrU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-NJCRfxU0OSawQ9XicQWlfQ-1; Mon, 20 Jul 2020 18:06:01 -0400
X-MC-Unique: NJCRfxU0OSawQ9XicQWlfQ-1
Received: by mail-qv1-f70.google.com with SMTP id x37so11092246qvf.4
        for <linux-sh@vger.kernel.org>; Mon, 20 Jul 2020 15:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ui4TgDlV8SNq6AEy7rMKlPf4tS22AT8vC1X2BWWDx3M=;
        b=ko4gLScTiDuP9ZeeyKZZ5BEZ1ha84sfX7TcevV2S+0ZD5xugY1n9iAmRw0t23/ICUe
         Z7aMZ1ma4+uq6O1fvoEMXaVfAicqXaF7Qyub+9ZED4V3R6oUijB6Rl8QCR5drVExAEJa
         3PN0zg3whfq47T0J2GiTV9n7LjllD6dqdD/NUcXFy5IWSGce/RG4Yx/oFAAJdlnxbScd
         KeUc76p9ZF4L2EX1wWIVgbDSGWLp8dlz0LPNxe6sZTewXN0/8HS/HzaOsbOZlfhb9Kp6
         wvhv7gjS6kB6fWrCYfKjxDNvBSs7wSycij9ksz9x8WzFER/8gaUDcddBG60DzK1PWYxI
         zhiw==
X-Gm-Message-State: AOAM532nfBtBKQfr3H4+iVgdUC5YQJ6NtrYb0IM4l9LEK77+GRSGQIM4
        lCEe/IElIpPJW2OdkGGkcocSurvqgdf3yKtvhfczp0QO8/6lyTgBkKBLoXTHgfb/FQtbt42mrtr
        d5A7g6JrdY9GiPwLa+S8=
X-Received: by 2002:ac8:5691:: with SMTP id h17mr27088645qta.35.1595282760684;
        Mon, 20 Jul 2020 15:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxktMziFRW26sqcuKCe1BiUW9KgrudLEhWcfpNy5hfiS8Zzypyg7oYWH9pVueXeHLJsRJoD/g==
X-Received: by 2002:ac8:5691:: with SMTP id h17mr27088613qta.35.1595282760176;
        Mon, 20 Jul 2020 15:06:00 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c8:6f::1f4f])
        by smtp.gmail.com with ESMTPSA id y12sm18742348qto.87.2020.07.20.15.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:05:59 -0700 (PDT)
Date:   Mon, 20 Jul 2020 18:05:57 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Rich Felker <dalias@libc.org>
Cc:     linux-kernel@vger.kernel.org,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH 20/25] mm/sh: Use mm_fault_accounting()
Message-ID: <20200720220557.GP535743@xz-x1>
References: <20200615221607.7764-1-peterx@redhat.com>
 <20200615222306.8502-1-peterx@redhat.com>
 <20200720212524.GL14669@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20200720212524.GL14669@brightrain.aerifal.cx>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi, Rich,

On Mon, Jul 20, 2020 at 05:25:24PM -0400, Rich Felker wrote:
> What's the status on the rest of this series? Do you need any action
> from my side (arch/sh) at this time?

This series should have been queued by Andrew in -next.  So iiuc no further
action is needed.

Thanks for asking,

-- 
Peter Xu

