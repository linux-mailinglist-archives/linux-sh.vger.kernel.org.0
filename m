Return-Path: <linux-sh+bounces-2261-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F2A09AD7
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jan 2025 19:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A427A0488
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jan 2025 18:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B04D22689D;
	Fri, 10 Jan 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYy/My5o"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC8225783
	for <linux-sh@vger.kernel.org>; Fri, 10 Jan 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534521; cv=none; b=XaU3/AwHurcpD6GVNAptCgEzuFwHtOEXIpotYiETOdl+4TZoCXPkGDsl3IKDlK7sMgVwQg1hIlw1nre3Z1Bhr3WzFDm7kFYxP78cyOXp6IYtEO6M/3RsK65ctVGA9mAu3Qk9N5o5GW/Q3Oo6CJjnU7+RYiUKoXj56Ti4O54LMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534521; c=relaxed/simple;
	bh=kGzuSX53lHwpbQyPS7sz1yo/F9Y/VcabtEWf2Y1h4vY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QoEXhSgnY7eYU41p303XP0xL4GuvoicEgU8gI8v0wTfbnVkRVA4Zu8SqS8gXP0sb7hyX6BaDkbbsZ8WR2f/WMtPmZSsHqoWXdpq9aScFDV6CdRcF/Xx+Sqc/Q5iahMcRdUSfEBNJCrla7vCz3G4ws4RTATPxTjzsr0FGHsBtum8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYy/My5o; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38a9118c486so1465744f8f.1
        for <linux-sh@vger.kernel.org>; Fri, 10 Jan 2025 10:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534491; x=1737139291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=CYy/My5odBGanUx9mJU448Z1FppXeL+BCJYcZBer9Hi3Ylw9Y3F31R6YtnmO/CvnJr
         YIlR3o2jdCU2FFCKXcJlsCKlT+NH163A8E1XnR6zQsRSAsWcYQHXgnD+oCR5pbrhH2FL
         uwolnqS5smZbHt4uLtRCyHgCjVnljI8Oo85sv/Kn+g0Zkm31xTSV4ajxMqZvPgRORD3+
         mxzHiZjq8FUBv71L72jBXhJ1CQt+r9iLMpFUP0Sw/Mo+Ic2VxYNLanMom0NlPpHQf4su
         luM10YHPmsYXcGhc4e3RKmpY7tpw/RKXVqZkS80gOOVVaS4eqbviVv96Wf7/ybSyeTQe
         bZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534491; x=1737139291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=D6wKaQCZVIlQihrpDabiahiojjm+qgKBtd4+GfvMRjrTnMBYcpYVMPBnMlM/QPmDqx
         d3jRg6RAm2CxfvuwRhQ/PlyAvbcOyopzUiK/yUxEhdACCw7Omn6yx30sBT05F+rFkRMz
         8VPkwzi68BMq7DNwo23ek6Zhb3OIVdTKvAtBaqE5gwQs1gdmQpz64ECYhzWbe284hACQ
         Fx1VHu4t7QLc2jQygpJ6NSL2itaGRQdyyxmhV6syKk0TQH3BmvOen+CnEl4vMjEJX2Mn
         R4YnYXps3SRsONPs6zAnfaAO/2LVPD3yvR848XhJxd0EJVk1I4OstPYXZBYZTceOzJF5
         L1tA==
X-Forwarded-Encrypted: i=1; AJvYcCWh+91qGpLpUjqtRN72Y8CNfuFNtAbkU5e7BZpiJU9y0GdW6hMN2i6uFrjSEFXt4PnQO829NpgRFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxaacuWMXcrAE5VIBCeYCR2Hp7c8aeBIL92XNOFZhtdj5Mf2d
	8iRvbaQ9zthkmmDJInN36OdrF3vlxS/baqeVrcQ0jpVNyO862K1+AuQpD6AC68z6e9Ex9PQeY8g
	Ix/kJeIo0rg==
X-Google-Smtp-Source: AGHT+IEE74PFwgraC6zRNOcME3rOW4swKtJd/bKE4AIl8MRowFtdpWNq19ZBTTKPz5sLGPxmEc1GHABVlwipiQ==
X-Received: from wmjv9.prod.google.com ([2002:a7b:cb49:0:b0:434:f173:a51])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a85:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38a872eb1eamr9947778f8f.27.1736534490587;
 Fri, 10 Jan 2025 10:41:30 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:46 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-20-8419288bc805@google.com>
