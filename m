Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945E71BB4A9
	for <lists+linux-sh@lfdr.de>; Tue, 28 Apr 2020 05:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgD1D2V (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 Apr 2020 23:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgD1D2S (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 27 Apr 2020 23:28:18 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB70C09B051
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:28:16 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id x56so22899006qtc.10
        for <linux-sh@vger.kernel.org>; Mon, 27 Apr 2020 20:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=S74qc3gT0+GaAOfxP9OW8h7LX2dHXzF9FcHNnI79iRU=;
        b=IidsVYIWxuA6ZMq4mduyFOFvGK2ppYXoJH0wqJkIqqc+oYorXd4D8TC5648uk83yp9
         Wk6TRGHazyI7/dl0YaKYN69J4JYYCXH0CXmm45CYpg5crMvD0sBEhoVk0OCbke9ON03l
         t++54shNE4fldweicnAFUG7BlPQRKlLvBj3ELH6NgoiG7tKyqU09KfhIbfcLrXBCqA5+
         ERaEY1qXQhMRhOoex9Yt2JzsgbxA1o9//qxW7Rl64iVEwEvm2M5aNBfC/sbBWFTgc2W9
         OB2UUdMDfKlny1MscN1lZUlNUVq8y5d3lfxTGrfnTL+k4Xh6lfcXpgzN0XvkrZqCgzwF
         SQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=S74qc3gT0+GaAOfxP9OW8h7LX2dHXzF9FcHNnI79iRU=;
        b=VMHdMKqMlFMl9gyoH+9TsTswCSdPNWl6uUdFPujrV4P4I8/V6Xp37v2Ylu+M6imLJ7
         2M/1IYZ351Xm6pVciqJONE/J64ZKbpDdKbCxrmoEWchOWTUps3+edCEU5dPXYXDOvAQS
         ZEBC0I41Zlt9COv8to+R3S/H8JFRD8SemaAgfaeDVBaU7qziNxXy0FnxPu0WgwZUVtUk
         oz5kvN4HwEjYeknZR2FkhG+Tho3iUXhhCJmTmB3Va3fZ7Z9ma5J3rklJLGkKAxOCxpcE
         de1hn2FwbZx7fWEYhRQP4zFTdI3LfsUQwfqiod/+tu5JBhWyCztt+rcE9zoSusJO5owQ
         vZzg==
X-Gm-Message-State: AGi0PuavUGBoUDkD38PkqMtnD3hndgtCtmVtVgmjyBd7raMe5oXxJBvG
        ePbK7xdbTKq6CF2Id/WBXxATFs739g==
X-Google-Smtp-Source: APiQypKNWrwmeyovNjE39gEB3tk3kbcuILr7RYV7vdkJNUwXcv+LEB33zDblKbOqInzqOcSp3nptjlK/lg==
X-Received: by 2002:a0c:99ca:: with SMTP id y10mr18997354qve.217.1588044495889;
 Mon, 27 Apr 2020 20:28:15 -0700 (PDT)
Date:   Tue, 28 Apr 2020 05:27:45 +0200
In-Reply-To: <20200428032745.133556-1-jannh@google.com>
Message-Id: <20200428032745.133556-6-jannh@google.com>
Mime-Version: 1.0
References: <20200428032745.133556-1-jannh@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 5/5] mm/gup: Take mmap_sem in get_dump_page()
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

Properly take the mmap_sem before calling into the GUP code from
get_dump_page(); and play nice, allowing __get_user_pages_locked() to drop
the mmap_sem if it has to sleep.

This requires adjusting the check in __get_user_pages_locked() to be
slightly less strict: While `vmas != NULL` is normally incompatible with
the lock-dropping retry logic, it's fine if we only want a single page,
because then retries can only happen when we haven't grabbed any pages yet.

Signed-off-by: Jann Horn <jannh@google.com>
---
 mm/gup.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 9a7e83772f1fe..4bb4149c0e259 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1261,7 +1261,8 @@ static __always_inline long __get_user_pages_locked(struct task_struct *tsk,
 
 	if (locked) {
 		/* if VM_FAULT_RETRY can be returned, vmas become invalid */
-		BUG_ON(vmas);
+		if (WARN_ON(vmas && nr_pages != 1))
+			return -EFAULT;
 		/* check caller initialized locked */
 		BUG_ON(*locked != 1);
 	}
@@ -1548,18 +1549,28 @@ static long __get_user_pages_locked(struct task_struct *tsk,
  * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
  * allowing a hole to be left in the corefile to save diskspace.
  *
- * Called without mmap_sem, but after all other threads have been killed.
+ * Called without mmap_sem (takes and releases the mmap_sem by itself).
  */
 struct page *get_dump_page(unsigned long addr)
 {
+	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	struct page *page;
+	int locked = 1;
+	int ret;
 
-	if (__get_user_pages(current, current->mm, addr, 1,
-			     FOLL_FORCE | FOLL_DUMP | FOLL_GET, &page, &vma,
-			     NULL) < 1)
+	if (down_read_killable(&mm->mmap_sem))
+		return NULL;
+	ret = __get_user_pages_locked(current, mm, addr, 1, &page, &vma,
+				      &locked,
+				      FOLL_FORCE | FOLL_DUMP | FOLL_GET);
+	if (ret != 1) {
+		if (locked)
+			up_read(&mm->mmap_sem);
 		return NULL;
+	}
 	flush_cache_page(vma, addr, page_to_pfn(page));
+	up_read(&mm->mmap_sem);
 	return page;
 }
 
-- 
2.26.2.303.gf8c07b1a785-goog

