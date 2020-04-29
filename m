Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B9D1BEA3A
	for <lists+linux-sh@lfdr.de>; Wed, 29 Apr 2020 23:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgD2VuU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 29 Apr 2020 17:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727827AbgD2VuR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 29 Apr 2020 17:50:17 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BD2C035495
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 14:50:17 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id z3so4496166qtb.6
        for <linux-sh@vger.kernel.org>; Wed, 29 Apr 2020 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JqiR2vOdqFfBqjhyMGJp8d/qL3dB8+X/PfK7MWBosOQ=;
        b=aiXVr9LW0+RfYp/BGKCZwf2eFb8u9bW41qbryYBrMOTMAxizbTvkyUsj2hMqoewXVA
         EbenkI3pjlj6j3Jz6v58GVbjLsRucPnyBIwyrf/cQxI7QYwEK5k1uOps+KFUBQSyYzSq
         4ScWZwqWRdd/I9EOQCike+A/g8LgBL08ZkugaoTqx2zKcpO0yY7MZeP+Y4VZXfi2opO+
         u0ixT5IVpYsz33tv0SuE/w161GkFjCv2PC0mWH6RqlvaBsCA3Nae7CGPq+IMF6tcDpg/
         xDEfx6+SvCzPkM2Gw22E+XqkcpxanCcgz9Szd+JSjxTdcGi6OboSgHQ79epRcTxfLjBk
         yKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JqiR2vOdqFfBqjhyMGJp8d/qL3dB8+X/PfK7MWBosOQ=;
        b=NheQ6aU0kxnwGrFTwWOtgq+9pDtHDSvVnhRMfmTRvaMN/fMruUs7WYuZ9vYq36gzxX
         cjAMBocherBhJl8h+FUfc86Qou7TD/t8lwh6KuZCCwIrn9/FdBqCj1I7nGfqrzB4rHIB
         1tsEvHqx+dSxIk5hsqC1maAU1JX7D7bl1LxHtvPfjDMJPl5sforwZG4PYMx7yhFEo4hP
         7ItN0xAGtMiHXhdsob5ALeWui37W0kF8NW6sgo68B4BdR+CcXVtRpCzKS0fkmrBIi3eh
         ybaYC1m6duOB1DplFBO9XgV/I93Elg/xuOo7WhdQsVv06Th9JgHPBD2O9WmlwCsj1Wb8
         ZBQw==
X-Gm-Message-State: AGi0PuZXS1noF6RPUdlOLRSvc3keHHNo6NhjwtObU2/PfPaLYoDm4o/i
        Myh864EKgrMW7/YwRnkdVNXXNjDkoQ==
X-Google-Smtp-Source: APiQypIhYRdYrJfvjviu8u64QDDNe2LAeKB+wfqrsyuISOkwKNnezPoPTQS28YSpGgdHWAPJujbNXC6IaA==
X-Received: by 2002:ad4:49d3:: with SMTP id j19mr34024184qvy.78.1588197016281;
 Wed, 29 Apr 2020 14:50:16 -0700 (PDT)
Date:   Wed, 29 Apr 2020 23:49:51 +0200
In-Reply-To: <20200429214954.44866-1-jannh@google.com>
Message-Id: <20200429214954.44866-3-jannh@google.com>
Mime-Version: 1.0
References: <20200429214954.44866-1-jannh@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH v2 2/5] coredump: Let dump_emit() bail out on short writes
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

dump_emit() has a retry loop, but there seems to be no way for that retry
logic to actually be used; and it was also buggy, writing the same data
repeatedly after a short write.

Let's just bail out on a short write.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Jann Horn <jannh@google.com>
---
 fs/coredump.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 408418e6aa131..d6fcc36a7db1f 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -823,17 +823,17 @@ int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
 	ssize_t n;
 	if (cprm->written + nr > cprm->limit)
 		return 0;
-	while (nr) {
-		if (dump_interrupted())
-			return 0;
-		n = __kernel_write(file, addr, nr, &pos);
-		if (n <= 0)
-			return 0;
-		file->f_pos = pos;
-		cprm->written += n;
-		cprm->pos += n;
-		nr -= n;
-	}
+
+
+	if (dump_interrupted())
+		return 0;
+	n = __kernel_write(file, addr, nr, &pos);
+	if (n != nr)
+		return 0;
+	file->f_pos = pos;
+	cprm->written += n;
+	cprm->pos += n;
+
 	return 1;
 }
 EXPORT_SYMBOL(dump_emit);
-- 
2.26.2.526.g744177e7f7-goog

