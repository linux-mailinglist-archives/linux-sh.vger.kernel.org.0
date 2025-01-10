Return-Path: <linux-sh+bounces-2265-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39584A09B5F
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jan 2025 20:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68AEC3A2865
	for <lists+linux-sh@lfdr.de>; Fri, 10 Jan 2025 19:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FAF227594;
	Fri, 10 Jan 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x/fetZE9"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7C21C193
	for <linux-sh@vger.kernel.org>; Fri, 10 Jan 2025 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534524; cv=none; b=gH9sBvmk+K+PebdICrXU3B6SMSyDRTs3kTVcXQZu1b33wnWi6F7Db3HjcrXwH95jEV6ki1yGuxG36NhVmgaNIId7rDbpNVdwf7R3tqvcborTROu4UfT7FeVgNIVrD95xdgCPHHtAPV+Kn/6Yt2N6opeWm8eSvf4jw557LGC3hZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534524; c=relaxed/simple;
	bh=4d7pidGbvdIp8iHsT7YACeXpM+11EgA5LY+ovyRSffk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oZjPoIcdDJbZVcXkQdvbetHEPllfPGmlYZup3Edx9vSaT5HqDGFLNqoOlmVqerBoZuvPcligzXhU+itQJSQIuvXhwm8moP9fZ5QvQlnfjiFzPy1Wnh3nm7M6QqX4853qSSPrMU5VDC4fR0MLlIrwDc3Nqpo3FXrV7byhaLBw1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x/fetZE9; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385e49efd59so941634f8f.0
        for <linux-sh@vger.kernel.org>; Fri, 10 Jan 2025 10:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534486; x=1737139286; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fqV4f6s/Eo+EZ+PE2OCyE0kBm/vfnsLcFKRz+1otrE=;
        b=x/fetZE9fqENNHA/TK7J3oNSgvGr+mTjENc36PJ4rqxoixGMSS2It48gQWpx5s1gLQ
         Q1bsI0nE5oPMsCrnK07kvVUSVDiVdcnQz0NDggu7QBOA49tfKncNEEKcZ+tcwl35q1iB
         ZW7Tq5/dKeWJMGEMwbIsEwh8eqNEPfjCaU15NIF/lDZc/wXJB2vS5oM+kKLEbmWg4eTH
         FDOIZ8zuvDv/Sit/wd2xrxF+AyAShMGCcD3ko6RY2pPVMsItRF+lXGxNuvVyg5XVlQBO
         8Nlrte9RJKZ5VdXMsskcV/p46JPYnucaAu8MnqMqBS0QbQzJ2h+yOejkpfafbu2lbMQe
         STZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534486; x=1737139286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fqV4f6s/Eo+EZ+PE2OCyE0kBm/vfnsLcFKRz+1otrE=;
        b=GMlxhUSq+kioOIE6yL8bLBL3DtzQZXVZzsx7aBRv9O/g7fdWBtuH3DaSxh3/IUL0EB
         Uv5AtbdMw57qOU5qt3P67ymHplUNxgfrZdX5C1ttdQwLp8E5h8gdfCSEFK1H1hRsBbZ1
         aGxEHEVY2UF6Hd6X4Gm+OP/cF3U00b7a/q3uumJpDTmvaV46HumXQUiGuZDb084e/Qsu
         JoYsA+UW+Wj5CnYc4EB13bPaz844CLlDshsyFKl7IQYMChM7zKaHA9NFiCDZrq5ZJun2
         pc6T3zW7dU2ObXFbIuzB6GSrrysuFjC9heJYPvYxIhWkbAT1qymTPNwMfesJBhHrQ4xR
         QxtA==
X-Forwarded-Encrypted: i=1; AJvYcCVCbx1pmz/rRiCzefDc8LJf8zUBKGCunv02iVjC4uuRfXzsQ9tgDs0TVA1iuhzANuWMtSLLIeAIiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Qu0WaaxturnjF1K9ZZT7PbCYPZjJnmabW0YRw0YxneryLcLA
	bAIUVs3w8lw6k+2/Tafogt44rrWgS4f9CN0JT/5CTfABDtJv9qDm0f9WPsv56pWdjQg4+5Tfd1N
	jiEl6W/K9eA==
X-Google-Smtp-Source: AGHT+IFgJUpClA++DtJe4xQ45Yc9kKsVSyJCXKqF0cxpPlCBfuMButRzIe/JLM7ynzshFcOsnG5hhjluySNsEA==
X-Received: from wrbeh5.prod.google.com ([2002:a05:6000:4105:b0:382:4235:c487])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:8b5b:0:b0:38a:88bc:aea4 with SMTP id ffacd0b85a97d-38a88bcaebfmr7355114f8f.30.1736534486264;
 Fri, 10 Jan 2025 10:41:26 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:44 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-18-8419288bc805@google.com>
Subject: [PATCH RFC v2 18/29] mm: asi: Map dynamic percpu memory as nonsensitive
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
	Brendan Jackman <jackmanb@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="utf-8"

From: Reiji Watanabe <reijiw@google.com>

Currently, all dynamic percpu memory is implicitly (and
unintentionally) treated as sensitive memory.

