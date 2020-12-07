Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734472D1C9E
	for <lists+linux-sh@lfdr.de>; Mon,  7 Dec 2020 23:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgLGWBi (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 7 Dec 2020 17:01:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:49714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727758AbgLGWBi (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 7 Dec 2020 17:01:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607378457;
        bh=ROj2E/DNz95dJeF/4hZqYnmHeYGnEnlXg8LBxRmkrTw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=omaR4Cu98x+zL2ZGHihgajNvL70pOGbcA3YhpZfeHG95ak5Y4JhXDCm88xYBUkMGU
         C4JGpkf+Q+pUyFjEdkodzz2+Dp8rcmN1yZFnE3YJpP8W+8X4UhkNeCBgPAuEFM9yRV
         SkBSM/gE731bY0yi1IwrQ5//C6o7lS/S3wYkRxd7xsdWD7GaO5E7nF4XnnzYOObLIz
         dwxaDZAbyaTdca5v2MCuV0h5F2qVBYDUfo1Q7BYQlNRM7PI3VpAmxtOIxjBOozqHB6
         9Tbvl24NqCv5D4dJ6rIeqP17y6VrgmfRiJiNN6X7lwW4NL9ku4Jtq9hvzBWaou4Dig
         cOE+ZzI7wHEEg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201110155029.3286090-1-geert+renesas@glider.be>
References: <20201110155029.3286090-1-geert+renesas@glider.be>
Subject: Re: [PATCH resend v2] sh: boards: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-sh@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Date:   Mon, 07 Dec 2020 14:00:56 -0800
Message-ID: <160737845618.1580929.560371999645128087@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-10 07:50:29)
> The SuperH/J2 DT platform code is not a clock provider, and just needs
> to call of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
