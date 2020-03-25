Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C044D1924FA
	for <lists+linux-sh@lfdr.de>; Wed, 25 Mar 2020 11:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgCYKED (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 25 Mar 2020 06:04:03 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:45046 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgCYKEC (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 25 Mar 2020 06:04:02 -0400
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id Ja3y2200o5USYZQ01a3yHU; Wed, 25 Mar 2020 11:04:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tC-00033V-Qi; Wed, 25 Mar 2020 11:03:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tC-0003Zo-O8; Wed, 25 Mar 2020 11:03:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] gpiolib: gpio_set_config() cleanups
Date:   Wed, 25 Mar 2020 11:03:55 +0100
Message-Id: <20200325100357.13705-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

	Hi Linus, Bartosz,

This patch sets reworks the parameters for gpio_set_config() and
gpio_set_bias(), which simplifies callers, and slightly reduces the
number of lines of code.

Thanks for your comments!

Geert Uytterhoeven (2):
  gpiolib: Pass gpio_desc to gpio_set_config()
  gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()

 drivers/gpio/gpiolib.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
