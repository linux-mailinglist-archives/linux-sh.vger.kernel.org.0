Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFC444C4
	for <lists+linux-sh@lfdr.de>; Thu, 13 Jun 2019 18:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730679AbfFMQjM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 13 Jun 2019 12:39:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40056 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730604AbfFMHJe (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 13 Jun 2019 03:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=liRfqBd4FU/1QUtK1l5E3mCH3KDKIkOHrkNG1NZ/aQk=; b=LB9Ac0yUlODginMpntEq2vEJwh
        kkhLAqS2fTeykjMvS9fcBEERt+p72opH4DF/CjDlhXyr6Uxs1jLP0KDVn1G89U8OeC3yXRRIo2xD9
        30F30NhmqeDvxHSzbxFmRfoK4JGi0lhBlDmigyxJoiTyK3Z+Aec1zy9jJ2yhubHjgT0feMP4+S8rY
        Y1T+PiyayWmOnSbGicNTfYaAggQh814hYqrgGNdiee0go9ERLojdGgQ7NWaT/HZYHvQSV8330+uJy
        QwNRG0J1zKGmETdEL4S+nmjNk29rAUviGlG8lSGyQc0eLqhtIulR/f7LsiYiaKc1qF6skLZ1UPMya
        Mxxr01/g==;
Received: from mpp-cp1-natpool-1-013.ethz.ch ([82.130.71.13] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbJrR-0004Fd-I3; Thu, 13 Jun 2019 07:09:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michal Simek <monstr@monstr.eu>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org,
        Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH 06/17] binfmt_flat: remove the uapi <linux/flat.h> header
Date:   Thu, 13 Jun 2019 09:08:52 +0200
Message-Id: <20190613070903.17214-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
References: <20190613070903.17214-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The split between the two flat.h files is completely arbitrary, and the
uapi version even contains CONFIG_ ifdefs that can't work in userspace.
The only userspace program known to use the header is elf2flt, and it
ships with its own version of the combined header.

Use the chance to move the <asm/flat.h> inclusion out of this file, as it
is in no way needed for the format defintion, but just for the binfmt
implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 fs/binfmt_flat.c          |  1 +
 include/linux/flat.h      | 45 ++++++++++++++++++++++++++---
 include/uapi/linux/flat.h | 59 ---------------------------------------
 3 files changed, 42 insertions(+), 63 deletions(-)
 delete mode 100644 include/uapi/linux/flat.h

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index a15fdd5d95ed..b63c5e63ae3f 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -42,6 +42,7 @@
 #include <asm/unaligned.h>
 #include <asm/cacheflush.h>
 #include <asm/page.h>
+#include <asm/flat.h>
 
 #ifndef flat_get_relocate_addr
 #define flat_get_relocate_addr(rel)	(rel)
diff --git a/include/linux/flat.h b/include/linux/flat.h
index 569b67d64d5c..21d901ba191b 100644
--- a/include/linux/flat.h
+++ b/include/linux/flat.h
@@ -10,8 +10,47 @@
 #ifndef _LINUX_FLAT_H
 #define _LINUX_FLAT_H
 
-#include <uapi/linux/flat.h>
-#include <asm/flat.h>
+#define	FLAT_VERSION			0x00000004L
+
+#ifdef CONFIG_BINFMT_SHARED_FLAT
+#define	MAX_SHARED_LIBS			(4)
+#else
+#define	MAX_SHARED_LIBS			(1)
+#endif
+
+/*
+ * To make everything easier to port and manage cross platform
+ * development,  all fields are in network byte order.
+ */
+
+struct flat_hdr {
+	char magic[4];
+	unsigned long rev;          /* version (as above) */
+	unsigned long entry;        /* Offset of first executable instruction
+	                               with text segment from beginning of file */
+	unsigned long data_start;   /* Offset of data segment from beginning of
+	                               file */
+	unsigned long data_end;     /* Offset of end of data segment
+	                               from beginning of file */
+	unsigned long bss_end;      /* Offset of end of bss segment from beginning
+	                               of file */
+
+	/* (It is assumed that data_end through bss_end forms the bss segment.) */
+
+	unsigned long stack_size;   /* Size of stack, in bytes */
+	unsigned long reloc_start;  /* Offset of relocation records from
+	                               beginning of file */
+	unsigned long reloc_count;  /* Number of relocation records */
+	unsigned long flags;
+	unsigned long build_date;   /* When the program/library was built */
+	unsigned long filler[5];    /* Reservered, set to zero */
+};
+
+#define FLAT_FLAG_RAM    0x0001 /* load program entirely into RAM */
+#define FLAT_FLAG_GOTPIC 0x0002 /* program is PIC with GOT */
+#define FLAT_FLAG_GZIP   0x0004 /* all but the header is compressed */
+#define FLAT_FLAG_GZDATA 0x0008 /* only data/relocs are compressed (for XIP) */
+#define FLAT_FLAG_KTRACE 0x0010 /* output useful kernel trace for debugging */
 
 /*
  * While it would be nice to keep this header clean,  users of older
@@ -22,8 +61,6 @@
  *        with the format above,  except to fix bugs with old format support.
  */
 
-#include <asm/byteorder.h>
-
 #define	OLD_FLAT_VERSION			0x00000002L
 #define OLD_FLAT_RELOC_TYPE_TEXT	0
 #define OLD_FLAT_RELOC_TYPE_DATA	1
diff --git a/include/uapi/linux/flat.h b/include/uapi/linux/flat.h
deleted file mode 100644
index 27e595e44fb7..000000000000
--- a/include/uapi/linux/flat.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2002-2003  David McCullough <davidm@snapgear.com>
- * Copyright (C) 1998       Kenneth Albanowski <kjahds@kjahds.com>
- *                          The Silver Hammer Group, Ltd.
- *
- * This file provides the definitions and structures needed to
- * support uClinux flat-format executables.
- */
-
-#ifndef _UAPI_LINUX_FLAT_H
-#define _UAPI_LINUX_FLAT_H
-
-
-#define	FLAT_VERSION			0x00000004L
-
-#ifdef CONFIG_BINFMT_SHARED_FLAT
-#define	MAX_SHARED_LIBS			(4)
-#else
-#define	MAX_SHARED_LIBS			(1)
-#endif
-
-/*
- * To make everything easier to port and manage cross platform
- * development,  all fields are in network byte order.
- */
-
-struct flat_hdr {
-	char magic[4];
-	unsigned long rev;          /* version (as above) */
-	unsigned long entry;        /* Offset of first executable instruction
-	                               with text segment from beginning of file */
-	unsigned long data_start;   /* Offset of data segment from beginning of
-	                               file */
-	unsigned long data_end;     /* Offset of end of data segment
-	                               from beginning of file */
-	unsigned long bss_end;      /* Offset of end of bss segment from beginning
-	                               of file */
-
-	/* (It is assumed that data_end through bss_end forms the bss segment.) */
-
-	unsigned long stack_size;   /* Size of stack, in bytes */
-	unsigned long reloc_start;  /* Offset of relocation records from
-	                               beginning of file */
-	unsigned long reloc_count;  /* Number of relocation records */
-	unsigned long flags;       
-	unsigned long build_date;   /* When the program/library was built */
-	unsigned long filler[5];    /* Reservered, set to zero */
-};
-
-#define FLAT_FLAG_RAM    0x0001 /* load program entirely into RAM */
-#define FLAT_FLAG_GOTPIC 0x0002 /* program is PIC with GOT */
-#define FLAT_FLAG_GZIP   0x0004 /* all but the header is compressed */
-#define FLAT_FLAG_GZDATA 0x0008 /* only data/relocs are compressed (for XIP) */
-#define FLAT_FLAG_KTRACE 0x0010 /* output useful kernel trace for debugging */
-
-
-
-#endif /* _UAPI_LINUX_FLAT_H */
-- 
2.20.1

