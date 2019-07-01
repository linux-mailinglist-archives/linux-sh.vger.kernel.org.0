Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 641FF57C3F
	for <lists+linux-sh@lfdr.de>; Thu, 27 Jun 2019 08:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfF0GeA (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 27 Jun 2019 02:34:00 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39404 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfF0GeA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 27 Jun 2019 02:34:00 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so713101pls.6;
        Wed, 26 Jun 2019 23:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rN7vvaupK7RLBVRK7J1DULNRGUcAxXTHXemdvX83dmE=;
        b=KUqVeoDVfZFedbtNauWJ6fxkKSIb8iyv27AAH+3ZyL8M8BICcmunMX+OuI2cDNqCYZ
         dabZmeZEhSeg93q9eOLl6YqZgYj6y9ZxbFYPlpYio0IWl5ev2ufOC8HhDsqU11hipMq6
         wik4Agp0oNNbcI+mrYecSl6cVTkLN9RpIUczVP25ROGmB8H3VXDer3Tb2tZvU9yQjUog
         uP2pP3d2IjbL2345Og0H5MGH1m/scGJizRY0ss3zmIMjExtk5G2jlUrrpr69ZKo8qZIN
         ai+ZL4PS1/YTerBWckk99Gcl+Uhf09+wYnRfXo7itpwjw2dACC1DZiBNcHZqLrEZB6iN
         Og+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rN7vvaupK7RLBVRK7J1DULNRGUcAxXTHXemdvX83dmE=;
        b=F1dnFYceRXylisdDkaecgo9/nfNL2f77mB/NPfd08JyMuVumNz/Mp0nXwpcXUa9NU1
         oqs3tAJx967p6W0OfCtJRv4q7paewCfFlFSw4S+4YEa1edC6InWCKejlRciLpXOrD1pn
         z4PIKqYBEZ2hiQ3PIxbWwJhzokVxpN7A1WiQvfr2S9zb3py0wRRQluxiYDcX9sWe2int
         OrOgP1oy4HJB4b7RkhXtN27eFxoXfeyocsC5bTfLg2ZegwhZLGuFaMJ5gfey3Oj8UTIa
         siDHeh2RXhkyFrKftWmMPtzuPuQ1naEck9QPKSZkidlP36GpdFoBRFuRDOtqDJE6zCAc
         z4AQ==
X-Gm-Message-State: APjAAAXV8Y41F6Wdps5NWUs2igiOqaYzGMoxPPXtQ+dEMKspztX9MKSF
        IXdgsXmXddd/PwfSKnKyrJU=
X-Google-Smtp-Source: APXvYqzd5daLzUEOgs2G8ejjDfh+6fWCmpv2F9xzIuIC62rqVezHzqZAjMn0rQcaya3WRsEbfT3wHw==
X-Received: by 2002:a17:902:aa83:: with SMTP id d3mr2662737plr.74.1561617239139;
        Wed, 26 Jun 2019 23:33:59 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.201.6])
        by smtp.gmail.com with ESMTPSA id r2sm1505103pfl.67.2019.06.26.23.33.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 23:33:58 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     ysato@users.sourceforge.jp, dalias@libc.org, corbet@lwn.net,
        linux-sh@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] Documentation:sh:convert register-banks.txt to register-banks.rst
Date:   Thu, 27 Jun 2019 12:03:47 +0530
Message-Id: <20190627063347.11137-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This patch converts register-banks.txt to ReST format, No content
change.
Added register-banks.rst to sh/index.rst

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 Documentation/sh/index.rst                                | 5 +++++
 .../sh/{register-banks.txt => register-banks.rst}         | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename Documentation/sh/{register-banks.txt => register-banks.rst} (90%)

diff --git a/Documentation/sh/index.rst b/Documentation/sh/index.rst
index bc8db7ba894a..59b4e0e17aca 100644
--- a/Documentation/sh/index.rst
+++ b/Documentation/sh/index.rst
@@ -57,3 +57,8 @@ Maple

 .. kernel-doc:: drivers/sh/maple/maple.c
    :export:
+
+.. toctree::
+   :maxdepth: 2
+
+   register-banks
diff --git a/Documentation/sh/register-banks.txt b/Documentation/sh/register-banks.rst
similarity index 90%
rename from Documentation/sh/register-banks.txt
rename to Documentation/sh/register-banks.rst
index a6719f2f6594..acccfaf80355 100644
--- a/Documentation/sh/register-banks.txt
+++ b/Documentation/sh/register-banks.rst
@@ -1,8 +1,9 @@
-	Notes on register bank usage in the kernel
-	==========================================
+==========================================
+Notes on register bank usage in the kernel
+==========================================

 Introduction
-------------
+============

 The SH-3 and SH-4 CPU families traditionally include a single partial register
 bank (selected by SR.RB, only r0 ... r7 are banked), whereas other families
@@ -30,4 +31,3 @@ Presently the kernel uses several of these registers.
 		- The SR.IMASK interrupt handler makes use of this to set the
 		  interrupt priority level (used by local_irq_enable())
 	- r7_bank (current)
-
--
2.17.1

