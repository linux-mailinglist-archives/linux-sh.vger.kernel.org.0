Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346AD122E7F
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 15:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbfLQOV5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 09:21:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:57072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728573AbfLQOV5 (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 17 Dec 2019 09:21:57 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A21DE21739;
        Tue, 17 Dec 2019 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576592516;
        bh=ueGS3iFnbRD2iFw8cOWQhfJY1+W3N8aPfHC9xXQTM3k=;
        h=From:To:Cc:Subject:Date:From;
        b=vXqu8GIYA+hYaUmgXRVbbmFskLdI7UcMHOrLuCJ5+ZIGvhrrT78TzXFmu5Kg6KEHz
         l6TeEGPx+2TBBo90EMku8XRyTGbrcQ6ftVeaW8AmwU+osMK7PklMv4u8UxQmD8Inir
         rvo0iiYhHA6uC+5q19TNAd9ZGKG71sh+gBkKD53k=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 0/2] sh: get rid of __ARCH_USE_5LEVEL_HACK
Date:   Tue, 17 Dec 2019 16:21:48 +0200
Message-Id: <20191217142150.10392-1-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches update the SuperH page table folding/unfolding to take into
account the 5th level.

Mike Rapoport (2):
  sh: drop __pXd_offset() macros that duplicate pXd_index() ones
  sh: add support for folded p4d page tables

 arch/sh/include/asm/pgtable-2level.h |  1 -
 arch/sh/include/asm/pgtable-3level.h |  1 -
 arch/sh/include/asm/pgtable_32.h     |  5 ++---
 arch/sh/include/asm/pgtable_64.h     |  5 ++---
 arch/sh/kernel/io_trapped.c          |  7 ++++++-
 arch/sh/mm/cache-sh4.c               |  4 +++-
 arch/sh/mm/cache-sh5.c               |  7 ++++++-
 arch/sh/mm/fault.c                   | 26 +++++++++++++++++++++++---
 arch/sh/mm/hugetlbpage.c             | 28 ++++++++++++++++++----------
 arch/sh/mm/init.c                    | 15 +++++++++++----
 arch/sh/mm/kmap.c                    |  2 +-
 arch/sh/mm/tlbex_32.c                |  6 +++++-
 arch/sh/mm/tlbex_64.c                |  7 ++++++-
 13 files changed, 83 insertions(+), 31 deletions(-)

-- 
2.24.0

