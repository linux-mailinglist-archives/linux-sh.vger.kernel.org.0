Return-Path: <linux-sh+bounces-2468-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6CA4B5D5
	for <lists+linux-sh@lfdr.de>; Mon,  3 Mar 2025 02:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960113AFC8D
	for <lists+linux-sh@lfdr.de>; Mon,  3 Mar 2025 01:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B027E765;
	Mon,  3 Mar 2025 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TK04mLFo"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7784F42A94
	for <linux-sh@vger.kernel.org>; Mon,  3 Mar 2025 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740966353; cv=none; b=X7+wK5YO51ojARlQEHX5bz6nOCowOh8yOrxfN4RYQ4U8h2xC472Eo3jPlVeotiN7QmNtP33fsg2IszmCDLWf82+jc+9PwjFsx5n2p3p+YHi6+JQmzTHuYaKMn1CFt936LWtDeNzXgh67x2li0egYdbu4AFnyGhUoWAOTvpqGjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740966353; c=relaxed/simple;
	bh=VVdApa3BG2mFUlbyWpECbB13z5U6JMfWDjN+ddRNM7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvKr2M2uomTTwBGelNJaKY1doRxfZ9F5thOJ56MeItEUpT344MPckDi3HxOIb/ilbs+L+1Am5om+13lNVQvUwcXBGBmbArxRRp5TKZGdkgw1R915XPqMXV5LSn9yb2F+cAxg4LGfTVVTWDMAYPJpRx6QshJNtrkoLZ6p95mu7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TK04mLFo; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c186270230so477539fac.0
        for <linux-sh@vger.kernel.org>; Sun, 02 Mar 2025 17:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740966349; x=1741571149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8SnZDZRbvLSaoNIXAx3tJOrDKr8WC27+4Kk8dOe4BE=;
        b=TK04mLFogIQ65pDkgHnRSCTOCitks0JFjNzCP9pXKTMzD5Tg32Eqb9rXN7CS7i8yyk
         AG+d0IVfykTXSi1HRB9zjSWb83BHgEdiDqDfQP+WV/4r3h338ReQIecHig++pFaz5uKd
         0QWgk4rUM+MxXcDZqqZ5h4OmkUI7NkYaKOqd4Xe6eZcuDqsNdt8mqUkzxowxK4jG5EUs
         XD/ZwAkBqoBcXaXSBbxigzj6RKgIKjMHR6nEWf3G42pRqjfYBzad+lSvDi6eatiD3fF+
         2OfFDAjysExJ/VxJ4nt7oRA1Ab6PUTpD9/ojbtOTGq/FOy7r1JG9Wtr8wTtjGbHf1/+l
         r5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740966349; x=1741571149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8SnZDZRbvLSaoNIXAx3tJOrDKr8WC27+4Kk8dOe4BE=;
        b=hVZCArKqWKQW/QHFZkjGUNA6fcEnx/BZKyRtu3ck1/7Qmx64KBW19wMHQO/x6YwP+z
         NVs9E4DUDCQmgw0BOO1gCcAvuSdSwhPKcNhVH9+VGOBliEqNZRWhpwOGfBj5SbCVrMvj
         sgTp8Kg0feTNV/kEZTIsiZiWByJiC9eHq0pC6QrI5d8rpVejIMrsfvJyLHUtlHUQR/Sa
         wt8jTq+uDJffQTJLgXi26yd3Cy2FCJfSsQmLbtCZ4w7zXcDxDFGGWx/Fv8iMoVVtqIca
         WprHKFFqJ45VOouDITXVSH3YC3m0sxLxHBu83nAqXzK06Na3+YMdSKAFx+7E8lBG/Iyt
         MpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTI2uJtcXH9RbAH7uuKthU0gl6Uqjgm80JdMhkWI3DObBQNFloN76GKakDLBmtCS76hOqbOgNKeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56O4P/52Wnm/TGyOIN3mWB01/aQNK0Eu+MUIuSlT65oHzMJIX
	5q9cdBFhKvE1f8Df4VsunW2wkCrf+ykqUYgRklT6wzO1sS7QBdGLtwT4iGFS75cTsRIxdbjBUHF
	bLhu3VvUKyThgTgiYNQwIzLuQR4K2Edd1Ux/ktg==
X-Gm-Gg: ASbGncsqAInhHRtRrnzB34WhkXmoYC4NJG4mR0MpA1J5MG5IqKYNUJbGP8Xsvw14d2S
	Ilqyo/eJtnGJEpB9VH9pR6h32QFaPIH3PeXWCnD2p1VZhpeYBNw8gi2CaRHxPMMbOvLUclT1IlF
	amb9U/47UntLKJSq3xAlRfWiKPKuXx
X-Google-Smtp-Source: AGHT+IGOWIRMroQZxbRNJcNH5tnmnGD/bIDamuPKwa3GDm5B/gWkRsBelrb1kdvpy/ijW+hukYwC4esnzOdnOPSB3MY=
X-Received: by 2002:a05:6871:aa16:b0:2b8:3d1c:772 with SMTP id
 586e51a60fabf-2c178335be6mr6945276fac.5.1740966349475; Sun, 02 Mar 2025
 17:45:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740454179.git.zhengqi.arch@bytedance.com> <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
