Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03B67EAB3D
	for <lists+linux-sh@lfdr.de>; Tue, 14 Nov 2023 09:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjKNIBR (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 14 Nov 2023 03:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbjKNIBQ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 14 Nov 2023 03:01:16 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 205F719E
        for <linux-sh@vger.kernel.org>; Tue, 14 Nov 2023 00:01:13 -0800 (PST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by sakura.ysato.name (Postfix) with ESMTPSA id 423461C04EC;
        Tue, 14 Nov 2023 17:01:12 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 26/37] dt-bindings: vendor-prefix: Add new vendor iodata and smi.
Date:   Tue, 14 Nov 2023 17:00:17 +0900
Message-Id: <3ca881b5919a21d6d08caf48ca9287edac5baafa.1699856600.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699856600.git.ysato@users.sourceforge.jp>
References: <cover.1699856600.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Added.
- IO DATA DEVICE, Inc.
- Silicon Motion Technology Corporation (Silicon Motion, Inc.)

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..a338bdd743ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -671,6 +671,8 @@ patternProperties:
     description: Inventec
   "^inversepath,.*":
     description: Inverse Path
+  "^iodata,.*":
+    description: IO DATA DEVICE Inc.
   "^iom,.*":
     description: Iomega Corporation
   "^irondevice,.*":
@@ -1281,6 +1283,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartlabs,.*":
     description: SmartLabs LLC
+  "^smi,.*":
+    description: Silicon Motion Technology Corporation
   "^smsc,.*":
     description: Standard Microsystems Corporation
   "^snps,.*":
-- 
2.39.2

