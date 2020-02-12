Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B6015ADF4
	for <lists+linux-sh@lfdr.de>; Wed, 12 Feb 2020 18:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgBLRDE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 12 Feb 2020 12:03:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:54684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbgBLRDE (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 12 Feb 2020 12:03:04 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59B1520658;
        Wed, 12 Feb 2020 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581526983;
        bh=OV1lAkhWnccziA5sFOfzebqBahiiSxWasRMp0M4pKcg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HlJA7bGDmSzALWHL7w61cgSi2AnDPRYanL4FnMVU+c28/AZASvonQIvCWct4XUKoF
         lhvcQQXtiYfSI7TVa+OQe02XkrCSa+7GTlHbgWCzOkyesIdo7S6raMfiakE7OPjFQL
         GI1sSg6COT5BtGO3SMDlO8/UfeoHReAZadpgvX24=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212101813.9230-1-geert+renesas@glider.be>
References: <20200212101813.9230-1-geert+renesas@glider.be>
Subject: Re: [PATCH] sh: boards: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-sh@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Date:   Wed, 12 Feb 2020 09:03:02 -0800
Message-ID: <158152698263.121156.7691702987273535933@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:18:13)
> The SuperH/J2 DT platform code is not a clock provider, and just needs
> to call of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
