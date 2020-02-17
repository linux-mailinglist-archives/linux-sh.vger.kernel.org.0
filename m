Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 608391617CF
	for <lists+linux-sh@lfdr.de>; Mon, 17 Feb 2020 17:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgBQQUz (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 17 Feb 2020 11:20:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55480 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbgBQQUw (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 17 Feb 2020 11:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=pA1Ytc4V6l+zv01/JwSvNvIG9QUyjZkI8aPimfUATz4=; b=Odl+TPknK3HUJhxjvOeLRzSBt5
        0MyamttI8PfGaWxdEFqVVn4SwqeVTN00LmvLIUldzZE8qGsOGWojQf5tVP66J0zykrJkRzhUDgUOM
        4PKQbKXVdpBMv4pKdbfIAoMOTVDI7RZoKXZYD9b3Th3YN3qJvKXWmZWJvkT8Wpf8a30deDO99qe30
        wCv4B3K2+t45JR1bCgRdcG2zOnc52i4oV28vsWJ8DjjEkaXWCNA+mnIAiNxNxLhlgTxqk5ZjHJTve
        2k/jshFTaCkL/7YoXgClFRjjHv8YDDfFCxB2YitOkoz+IVgjcYXxJ0RkGwTK1PWdzV686SHMAinAl
        h0RPxbIw==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8Y-00042L-Ep; Mon, 17 Feb 2020 16:20:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fqK-HE; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH v2 22/24] docs: sh: convert new-machine.txt to ReST
Date:   Mon, 17 Feb 2020 17:20:40 +0100
Message-Id: <3623fa8b3045ca7ad3373763578ba8690a469dbd.1581956285.git.mchehab+huawei@kernel.org>
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
- Mark literal blocks as such;
- Mark a table as such;
- Add it to sh/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sh/index.rst                    |   5 +
 .../sh/{new-machine.txt => new-machine.rst}   | 193 +++++++++---------
 2 files changed, 105 insertions(+), 93 deletions(-)
 rename Documentation/sh/{new-machine.txt => new-machine.rst} (73%)

diff --git a/Documentation/sh/index.rst b/Documentation/sh/index.rst
index bc8db7ba894a..56c08790265d 100644
--- a/Documentation/sh/index.rst
+++ b/Documentation/sh/index.rst
@@ -4,6 +4,11 @@ SuperH Interfaces Guide
 
 :Author: Paul Mundt
 
+.. toctree::
+    :maxdepth: 1
+
+    new-machine
+
 Memory Management
 =================
 
diff --git a/Documentation/sh/new-machine.txt b/Documentation/sh/new-machine.rst
similarity index 73%
rename from Documentation/sh/new-machine.txt
rename to Documentation/sh/new-machine.rst
index e0961a66130b..07d69049c220 100644
--- a/Documentation/sh/new-machine.txt
+++ b/Documentation/sh/new-machine.rst
@@ -1,6 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
 
-                Adding a new board to LinuxSH
-               ================================
+=============================
+Adding a new board to LinuxSH
+=============================
 
                Paul Mundt <lethal@linux-sh.org>
 
@@ -19,65 +21,67 @@ include/asm-sh/. For the new kernel, things are broken out by board type,
 companion chip type, and CPU type. Looking at a tree view of this directory
 hierarchy looks like the following:
 
-Board-specific code:
+Board-specific code::
 
-.
-|-- arch
-|   `-- sh
-|       `-- boards
-|           |-- adx
-|           |   `-- board-specific files
-|           |-- bigsur
-|           |   `-- board-specific files
-|           |
-|           ... more boards here ...
-|
-`-- include
-    `-- asm-sh
-        |-- adx
-        |   `-- board-specific headers
-        |-- bigsur
-        |   `-- board-specific headers
-        |
-	.. more boards here ...
+    .
+    |-- arch
+    |   `-- sh
+    |       `-- boards
+    |           |-- adx
+    |           |   `-- board-specific files
+    |           |-- bigsur
+    |           |   `-- board-specific files
+    |           |
+    |           ... more boards here ...
+    |
+    `-- include
+	`-- asm-sh
+	    |-- adx
+	    |   `-- board-specific headers
+	    |-- bigsur
+	    |   `-- board-specific headers
+	    |
+	    .. more boards here ...
 
-Next, for companion chips:
-.
-`-- arch
-    `-- sh
-        `-- cchips
-            `-- hd6446x
-                `-- hd64461
-                    `-- cchip-specific files
+Next, for companion chips::
+
+    .
+    `-- arch
+	`-- sh
+	    `-- cchips
+		`-- hd6446x
+		    `-- hd64461
+			`-- cchip-specific files
 
 ... and so on. Headers for the companion chips are treated the same way as
 board-specific headers. Thus, include/asm-sh/hd64461 is home to all of the
 hd64461-specific headers.
 
-Finally, CPU family support is also abstracted:
-.
-|-- arch
-|   `-- sh
-|       |-- kernel
-|       |   `-- cpu
-|       |       |-- sh2
-|       |       |   `-- SH-2 generic files
-|       |       |-- sh3
-|       |       |   `-- SH-3 generic files
-|       |       `-- sh4
-|       |           `-- SH-4 generic files
-|       `-- mm
-|           `-- This is also broken out per CPU family, so each family can
-|               have their own set of cache/tlb functions.
-|
-`-- include
-    `-- asm-sh
-        |-- cpu-sh2
-        |   `-- SH-2 specific headers
-        |-- cpu-sh3
-        |   `-- SH-3 specific headers
-        `-- cpu-sh4
-            `-- SH-4 specific headers
+Finally, CPU family support is also abstracted::
+
+    .
+    |-- arch
+    |   `-- sh
+    |       |-- kernel
+    |       |   `-- cpu
+    |       |       |-- sh2
+    |       |       |   `-- SH-2 generic files
+    |       |       |-- sh3
+    |       |       |   `-- SH-3 generic files
+    |       |       `-- sh4
+    |       |           `-- SH-4 generic files
+    |       `-- mm
+    |           `-- This is also broken out per CPU family, so each family can
+    |               have their own set of cache/tlb functions.
+    |
+    `-- include
+	`-- asm-sh
+	    |-- cpu-sh2
+	    |   `-- SH-2 specific headers
+	    |-- cpu-sh3
+	    |   `-- SH-3 specific headers
+	    `-- cpu-sh4
+		`-- SH-4 specific headers
 
 It should be noted that CPU subtypes are _not_ abstracted. Thus, these still
 need to be dealt with by the CPU family specific code.
@@ -110,33 +114,33 @@ arch/sh/boards and the include/asm-sh/ hierarchy. In order to better
 explain this, we use some examples for adding an imaginary board. For
 setup code, we're required at the very least to provide definitions for
 get_system_type() and platform_setup(). For our imaginary board, this
-might look something like:
+might look something like::
 
-/*
- * arch/sh/boards/vapor/setup.c - Setup code for imaginary board
- */
-#include <linux/init.h>
+    /*
+    * arch/sh/boards/vapor/setup.c - Setup code for imaginary board
+    */
+    #include <linux/init.h>
 
-const char *get_system_type(void)
-{
-	return "FooTech Vaporboard";
-}
+    const char *get_system_type(void)
+    {
+	    return "FooTech Vaporboard";
+    }
 
-int __init platform_setup(void)
-{
-  	/*
-	 * If our hardware actually existed, we would do real
-	 * setup here. Though it's also sane to leave this empty
-	 * if there's no real init work that has to be done for
-	 * this board.
-	 */
+    int __init platform_setup(void)
+    {
+	    /*
+	    * If our hardware actually existed, we would do real
+	    * setup here. Though it's also sane to leave this empty
+	    * if there's no real init work that has to be done for
+	    * this board.
+	    */
 
-	/* Start-up imaginary PCI ... */
+	    /* Start-up imaginary PCI ... */
 
-	/* And whatever else ... */
+	    /* And whatever else ... */
 
-	return 0;
-}
+	    return 0;
+    }
 
 Our new imaginary board will also have to tie into the machvec in order for it
 to be of any use.
@@ -172,7 +176,7 @@ sufficient.
    vector.
 
    Note that these prototypes are generated automatically by setting
-   __IO_PREFIX to something sensible. A typical example would be:
+   __IO_PREFIX to something sensible. A typical example would be::
 
 	#define __IO_PREFIX vapor
    	#include <asm/io_generic.h>
@@ -181,7 +185,7 @@ sufficient.
    have a legacy io.h should remove it entirely and switch to the new model.
 
  - Add machine vector definitions to the board's setup.c. At a bare minimum,
-   this must be defined as something like:
+   this must be defined as something like::
 
 	struct sh_machine_vector mv_vapor __initmv = {
 		.mv_name = "vapor",
@@ -202,20 +206,20 @@ Large portions of the build system are now entirely dynamic, and merely
 require the proper entry here and there in order to get things done.
 
 The first thing to do is to add an entry to arch/sh/Kconfig, under the
-"System type" menu:
+"System type" menu::
 
-config SH_VAPOR
-	bool "Vapor"
-	help
-	  select Vapor if configuring for a FooTech Vaporboard.
+    config SH_VAPOR
+	    bool "Vapor"
+	    help
+	    select Vapor if configuring for a FooTech Vaporboard.
 
 next, this has to be added into arch/sh/Makefile. All boards require a
 machdir-y entry in order to be built. This entry needs to be the name of
 the board directory as it appears in arch/sh/boards, even if it is in a
 sub-directory (in which case, all parent directories below arch/sh/boards/
-need to be listed). For our new board, this entry can look like:
+need to be listed). For our new board, this entry can look like::
 
-machdir-$(CONFIG_SH_VAPOR)	+= vapor
+    machdir-$(CONFIG_SH_VAPOR)	+= vapor
 
 provided that we've placed everything in the arch/sh/boards/vapor/ directory.
 
@@ -230,7 +234,7 @@ This is done by adding an entry to the end of the arch/sh/tools/mach-types
 list. The method for doing this is self explanatory, and so we won't waste
 space restating it here. After this is done, you will be able to use
 implicit checks for your board if you need this somewhere throughout the
-common code, such as:
+common code, such as::
 
 	/* Make sure we're on the FooTech Vaporboard */
 	if (!mach_is_vapor())
@@ -253,16 +257,19 @@ build target, and it will be implicitly listed as such in the help text.
 Looking at the 'make help' output, you should now see something like:
 
 Architecture specific targets (sh):
-  zImage                  - Compressed kernel image (arch/sh/boot/zImage)
-  adx_defconfig           - Build for adx
-  cqreek_defconfig        - Build for cqreek
-  dreamcast_defconfig     - Build for dreamcast
-...
-  vapor_defconfig         - Build for vapor
 
-which then allows you to do:
+  =======================   =============================================
+  zImage                    Compressed kernel image (arch/sh/boot/zImage)
+  adx_defconfig             Build for adx
+  cqreek_defconfig          Build for cqreek
+  dreamcast_defconfig       Build for dreamcast
+  ...
+  vapor_defconfig           Build for vapor
+  =======================   =============================================
 
-$ make ARCH=sh CROSS_COMPILE=sh4-linux- vapor_defconfig vmlinux
+which then allows you to do::
+
+    $ make ARCH=sh CROSS_COMPILE=sh4-linux- vapor_defconfig vmlinux
 
 which will in turn copy the defconfig for this board, run it through
 oldconfig (prompting you for any new options since the time of creation),
-- 
2.24.1