Subject: [PATCH RFC v2 20/29] mm: asi: Make TLB flushing correct under ASI
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

This is the absolute minimum change for TLB flushing to be correct under
ASI. There are two arguably orthogonal changes in here but they feel
small enough for a single commit.

.:: CR3 stabilization

As noted in the comment ASI can destabilize CR3, but we can stabilize it
again by calling asi_exit, this makes it safe to read CR3 and write it
back.

This is enough to be correct - we don't have to worry about invalidating
the other ASI address space (i.e. we don't need to invalidate the
restricted address space if we are currently unrestricted / vice versa)
because we currently never set the noflush bit in CR3 for ASI
transitions.

Even without using CR3's noflush bit there are trivial optimizations
still on the table here: on where invpcid_flush_single_context is
available (i.e. with the INVPCID_SINGLE feature) we can use that in lieu
of the CR3 read/write, and avoid the extremely costly asi_exit.

.:: Invalidating kernel mappings

Before ASI, with KPTI off we always either disable PCID or use global
mappings for kernel memory. However ASI disables global kernel mappings
regardless of factors. So we need to invalidate other address spaces to
trigger a flush when we switch into them.

Note that there is currently a pointless write of
cpu_tlbstate.invalidate_other in the case of KPTI and !PCID. We've added
another case of that (ASI, !KPTI and !PCID). I think that's preferable
to expanding the conditional in flush_tlb_one_kernel.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index ce5598f96ea7a84dc0e8623022ab5bfbba401b48..07b1657bee8e4cf17452ea57c838823e76f482c0 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -231,7 +231,7 @@ static void clear_asid_other(void)
 	 * This is only expected to be set if we have disabled
 	 * kernel _PAGE_GLOBAL pages.
 	 */
-	if (!static_cpu_has(X86_FEATURE_PTI)) {
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
 		WARN_ON_ONCE(1);
 		return;
 	}
@@ -1040,7 +1040,6 @@ static void put_flush_tlb_info(void)
 noinstr u16 asi_pcid(struct asi *asi, u16 asid)
 {
 	return kern_pcid(asid) | ((asi->class_id + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
-	// return kern_pcid(asid) | ((asi->index + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
 }
 
 void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len)
@@ -1192,15 +1191,19 @@ void flush_tlb_one_kernel(unsigned long addr)
 	 * use PCID if we also use global PTEs for the kernel mapping, and
 	 * INVLPG flushes global translations across all address spaces.
 	 *
-	 * If PTI is on, then the kernel is mapped with non-global PTEs, and
-	 * __flush_tlb_one_user() will flush the given address for the current
-	 * kernel address space and for its usermode counterpart, but it does
-	 * not flush it for other address spaces.
+	 * If PTI or ASI is on, then the kernel is mapped with non-global PTEs,
+	 * and __flush_tlb_one_user() will flush the given address for the
+	 * current kernel address space and, if PTI is on, for its usermode
+	 * counterpart, but it does not flush it for other address spaces.
 	 */
 	flush_tlb_one_user(addr);
 
-	if (!static_cpu_has(X86_FEATURE_PTI))
+	/* Nothing more to do if PTI and ASI are completely off. */
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
+		VM_WARN_ON_ONCE(static_cpu_has(X86_FEATURE_PCID) &&
+				!(__default_kernel_pte_mask & _PAGE_GLOBAL));
 		return;
+	}
 
 	/*
 	 * See above.  We need to propagate the flush to all other address
@@ -1289,6 +1292,16 @@ STATIC_NOPV void native_flush_tlb_local(void)
 
 	invalidate_user_asid(this_cpu_read(cpu_tlbstate.loaded_mm_asid));
 
+	/*
+	 * Restricted ASI CR3 is unstable outside of critical section, so we
+	 * couldn't flush via a CR3 read/write. asi_exit() stabilizes it.
+	 * We don't expect any flushes in a critical section.
+	 */
+	if (WARN_ON(asi_in_critical_section()))
+		native_flush_tlb_global();
+	else
+		asi_exit();
+
 	/* If current->mm == NULL then the read_cr3() "borrows" an mm */
 	native_write_cr3(__native_read_cr3());
 }

-- 
2.47.1.613.gc27f4b7a9f-goog


