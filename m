Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FC76ABCA6
	for <lists+linux-sh@lfdr.de>; Mon,  6 Mar 2023 11:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjCFK30 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 6 Mar 2023 05:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjCFK3K (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 6 Mar 2023 05:29:10 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4231F22DCB
        for <linux-sh@vger.kernel.org>; Mon,  6 Mar 2023 02:28:28 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so7796037wmb.5
        for <linux-sh@vger.kernel.org>; Mon, 06 Mar 2023 02:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFKp5UQBG3l53oFN1TX3lPoz/7qd6K9MPu25CwOaBFY=;
        b=gXmErd07mq8h9FQwNad9cHSDKVO/9kBBoPVqhRVVJUdZ7yZ6dO44uoI2RadJITDD9x
         eZJl+a1RTgZ111TBTwySUjS84WDIz+4djsf+l2W/J89fu/WTd0mjG1XPGZToDSsihfLV
         UXMJABATU/cjR2YxRJRgB7Cu/M/L0BAmfO4BmQCA5HSKPmBAHyVFMfnuOT+nwcLcO4Eq
         Wf2RR5GDge2FA5kaHsVsn9jcM0m1zq6fhigT4Sh/Z1TwUMZsVzj25cRF4QttJ+0vPfRG
         JkY7jtv6yyTgK9GTcVTml3MvHOnPArnnd5490o/SLfyRgHMQ3bG0rS81rWV3vnXg1JON
         W3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFKp5UQBG3l53oFN1TX3lPoz/7qd6K9MPu25CwOaBFY=;
        b=IR1ORyfr2uYErGOYVSWlIYhArdXJreBXxN7bGm7dcy9tHaMitM3jgb/jUKQOa+gGng
         YFBeKda9ttkXJKErzIwHUaFQ+ESvSr0JgiY859JGKxFGiAUT7e+EZ2mO8JJBB4zNMGNb
         6Oah/ZPXdfZTsu+AMNhCXgPLlZdqbY0ZAm7JY38NZve7YBsGLkexZoBKhKMLi0yT97gk
         1RYkDvAVvlaFLmijyiZ+7HO4lRCoVz/ic5zSpbe3iLeZ3gh/Tcc4SfsJidQZEU3eqKuC
         BdYzna0etq+Jl8TRklhnI/dc/sNpQJoLvkXPWX7ueuAjedem7UwnoMcf5NQtyJOf3Lug
         u2WQ==
X-Gm-Message-State: AO0yUKWs3eqivuE8x4b2lmRqUzie9yxbpqCkaimJMJz5yHqTvy7rsJqr
        PCPvnEZ+gKaZxZ++UxWqQ4hgjQ==
X-Google-Smtp-Source: AK7set/1QsFX/6t8V/FLcEmEqIc3FZ+bbYGyTypDjK5daD6AXO6IUVgA7zTW4rCAHVVJZZlaMKFiMA==
X-Received: by 2002:a05:600c:35c9:b0:3e2:1e01:803a with SMTP id r9-20020a05600c35c900b003e21e01803amr8595976wmq.9.1678098501632;
        Mon, 06 Mar 2023 02:28:21 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i47-20020a05600c4b2f00b003eb5a531232sm9835051wmp.38.2023.03.06.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:28:21 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 22/26] xtensa: Remove empty <uapi/asm/setup.h>
Date:   Mon,  6 Mar 2023 11:05:04 +0100
Message-Id: <20230306100508.1171812-23-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
deleted file mode 100644
index 6f982394684a..000000000000
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * include/asm-xtensa/setup.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_SETUP_H
-#define _XTENSA_SETUP_H
-
-#endif
-- 
2.37.2

