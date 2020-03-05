Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D208717B005
	for <lists+linux-sh@lfdr.de>; Thu,  5 Mar 2020 21:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCEUwH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Mar 2020 15:52:07 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:38695 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgCEUwG (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Mar 2020 15:52:06 -0500
Received: by mail-yw1-f66.google.com with SMTP id 10so86706ywv.5
        for <linux-sh@vger.kernel.org>; Thu, 05 Mar 2020 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tycho-ws.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rH1kRgRamv58/PWKnkrnSTZWeEPtKbW21oLiW57uMY8=;
        b=uRFzyUvBwn6/q/kY0ilgjuzyuH6Z4OE1w9PzgdiwYLKHPiHjGNAxLmJn8z/C6zuJ82
         zyhdRkdrYTsRXXCr/XScXu6ZjFv8YDd24ruOvHuzRTFfKOTrqxmOZ+TofbRvReGhN8ZG
         /sKtSunD8xqVXLbEg4PnvoVVJ0pYcnUVQ/l7VbxiYC2Q03oTO9zWuVxrY77WGSr/U/lx
         Z9aYehlB4+OtaZ9UTnS34vvEZV9vOhNnoS6i6PtqW4AIKUzuwyyg4RBrlq6ky4QExcce
         MqAbBx7AF6/E3ekKGZTx54gf1FOP9huiNGf87bhRm3quItdUYVh9+Wk/AbYCOtZStlR/
         L9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rH1kRgRamv58/PWKnkrnSTZWeEPtKbW21oLiW57uMY8=;
        b=k6KYeBJgvPNyhGy5Umkc4DVFT9JwxVysx8hpLxT9g9v+q+/MU83yXflHnmBuhRICb/
         YAx7udldoaH/4aG8mzmef5h1KtEcMLh2F972iI5vTwi9gFevASBQ0R9Ot9eBRphYFWB8
         U3BdZkvVD82Nr5bWO9AV72l1VEelgacswBfz8YREn8C91jg4xqHlczE8MTzR7N2jQXjC
         bUv+wNJXRkJlO3AeX6ZmApoFAOcYf9TVuMulGMlmrPy3QGX/4uDJYCuG8oXo0tKG5GTc
         xYPJfJwuHVng0yRncyuc20swZXdcGprWyzzbpQAa1Ww4TS9IIU2WpzNRKQkRKijwA89G
         aqrQ==
X-Gm-Message-State: ANhLgQ1L+ijuJ+nWWKTjvYj7mYpv0MHdUDFW6cK242L1EaCvkAOEx6vn
        pFLbNydVDgnr56aOHELDIZUSAQ==
X-Google-Smtp-Source: ADFU+vuUrQamPRTnwCtkAj507QoOwrXbHzBwwWDHh1EiihLsrBz1jv619SOn66N1Nsiie+NG8gSp+w==
X-Received: by 2002:a25:4843:: with SMTP id v64mr101146yba.315.1583441524439;
        Thu, 05 Mar 2020 12:52:04 -0800 (PST)
Received: from cisco ([2607:fb90:17d4:133:1002:9a44:e2a2:4464])
        by smtp.gmail.com with ESMTPSA id y77sm6647112ywg.66.2020.03.05.12.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 12:52:03 -0800 (PST)
Date:   Thu, 5 Mar 2020 13:51:58 -0700
From:   Tycho Andersen <tycho@tycho.ws>
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        "Tobin C . Harding" <me@tobin.cc>,
        kernel-hardening@lists.openwall.com,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: Stop printing the virtual memory layout
Message-ID: <20200305205158.GF6506@cisco>
References: <202003021038.8F0369D907@keescook>
 <20200305151010.835954-1-nivedita@alum.mit.edu>
 <f672417e-1323-4ef2-58a1-1158c482d569@physik.fu-berlin.de>
 <31d1567c4c195f3bc5c6b610386cf0f559f9094f.camel@perches.com>
 <3c628a5a-35c7-3d92-b94b-23704500f7c4@physik.fu-berlin.de>
 <20200305154657.GA848330@rani.riverdale.lan>
 <456fddd9-c980-b0f2-9dd0-19befee7861e@physik.fu-berlin.de>
 <20200305155628.GA857024@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305155628.GA857024@rani.riverdale.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Mar 05, 2020 at 10:56:29AM -0500, Arvind Sankar wrote:
> On Thu, Mar 05, 2020 at 04:49:22PM +0100, John Paul Adrian Glaubitz wrote:
> > On 3/5/20 4:46 PM, Arvind Sankar wrote:
> > > Not really too late. I can do s/pr_info/pr_devel and resubmit.
> > > 
> > > parisc for eg actually hides this in #if 0 rather than deleting the
> > > code.
> > > 
> > > Kees, you fine with that?
> > 
> > But wasn't it removed for all the other architectures already? Or are these
> > changes not in Linus' tree yet?
> > 
> > Adrian
> 
> The ones mentioned in the commit message, yes, those are long gone. But
> I don't see any reason why the remaining ones (there are 6 left that I
> submitted patches just now for) couldn't switch to pr_devel instead.

If you do happen to re-send with pr_debug() instead, feel free to add
my ack to that series as well. But in any case, this one is also:

Acked-by: Tycho Andersen <tycho@tycho.ws>
