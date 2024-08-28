Return-Path: <linux-sh+bounces-1513-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66A961EC5
	for <lists+linux-sh@lfdr.de>; Wed, 28 Aug 2024 07:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC1F1F24F1C
	for <lists+linux-sh@lfdr.de>; Wed, 28 Aug 2024 05:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED19C15B971;
	Wed, 28 Aug 2024 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3IkS1buT"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D395E15B141
	for <linux-sh@vger.kernel.org>; Wed, 28 Aug 2024 05:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824210; cv=none; b=QaGN9X2RHOnzvM3wKn0VJuv2sEgyFASbG1LH8YpesbbpvCQGraf86k61RlHe+WlWbppOqyt7aHOo8yX84/c2Qz9uSFCerMzXZPEFD3NY/ZGbn91KeAhs5pKKS6k6E9Lw5+8kacD6S79TyJg8VVDXXNz7DucUyoNeN8UjZmOikCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824210; c=relaxed/simple;
	bh=RM+/CbqQAwiDfaQaSk6aR6JgRkcXqI3LycpAEGdsrx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZOMlTSkWALPchUYYM8nlUdj/8DHJ04BVmWtIK4Vv+fsxbQrdhIhNRON5Nl8ZuJ5VgbrmcSbdzrdY5UzBSj3QKcMiWFami/87w9biJiGUs3ccaxg5MKVIz08PZO+0X+aGkEbw0d3fFloYsmkIBI9Iwc7ZhlIDFrsuurShIuEib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3IkS1buT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-202318c4f45so65337575ad.0
        for <linux-sh@vger.kernel.org>; Tue, 27 Aug 2024 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824207; x=1725429007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnBGdEXd1SbkXIrtxJgk/JDNcWExLMEwccaijei9Lbw=;
        b=3IkS1buTBD0GxsAenXnfivSyjp5hHFvFvDMr4k3pnmaa/wKASkhnkE2sTtE2mRbz03
         7SHbyQlGPPQ668NUMR0GhN6hro1VeCPOt2DneQamL3SgX2N5VxeF9xS9bVyT9t5bzuSs
         oAHFq3UhJvduEUAvNkyNyuJJcLmP1rGyitifWOK8Yc76a2IUnaLLFcODBhmw7G7KpCIR
         pp6XoHGyod7XIgcrQypTBN2UgxYASF7BVtsNdqp2tPwAo5nJvfkDy404E5mD2jksg+I6
         3lHCkKl3tIrpEdNI0zQZOpQb5likmWbhTozjpW/kuvSsR4KM29S6lhDhrxYCoog9sow2
         S4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824207; x=1725429007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnBGdEXd1SbkXIrtxJgk/JDNcWExLMEwccaijei9Lbw=;
        b=lq63l013nZqtnrHV1dxgmYVeOhQmnkr+RiQ6HSo6TbgQkisIB3iUDGDBXiVzMszMQi
         OaiQJxBh3z1qDFs3jqFmvjj9saFkvJaeakJzn0RiipsBDe6vCuXUEe56wADQyJKRhI5X
         9ZkZnNKep51AoX8LwSpZf7JvhgxPhoZsCSjUhsw717PhC41WsHRc428q4I1wCke4+Lqh
         5CMiFwQ0Ulm1JJAiw22u08tVM5EnyAu41I6JTRjx0KyM99v7+9GgwIABAXdLrY5LgipE
         zCXPoqyN4xSY0/8E2pRX2ilq+nkO7hIaifii1v8AU/AaWxYLjfmHLYuyjwNJBdyThYVN
         W0gA==
X-Forwarded-Encrypted: i=1; AJvYcCXaJReWPhEau8ruNv90B66gEmTJ5xbsYJ3jmN1d9GREPr0QRJirwRqPtPeBv6BvaQTKUL3NgqUSnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3l6VBEJL0J5QPKEkU8mSZ84mhIDZe4HEVBJwi5LGnyrv0gK1
	8ZExdpmSBScr4uUvjMnQSDLoTqZh28ZwmKHEm3O8LtRJtTGrkgri+hNKZI0dXec=
X-Google-Smtp-Source: AGHT+IEsQQCnEuxvR964+0rX/KlAEG5qqvky10H/EfSUq5MJAsWWGO7Ld//wKHkIp7XPnG+kf0G25w==
X-Received: by 2002:a17:902:cf07:b0:202:60e:7700 with SMTP id d9443c01a7336-204f9a548eemr12735035ad.7.1724824207147;
        Tue, 27 Aug 2024 22:50:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:18 -0700
Subject: [PATCH 12/16] parisc: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-12-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2500; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=RM+/CbqQAwiDfaQaSk6aR6JgRkcXqI3LycpAEGdsrx8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQl7j2395l162Zz3ULDsob8MjXdzJ1/bXx7d7Lq5e
 d+zLQfcO0pZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIAVaGfwp5ZTFJes0Kym85
 OvJO+pR7Lg+83rfo09z/TvfTNed8SmX4751+T74tYdaFrpd5nh9q5rfzOL+4IN+53YNdoEni27c
 l3AA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/parisc/include/uapi/asm/mman.h       | 1 +
 arch/parisc/kernel/sys_parisc.c           | 9 +++++++++
 tools/arch/parisc/include/uapi/asm/mman.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 68c44f99bc93..44925ef8ac44 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -26,6 +26,7 @@
 #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
 #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 #define MAP_UNINITIALIZED 0		/* uninitialized anonymous mmap */
+#define MAP_BELOW_HINT  0x200000	/* give out address that is below (inclusive) hint address */
 
 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f7722451276e..feccb60cf746 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -148,6 +148,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 		if (!(addr & ~PAGE_MASK))
 			return addr;
@@ -163,6 +170,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_upper_limit(NULL);
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc/include/uapi/asm/mman.h
index 4cc88a642e10..297acc0f7b2a 100644
--- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -40,4 +40,5 @@
 /* MAP_32BIT is undefined on parisc, fix it for perf */
 #define MAP_32BIT	0
 #define MAP_UNINITIALIZED	0
+#define MAP_BELOW_MAP	0x200000
 #endif

-- 
2.45.0


