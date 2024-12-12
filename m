Return-Path: <linux-sh+bounces-2012-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7029EDBB1
	for <lists+linux-sh@lfdr.de>; Thu, 12 Dec 2024 00:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F411889EF1
	for <lists+linux-sh@lfdr.de>; Wed, 11 Dec 2024 23:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C5F2010E5;
	Wed, 11 Dec 2024 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OXajPhuQ"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535961FD796
	for <linux-sh@vger.kernel.org>; Wed, 11 Dec 2024 23:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959709; cv=none; b=La9cy+ZAvSCxIgw/rbYQarptORP8rKZQak16jrrjHqy6wen5fUKNTKLs8cxSBnDt+HdA/cLtbO4scdz7Vj2aRyxXZ0G5e0LmYtoqCw7JJrS2uGC6U/Tn7Sl3XaQ4aRkPYbN4qzzrkJm1AIVzg4IpNI8mMjMI2rsgGSBTMIkgk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959709; c=relaxed/simple;
	bh=e6BnmSCV2QrrtoqE+kEeLZmDcpCmkfYXz43FlPij0LM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W6ouEEnw0UfmKc8uslyJFBDQuphDFmqnYi5e33jEY5/xQIBA+uxsw+RjYrZBPTv0+fycBNugtuZ5IsyUh+Z1AZMCxQe797H8FZQdCXUlsonV50I6lI0fp2EajJGDiuqC3AbT3KAouA4dNOsI3+cT6r7NmPN/PYkWO7PrF9Gpvcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OXajPhuQ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728eb2e190cso13316b3a.3
        for <linux-sh@vger.kernel.org>; Wed, 11 Dec 2024 15:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959706; x=1734564506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=OXajPhuQrIh+qiUrSPxrwqRABByE6r0uBtIra/NXAhrZWdRhgIXKn6oBQMg01UPGCE
         36CnE3+f1S7sGsp2c9lfX3FK2LFG6yaMe1UwcVQtHOyfH4pB4efEP1nDAJPbeoEOUfPK
         4t6z3rdpI4j7tYB3W0m1DJz3PCB+OO9lBVuPOvBd22D1rxzu3droH932qVtl9kbXTCPY
         SVhWEV4FWmckLmjCH6qRgFKfR+JUindoxy8maZbdre66KeN4iV2DBwDKHAfaBXq8RmDd
         LNPDeFLjao067G8USlrya6O0tfRLNcvx7Qu9KQOROGMgtjeB/l54BQzmqFdKImC3an7F
         Kt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959706; x=1734564506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=Merj6evIjk4pQ9z8jKLTanJ8jPsg7i3a+8YR6gNupoyVT1GLYnxqYhm50RWmAXqtq5
         O5usr2eQhZD8mwm3h2kMZBY8ua1g7sbg3RO/ljfVDObfLaY5RRIzr6Go5wul8flU9cx3
         R5r334pdoHvSLPh8C1KFaiDH+6eSCty06gL43t+IyiApVxJXAozxm4fv8NvzTpw5Zpam
         bMvP4rk8T0mFbLLT6OypfamKjCVjt1/HiPdMIBOprguljFaDsQtfHYPzDgzhC9cStiZU
         SJL21pxq6TzuZAqxY40DvIUQoo+MBU01IreFqDiUvqadZhSdTmgAbNbgbS7RQfysppTG
         BBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS8/yIKHuEdtPD4O1prHnU1zqs0nZmW7ZAXR1qcZojePbzWXhmiHlkT+O2GP9NLYLa4m90PeKhnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Uh4xGvRraRreniO90rStjfQl7MZK2PQAI3yhM4QkUybrfxic
	6m+tB8pGXry4y5d3ctQoQJRd6nwUvYhQ/daWbSUcZH8T3+8usTbTEbqKUtiYZUemcH30u42XLBx
	SG5u2OKs5cHo8x6c8aETDzA==
X-Google-Smtp-Source: AGHT+IGnJnRJXQZ5IIc8W3PGTGxBtDfE/sIYeRjCrJpkHMTtOgcOp40OoEyKbTRESGUAjOdqxtzUpt2F+EP39npdAw==
X-Received: from pfbcw14.prod.google.com ([2002:a05:6a00:450e:b0:728:e4d7:e3d3])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10d:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1e1cea82ca5mr1784516637.1.1733959706098;
 Wed, 11 Dec 2024 15:28:26 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:53 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-16-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 15/16] mm: powerpc: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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

Introduce powerpc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/powerpc/include/asm/book3s/64/slice.h |  1 +
 arch/powerpc/mm/book3s64/slice.c           | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index 5fbe18544cbd..89f629080e90 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -10,6 +10,7 @@
 #endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 #endif
 
 #define SLICE_LOW_SHIFT		28
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index bc9a39821d1c..b4067c57c778 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -647,6 +647,37 @@ static int file_to_psize(struct file *file)
 }
 #endif
 
+static unsigned long slice_mmap_hint(unsigned long addr, unsigned long len,
+				     unsigned long flags, unsigned int psize)
+{
+	unsigned long hint_addr = slice_get_unmapped_area(addr, len, flags, psize, 0);
+
+	if (IS_ERR_VALUE(hint_addr) || hint_addr == PAGE_ALIGN(addr))
+		return hint_addr;
+
+	return 0;
+}
+
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned int psize;
+
+	if (!addr)
+		return 0;
+
+	if (radix_enabled())
+		return generic_mmap_hint(filp, addr, len, pgoff, flags);
+
+	if (filp && is_file_hugepages(filp))
+		psize = file_to_psize(filp);
+	else
+		psize = mm_ctx_user_psize(&current->mm->context);
+
+	return slice_mmap_hint(addr, len, flags, psize);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
-- 
2.47.0.338.g60cca15819-goog


