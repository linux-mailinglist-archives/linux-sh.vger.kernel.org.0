Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A0D17B069
	for <lists+linux-sh@lfdr.de>; Thu,  5 Mar 2020 22:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCEVRG (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Mar 2020 16:17:06 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37729 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgCEVRE (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Mar 2020 16:17:04 -0500
Received: by mail-pj1-f67.google.com with SMTP id o2so123613pjp.2
        for <linux-sh@vger.kernel.org>; Thu, 05 Mar 2020 13:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v1upWCD1mlNbaZtpOS/pHEyeFFYjDyZbTGORJ9Hi0Po=;
        b=XNKMdglo9YOUj0vtGHLxx4w9M+D74XpIcU4euCxAw/oRnX95qUBq3YYOSLvlws4gkk
         atLHgbiIjNl4Lp9deokObeR0JVIWdr2FmZPhgIfkwyijrv/GEYGYZm2UEGlBVLPDxs+J
         0LEUO4jLu6BKbSOTzI6Mg6d7fY6bdnZ4QBEbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v1upWCD1mlNbaZtpOS/pHEyeFFYjDyZbTGORJ9Hi0Po=;
        b=sQxrrW1e47UiaG27as5Z5Op/7J40K9EAR3qolZjq9A15L5HYw70mMd1MOlHv+tdNkc
         Q54gbhqafurRQ6PFX24Tyyu1m+3PO0613Ph2sAQklK5WKgsKJUsCqDh8hWZyntF6opHO
         5nOTI8dRDhCUbWc+sdqu/3LZgqgcfRQss1ZRgdKaoK3dipjh/4NdZUgphf7RCh1Z/cWV
         xT6VKzGCtgqrF9V27GfR6jFEM9j1UxkG2BarNCtC1psY2Fd7QsIU2nMuFne+GuBnXs/+
         TSvH0DqBo3LnMvWL+QD/U9AS0EAy1QD930h2GAaiMgE/eXokg0xQamj2CMfHB3pJpQoX
         GPYg==
X-Gm-Message-State: ANhLgQ34GjG8+/hxGLlRvg3zgUY8XgBrF4vvFU2dVGhJLFlz3fCCzTyV
        mGe6TxgKdQrTTfaAmr4V9hbbWw==
X-Google-Smtp-Source: ADFU+vuo71xr7b8efmkr7fBfrfvy+omdGcPEhfxnxPNTCL+ixBfzvYE9MKbAXGRIxUwFoXEpYSZksw==
X-Received: by 2002:a17:902:b617:: with SMTP id b23mr10279367pls.285.1583443023339;
        Thu, 05 Mar 2020 13:17:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y23sm13916086pfb.76.2020.03.05.13.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 13:17:02 -0800 (PST)
Date:   Thu, 5 Mar 2020 13:17:01 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Tycho Andersen <tycho@tycho.ws>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Joe Perches <joe@perches.com>,
        "Tobin C . Harding" <me@tobin.cc>,
        kernel-hardening@lists.openwall.com,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: Stop printing the virtual memory layout
Message-ID: <202003051310.F4AC41A@keescook>
References: <202003021038.8F0369D907@keescook>
 <20200305151010.835954-1-nivedita@alum.mit.edu>
 <f672417e-1323-4ef2-58a1-1158c482d569@physik.fu-berlin.de>
 <31d1567c4c195f3bc5c6b610386cf0f559f9094f.camel@perches.com>
 <3c628a5a-35c7-3d92-b94b-23704500f7c4@physik.fu-berlin.de>
 <20200305154657.GA848330@rani.riverdale.lan>
 <456fddd9-c980-b0f2-9dd0-19befee7861e@physik.fu-berlin.de>
 <20200305155628.GA857024@rani.riverdale.lan>
 <20200305205158.GF6506@cisco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305205158.GF6506@cisco>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Mar 05, 2020 at 01:51:58PM -0700, Tycho Andersen wrote:
> On Thu, Mar 05, 2020 at 10:56:29AM -0500, Arvind Sankar wrote:
> > On Thu, Mar 05, 2020 at 04:49:22PM +0100, John Paul Adrian Glaubitz wrote:
> > > On 3/5/20 4:46 PM, Arvind Sankar wrote:
> > > > Not really too late. I can do s/pr_info/pr_devel and resubmit.
> > > > 
> > > > parisc for eg actually hides this in #if 0 rather than deleting the
> > > > code.
> > > > 
> > > > Kees, you fine with that?
> > > 
> > > But wasn't it removed for all the other architectures already? Or are these
> > > changes not in Linus' tree yet?
> > > 
> > > Adrian
> > 
> > The ones mentioned in the commit message, yes, those are long gone. But
> > I don't see any reason why the remaining ones (there are 6 left that I
> > submitted patches just now for) couldn't switch to pr_devel instead.
> 
> If you do happen to re-send with pr_debug() instead, feel free to add

(FYI, pr_devel() was suggested, not pr_debug() -- the former is
compile-time enabled with DEBUG and the latter can be enabled dynamically
in some cases in the kernel, so pr_debug() should not be used.)

> my ack to that series as well. But in any case, this one is also:
> 
> Acked-by: Tycho Andersen <tycho@tycho.ws>

Same for me. :) Consider the series:

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
