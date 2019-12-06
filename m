Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8595D1153DD
	for <lists+linux-sh@lfdr.de>; Fri,  6 Dec 2019 16:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfLFPGr (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 6 Dec 2019 10:06:47 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:45674 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726244AbfLFPGr (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 6 Dec 2019 10:06:47 -0500
Received: (qmail 1799 invoked by uid 2102); 6 Dec 2019 10:06:46 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Dec 2019 10:06:46 -0500
Date:   Fri, 6 Dec 2019 10:06:46 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-usb@vger.kernel.org>, <linux-sh@vger.kernel.org>
Subject: Re: [PATCH] usb: host: ehci-sh: Remove unused platform data support
In-Reply-To: <20191206132849.29406-1-geert+renesas@glider.be>
Message-ID: <Pine.LNX.4.44L0.1912061006170.1618-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, 6 Dec 2019, Geert Uytterhoeven wrote:

> ehci_sh_platdata was never used, remove it. It can be resurrected from
> git history when needed.
> 
> This basically reverts commit 3e0c70d050c7ed6d ("usb: ehci-sh: Add PHY
> init function with platform data").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

