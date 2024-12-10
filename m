Return-Path: <linux-sh+bounces-1976-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4DE9EA576
	for <lists+linux-sh@lfdr.de>; Tue, 10 Dec 2024 03:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642DE188B23D
	for <lists+linux-sh@lfdr.de>; Tue, 10 Dec 2024 02:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5463A1D14F8;
	Tue, 10 Dec 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r+l2mXHR"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8651AAA36
	for <linux-sh@vger.kernel.org>; Tue, 10 Dec 2024 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798495; cv=none; b=E+3sJTiyi/h5D/uI8sCp4svgUOHenzySLLsX4GD+ULtrl07dhCeK08zcaktSOvUejhumO9Q9iY5Xo2hOuWdOhxReghwq4sC2qz/aOTprBCxWq8bO5ioOUOP95WxC2DTeY3lnI6L3kckscKw2w9bwBEA7lAmymZQTRCqcheVaL2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798495; c=relaxed/simple;
	bh=JvP+EsC2ed2h2HeDVKMeMFmoQFp3PpsCZOYPNBeb6GE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e8ZUB9ywdO6D+mCLOWyPyxYfi5mi1TqVK9LCwkMvwrKhReQrzg5NN/J2Wum0oHj9cTE1aT1Zf169AQJ1Xs2geTiQcJAGXuEUevl6OLyrvX077okaZf14d2pGostmsGgEi+sMVQzBRyFt4FRI+GgQulE6kYWoYNDGUgRAgfERMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r+l2mXHR; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so7906634a91.2
        for <linux-sh@vger.kernel.org>; Mon, 09 Dec 2024 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798493; x=1734403293; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=r+l2mXHRQQf9ZJoqHmigNLqlOMQjyKL01T5+fxo/Dzzgs9vnTq8GE0KJaxp09Pl24x
         wxHaZGNDB+Dni92914rkYtbYiQv7lucf0gTYIrFq8lTbKV08jA/4sOf7d8I9C8bC80uC
         agDtEKVVSQIoCgEGuQrRvIluI4WWpm8MIYWfjtFk8dPwhHk/uDzqGadWYFzAD4KZ/rOu
         2+rmbe1sTS2OoUy3OzX3UtY+johXvkrLk/WldfoZsqpIpBTghj2uyRFG/9/Jf97mRTiI
         XzWajhNTX8SNxMYxXfJcnwGoO9+lP6JKLSohM4FCtF4WTeduLv4UlMveaCdHLYKLKIOn
         FXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798493; x=1734403293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=TXN7+fgHdMeEUXigpD60aXRD3KW+IcaXmmPpQcnHXjWfsKZxGT14Adhf406wDCiflI
         MCYpBiyDPfxPE257IAZ6RAdQZjMFa4+lMiELWJPfo+haKaoDP92IFSroYCGrec2mX53A
         0B7iEuw2BkCfAZJx5VBoAwzX2wM72NLYYepFJ3IikNeC9YzzFoTl+98AGaP8HJTZNuAw
         eTRawls3sEg8sNfZ8+Vz9rDO5tq3/rwbUBkTxxeVwYo7pWsK09ncnKaxwJR2jyo/XofM
         Jis0vuvmfA0Wcd6OQEz7e0A8BTUyX8kl/9MdiXuW35Da9rXGCqUsEdkAwPCrJBUizYbz
         qWxA==
X-Forwarded-Encrypted: i=1; AJvYcCU/InYuV3Mo1zMfD+QXxA8nRwAhLNgu9pWvmO3qha047PmjnSv1xB/ALyX5DL33iCBprsbgUy0cew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpLVEtcrXN3cQURqtslufn8EMAHvSf4bGFRzl74hmNmHB3dEr
	fwSBzZKUgau7ax0T7rceljQYiDqMEo/r8QSmvhrjVMjA+uFN/SPZRxc4sGHIMLaW1U3kKbJxJ3T
	+AXXQyL43GratZPhm/+PHcQ==
X-Google-Smtp-Source: AGHT+IHwTbEIW/FAeU1sg3ure6LNMbce1+qfNwJ7QwjwcLyYjZmtwQZSOt2eORyWNRKplpOxNs0RywA1YRSDvXTeEQ==
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:2ea:5c73:542c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c0f:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2efcf1700c3mr4344722a91.3.1733798492790;
 Mon, 09 Dec 2024 18:41:32 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:07 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 05/17] mm: arc: Use generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Use generic_mmap_hint() in arch arch_get_unmapped_area().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/arc/mm/mmap.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..6b1fcea06779 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	/*
@@ -43,14 +42,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


