Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F3679363C
	for <lists+linux-sh@lfdr.de>; Wed,  6 Sep 2023 09:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjIFH17 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Wed, 6 Sep 2023 03:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjIFH17 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 6 Sep 2023 03:27:59 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAD58E
        for <linux-sh@vger.kernel.org>; Wed,  6 Sep 2023 00:27:54 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-2.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id d9f3b702-85a9-4f4d-af18-c3e0e0860a3a;
        Wed, 06 Sep 2023 16:27:52 +0900 (JST)
Received: from SIOS1075.ysato.ml (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
        by sakura.ysato.name (Postfix) with ESMTPSA id 0B1FD1C01AA;
        Wed,  6 Sep 2023 16:27:51 +0900 (JST)
Date:   Wed, 06 Sep 2023 16:27:50 +0900
Message-ID: <87edjbvk09.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-sh@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [RESEND RFC PATCH 10/12] serial/sh-sci: Fix earlyprintk / earlycon.
In-Reply-To: <CAMuHMdX6eGEFH9wbqWOV07gi=vcgfsdnnrZm9UG8wCjYRwRYsQ@mail.gmail.com>
References: <cover.1693444193.git.ysato@users.sourceforge.jp>
        <8f12d3b4b5fdeae4e465fc8fbf843e2878f17b55.1693444193.git.ysato@users.sourceforge.jp>
        <CAMuHMdX6eGEFH9wbqWOV07gi=vcgfsdnnrZm9UG8wCjYRwRYsQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, 01 Sep 2023 22:26:14 +0900,
Geert Uytterhoeven wrote:
> 
> Hi Sato-san,
> 
> On Thu, Aug 31, 2023 at 11:23 AM Yoshinori Sato
> <ysato@users.sourceforge.jp> wrote:
> > - earlyprintk having fault.
> > - fix shortname conflict.
> > - fix SCI regshift in SH4.
> >
> > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> 
> Thanks for your patch!
> 
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -2721,7 +2721,7 @@ static int sci_remap_port(struct uart_port *port)
> >         if (port->membase)
> >                 return 0;
> >
> > -       if (port->dev->of_node || (port->flags & UPF_IOREMAP)) {
> > +       if ((port->dev && port->dev->of_node) || (port->flags & UPF_IOREMAP)) {
> 
> Why is this needed? It works fine on arm32, arm64, and riscv.

earlycon works fine, but the old earlyprintk was stuck.
I don't think it's used much, but it's a problem if it doesn't work
when checking old sh targets.

> >                 port->membase = ioremap(port->mapbase, sport->reg_size);
> >                 if (unlikely(!port->membase)) {
> >                         dev_err(port->dev, "can't remap port#%d\n", port->line);
> > @@ -3507,6 +3507,10 @@ static int __init early_console_setup(struct earlycon_device *device,
> >         if (!device->port.membase)
> >                 return -ENODEV;
> >
> > +       if (type == PORT_SCI &&
> > +           (IS_ENABLED(CONFIG_CPU_SH3) || IS_ENABLED(CONFIG_CPU_SH4))) {
> > +               device->port.regshift = 2;
> > +       }
> 
> How do you run into this, given you don't have any SCI ports enabled
> in your DTS, only SCIF?
> 
> Anyway, I think this should be fixed in sci_init_single(), by extending
> the driver to support the more-or-less standard "reg-shift" DT property
> (as I said before in
> https://lore.kernel.org/all/CAMuHMdW2gxDzYbP_0Z90o8mHdUm_BV6e+gMHpELJx_g=ezAbdw@mail.gmail.com).

earlycon cannot reference DeviceTree.
If you give the value of reg-shift dynamically, you need to use a kernel
parameter.
I don't think this is necessary either, but it's a problem if it doesn't work.

> >         device->port.serial_in = sci_serial_in;
> >         device->port.serial_out = sci_serial_out;
> >         device->port.type = type;
> > @@ -3556,8 +3560,8 @@ static int __init hscif_early_console_setup(struct earlycon_device *device,
> >
> >  OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
> >  OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
> > -OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_setup);
> > -OF_EARLYCON_DECLARE(scif, "renesas,scif-r9a07g044", rzscifa_early_console_setup);
> > +OF_EARLYCON_DECLARE(rzscif, "renesas,scif-r7s9210", rzscifa_early_console_setup);
> > +OF_EARLYCON_DECLARE(rzscif, "renesas,scif-r9a07g044", rzscifa_early_console_setup);
> 
> Why?

The earlycon parameter uses the first name.
If sh4 and rz use the same name, one of them will not work properly.

> 
> >  OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
> >  OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
> >  OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Yosinori Sato
