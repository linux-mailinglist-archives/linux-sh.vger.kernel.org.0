Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9CAD72882B
	for <lists+linux-sh@lfdr.de>; Thu,  8 Jun 2023 21:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbjFHTU5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 8 Jun 2023 15:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234676AbjFHTUw (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 8 Jun 2023 15:20:52 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0582D52
        for <linux-sh@vger.kernel.org>; Thu,  8 Jun 2023 12:20:07 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bb167972cffso1090997276.1
        for <linux-sh@vger.kernel.org>; Thu, 08 Jun 2023 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=mXQ7UC6cKQLLZIQ28oFk9gQ5KxeKVwwY9rk3e7MKP3JMMgFBUS0Y4Ow9xYO3QBbWBp
         OG1o7JhalsKeTrmK+H6URVPXbxrefFexNILlJOVSmAp7Qw//UVTcssC14O2AbNOpA95o
         3fphns61QjibpjRegZHBgnDNFY4BaX8z0yU2Yg9FB0o8UxxLFxwBrXonk679QJW2NVtL
         a5CA3hBH6G8j2p1GNpc9/KN99Dv4NvapDgXnvT++Pvq7LeadMsdSuwcoq6yEHgW25m/P
         tlZmPB8WvPaouvvNC3jzVDH6WgeuI0e6ggHbT3c4Xpt7le2+MhNk3DZW5USJxtb/KL2r
         qm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=NiT9wasQ7KvXFXeQz5htsWjuimRdFSdtGZ1AbBret4qmwVw+OUdblI4HDrJ2R8NOGf
         MGJhe1bIzhiwEjY9M+nCtgrZ/OitjF4EKU0oZgHpD/u5c+KcmBufJAQ092dRIeLUB4jF
         6MDmBUaQYP301aa5kwVowpJk0aVrmzZejpPMGBl9ESnRwlo3vFQOIwrYWGSus+hBcNwP
         VB1CaHyBw7dnUmmUQzr1KvRzznGMX4eW9Du/2dgCkMuW2OJvUZ5LmKQLkj+nFc9ZIdAW
         g95ZKuZhr3fesspLnSAahVlFQ/d24SXefXKSBtEha3zH2zjnfF4CK8dmVRNBSZKm8EGf
         zAzw==
X-Gm-Message-State: AC+VfDwODLzGoQGKob2xp6SmxNt7OJdhX2Suk6EvJANT+mSGJKIKGb8s
        0PE5uQ/7hUziQTRCQsIbB5u6Mg==
X-Google-Smtp-Source: ACHHUZ4wGfYoiszAK487KBc/kae1dH0iFiJPU4oIJDoWEvbSOVI5OJwBbX6lcOBaT8/42nfo55JclQ==
X-Received: by 2002:a25:ce90:0:b0:ba8:16df:e3f5 with SMTP id x138-20020a25ce90000000b00ba816dfe3f5mr700600ybe.0.1686252005314;
        Thu, 08 Jun 2023 12:20:05 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 2-20020a251802000000b00b9dfcc7a1fasm446566yby.7.2023.06.08.12.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:20:04 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:20:00 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 09/23] parisc: unmap_uncached_pte() use
 pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <358dfe21-a47f-9d3-bf21-9c454735944@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

unmap_uncached_pte() is working from pgd_offset_k(vaddr), so it should
use pte_offset_kernel() instead of pte_offset_map(), to avoid the
question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 71ed5391f29d..415f12d5bab3 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -164,7 +164,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
 		pmd_clear(pmd);
 		return;
 	}
-	pte = pte_offset_map(pmd, vaddr);
+	pte = pte_offset_kernel(pmd, vaddr);
 	vaddr &= ~PMD_MASK;
 	end = vaddr + size;
 	if (end > PMD_SIZE)
-- 
2.35.3

