Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD93E4315
	for <lists+linux-sh@lfdr.de>; Fri, 25 Oct 2019 07:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393715AbfJYFxC (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 25 Oct 2019 01:53:02 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34099 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393714AbfJYFxB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 25 Oct 2019 01:53:01 -0400
Received: by mail-qk1-f196.google.com with SMTP id f18so721175qkm.1
        for <linux-sh@vger.kernel.org>; Thu, 24 Oct 2019 22:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=1iOcwXtGM80ggiAcn0tWj6rY4y3FXj3/K8+9W6cybNQ=;
        b=Zqxn3o9ynPwH66+Qcr9vdGz6gSYyudkpi+Z2Oz0jbhfPz7rA3PabNWQQCma5I+yARn
         eBlST1wXQLW765R9cjQEb7jShJbR5OSNoXMUXkknkPBFMVf5yWXTtaUsuk9Rd2PxzAmh
         q2AJBIMYQ1hbRT2IEgL/DenzigssaRzaLPngNDd0uNGZNn5VPmHDNtWOe5i7LU6gxGms
         DG+cRAyxM2Yo5dTFUbyEjy/oXZ60fHMnjOKMvqPhtEVeXP3HjJ0d5mzbSpqHawcBlByH
         TzKbaZfTQCyPdzEsLR/gqo/nNF6hyedXePJbHFV1sF38FX0OXhfyWuYjlDSDd9K5Iode
         sxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=1iOcwXtGM80ggiAcn0tWj6rY4y3FXj3/K8+9W6cybNQ=;
        b=CgFM1cyEUSICWprsQqt1+qPvUvqs2PllnnwD8DrE7v/c6vzIGSvJiHbYV9sC4Jz/+p
         1QpdNtGrPKu9gy4G6bQtfU+POZD828JhGm6dy3n2+DnVd71IrPzVqAH+aIdRYFmZTmq1
         k396CVI7q4lFj7EYua2wu2AXlIx07IsE8nW4Ftr5ZI3PlZkThWXy4LmaZQW0ZfaFlxki
         mTR1lHXrDgaY17HFvez9ZHD4BANXVmb9BnrSEkscY/NCTkdYrzqU9pJQNVY9d88W+pOT
         f13PScPdi+9DaEKwJ59y8MDgJ6+2XqTPhV8F5uYhiIQr/MnC5eKm1aHssy4am2mR/UQy
         RtGA==
X-Gm-Message-State: APjAAAWoAcy2rIek19mksctF7w0tXtf3Eu6/Vq4+AVjx7OWhTuD7VXHR
        PPGlQ0zzmJ8gsNLh3E4L9GuP3w==
X-Google-Smtp-Source: APXvYqx2Df+s9byE/wNVstFnjLEksyrVQg6dm5A3OEDXYMZmbJ9PH0J1MBt8U1ezq/VXB9h6sxXS6Q==
X-Received: by 2002:a05:620a:a8d:: with SMTP id v13mr1326244qkg.113.1571982780765;
        Thu, 24 Oct 2019 22:53:00 -0700 (PDT)
Received: from [10.250.15.239] ([76.191.34.78])
        by smtp.gmail.com with ESMTPSA id e12sm517936qth.55.2019.10.24.22.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 22:53:00 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table helpers
Date:   Fri, 25 Oct 2019 01:52:59 -0400
Message-Id: <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
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
In-Reply-To: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



> On Oct 24, 2019, at 11:45 PM, Anshuman Khandual <Anshuman.Khandual@arm.com=
> wrote:
>=20
> Nothing specific. But just tested this with x86 defconfig with relevant co=
nfigs
> which are required for this test. Not sure if it involved W=3D1.

No, it will not. It needs to run like,

make W=3D1 -j 64 2>/tmp/warns=
