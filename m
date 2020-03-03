Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2819C17780B
	for <lists+linux-sh@lfdr.de>; Tue,  3 Mar 2020 14:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgCCN7f (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 3 Mar 2020 08:59:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:45730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCCN7f (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:35 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB39022522;
        Tue,  3 Mar 2020 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243974;
        bh=38DXsbkZYmqOhYk1K5sLCRkUW+WnqbLtqwa6rshpzak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Emi4SSzApCSJ0u9pPCjQNN91Bunihpa8oSagAUY+KnR5ODkkdiHE8CTMVGNAYdcaY
         Osta5d8Xz/v/WUf5B1YGTmgFO1LxdzxzctmYZg4dDKM9kOV5yi9vJ4Z51rkFvxVsj6
         nvxu2ZsMiqy6J0VvuOomMji/WLAy6nbRM6wr48EQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001Ye0-K6; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 16/18] docs: sh: convert register-banks.txt to ReST
Date:   Tue,  3 Mar 2020 14:59:23 +0100
Message-Id: <8095ea8e231bb75d66e343491880a8561c8dc043.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
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
2.24.1

