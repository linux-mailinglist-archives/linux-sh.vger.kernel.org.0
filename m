Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BEA1BEA32
	for <lists+linux-sh@lfdr.de>; Wed, 29 Apr 2020 23:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgD2VuO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 Apr 2020 17:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727812AbgD2VuO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 29 Apr 2020 17:50:14 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAC6C035495
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 14:50:13 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id s8so5225016ybj.9
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 14:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=X8Ilta2TozKsEzasXrZac28hkMQagz57pEK9xvAhCMU=;
        b=hq7/1zfUEsP2iAtt4ZQ4PwzfpMH/LEAjv1O6M4T2kyI5ocMSPyrezh78agwH8E2fzC
         5UoVyHnot4yvU3uT3T/gW30svDPED38wwzcwKUzc1ikntjBs+9t1DIScbtC1T7t5gt+O
         mS6z/RcBXMryw96KRHKWMXSzRFEqU6HnTb477iWgeCgmihZ523VW2z3+tpWL0Olncc0H
         DbIb3P9b+pQ9ux7Mr0Ope9w48HA1d2qcLTAWT5s9KeaNQb1A3h6o/n0bM6oiKdKbONLG
         xXvcA9wtEp7X3YvX7oN/lCMYNvQZ5hT+jnRwGzIUoXJDAz6icA6ycOc2YEueJSe+gqSn
         I33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=X8Ilta2TozKsEzasXrZac28hkMQagz57pEK9xvAhCMU=;
        b=R95cl+pNWoxbwJz8ye1e+DRebdpqniTzuR9lCqQANgSb6yNPhZVhDqtm93WyTk5nvx
         R6Jf+wqbz/VOGHyiTwIkJ5cYWZxksOM7cTRbjo9J4rFeCM/f/OwcCx2kejp93UaH25XC
         WP+fTukJIx5n61liS3Z93eQnJuz1osmuHuwElLM8tf3LYJowRsDRZtJFJ952U6Cbt8UL
         3hp6+W2o+o2gEDeGPP75OHmwtPfCsey2UYDPaQ0A4SofFbPPg5etVsVz/EXhKm0Lx2ER
         c5g1bS2unUCFHWkDvCrXExisuKdSurBuShxA1hdzrKBFOrau817q+8pGHU9WPkieark0
         5SVQ==
X-Gm-Message-State: AGi0PubPlubAr+yyUSIDV05bX6sZwp9cNme7YXqtFyq+E0ziFjaOSKSS
        OgadVaBQGQyZqIrlDdVmOtDLbOzo5A==
X-Google-Smtp-Source: APiQypK393UboBZKtVhF2VXC53kboONpVDbYMmk4wx3dfVKrxYMarbZX5Q8DMVWqcVWoG5mrxwWJr8Q+6w==
X-Received: by 2002:a25:c048:: with SMTP id c69mr565867ybf.169.1588197012786;
 Wed, 29 Apr 2020 14:50:12 -0700 (PDT)
Date:   Wed, 29 Apr 2020 23:49:50 +0200
In-Reply-To: <20200429214954.44866-1-jannh@google.com>
Message-Id: <20200429214954.44866-2-jannh@google.com>
Mime-Version: 1.0
References: <20200429214954.44866-1-jannh@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH v2 1/5] binfmt_elf_fdpic: Stop using dump_emit() on user
 pointers on !MMU
From:   Jann Horn <jannh@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

dump_emit() is for kernel pointers, and VMAs describe userspace memory.
Let's be tidy here and avoid accessing userspace pointers under KERNEL_DS,
even if it probably doesn't matter much on !MMU systems - especially given
that it looks like we can just use the same get_dump_page() as on MMU if
we move it out of the CONFIG_MMU block.

Signed-off-by: Jann Horn <jannh@google.com>
---
 fs/binfmt_elf_fdpic.c |  8 ------
 mm/gup.c              | 58 +++++++++++++++++++++----------------------
 2 files changed, 29 insertions(+), 37 deletions(-)

diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index c62c17a5c34a9..f5b47076fa762 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1495,14 +1495,11 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 	struct vm_area_struct *vma;
 
 	for (vma = current->mm->mmap; vma; vma = vma->vm_next) {
-#ifdef CONFIG_MMU
 		unsigned long addr;
-#endif
 
 		if (!maydump(vma, cprm->mm_flags))
 			continue;
 
-#ifdef CONFIG_MMU
 		for (addr = vma->vm_start; addr < vma->vm_end;
 							addr += PAGE_SIZE) {
 			bool res;
@@ -1518,11 +1515,6 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 			if (!res)
 				return false;
 		}
-#else
-		if (!dump_emit(cprm, (void *) vma->vm_start,
-				vma->vm_end - vma->vm_start))
-			return false;
-#endif
 	}
 	return true;
 }
diff --git a/mm/gup.c b/mm/gup.c
index 50681f0286ded..76080c4dbff05 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1490,35 +1490,6 @@ int __mm_populate(unsigned long start, unsigned long len, int ignore_errors)
 		up_read(&mm->mmap_sem);
 	return ret;	/* 0 or negative error code */
 }
-
-/**
- * get_dump_page() - pin user page in memory while writing it to core dump
- * @addr: user address
- *
- * Returns struct page pointer of user page pinned for dump,
- * to be freed afterwards by put_page().
- *
- * Returns NULL on any kind of failure - a hole must then be inserted into
- * the corefile, to preserve alignment with its headers; and also returns
- * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
- * allowing a hole to be left in the corefile to save diskspace.
- *
- * Called without mmap_sem, but after all other threads have been killed.
- */
-#ifdef CONFIG_ELF_CORE
-struct page *get_dump_page(unsigned long addr)
-{
-	struct vm_area_struct *vma;
-	struct page *page;
-
-	if (__get_user_pages(current, current->mm, addr, 1,
-			     FOLL_FORCE | FOLL_DUMP | FOLL_GET, &page, &vma,
-			     NULL) < 1)
-		return NULL;
-	flush_cache_page(vma, addr, page_to_pfn(page));
-	return page;
-}
-#endif /* CONFIG_ELF_CORE */
 #else /* CONFIG_MMU */
 static long __get_user_pages_locked(struct task_struct *tsk,
 		struct mm_struct *mm, unsigned long start,
@@ -1565,6 +1536,35 @@ static long __get_user_pages_locked(struct task_struct *tsk,
 }
 #endif /* !CONFIG_MMU */
 
+/**
+ * get_dump_page() - pin user page in memory while writing it to core dump
+ * @addr: user address
+ *
+ * Returns struct page pointer of user page pinned for dump,
+ * to be freed afterwards by put_page().
+ *
+ * Returns NULL on any kind of failure - a hole must then be inserted into
+ * the corefile, to preserve alignment with its headers; and also returns
+ * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
+ * allowing a hole to be left in the corefile to save diskspace.
+ *
+ * Called without mmap_sem, but after all other threads have been killed.
+ */
+#ifdef CONFIG_ELF_CORE
+struct page *get_dump_page(unsigned long addr)
+{
+	struct vm_area_struct *vma;
+	struct page *page;
+
+	if (__get_user_pages(current, current->mm, addr, 1,
+			     FOLL_FORCE | FOLL_DUMP | FOLL_GET, &page, &vma,
+			     NULL) < 1)
+		return NULL;
+	flush_cache_page(vma, addr, page_to_pfn(page));
+	return page;
+}
+#endif /* CONFIG_ELF_CORE */
+
 #if defined(CONFIG_FS_DAX) || defined (CONFIG_CMA)
 static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
 {
-- 
2.26.2.526.g744177e7f7-goog

