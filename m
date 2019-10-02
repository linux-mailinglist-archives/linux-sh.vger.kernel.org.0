Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA394C8D44
	for <lists+linux-sh@lfdr.de>; Wed,  2 Oct 2019 17:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfJBPsE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 2 Oct 2019 11:48:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51533 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbfJBPsD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 2 Oct 2019 11:48:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so7767226wme.1
        for <linux-sh@vger.kernel.org>; Wed, 02 Oct 2019 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/WPUaXsRXb4AarLiZQsfAeLGL43b4rhfT5+5/3Bhwg=;
        b=Or8zBwctsY8Elqzo/0JuCpOf55Q+IXWHSz/Pt+bUD7zKlYNuoUa8delcjy5ux+5YNs
         HwVk7wfITAIThiOwJ91xWbJ6bnLvJVmhlygYBwdcabmCVOMKaOArlekS5iae072COMBr
         xK8mM4HM2nDlmv9L4dFM6HjzN3gNwK37enE3hPi1WuytjXHSxfnnZ8wF7Nq9/6n6U8Hm
         cnQjWxeLFKV0XLFbNdRLyY9A6wm5c91MK0omP7yNKHbpA5WXGEvcHkyw/FHfATYIVMqn
         5pUAPlUckvjuz3Ms21JUf6+J6XMxt4bvnuoZisaDlOun0AoJZ0AnxpxeckmGby+bbDlZ
         UhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/WPUaXsRXb4AarLiZQsfAeLGL43b4rhfT5+5/3Bhwg=;
        b=b7zA0cc+ZOxGF9SZzJAXlfu45+j33835kUnFt3Q1JAaANBWxgd5UODzdF6bho5qN7N
         K6nb3x7ua4Lr/aaL0lqrJuORVOtKgNCCdxJRVWfEkv8D3VbiW4wDPSGM9UABxAnEtjWX
         02nGuFeZN18WTHHXpwIH3k0GsV/+7vqCJ6tsrRXjLUdwicL8vc6WDPjs+qgqbOT0mJD+
         wGfSS+FmEkqRH4QaGfq3TEX2YiY1yXaNJwA78xeb/oTUGEGdVpjChNKnHvzL7kPwRr1v
         HxKZ36RQB6gE59Bz2LAER5VKwQ0AtJ5T74uCKI3qE7LgNrSouz89J4fnhm7ma8afnhdn
         s+HQ==
X-Gm-Message-State: APjAAAXYyo+oMG4nLQsZQAl/BA5IqvPyjl31pMChEl2jWO0Twwpu0W/o
        0MViqBsJQQEjdl19/ueyGIyn6g==
X-Google-Smtp-Source: APXvYqxF4BZbL9PtGJ4FXKof8VYcQOLSXhFigZ7LdNlh9U68F4/M4t+F1WCRBdwt5uQN8sgEvCyV2Q==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr3423244wmc.111.1570031281844;
        Wed, 02 Oct 2019 08:48:01 -0700 (PDT)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id a2sm2809345wrp.11.2019.10.02.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 08:48:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] sh: kgdb: fix an implicit fallthrough warning
Date:   Wed,  2 Oct 2019 17:47:56 +0200
Message-Id: <20191002154756.18924-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The switch case in arch/sh/kernel/kgdb.c can fallthrough. Add an
appropriate comment.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/sh/kernel/kgdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/kgdb.c b/arch/sh/kernel/kgdb.c
index 6d61f8cf4c13..0d5f3c9d52f3 100644
--- a/arch/sh/kernel/kgdb.c
+++ b/arch/sh/kernel/kgdb.c
@@ -266,6 +266,7 @@ int kgdb_arch_handle_exception(int e_vector, int signo, int err_code,
 		ptr = &remcomInBuffer[1];
 		if (kgdb_hex2long(&ptr, &addr))
 			linux_regs->pc = addr;
+		/* fallthrough */
 	case 'D':
 	case 'k':
 		atomic_set(&kgdb_cpu_doing_single_step, -1);
-- 
2.23.0