In-Reply-To: <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 3 Mar 2025 09:45:37 +0800
X-Gm-Features: AQ5f1Jrb5nkY3jTSkwu3MIgtit28ISDfNBjj4Qwj5SXBUXKwFnVTECUIEIzLwQo
Message-ID: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
Subject: Re: [External] [PATCH v2 4/6] riscv: pgtable: unconditionally use tlb_remove_ptdesc()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com, 
	vishal.moola@gmail.com, david@redhat.com, jannh@google.com, hughd@google.com, 
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com, 
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi,

On Tue, Feb 25, 2025 at 11:48=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.c=
om> wrote:
>
> To support fast gup, the commit 69be3fb111e7 ("riscv: enable
> MMU_GATHER_RCU_TABLE_FREE for SMP && MMU") did the following:
>
> 1) use tlb_remove_page_ptdesc() for those platforms which use IPI to
>    perform TLB shootdown
>
> 2) use tlb_remove_ptdesc() for those platforms which use SBI to perform
>    TLB shootdown
>
> The tlb_remove_page_ptdesc() is the wrapper of the tlb_remove_page(). By
> design, the tlb_remove_page() should be used to remove a normal page from
> a page table entry, and should not be used for page table pages.
>
> The tlb_remove_ptdesc() is the wrapper of the tlb_remove_table(), which i=
s
> designed specifically for freeing page table pages. If the
> CONFIG_MMU_GATHER_TABLE_FREE is enabled, the tlb_remove_table() will use
> semi RCU to free page table pages, that is:
>
>  - batch table freeing: asynchronous free by RCU
>  - single table freeing: IPI + synchronous free
>
> If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
> will fall back to pagetable_dtor() + tlb_remove_page().
>
> For case 1), since we need to perform TLB shootdown before freeing the
> page table page, the local_irq_save() in fast gup can block the freeing
> and protect the fast gup page walker. Therefore we can ensure safety by
> just using tlb_remove_page_ptdesc(). In addition, we can also the
> tlb_remove_ptdesc()/tlb_remove_table() to achieve it, and it doesn't
> matter whether CONFIG_MMU_GATHER_RCU_TABLE_FREE is selected. And in
> theory, the performance of freeing pages asynchronously via RCU will not
> be lower than synchronous free.
>
> For case 2), since local_irq_save() only disable S-privilege IPI irq but
> not M-privilege's, which is used by the SBI implementation to perform TLB
> shootdown, so we must select CONFIG_MMU_GATHER_RCU_TABLE_FREE and use
> tlb_remove_ptdesc() to ensure safety. The riscv selects this config for
> SMP && MMU, the CONFIG_RISCV_SBI is dependent on MMU. Therefore, only the
> UP system may have the situation where CONFIG_MMU_GATHER_RCU_TABLE_FREE i=
s
> disabled but CONFIG_RISCV_SBI is enabled. But there is no freeing vs fast
> gup race in the UP system.
>
> So, in summary, we can use tlb_remove_ptdesc() to support fast gup in all
> cases, and this interface is specifically designed for page table pages.
> So let's use it unconditionally.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/riscv/include/asm/pgalloc.h | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pg=
alloc.h
> index 3e2aebea6312d..770ce18a7328b 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -15,24 +15,6 @@
>  #define __HAVE_ARCH_PUD_FREE
>  #include <asm-generic/pgalloc.h>
>
> -/*
> - * While riscv platforms with riscv_ipi_for_rfence as true require an IP=
I to
> - * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as fa=
lse use
> - * SBI to perform TLB shootdown. To keep software pagetable walkers safe=
 in this
> - * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). S=
ee the
> - * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm=
-generic/tlb.h
> - * for more details.
> - */
> -static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void =
*pt)
> -{
> -       if (riscv_use_sbi_for_rfence()) {
> -               tlb_remove_ptdesc(tlb, pt);
> -       } else {
> -               pagetable_dtor(pt);
> -               tlb_remove_page_ptdesc(tlb, pt);
> -       }
> -}
> -
>  static inline void pmd_populate_kernel(struct mm_struct *mm,
>         pmd_t *pmd, pte_t *pte)
>  {
> @@ -108,14 +90,14 @@ static inline void __pud_free_tlb(struct mmu_gather =
*tlb, pud_t *pud,
>                                   unsigned long addr)
>  {
>         if (pgtable_l4_enabled)
> -               riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
> +               tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
>  }
>
>  static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>                                   unsigned long addr)
>  {
>         if (pgtable_l5_enabled)
> -               riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> +               tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
>  }
>  #endif /* __PAGETABLE_PMD_FOLDED */
>
> @@ -143,7 +125,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
>                                   unsigned long addr)
>  {
> -       riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
> +       tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
>  }
>
>  #endif /* __PAGETABLE_PMD_FOLDED */
> @@ -151,7 +133,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *=
tlb, pmd_t *pmd,
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
>                                   unsigned long addr)
>  {
> -       riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
> +       tlb_remove_ptdesc(tlb, page_ptdesc(pte));
>  }
>  #endif /* CONFIG_MMU */
>
> --
> 2.20.1
>
>

This set of patches mainly refactors the remove page table function
interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
was no longer needed, and this patch handles that.

Additionally, whether riscv_use_sbi_for_rfence is true or false, page
tables can now be released using RCU. This patch changes the previous
synchronous release logic (for !riscv_use_sbi_for_rfence) to an
RCU-based release.

So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>

Based on qemu-system-riscv64, I tested this patch. The log is as follows:
./gup_test
TAP version 13
1..1
# GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
# ok 1 ioctl status 0
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thanks,
Yunhui

