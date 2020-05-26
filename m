Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D411C0215
	for <lists+linux-sh@lfdr.de>; Thu, 30 Apr 2020 18:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgD3QSm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 30 Apr 2020 12:18:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:58762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728147AbgD3QSk (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 30 Apr 2020 12:18:40 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30D042496C;
        Thu, 30 Apr 2020 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588263518;
        bh=tiWe5FzyBY3lLv+S2h54s5pLwV8IMienneyPdC0ziM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QQzB+7vUTuW9wjsCOgHMPqeovDDNfA+m7xF1BW0InEv5jHQnf72IjygJhTq+ev5k0
         TTS4mG3g3f0SqX+Xu5AEU3/DLp+O+SDHOJemu40XNW9HfNZABHGncejPR9ZR8ErOKz
         Mfk3GAbg2BwiVClBnCRpw5C+BT32B97nEJ85XNQc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jUBtU-00Axhr-Ay; Thu, 30 Apr 2020 18:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v4 16/19] docs: sh: convert register-banks.txt to ReST
Date:   Thu, 30 Apr 2020 18:18:30 +0200
Message-Id: <ca2ef2dea673dfd99e68b73da5bf3c24dc3b2d71.1588263270.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588263270.git.mchehab+huawei@kernel.org>
References: <cover.1588263270.git.mchehab+huawei@kernel.org>
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
 Documentation/sh/index.rst                          |  1 +
 .../sh/{register-banks.txt => register-banks.rst}   | 13 ++++++++++---
 arch/sh/Kconfig.cpu                                 |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)
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
index a6719f2f6594..2bef5c8fcbbc 100644
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
@@ -23,11 +26,15 @@ Presently the kernel uses several of these registers.
 
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
-
diff --git a/arch/sh/Kconfig.cpu b/arch/sh/Kconfig.cpu
index 4a4edc7e03d4..07ad7597cbe7 100644
--- a/arch/sh/Kconfig.cpu
+++ b/arch/sh/Kconfig.cpu
@@ -94,7 +94,7 @@ config CPU_HAS_SR_RB
 	  that are lacking this bit must have another method in place for
 	  accomplishing what is taken care of by the banked registers.
 
-	  See <file:Documentation/sh/register-banks.txt> for further
+	  See <file:Documentation/sh/register-banks.rst> for further
 	  information on SR.RB and register banking in the kernel in general.
 
 config CPU_HAS_PTEAEX
-- 
2.25.4

