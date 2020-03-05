Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7FA17AD5C
	for <lists+linux-sh@lfdr.de>; Thu,  5 Mar 2020 18:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCERew (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 5 Mar 2020 12:34:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45221 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgCERev (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 5 Mar 2020 12:34:51 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so3073179pfg.12
        for <linux-sh@vger.kernel.org>; Thu, 05 Mar 2020 09:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xEAJ1NUXPHu81BkE5lRF70aT//8/AuwgSjMAA/AA9VY=;
        b=LWAX/mnHWCEyMQS79Ze1HibVuhsx2iRhWybu/OIfRIhEMmxafA+jO26+0CcM8GqZKp
         bj465loQBo/50XZIGBZ/ylnMWfJX66dz1JBN7/OtzDfydSHSgNy9SDYwXcCo8Xg96Vmr
         Yt9ah3j9GlG/34Y7n1Z4iDB3Jgr4sgDvvLFHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xEAJ1NUXPHu81BkE5lRF70aT//8/AuwgSjMAA/AA9VY=;
        b=Oxd7J5JDcPsDDFaH2rQAZFj+UoK61HHHARt3n0/CM4H+jnPVXOGkl6LJOu1nDbZRoW
         9yzf0nt7mSWLC8GXkcVHi92FyFiC3h8Iz3rCAEUhAZ5b5nW9J29DBRfSCjOhwVxKJuLo
         I1QL+Ja5GCSmGJRzuEIN/4aThx0026kItdHrwQPo9ZrTApNBXXocfh8tRESpuZV2RYn9
         O/V/ynHLmgvM3EDOPYfpglkxzv0+X8CSfVkdHQ0DNi0jN3NffTJpw/IgY5bXW6vfy+Iy
         m0YwFPl6TDppAPMVx0ozZ1qw1PXw94sAeRTqv+nLcZHt4oiStIVGDMeMvJhcaoX4PD6G
         T09A==
X-Gm-Message-State: ANhLgQ1wSoawJtjy2WC8wBg0Kbgq6ZFj8rc7Jvr7Gv3fSrf5EQ/VaZ2b
        1dRmM/gr3PDeRVCpa3W9pdSjRA==
X-Google-Smtp-Source: ADFU+vuqTfC7B4BJz1/7pVQ/CWvKBqNiVRzuaTrFyEVgzlwk4wZWRxHJIk8rQLzAzPTg3iuU6kJDPA==
X-Received: by 2002:a63:7f14:: with SMTP id a20mr3441343pgd.428.1583429689456;
        Thu, 05 Mar 2020 09:34:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h29sm29954099pfk.57.2020.03.05.09.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 09:34:48 -0800 (PST)
Date:   Thu, 5 Mar 2020 09:34:47 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Joe Perches <joe@perches.com>,
        "Tobin C . Harding" <me@tobin.cc>, Tycho Andersen <tycho@tycho.ws>,
        kernel-hardening@lists.openwall.com,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: Stop printing the virtual memory layout
Message-ID: <202003050933.14BDEDBF1@keescook>
References: <202003021038.8F0369D907@keescook>
 <20200305151010.835954-1-nivedita@alum.mit.edu>
 <f672417e-1323-4ef2-58a1-1158c482d569@physik.fu-berlin.de>
 <31d1567c4c195f3bc5c6b610386cf0f559f9094f.camel@perches.com>
 <3c628a5a-35c7-3d92-b94b-23704500f7c4@physik.fu-berlin.de>
 <20200305154657.GA848330@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305154657.GA848330@rani.riverdale.lan>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Thu, Mar 05, 2020 at 10:46:58AM -0500, Arvind Sankar wrote:
> On Thu, Mar 05, 2020 at 04:41:05PM +0100, John Paul Adrian Glaubitz wrote:
> > On 3/5/20 4:38 PM, Joe Perches wrote:
> > >> Aww, why wasn't this made configurable? I found these memory map printouts
> > >> very useful for development.
> > > 
> > > It could be changed from pr_info to pr_devel.
> > > 
> > > A #define DEBUG would have to be added to emit it.
> > 
> > Well, from the discussion it seems the decision to cut it out has already been
> > made, so I guess it's too late :(.
> > 
> > Adrian
> > 
> > -- 
> >  .''`.  John Paul Adrian Glaubitz
> > : :' :  Debian Developer - glaubitz@debian.org
> > `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
> >   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> Not really too late. I can do s/pr_info/pr_devel and resubmit.
> 
> parisc for eg actually hides this in #if 0 rather than deleting the
> code.
> 
> Kees, you fine with that?

I don't mind pr_devel(). ("#if 0" tends to lead to code-rot since it's
not subjected to syntax checking in case the names of things change.)
That said, it's really up to the arch maintainers.

-- 
Kees Cook
