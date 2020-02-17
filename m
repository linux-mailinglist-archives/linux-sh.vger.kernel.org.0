Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6421617CE
	for <lists+linux-sh@lfdr.de>; Mon, 17 Feb 2020 17:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgBQQU4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 17 Feb 2020 11:20:56 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55478 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgBQQUw (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 17 Feb 2020 11:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=crZFOo/t9VKSc5KMMcfdd5wNRKtdT4ryDJR27QN4v/s=; b=djrzgQy1c0H3V7nhrCoUm+PSLz
        0cWofXfZ1xtiDJDLONECcqPpasbe1+FMUdFnf2FvrrMFG5XoO5lOBaYiSfeXThkF7+lEhKw3t0At/
        suTIYXDO34kLocB95U93UtXtm1p2XPh7ENjWagiesRh3CvIwsB+KNJ+VddNi3ErzExOAj/Cq/e4wc
        Cbr7BE3vckcRvckA5kCp4VmdnhozWC+n7dD8ez7erFIZGt9oyVWKigmJtIwZU7ijEHG0slNVgX+C3
        hgFZx2BeiJDKIyW7flJu9EuRkQoJzwCvTzerqSP+OfxOJ2sd8jIDcG4I95CpRPl1yicMPkx+32CP0
        wP8GXRWg==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8Y-00042M-G6; Mon, 17 Feb 2020 16:20:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fqP-IC; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v2 23/24] docs: sh: convert register-banks.txt to ReST
Date:   Mon, 17 Feb 2020 17:20:41 +0100
Message-Id: <210c9d5b461d48663a15efb940bef52c6e3f69fc.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

- Add a SPDX header;
- Adjust document title to follow ReST style;
- Add blank lines to make ReST markup happy
- Add it to sh/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sh/index.rst                           |  1 +
 .../sh/{register-banks.txt => register-banks.rst}    | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)
 rename Documentation/sh/{register-banks.txt => register-banks.rst} (88%)

diff --git a/Documentation/sh/index.rst b/Documentation/sh/index.rst
index 56c08790265d..580f3b17e841 100644
--- a/Documentation/sh/index.rst
+++ b/Documentation/sh/index.rst
@@ -8,6 +8,7 @@ SuperH Interfaces Guide
     :maxdepth: 1
 
     new-machine
+    register-banks
 
 Memory Management
 =================
diff --git a/Documentation/sh/register-banks.txt b/Documentation/sh/register-banks.rst
similarity index 88%
rename from Documentation/sh/register-banks.txt
rename to Documentation/sh/register-banks.rst
index a6719f2f6594..2f51212043f4 100644
--- a/Documentation/sh/register-banks.txt
+++ b/Documentation/sh/register-banks.rst
@@ -1,5 +1,8 @@
-	Notes on register bank usage in the kernel
-	==========================================
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================
+Notes on register bank usage in the kernel
+==========================================
 
 Introduction
 ------------
@@ -23,11 +26,16 @@ Presently the kernel uses several of these registers.
 
 	- r0_bank, r1_bank (referenced as k0 and k1, used for scratch
 	  registers when doing exception handling).
+
 	- r2_bank (used to track the EXPEVT/INTEVT code)
+
 		- Used by do_IRQ() and friends for doing irq mapping based off
 		  of the interrupt exception vector jump table offset
+
 	- r6_bank (global interrupt mask)
+
 		- The SR.IMASK interrupt handler makes use of this to set the
 		  interrupt priority level (used by local_irq_enable())
+
 	- r7_bank (current)
 
-- 
2.24.1

