Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F21978A9D0
	for <lists+linux-sh@lfdr.de>; Mon, 12 Aug 2019 23:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfHLVvv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 12 Aug 2019 17:51:51 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:43092 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfHLVvu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 12 Aug 2019 17:51:50 -0400
Received: by mail-qk1-f202.google.com with SMTP id m2so6236370qkk.10
        for <linux-sh@vger.kernel.org>; Mon, 12 Aug 2019 14:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dkl7/UCGpL+NlP2/x1g4PAFoM8egHhu+Vinm7RBGZqk=;
        b=J+mGdp7Xm+87VwfjayUFTm4z6KIjoLKr3G5/6jbsKjKiWWIavprKB+X7dmk0l9Bx8F
         onSRT1QJl9t/AsSUb7lT5itZEaf1B4LthCvRbfAWbm/I4HV9vsfjoxoUO6mofTuRYqBk
         QTMiE2dznF57pZEAp4uQD5dk+pVLIclEK1thrPGBYjJh5Sxq9A2Qq/K1ErbvAnsf/NbL
         H0siglRdh1L/K6vWMFosRpOdO6OhF8/2McAILUeNkj8aeoy+x9pm/NMyc5ueAlhUBX7q
         7F81YB86R3OsMbHXv+SUQCqqSSDQh7B55g3uz+4czgFjrQGi1eUJ/VLLgzCmLQxj34Bi
         PjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dkl7/UCGpL+NlP2/x1g4PAFoM8egHhu+Vinm7RBGZqk=;
        b=jLf1PuOT9V/Q+sOzGc2CfU272FxCuP+GNZEnSnVHinGKSbUaF91iKTiqypIxBn5RMP
         VrRDDcPLRyOnZpxspq198CPWasOSsHc/OLo8K5fF/qBAEQw6E9pmOchIfj1cn35Z2J1A
         rtQdOE7UA/w3hyULHRVLSiMtMIu+Wc9FC8lLww9czBwzrloimdIKI/CXmUu+6XXVWWT7
         V0odBcmeyaOmIlEJrjTGSz9m0NK0Cg5B6XLHaxBbSmjFZf6w0h0VM+5spyze0G+/H/PE
         d5EGSCTL+Vk1jhuXsFAXmwrRcDzjtHbgqFMyJamGBArsnVwrx7aD3gNw+8lbA1YqvfLI
         pVpg==
X-Gm-Message-State: APjAAAUjnaL7QUnm1EInZkQVFYlDkGE4i2Mgk2d4Ntad5JDQHSv6xRdF
        6NEqNsN0WQYoTh6iWmksGCgaWFsTa44ppe+ltvM=
X-Google-Smtp-Source: APXvYqyIVNZp/lKbPY7G8paK5xKsgjgvn231PYi/oi7bEXYUfhmPaZX/hLJikIpebz1OJaGj/71NLcX6GrZgVy6zIas=
X-Received: by 2002:a05:6214:1086:: with SMTP id o6mr17437802qvr.107.1565646709559;
 Mon, 12 Aug 2019 14:51:49 -0700 (PDT)
Date:   Mon, 12 Aug 2019 14:50:38 -0700
In-Reply-To: <20190812215052.71840-1-ndesaulniers@google.com>
Message-Id: <20190812215052.71840-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190812215052.71840-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH 05/16] sh: prefer __section from compiler_attributes.h
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     akpm@linux-foundation.org
Cc:     sedat.dilek@gmail.com, jpoimboe@redhat.com, yhs@fb.com,
        miguel.ojeda.sandonis@gmail.com,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/sh/include/asm/cache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/include/asm/cache.h b/arch/sh/include/asm/cache.h
index 2408ac4873aa..07ddf31124a3 100644
--- a/arch/sh/include/asm/cache.h
+++ b/arch/sh/include/asm/cache.h
@@ -15,7 +15,7 @@
 
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(.data..read_mostly)
 
 #ifndef __ASSEMBLY__
 struct cache_info {
-- 
2.23.0.rc1.153.gdeed80330f-goog

