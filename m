Return-Path: <linux-sh+bounces-116-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC980E1E1
	for <lists+linux-sh@lfdr.de>; Tue, 12 Dec 2023 03:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2A61F21CBB
	for <lists+linux-sh@lfdr.de>; Tue, 12 Dec 2023 02:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96146179A1;
	Tue, 12 Dec 2023 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBRWLcq/"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5BD189;
	Mon, 11 Dec 2023 18:28:46 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5e1f852cb46so172957b3.2;
        Mon, 11 Dec 2023 18:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348125; x=1702952925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo8m0hD4+F1htFRsuw+mgKqoUgBikXdLbdGdafmirjs=;
        b=QBRWLcq/d/tBqDLg7eCONqV2U2nIlxfcn0P+QF+Orfd/DZuiRUmMmr4c36SB7HAWj2
         CnLJUFhLN2nXg+8eRvPWYaMl1fEtcKSabW/xW37UtOrjnc2sltLG+Vj77mXLpfXh+X4H
         kflNNzDLQ/DiNySHe00IfUjCGa7/2reyU3BEa+xxsXmWfhzPuWGgs9ygHjDspXHj3FAi
         nKpLgOjq64cLHwK5TrTZnAv5BAMHz9GscIJlgR3KtctuqzeAqFqCs2BOP75v76ZD3uJ2
         fEcYzD/eirVtxCxEyTHqpdEGO+fjlXJlE90L9Cv04KSHxYf0O3i9m5pgqT/valunlxxj
         QA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348125; x=1702952925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo8m0hD4+F1htFRsuw+mgKqoUgBikXdLbdGdafmirjs=;
        b=Or38kVKdRrI5USk9EFtanmHxsYvxkDxm9KQg3fdl3d2iBCHLkdGAMFvWcbHPM1H2MT
         uBBmXk66VUowdEvuKpo4gUlhWn8/Tu+m8hG485hB5v42Qv0rh5nJ83lwkI9U15rQap5i
         qCDmnkXHpKvsPShtxJqCWdXXCKB5ebbzGC+AUPREj5ysRQBfJ5EbFUwfrKoUVp4Ro+z4
         OLe1y+9jqBylZVtTfed4cLkuaBTfHjf+4Vns+UFEkoKesDqs04BrJus/TwbYCLICgMsq
         3MKW9FFe5SVLkCQFD9Fv7Cs3+jdNH0uLVZTKF14M/NJ/7IURpOz2nxx3AHT31qhdjb5O
         dUFg==
X-Gm-Message-State: AOJu0YzMejRNfbh/B/FIsAkt4WtNJO4OBxdtzcB+AXoVw5QW69MUycV/
	VpVSHcdgb8ijvLZl6NPmiioFEY0NLW3jzQ==
X-Google-Smtp-Source: AGHT+IHXKXarS0Td3fM708B+gCetT/1L8OI+lioZfJCrro13xZOGGax2Jo9xqqXoI9HlYUYn6jgdow==
X-Received: by 2002:a0d:dbd1:0:b0:5d7:1940:8dce with SMTP id d200-20020a0ddbd1000000b005d719408dcemr2626933ywe.53.1702348124999;
        Mon, 11 Dec 2023 18:28:44 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id x75-20020a81a04e000000b00576c727498dsm3462728ywg.92.2023.12.11.18.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:44 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yury Norov <yury.norov@gmail.com>,
	linux-sh@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3 35/35] sh: mach-x3proto: optimize ilsel_enable()
Date: Mon, 11 Dec 2023 18:27:49 -0800
Message-Id: <20231212022749.625238-36-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify ilsel_enable() by using find_and_set_bit().

CC: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/sh/boards/mach-x3proto/ilsel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/boards/mach-x3proto/ilsel.c b/arch/sh/boards/mach-x3proto/ilsel.c
index f0d5eb41521a..7fadc479a80b 100644
--- a/arch/sh/boards/mach-x3proto/ilsel.c
+++ b/arch/sh/boards/mach-x3proto/ilsel.c
@@ -99,8 +99,8 @@ int ilsel_enable(ilsel_source_t set)
 	}
 
 	do {
-		bit = find_first_zero_bit(&ilsel_level_map, ILSEL_LEVELS);
-	} while (test_and_set_bit(bit, &ilsel_level_map));
+		bit = find_and_set_bit(&ilsel_level_map, ILSEL_LEVELS);
+	} while (bit >= ILSEL_LEVELS);
 
 	__ilsel_enable(set, bit);
 
-- 
2.40.1


