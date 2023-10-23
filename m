Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE2E7D347E
	for <lists+linux-sh@lfdr.de>; Mon, 23 Oct 2023 13:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjJWLkN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Mon, 23 Oct 2023 07:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbjJWLkM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 23 Oct 2023 07:40:12 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FFA102
        for <linux-sh@vger.kernel.org>; Mon, 23 Oct 2023 04:40:08 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-0.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id 75fc1871-9839-4671-892c-d4b2178ab7bb;
        Mon, 23 Oct 2023 20:40:06 +0900 (JST)
Received: from SIOS1075.ysato.ml (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by sakura.ysato.name (Postfix) with ESMTPSA id 51FCF1C0037;
        Mon, 23 Oct 2023 20:40:05 +0900 (JST)
Date:   Mon, 23 Oct 2023 20:40:04 +0900
Message-ID: <87wmvd7ejv.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-sh@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [RFC PATCH v3 22/35] drivers/clocksource/sh_tmu: Add support CLOCKSOURCE.
In-Reply-To: <CAMuHMdU66TvS7D=tuQUMazO85V9wh+uMf_t086VKBB+C8wvYQg@mail.gmail.com>
References: <cover.1697199949.git.ysato@users.sourceforge.jp>
        <4fc0bdc03033bbe43b31c89b6cc705e5f3498846.1697199949.git.ysato@users.sourceforge.jp>
        <CAMuHMdU66TvS7D=tuQUMazO85V9wh+uMf_t086VKBB+C8wvYQg@mail.gmail.com>
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

On Thu, 19 Oct 2023 01:04:57 +0900,
Geert Uytterhoeven wrote:
> 
> Hi Sato-san,
> 
> Thanks for your patch!
> 
> On Sat, Oct 14, 2023 at 4:54 PM Yoshinori Sato
> <ysato@users.sourceforge.jp> wrote:
> > Enables registration as a Clocksource in the case of OF.
> 
> I think this is not a good description.
> What this patch does, is to add support for early registration using
> TIMER_OF_DECLARE(), so the timer can be used as a clocksource
> on SoCs that do not have any other suitable timer.
> 
> Then I wondered: do you need this?  On R-Mobile A1, the TMU is also
> used as a clocksource, how come it works there?
> The trick is to set preset_lpj based on the CPU core clock frequency.
> 
> I see your v2 actually added that, but you dropped the code in v3.
> https://lore.kernel.org/linux-sh/236185b4a47f303332aafeacadd9c9652e650062.1694596125.git.ysato@users.sourceforge.jp
> Nevertheless, it doesn't work anymore, as you also removed the
> clock-frequency property from cpu@0 in DT...
> Adding that makes it work without this TMU patch.

Currently sh initializes the timer with a parameter called "earlytimer",
but this does not seem to work correctly with CONFIG_OF.
It will be initialized later when of_platform_depopulate is called,
so it can be started, but I think this is incorrect initialization
of the timer.
I think it's better to follow the OF procedure rather than the old
SH-specific framework.

> > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> 
> > --- a/drivers/clocksource/sh_tmu.c
> > +++ b/drivers/clocksource/sh_tmu.c
> 
> > @@ -403,7 +411,8 @@ static void sh_tmu_clock_event_resume(struct clock_event_device *ced)
> >  }
> >
> >  static void sh_tmu_register_clockevent(struct sh_tmu_channel *ch,
> > -                                      const char *name)
> > +                                      const char *name,
> > +                                      struct device_node *np)
> 
> "np" is unused in this function, hence this change is unneeded.
> 
> >  {
> >         struct clock_event_device *ced = &ch->ced;
> >         int ret;
> 
> >  static int sh_tmu_register(struct sh_tmu_channel *ch, const char *name,
> > +                          struct device_node *np,
> 
> This change is unneeded...
> 
> >                            bool clockevent, bool clocksource)
> >  {
> >         if (clockevent) {
> >                 ch->tmu->has_clockevent = true;
> > -               sh_tmu_register_clockevent(ch, name);
> > +               sh_tmu_register_clockevent(ch, name, np);
> 
> ... as sh_tmu_register_clockevent() doesn't use "np".
> 
> >         } else if (clocksource) {
> >                 ch->tmu->has_clocksource = true;
> >                 sh_tmu_register_clocksource(ch, name);
> 
> > @@ -465,53 +477,59 @@ static int sh_tmu_channel_setup(struct sh_tmu_channel *ch, unsigned int index,
> >         else
> >                 ch->base = tmu->mapbase + 8 + ch->index * 12;
> >
> > -       ch->irq = platform_get_irq(tmu->pdev, index);
> > +       if (tmu->pdev)
> > +               ch->irq = platform_get_irq(tmu->pdev, index);
> > +       else
> > +               ch->irq = of_irq_get(np, index);
> 
> You can use of_irq_get() uncondtionally.
> 
> >         if (ch->irq < 0)
> >                 return ch->irq;
> >
> >         ch->cs_enabled = false;
> >         ch->enable_count = 0;
> >
> > -       return sh_tmu_register(ch, dev_name(&tmu->pdev->dev),
> > +       return sh_tmu_register(ch, tmu->name, np,
> 
> No need to pass np.
> 
> >                                clockevent, clocksource);
> >  }
> >
> > -static int sh_tmu_map_memory(struct sh_tmu_device *tmu)
> > +static int sh_tmu_map_memory(struct sh_tmu_device *tmu, struct device_node *np)
> >  {
> >         struct resource *res;
> >
> > -       res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
> > -       if (!res) {
> > -               dev_err(&tmu->pdev->dev, "failed to get I/O memory\n");
> > -               return -ENXIO;
> > -       }
> > +       if (tmu->pdev) {
> > +               res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
> > +               if (!res) {
> > +                       pr_err("sh_tmu failed to get I/O memory\n");
> > +                       return -ENXIO;
> > +               }
> > +
> > +               tmu->mapbase = ioremap(res->start, resource_size(res));
> > +       } else
> > +               tmu->mapbase = of_iomap(np, 0);
> 
> You can use of_iomap() unconditionally.
> 
> >
> > -       tmu->mapbase = ioremap(res->start, resource_size(res));
> >         if (tmu->mapbase == NULL)
> >                 return -ENXIO;
> >
> >         return 0;
> >  }
> >
> > -static int sh_tmu_parse_dt(struct sh_tmu_device *tmu)
> > +static int sh_tmu_parse_dt(struct sh_tmu_device *tmu, struct device_node *np)
> >  {
> > -       struct device_node *np = tmu->pdev->dev.of_node;
> > -
> >         tmu->model = SH_TMU;
> >         tmu->num_channels = 3;
> >
> >         of_property_read_u32(np, "#renesas,channels", &tmu->num_channels);
> >
> >         if (tmu->num_channels != 2 && tmu->num_channels != 3) {
> > -               dev_err(&tmu->pdev->dev, "invalid number of channels %u\n",
> > -                       tmu->num_channels);
> > +               pr_err("%s: invalid number of channels %u\n",
> > +                      tmu->name, tmu->num_channels);
> >                 return -EINVAL;
> >         }
> >
> >         return 0;
> >  }
> >
> > -static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
> > +static int sh_tmu_setup(struct sh_tmu_device *tmu,
> > +                       struct platform_device *pdev, struct device_node *np)
> >  {
> >         unsigned int i;
> >         int ret;
> 
> > @@ -531,14 +554,17 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
> >                 tmu->model = id->driver_data;
> >                 tmu->num_channels = hweight8(cfg->channels_mask);
> >         } else {
> > -               dev_err(&tmu->pdev->dev, "missing platform data\n");
> > +               pr_err("%s missing platform data\n", tmu->name);
> >                 return -ENXIO;
> >         }
> >
> >         /* Get hold of clock. */
> > -       tmu->clk = clk_get(&tmu->pdev->dev, "fck");
> > +       if (pdev)
> > +               tmu->clk = clk_get(&tmu->pdev->dev, "fck");
> > +       else
> > +               tmu->clk = of_clk_get(np, 0);
> 
> You can use of_clk_get() unconditionally.
> 
> >         if (IS_ERR(tmu->clk)) {
> > -               dev_err(&tmu->pdev->dev, "cannot get clock\n");
> > +               pr_err("%s: cannot get clock\n", tmu->name);
> >                 return PTR_ERR(tmu->clk);
> >         }
> >
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
