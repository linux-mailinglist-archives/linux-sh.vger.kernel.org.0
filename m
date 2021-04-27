Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0136C0CF
	for <lists+linux-sh@lfdr.de>; Tue, 27 Apr 2021 10:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbhD0Ia4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Tue, 27 Apr 2021 04:30:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:32954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233847AbhD0Iaz (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 27 Apr 2021 04:30:55 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E6C36100B;
        Tue, 27 Apr 2021 08:30:12 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lbJ6g-009dR1-1U; Tue, 27 Apr 2021 09:30:10 +0100
Date:   Tue, 27 Apr 2021 09:30:09 +0100
Message-ID: <87o8e0nn8u.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/9] ARM: PXA: Kill use of irq_create_strict_mappings()
In-Reply-To: <20210426223942.GA213931@roeck-us.net>
References: <20210406093557.1073423-1-maz@kernel.org>
        <20210406093557.1073423-3-maz@kernel.org>
        <20210426223942.GA213931@roeck-us.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org, robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Guenter,

Thanks for the heads up.

On Mon, 26 Apr 2021 23:39:42 +0100,
Guenter Roeck <linux@roeck-us.net> wrote:
> 
> On Tue, Apr 06, 2021 at 10:35:50AM +0100, Marc Zyngier wrote:
> > irq_create_strict_mappings() is a poor way to allow the use of
> > a linear IRQ domain as a legacy one. Let's be upfront about
> > it and use a legacy domain when appropriate.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> 
> When running the "mainstone" qemu emulation, this patch results
> in many (32, actually) runtime warnings such as the following.
> 
> [    0.528272] ------------[ cut here ]------------
> [    0.528285] WARNING: CPU: 0 PID: 1 at kernel/irq/irqdomain.c:550 irq_domain_associate+0x194/0x1f0
> [    0.528315] error: virq335 is not allocated

[...]

This looks like a case of CONFIG_SPARSE_IRQ, combined with a lack of
brain engagement. I've come up with the following patch, which lets
the kernel boot in QEMU without screaming (other than the lack of a
rootfs...).

Please let me know if this helps.

Thanks,

	M.

From 4d7f6ddbbfdff1c9f029bafca79020d3294dc32c Mon Sep 17 00:00:00 2001
From: Marc Zyngier <maz@kernel.org>
Date: Tue, 27 Apr 2021 09:00:28 +0100
Subject: [PATCH] ARM: PXA: Fix cplds irqdesc allocation when using legacy mode

The Mainstone PXA platform uses CONFIG_SPARSE_IRQ, and thus we
cannot rely on the irq descriptors to be readilly allocated
before creating the irqdomain in legacy mode. The kernel then
complains loudly about not being able to associate the interrupt
in the domain -- can't blame it.

Fix it by allocating the irqdescs upfront in the legacy case.

Fixes: b68761da0111 ("ARM: PXA: Kill use of irq_create_strict_mappings()")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm/mach-pxa/pxa_cplds_irqs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa_cplds_irqs.c b/arch/arm/mach-pxa/pxa_cplds_irqs.c
index ec0d9b094744..bddfc7cd5d40 100644
--- a/arch/arm/mach-pxa/pxa_cplds_irqs.c
+++ b/arch/arm/mach-pxa/pxa_cplds_irqs.c
@@ -121,8 +121,13 @@ static int cplds_probe(struct platform_device *pdev)
 		return fpga->irq;
 
 	base_irq = platform_get_irq(pdev, 1);
-	if (base_irq < 0)
+	if (base_irq < 0) {
 		base_irq = 0;
+	} else {
+		ret = devm_irq_alloc_descs(&pdev->dev, base_irq, base_irq, CPLDS_NB_IRQ, 0);
+		if (ret < 0)
+			return ret;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	fpga->base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.30.2


-- 
Without deviation from the norm, progress is not possible.
