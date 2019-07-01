Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68213C8B7
	for <lists+linux-sh@lfdr.de>; Tue, 11 Jun 2019 12:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405183AbfFKKUm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 11 Jun 2019 06:20:42 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39179 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404766AbfFKKUl (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 11 Jun 2019 06:20:41 -0400
Received: from 5HSWXM1 ([87.191.24.82]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mrwnt-1gmn4M05RN-00o00l; Tue, 11
 Jun 2019 12:20:23 +0200
Date:   Tue, 11 Jun 2019 12:20:20 +0200 (CEST)
From:   Rolf Evers-Fischer <embedded24@evers-fischer.de>
X-X-Sender: rolf@5HSWXM1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Rolf Evers-Fischer <embedded24@evers-fischer.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sh: dma: Add missing IS_ERR test
In-Reply-To: <CAMuHMdVGhd3KfRq9F+-Qzc7q5kJyczG1RRQDpgs4FqJpPwK4QA@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.99.1906111200560.3086@5HSWXM1>
References: <20190607115404.4557-1-embedded24@evers-fischer.de> <CAMuHMdVGhd3KfRq9F+-Qzc7q5kJyczG1RRQDpgs4FqJpPwK4QA@mail.gmail.com>
User-Agent: Alpine 2.21.99 (LNX 239 2017-12-04)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:whDOo69V0O8WmU3uuTAKRyDoVquQvT54J4HeBg/Yr3HgYZ3CjzP
 C2j7QukDFdAH9n8RV7T2iR6znt2fcKol4IU5omSqeRGKt5ixZNBO2hnXW2Iit4oNAXYorcy
 REDkx57sOeTSURGpgWmf4+fsUtFklgcaZzYcdrZ06vlS2DFGB8/R4mw30Vh+eHLzakgyIdt
 Nx/vyWWpFhQcWMDkLMj2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OGm9Xwwarbs=:TMek2VM/w38JcrExLRBLIp
 n1R5/VpcFsyhPxFjLjMKBBNVafoCaOcLYLBOFPgQTPdhqm6nASNpuIOB9X/6NjBIDsYDTUENK
 uadNwbKys6JjzXJUmUm1d3OJToEgd+IVLj7J90JqJpdi5o2nBAATIXiraDWetbtyj1YFy/Yn6
 IDZiIT+8AfgwIsm04wQaqAYzWmgh1yy792uxZ2w6EaI2yyMUl/9A9G8hqXiKmiTTO4sKwooO/
 PKA8l/C41eDaG/AT/fC6Mi8FOzA5Ffc9LSLu6hmAsKn0mRoqAw3uSOp+RsFCKrnxuCXsQxbZq
 Qsh094hFgF1KrRQnuOonlj7AvyJ7EOh8WNrrdBS+f2+T5dXYGVJz6+d5OPq/3bLPcTOY6j++l
 zXYfEoppNOepkKMm4QgBsQEvYzUCq6ByKigltSLxEmk0lTY4oZKyx23v8zxqTLKPMF4+TGd8i
 cxzBNDWIQOP16+1RViRIGGKCmZXJw52Jv7mbQFlqXaa8WBM3utngGHnDnXH/FxTEhmM8hEdyU
 yDvkZRjQDAZ1kDtzvXMOwZcKQbnV0t1q6SkD6MGLXbv0giGMw6xtdn0zHFT2eHuVteNKGO4K/
 b/d5hV9TBdcr7WGi84JNu0ZKX3y5Qz/HYQ0DfkFdHRfuVJNglW7q5yIZWNkLVIr+FEXL7vFdf
 2k0OLWAK9jIWG86+omJ/JOnpRYAni40Q+YJLtV2ZWjCrOYmeruQ9sSAPVTfdcL6yyOAXVVnQh
 YvLB5VFqXJRYKdWfffEpq9sljfUBzKbGnTeTjTSOmr9f7mfIqLF37SWTcgcIvvlGncfW+IZQa
 gtmOIFj
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On Sat, 8 Jun 2019, Geert Uytterhoeven wrote:
Hi Geert,

thank you for your reply and your additional findings.

> Hi Rolf,
> 
> Thanks for your patch!
> 
> On Fri, Jun 7, 2019 at 2:04 PM Rolf Evers-Fischer
> <embedded24@evers-fischer.de> wrote:
> > get_dma_channel may return ERR_PTR, so a check is added.
> 
> It may also return NULL...

Good catch. I must have missed this.

> 
> > --- a/arch/sh/drivers/dma/dma-api.c
> > +++ b/arch/sh/drivers/dma/dma-api.c
> > @@ -94,7 +94,7 @@ int get_dma_residue(unsigned int chan)
> >         struct dma_info *info = get_dma_info(chan);
> >         struct dma_channel *channel = get_dma_channel(chan);
> >
> > -       if (info->ops->get_residue)
> > +       if (!IS_ERR(channel) && (info->ops->get_residue))
> >                 return info->ops->get_residue(channel);
> 
> ... in which case .get_residue() may crash, as some implementations
> dereference the passed channel pointer.
> 
> Hence !IS_ERR_OR_NULL()?

Yes, in fact. IS_ERR_OR_NULL is the better choice here. 
I will resend a reworked patch immediately.

> 
> I didn't check the other callers.

Well, I did. And I found that none of the implementations checks the 
passed pointer. However, no in-tree driver is using the .extend() op, but 
as long as we don't know, if any out-of-tree drivers are using it without 
any additional check, I would prefer to check for NULL or error in 
dma_extend() as well.

Kind regards,
 Rolf