Unconditionally map pages for dynamically allocated percpu
memory as global nonsensitive memory, other than pages that
are allocated for pcpu_{first,reserved}_chunk during early
boot via memblock allocator (these will be taken care by the
following patch).

We don't support sensitive percpu memory allocation yet.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Reiji Watanabe <reijiw@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>

WIP: Drop VM_SENSITIVE checks from percpu code
---
 mm/percpu-vm.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 mm/percpu.c    |  4 ++--
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index cd69caf6aa8d8eded2395eb4bc4051b78ec6aa33..2935d7fbac41548819a94dcc60566bd18cde819a 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -132,11 +132,20 @@ static void pcpu_pre_unmap_flush(struct pcpu_chunk *chunk,
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
 }
 
-static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
+static void ___pcpu_unmap_pages(unsigned long addr, int nr_pages)
 {
 	vunmap_range_noflush(addr, addr + (nr_pages << PAGE_SHIFT));
 }
 
+static void __pcpu_unmap_pages(unsigned long addr, int nr_pages,
+			       unsigned long vm_flags)
+{
+	unsigned long size = nr_pages << PAGE_SHIFT;
+
+	asi_unmap(ASI_GLOBAL_NONSENSITIVE, (void *)addr, size);
+	___pcpu_unmap_pages(addr, nr_pages);
+}
+
 /**
  * pcpu_unmap_pages - unmap pages out of a pcpu_chunk
  * @chunk: chunk of interest
@@ -153,6 +162,8 @@ static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
 static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
 			     struct page **pages, int page_start, int page_end)
 {
+	struct vm_struct **vms = (struct vm_struct **)chunk->data;
+	unsigned long vm_flags = vms ? vms[0]->flags : VM_ALLOC;
 	unsigned int cpu;
 	int i;
 
@@ -165,7 +176,7 @@ static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
 			pages[pcpu_page_idx(cpu, i)] = page;
 		}
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, cpu, page_start),
-				   page_end - page_start);
+				   page_end - page_start, vm_flags);
 	}
 }
 
@@ -190,13 +201,38 @@ static void pcpu_post_unmap_tlb_flush(struct pcpu_chunk *chunk,
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
 }
 
-static int __pcpu_map_pages(unsigned long addr, struct page **pages,
-			    int nr_pages)
+/*
+ * __pcpu_map_pages() should not be called during the percpu initialization,
+ * as asi_map() depends on the page allocator (which isn't available yet
+ * during percpu initialization).  Instead, ___pcpu_map_pages() can be used
+ * during the percpu initialization. But, any pages that are mapped with
+ * ___pcpu_map_pages() will be treated as sensitive memory, unless
+ * they are explicitly mapped with asi_map() later.
+ */
+static int ___pcpu_map_pages(unsigned long addr, struct page **pages,
+			     int nr_pages)
 {
 	return vmap_pages_range_noflush(addr, addr + (nr_pages << PAGE_SHIFT),
 					PAGE_KERNEL, pages, PAGE_SHIFT);
 }
 
+static int __pcpu_map_pages(unsigned long addr, struct page **pages,
+			    int nr_pages, unsigned long vm_flags)
+{
+	unsigned long size = nr_pages << PAGE_SHIFT;
+	int err;
+
+	err = ___pcpu_map_pages(addr, pages, nr_pages);
+	if (err)
+		return err;
+
+	/*
+	 * If this fails, pcpu_map_pages()->__pcpu_unmap_pages() will call
+	 * asi_unmap() and clean up any partial mappings.
+	 */
+	return asi_map(ASI_GLOBAL_NONSENSITIVE, (void *)addr, size);
+}
+
 /**
  * pcpu_map_pages - map pages into a pcpu_chunk
  * @chunk: chunk of interest
@@ -214,13 +250,15 @@ static int __pcpu_map_pages(unsigned long addr, struct page **pages,
 static int pcpu_map_pages(struct pcpu_chunk *chunk,
 			  struct page **pages, int page_start, int page_end)
 {
+	struct vm_struct **vms = (struct vm_struct **)chunk->data;
+	unsigned long vm_flags = vms ? vms[0]->flags : VM_ALLOC;
 	unsigned int cpu, tcpu;
 	int i, err;
 
 	for_each_possible_cpu(cpu) {
 		err = __pcpu_map_pages(pcpu_chunk_addr(chunk, cpu, page_start),
 				       &pages[pcpu_page_idx(cpu, page_start)],
-				       page_end - page_start);
+				       page_end - page_start, vm_flags);
 		if (err < 0)
 			goto err;
 
@@ -232,7 +270,7 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk,
 err:
 	for_each_possible_cpu(tcpu) {
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
-				   page_end - page_start);
+				   page_end - page_start, vm_flags);
 		if (tcpu == cpu)
 			break;
 	}
diff --git a/mm/percpu.c b/mm/percpu.c
index da21680ff294cb53dfb42bf0d3b3bbd2654d2cfa..c2d913c579bf07892957ac7f601a6a71defadc4b 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3273,8 +3273,8 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 			pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
 
 		/* pte already populated, the following shouldn't fail */
-		rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
-				      unit_pages);
+		rc = ___pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
+				       unit_pages);
 		if (rc < 0)
 			panic("failed to map percpu area, err=%d\n", rc);
 

-- 
2.47.1.613.gc27f4b7a9f-goog


