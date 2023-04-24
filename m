Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0302A6E7408
	for <lists+linux-sh@lfdr.de>; Wed, 19 Apr 2023 09:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjDSHbJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Wed, 19 Apr 2023 03:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjDSHbA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 19 Apr 2023 03:31:00 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DDB93C7
        for <linux-sh@vger.kernel.org>; Wed, 19 Apr 2023 00:30:55 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pp2HE-001l6d-PH; Wed, 19 Apr 2023 09:30:52 +0200
Received: from p5b13a017.dip0.t-ipconnect.de ([91.19.160.23] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pp2HE-001csf-IL; Wed, 19 Apr 2023 09:30:52 +0200
Message-ID: <031163a43190031e742504d6e89183f6f22ac03e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] Fix J-core aic warning spam
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Landley <rob@landley.net>
Cc:     Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Date:   Wed, 19 Apr 2023 09:30:51 +0200
In-Reply-To: <CAMuHMdX5Hn2QR127M4NjNLWJMrEVUQK5ApCkeb2nDuSid1o90g@mail.gmail.com>
References: <ec905cf9-09de-a5d1-b8ee-0d874db4c301@landley.net>
         <45c6426d762dbbe27830182ce751aa3d8210602a.camel@physik.fu-berlin.de>
         <CAMuHMdVxTtoV5_+tEeoTT6hSEBkK8ZsHtu8t6jumvUK6u5effQ@mail.gmail.com>
         <e4f89e6f-b7fb-6cfc-c90c-03ecdefe602a@landley.net>
         <08823dbc7d6abb99958993bc35e315a3eb0e63bb.camel@physik.fu-berlin.de>
         <f321805d-346b-36d5-247f-3c092aa7bea1@landley.net>
         <CAMuHMdXX7+-KF7eEoqY4NH90e9g=ykapfma7V050NaKW1Qb-vQ@mail.gmail.com>
         <33f74e06-6b62-3f13-ed09-8efb4f05ac5c@landley.net>
         <CAMuHMdX5Hn2QR127M4NjNLWJMrEVUQK5ApCkeb2nDuSid1o90g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.160.23
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 2023-04-19 at 09:27 +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 18, 2023 at 11:56 PM Rob Landley <rob@landley.net> wrote:
> > 
> > On 4/18/23 04:16, Geert Uytterhoeven wrote:
> > > Hi Rob,
> > > 
> > > On Tue, Apr 18, 2023 at 10:59 AM Rob Landley <rob@landley.net> wrote:
> > > > On 4/18/23 03:10, John Paul Adrian Glaubitz wrote:
> > > > > On Tue, 2023-04-18 at 03:09 -0500, Rob Landley wrote:
> > > > > > On 4/18/23 02:18, Geert Uytterhoeven wrote:
> > > > > > > On Tue, Apr 18, 2023 at 8:19 AM John Paul Adrian Glaubitz
> > > > > > > <glaubitz@physik.fu-berlin.de> wrote:
> > > > > > > > On Mon, 2023-04-17 at 23:23 -0500, Rob Landley wrote:
> > > > > > > > > From: Rich Felker <dalias@libc.org>
> > > > > > > > > Signed-off-by: Rob Landley <rob@landley.net>
> > > > > > > > > 
> > > > > > > > > Silence noisy boot messages (warning and stack dump for each IRQ) when booting
> > > > > > > > > on J2 SOC.
> > > > > > > 
> > > > > > > > > --- a/drivers/irqchip/irq-jcore-aic.c
> > > > > > > > > +++ b/drivers/irqchip/irq-jcore-aic.c
> > > > > > > > > @@ -68,6 +68,7 @@ static int __init aic_irq_of_init(struct device_node *node,
> > > > > > > > >       unsigned min_irq = JCORE_AIC2_MIN_HWIRQ;
> > > > > > > > >       unsigned dom_sz = JCORE_AIC_MAX_HWIRQ+1;
> > > > > > > > >       struct irq_domain *domain;
> > > > > > > > > +     int rc;
> > > > > > > > > 
> > > > > > > > >       pr_info("Initializing J-Core AIC\n");
> > > > > > > > > 
> > > > > > > > > @@ -100,6 +101,11 @@ static int __init aic_irq_of_init(struct device_node *node,
> > > > > > > > >       jcore_aic.irq_unmask = noop;
> > > > > > > > >       jcore_aic.name = "AIC";
> > > > > > > > > 
> > > > > > > > > +     rc = irq_alloc_descs(min_irq, min_irq, dom_sz - min_irq,
> > > > > > > > > +                          of_node_to_nid(node));
> > > > > > > > > +     if (rc < 0)
> > > > > > > > > +             pr_info("Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n",
> > > > > > > > > +                     min_irq);
> > > > > > > 
> > > > > > > This is a fatal error, so please bail out, instead of continuing.
> > > > > > 
> > > > > > If it can continue, it's not a fatal error. (Some pieces of hardware might not
> > > > > > come up, but the board might still be usable.) If it can't continue, how does
> > > > > > the _type_ of failure matter?
> > > > > 
> > > > > I would still consider it fatal if any of the integral board components failed to
> > > > > initialize. I don't think we want users to boot up their system into such an undefined
> > > > > state.
> > > > 
> > > > So if the network card doesn't work, kernel panic? If it's fatal, why does the
> > > > function return? It could have called panic() instead. How does panicing _help_?
> > > > (If the driver loads and the hardware works, we're good. If it doesn't, it won't
> > > > work and they'll notice...)
> > > 
> > > I didn't suggest to call panic(), just return rc.
> > 
> > Ah, I misunderstood.
> > 
> > > Diving deeper, irq_alloc_descs() can fail only when passing bad or severely
> > > out-of-range values, so that's very unlikely.
> > > 
> > > BTW, what are the noisy boot messages? What's the call chain?
> > 
> > I have a log lying around somewhere...
> 
> Thanks!
> 
> It was a bit too large for the list, so I only kept the first relevant
> part below...
> 
> > Initializing J-Core AIC
> > ------------[ cut here ]------------
> > error: virq16 is not allocated
> > WARNING: CPU: 0 PID: 0 at kernel/irq/irqdomain.c:571
> > irq_domain_associate+0x120/0x178
> > 
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc2 #1
> > PC is at irq_domain_associate+0x120/0x178
> > PR is at irq_domain_associate+0x120/0x178
> > PC  : 10049b90 SP  : 103bdec0 SR  : 400001f1
> > R0  : 0000001e R1  : 1042d024 R2  : 1042d024 R3  : 00000028
> > R4  : 00000001 R5  : 0006f1ff R6  : 00000008 R7  : 103bde04
> > R8  : 1200c000 R9  : 00000010 R10 : 00000000 R11 : 00000010
> > R12 : 10049a70 R13 : 103bfcac R14 : 1030a398
> > MACH: 00000000 MACL: 00057fa8 GBR : 00000000 PR  : 10049b90
> > 
> > Call trace:
> >  [<100496f0>] __irq_domain_add+0x80/0x1dc
> >  [<10049cd2>] irq_domain_create_legacy+0x46/0x68
> >  [<10049a70>] irq_domain_associate+0x0/0x178
> >  [<104517da>] aic_irq_of_init+0x82/0xd8
> >  [<1020ab90>] of_iomap+0x0/0x30
> >  [<1031df1c>] _printk+0x0/0x24
> >  [<1045630c>] of_irq_init+0xe4/0x228
> >  [<100a5a10>] kfree+0x0/0x250
> >  [<10042376>] vprintk_emit+0xde/0x1fc
> >  [<1004239c>] vprintk_emit+0x104/0x1fc
> >  [<10309940>] strlen+0x0/0x60
> >  [<100424a6>] vprintk_default+0x12/0x20
> >  [<10309940>] strlen+0x0/0x60
> >  [<10002a2c>] arch_local_save_flags+0x0/0x8
> >  [<1031df1c>] _printk+0x0/0x24
> >  [<104456f8>] init_IRQ+0x14/0x28
> >  [<10309940>] strlen+0x0/0x60
> >  [<10002a2c>] arch_local_save_flags+0x0/0x8
> >  [<1031df1c>] _printk+0x0/0x24
> >  [<1044394c>] start_kernel+0x3b8/0x73c
> >  [<1044320c>] unknown_bootoption+0x0/0x170
> >  [<1000202a>] _stext+0x2a/0x34
> > 
> > Code:
> >   10049b8a:  mov.l     10049bd8 <irq_domain_associate+0x168/0x178>, r4  !
> > 10393da0 <0x10393da0>
> >   10049b8c:  jsr       @r1
> >   10049b8e:  mov       r11, r5
> > ->10049b90:  trapa     #62
> >   10049b92:  bra       10049b0e
> >   10049b94:  mov       #-22, r12
> >   10049b96:  mov.l     10049bd0 <irq_domain_associate+0x160/0x178>, r1  !
> > 1031da2c <__warn_printk+0x0/0x38>
> >   10049b98:  mov.l     10049bdc <irq_domain_associate+0x16c/0x178>, r4  !
> > 10393dc0 <0x10393dc0>
> >   10049b9a:  jsr       @r1
> > 
> > ---[ end trace 0000000000000000 ]---
> 
> OK, so virq 16-127 are non-functional without this fix.
> 
> One other thing to consider when sending a v2: v1 lacks an SoB
> from the original author.

So, my original assessment that the patch title is misleading was correct then?

If Rich is not going to send a v2 of the patch anytime soon, I can do that myself.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
