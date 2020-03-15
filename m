Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3357185EC3
	for <lists+linux-sh@lfdr.de>; Sun, 15 Mar 2020 18:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgCORvO (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 15 Mar 2020 13:51:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40610 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728979AbgCORvO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 15 Mar 2020 13:51:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id z12so6354821wmf.5
        for <linux-sh@vger.kernel.org>; Sun, 15 Mar 2020 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6eiGa7DuFos4OFRCu6F9mmBj8osCsLS7c9lg5q8eIA=;
        b=EWBJQaQXgXZJDtzW+Hldz74fLhYeTdA/gNgJLT1IQsUWUWcYC8lJKx/TEWw9k1MA6+
         0nrKrhBUtakfnhMj/OvVUrvQBJpAEKNNY6GQQq5AUmFTGPZFoJcr3LHhDIjkt/7LSNIY
         xCA02sVHf/bmTvHWbQm2j5su7kGa6Px528vIsaNDMyIfzcCUQNxmo0GD2+vaLSUbJPq4
         Jv3JsZsOxGiEjYutaZ135kSrqUszwyX7BtovULEL2ztkxqdBt0DIoxKTOh6cfvicd0Zh
         k2jCR3H9rBL0Hj9u7uUzWmclTflw+2KFOyTfmCg1cR94bIwTtIUXKCzn1i5Ts1HIgqkb
         Tilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6eiGa7DuFos4OFRCu6F9mmBj8osCsLS7c9lg5q8eIA=;
        b=ob1fZ10A2Y3rDERewuLv3OIu0YjT/TCNjScLn7RyjQBcwE6NkxnKntjRnPU9DMEAgP
         gFOq1P+w2rMOhDqGXiB2aKzEjP2aLLjozHwtxTcAerFJDe+lOP5K7/KRcFDC+60UWiAR
         B3kE4ltAKFU/dyqeqKNNp7qlCCF10Erdgmj4SNy624S6g/Yna1pkNPTIYz9PEyhgr2Zs
         La/ExlFv1PigA6o7NTPlyK+K+z0L4h3CDZqsjLc/qun1yihLe/PQgdq+ZFydM0fABkRZ
         pppYIL3iQHpNttYT6QCS9n74SnzL64KJuAz6dfC/m3GaQ88NyhXUErJ5vTxWnFlRHhSK
         rUMw==
X-Gm-Message-State: ANhLgQ3d6GnSzpK5nLEHYEDopyKbEhla8PCJ/o0L/Fon//1ZmxUh0CTU
        JTtK2rK6lq3cfYJlx8vueZ7CnbNr
X-Google-Smtp-Source: ADFU+vuOc85CbOsJWnfFjpHWe3ZeCEhQEj3ZFlhzZ+TGwcH05WdCbNv2cgW1WHr3TZ7tsfC8U0S5JQ==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr22720660wme.176.1584294672568;
        Sun, 15 Mar 2020 10:51:12 -0700 (PDT)
Received: from localhost.localdomain (2a01cb0589880c0046708304bf1f24fd.ipv6.abo.wanadoo.fr. [2a01:cb05:8988:c00:4670:8304:bf1f:24fd])
        by smtp.gmail.com with ESMTPSA id u1sm70984239wrt.78.2020.03.15.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 10:51:12 -0700 (PDT)
From:   Romain Naour <romain.naour@gmail.com>
To:     linux-sh@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>,
        Alan Modra <amodra@gmail.com>
Subject: [PATCH 1/2] arch/sh: vmlinux.scr
Date:   Sun, 15 Mar 2020 18:51:07 +0100
Message-Id: <20200315175108.9694-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.24.1
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
 arch/sh/boot/compressed/vmlinux.scr | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
index 862d74808236..dd292b4b9082 100644
--- a/arch/sh/boot/compressed/vmlinux.scr
+++ b/arch/sh/boot/compressed/vmlinux.scr
@@ -1,6 +1,6 @@
 SECTIONS
 {
-  .rodata..compressed : {
+  .rodata..compressed : ALIGN(8) {
 	input_len = .;
 	LONG(input_data_end - input_data) input_data = .;
 	*(.data)
-- 
2.24.1

