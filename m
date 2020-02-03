Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7769B150A30
	for <lists+linux-sh@lfdr.de>; Mon,  3 Feb 2020 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgBCPsV (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 3 Feb 2020 10:48:21 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39684 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgBCPsU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 3 Feb 2020 10:48:20 -0500
Received: by mail-qt1-f193.google.com with SMTP id c5so11760544qtj.6
        for <linux-sh@vger.kernel.org>; Mon, 03 Feb 2020 07:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
        b=kUu9P+c9Xi/sRwQmUmgRczJtLr5gqK+yFzRIYgulkIKq53mKQTosQf2B1M6rGAi1Vz
         zf6l65bkbMXSBdMvkcorvRBREKJsVTppzgxLeEe94RRQYYE5rTfTkBy5PLm4V1jr5ZQ2
         8/TkMtxS7aFoHnfHuQCreV0p97LuOHmi4sH1PeQhHzRc+prSAziRCba+Efew+79NFeug
         7sAupOPSdzNPuzEGx/PoF+bkDk7yc1blkxEFffDT9NhTb2wE5i6A49kcGqskeWYy690O
         nI+R4iCW7RBwWJK/FMvjoUPLd2pEL4Dy23U+/NizYdlcaK8tA1r3cfCm2lrDynXLFW6Q
         69MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
        b=P09GHRAB1tdfmwGhXUxk/oFNWFOgNRgvKrgpzPluMI+SXAzTwOzX29ItbemPNwO85f
         Ic2XgwIZVSEtQNn0mHP1HO+LEE0U/410Y5tvm3QNpWuv5tUar8L9M7XMP6TmpzszY6xZ
         cJ1OaAqsegu83VWKvpTsAktO4ZecSmxlLOsztTL7QLtDwcEWs7KVFfg45tnw4qNx6aeD
         0pZF6M4XjeMGjWyEP/2iUaSJ3RLLA1MVWowo1/sTJnyAPUWfAam3kmQ025cSixObJww3
         A4hArhcYe2GgxuVslCIwP6Q0n9Gu5c7Jb0N+pooDFaumOadDP2rqBqFUd7LYF8UcyJ7Y
         j+sQ==
X-Gm-Message-State: APjAAAULncYeJZNmdEdvK5aUcV0Z22FCKU11zbbk6it02UL8FG0OBplj
        iOTz0go1HWC3Gpg0J548vgT9rw==
X-Google-Smtp-Source: APXvYqzzoz8hW5WNsRr+QGAP5pmz1r20ujicRCSbC4RPyZEQg2Pm/930hS/RB0M0ITiwlO80rrs//A==
X-Received: by 2002:ac8:7695:: with SMTP id g21mr22123082qtr.99.1580744899546;
        Mon, 03 Feb 2020 07:48:19 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id n132sm9814556qke.58.2020.02.03.07.48.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 07:48:18 -0800 (PST)
Message-ID: <1580744894.7365.3.camel@lca.pw>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From:   Qian Cai <cai@lca.pw>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev <kasan-dev@googlegroups.com>
Date:   Mon, 03 Feb 2020 10:48:14 -0500
In-Reply-To: <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
         <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
         <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, 2020-02-03 at 16:14 +0100, Christophe Leroy wrote:
> 
> Le 02/02/2020 à 12:26, Qian Cai a écrit :
> > 
> > 
> > > On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > > 
> > > config DEBUG_VM_PGTABLE
> > >     bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > >     depends on MMU
> > >     default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
> > >     default 'y' if DEBUG_VM
> > 
> > Does it really necessary to potentially force all bots to run this? Syzbot, kernel test robot etc? Does it ever pay off for all their machine times there?
> > 
> 
> Machine time ?
> 
> On a 32 bits powerpc running at 132 MHz, the tests takes less than 10ms. 
> Is it worth taking the risk of not detecting faults by not selecting it 
> by default ?

The risk is quite low as Catalin mentioned this thing is not to detect
regressions but rather for arch/mm maintainers.

I do appreciate the efforts to get everyone as possible to run this thing,
so it get more notices once it is broken. However, DEBUG_VM seems like such
a generic Kconfig those days that have even been enabled by default for
Fedora Linux, so I would rather see a more sensitive default been taken
even though the test runtime is fairly quickly on a small machine for now.

> 
> [    5.656916] debug_vm_pgtable: debug_vm_pgtable: Validating 
> architecture page table helpers
> [    5.665661] debug_vm_pgtable: debug_vm_pgtable: Validated 
> architecture page table helpers

