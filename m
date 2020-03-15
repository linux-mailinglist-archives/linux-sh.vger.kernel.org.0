Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46460185EC4
	for <lists+linux-sh@lfdr.de>; Sun, 15 Mar 2020 18:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgCORvQ (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 15 Mar 2020 13:51:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53585 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbgCORvP (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 15 Mar 2020 13:51:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id 25so15199470wmk.3
        for <linux-sh@vger.kernel.org>; Sun, 15 Mar 2020 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2jceW0QdZvHl7bbfsFt5HpBn+mJnNMLv0oV1l+Bmnl8=;
        b=JHzBnIsv4M4/NVEc9ednrB2VKOFV/Fff6d+vyJT3I1QQR9f9eUiu3AACCRrPExHeQ6
         ++t/nan83deNxeILgNwO9iP7U5EoT2l8PEKWgzg8jK6ZpIB5c9rz1cTYZ7J4p39kJkj/
         FzM2q7oPq0nHZ1ZCmbmIzZPb6mQsStZHwbnAUUY1q/meABepvnfcrjAgJvriWgoJTcZ/
         PgWLHbVVCYIQI9QdbXdKi0uEessoaaWE4Ex4ULDhButTcHIPD5jAoLZjb9adz0mcZRxq
         qWx6ljeSVBuxYZ3sc8t33eGMpbqnOlj406eHSIkvcEpLJBQagMYL5tB6aXhl34OtzVqz
         f59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jceW0QdZvHl7bbfsFt5HpBn+mJnNMLv0oV1l+Bmnl8=;
        b=ZGnz3RrxFJ9KB+N//Snlj+aiZm9VqWlnSJOb9vyiGseDG1ePAdG/OEGLnC6/oM7pe2
         6XueXmVz2ERPKBSu0turLQVMww60Uz1PghLytR1tOFa3Gn4Ey8qlo3iL5mX9LxHy2duz
         HFvYvURODfpZ2RjNtNk2uMXkT6+Pzu7R+A4+Sa3DqfdJiImty0Ak6Hr+lfOZMZUY/g+d
         iEBWyedDoJGhPTuaQbdOdQyq35O9o0hM7OlMHxiRLh4Uk/nLn78Y/YWKqxRZaD5KtcHv
         7X4ddMuigBPps+FQi/D0DvCN3UF5oANdcVk0NW4xwJvF/jJOvr1afKF/irnPmA6YGrj+
         M2vA==
X-Gm-Message-State: ANhLgQ1turWz+0v63kwsAjv/bADmhB3znyBh9YeIBXkIpuYvF/5uryT3
        TpNO9G+nYHVzhnD82A++UGXQbQP+
X-Google-Smtp-Source: ADFU+vtAi+9/baEW90bjvoOorLZbZ35ThBF+ovFgMigJsrZxoyErDqxO94fPpg9LA5Nu+M1U/e0IMQ==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr21997730wmc.167.1584294673682;
        Sun, 15 Mar 2020 10:51:13 -0700 (PDT)
Received: from localhost.localdomain (2a01cb0589880c0046708304bf1f24fd.ipv6.abo.wanadoo.fr. [2a01:cb05:8988:c00:4670:8304:bf1f:24fd])
        by smtp.gmail.com with ESMTPSA id u1sm70984239wrt.78.2020.03.15.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 10:51:13 -0700 (PDT)
From:   Romain Naour <romain.naour@gmail.com>
To:     linux-sh@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>,
        Alan Modra <amodra@gmail.com>
Subject: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
Date:   Sun, 15 Mar 2020 18:51:08 +0100
Message-Id: <20200315175108.9694-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200315175108.9694-1-romain.naour@gmail.com>
References: <20200315175108.9694-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Since the patch [1], building the kernel using a toolchain built with
Binutils 2.33.1 prevent booting a sh4 system under Qemu.
Apply the patch provided by Alan Modra [2] that fix alignment of rodata.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alan Modra <amodra@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e00f41aa8ec4..d46d34b58c96 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -374,6 +374,7 @@
  */
 #ifndef RO_AFTER_INIT_DATA
 #define RO_AFTER_INIT_DATA						\
+	. = ALIGN(8);							\
 	__start_ro_after_init = .;					\
 	*(.data..ro_after_init)						\
 	JUMP_TABLE_DATA							\
-- 
2.24.1

