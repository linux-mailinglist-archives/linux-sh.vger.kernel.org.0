Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6CA61377EB
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jan 2020 21:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgAJU3y (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 10 Jan 2020 15:29:54 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39705 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgAJU3y (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 10 Jan 2020 15:29:54 -0500
Received: by mail-lf1-f66.google.com with SMTP id y1so2440840lfb.6
        for <linux-sh@vger.kernel.org>; Fri, 10 Jan 2020 12:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/VR1yCvH028Xk6zuB3TDzNdY/9rSkzTRJyCKNvGpUXs=;
        b=FlN1J80whxkUVnmmO43Nb0P/p2NwWa3ESJ6kC3gJYn0AFJoxvjBvVktd8oQOGp/22h
         +UMgNlGFZQQLLUZo2l6zgrMO18eIYQy7wEk50qFx/fNcDzPCRHhO8q6DnfpeDCO2Hv6G
         9Czi0Q7nnTEAaxEBA8tz2yudwsLAJjE5tvoVyCrYbiihuyZqtIpKb6L5p/PqvopcUQGe
         I9kql/6ICwTyR7rRR5mFZn4+TwA/8VpO1ANhxskTRkT4xZsybdbiadSpe584zm6WfgZt
         mjfGBLMhGqyCcsm3g1kyOP1tDQJSAlQ4IjqHcEMoV4RdK2a/FzUJisgzRFDHUQVgyZwg
         78gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/VR1yCvH028Xk6zuB3TDzNdY/9rSkzTRJyCKNvGpUXs=;
        b=fnmt9dIKqEofBIqzWdF2RZmbkV09ggICCQp5J6IuUFLuc3FQagvTP0OEVPzr4angy+
         Sj1bDbguw+/IhNM1CL3mnqhKrrwMl99lNt9iHvAGi1Q92VLnQbsyhum0e9vgLid9pcTd
         OAN4wsVUUUaQcZnKrbdW/LxQNkCaCvZdjKx2Ije5Rwc623lfGLUw5SIErytFHA5Pjf3C
         dGrDJuc/vOzi5o/94HGsKQz5H6rmtnfjFLZVuBnCB5TVagspP77uLoARGLHzXng61sNe
         vweVRhASGpyeZMkWEgTOt3h5o7aHtM2E2MvntShGxM33GVGnHfNibgqNO5lVg7ZzH+FO
         KMjQ==
X-Gm-Message-State: APjAAAVgsoN7BmKas3yLdBLSbPbqJ0e8QxDgISP+X+K4oF0RhSMaR3+Q
        HBN0oxqzqXTW8ouE1IBHvj50bXnsKQU=
X-Google-Smtp-Source: APXvYqwzdgG99A6SzCa+U41cIOlTkNF6PSGtT0UT3hvrJ59FLUjAOwhUubaRWCqXaSGnp0ySAUGC4g==
X-Received: by 2002:a19:a408:: with SMTP id q8mr3413226lfc.174.1578688192070;
        Fri, 10 Jan 2020 12:29:52 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id d20sm1563692lfm.32.2020.01.10.12.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 12:29:51 -0800 (PST)
Date:   Fri, 10 Jan 2020 21:29:50 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH 00/13] pinctrl: sh-pfc: checker: Various improvements
Message-ID: <20200110202950.GA695049@oden.dyn.berto.se>
References: <20200110131927.1029-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Geert,

Neat series. I always worry when my eyes start to cross each other when 
looking at the big tables I will make mistakes like this ;-)

On 2020-01-10 14:19:14 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains various improvements for the builtin pin
> control table runtime checks of the Renesas Pin Function Controller
> driver.  These checks are enabled with CONFIG_DEBUG_PINCTRL=y, which can
> be combined with CONFIG_COMPILE_TEST=y to increase coverage to all
> Renesas ARM and SuperH SoCs..
> 
> Note that all issues detected by this have already been fixed in "[PATCH
> 0/6] pinctrl: sh-pfc: More miscellenaous fixes"[1], and are now part of
> linux-next.
> 
> I plan to queue this in sh-pfc-for-v5.7.

With the fix you point out yourself in 13/13 for 
CONFIG_PINCTRL_SH_FUNC_GPIO=n feel free to add

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

For the whole series.

> 
> Thanks for your comments!
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20191218194812.12741-1-geert+renesas@glider.be/
> 
> Geert Uytterhoeven (13):
>   pinctrl: sh-pfc: checker: Move data before code
>   pinctrl: sh-pfc: checker: Add helpers for reporting
>   pinctrl: sh-pfc: checker: Add helper for safe name comparison
>   pinctrl: sh-pfc: checker: Add check for config register conflicts
>   pinctrl: sh-pfc: checker: Add check for enum ID conflicts
>   pinctrl: sh-pfc: checker: Improve pin checks
>   pinctrl: sh-pfc: checker: Improve pin function checks
>   pinctrl: sh-pfc: checker: Improve pin group checks
>   pinctrl: sh-pfc: checker: Add drive strength register checks
>   pinctrl: sh-pfc: checker: Add bias register checks
>   pinctrl: sh-pfc: checker: Add ioctrl register checks
>   pinctrl: sh-pfc: checker: Add data register checks
>   pinctrl: sh-pfc: checker: Add function GPIO checks
> 
>  drivers/pinctrl/sh-pfc/core.c | 312 +++++++++++++++++++++++++++-------
>  1 file changed, 250 insertions(+), 62 deletions(-)
> 
> -- 
> 2.17.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
