Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E92E38DD
	for <lists+linux-sh@lfdr.de>; Thu, 24 Oct 2019 18:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409934AbfJXQwA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Oct 2019 12:52:00 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36960 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409931AbfJXQv7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Oct 2019 12:51:59 -0400
Received: by mail-qt1-f195.google.com with SMTP id g50so24696870qtb.4
        for <linux-sh@vger.kernel.org>; Thu, 24 Oct 2019 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=MD1pbzPN74Cooi+p6oJbLof2wiDKOMhFaRekjLXUrZs=;
        b=sB2Jn2rl37IzEiSgyk42DahVjDex25NdgPPfI1R0zFA09tT7ZrEMPasarAoAIcvKxN
         +n+x+G/+I18JPbiGrp5t2JZcqhYPVeiElEGSvhaL9nzJ8Ww77rBhXEczirB9UWDjC+HR
         FGu6S9JSyxY5ETieOFNYQcEvWt2BfiJWwkUuEuoDsJvJztOWzJQGE+BFr2DaG5QlopyQ
         ABJd/lChwAngBkE3q9AXNi+BbvxqNkFBoPMDPmKsYKQMDx8sAaTnfM/AZCbzTa94uXWS
         F+ZruUfTIm9SwZJdBHY7xPH/3MaUjJC8g0ITbr2z/pLULsaIH5B4UY62/g4sqHyx5zRc
         ID7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=MD1pbzPN74Cooi+p6oJbLof2wiDKOMhFaRekjLXUrZs=;
        b=fdz63x2IHTfKH8iRztArtbb0uvNDWUDRptHW9X7JIV5wR/N0oyYANEXojZU+cg5vvo
         th7vrWrOFMEVSjyxUvXTJBRx8VE9yiofIXwPqLGT8G7u7GXHL10P6FhAKPEv68Ncq5Oz
         p/3EHGo3fuPmXBwCdxLaVkwxY9MS40BUu1KoBTs+l/0LTU1Cm6Y9R9oibdIJFGrB/zYV
         zlIaL5F3KP68v/7cqOhSA1kIwQilkNR82s3qA/EMstTRnEoR0/ot1Ws44PPYXakHFlIe
         gIJFdX2VMEx6lG9vsmL4SEKPwdwSbmyBX8UXHcOLFm5jSSthAHDE3NCLPsvpbYomeY2g
         ruCg==
X-Gm-Message-State: APjAAAWCBvN/C3FvJIZg/pm2W8htYTKtZY6/BS8hPeou8l10qWfubVDt
        mPcV82kgy+yTEJfu7LyU3Vh6/A==
X-Google-Smtp-Source: APXvYqxQOBVx3ITKJVFCZM4JTBqxBQ++B+FV+OPeFAZHzhypJMMzaZu2sZwLWN1gjap9nOuKNtEYxQ==
X-Received: by 2002:ac8:1b45:: with SMTP id p5mr1975446qtk.330.1571935918881;
        Thu, 24 Oct 2019 09:51:58 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id u9sm1610352qkk.34.2019.10.24.09.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:51:58 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table helpers
Date:   Thu, 24 Oct 2019 12:51:57 -0400
Message-Id: <FCAFFD72-3781-4474-8393-A4E40264473A@lca.pw>
References: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



> On Oct 24, 2019, at 10:50 AM, Anshuman Khandual <Anshuman.Khandual@arm.com=
> wrote:
>=20
> Changes in V7:
>=20
> - Memory allocation and free routines for mapped pages have been droped
> - Mapped pfns are derived from standard kernel text symbol per Matthew
> - Moved debug_vm_pgtaable() after page_alloc_init_late() per Michal and Qi=
an=20
> - Updated the commit message per Michal
> - Updated W=3D1 GCC warning problem on x86 per Qian Cai

It would be interesting to know if you actually tested  out to see if the wa=
rning went away. As far I can tell, the GCC is quite stubborn there, so I am=
 not going to insist.=
