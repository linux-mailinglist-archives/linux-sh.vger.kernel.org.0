Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B29125236
	for <lists+linux-sh@lfdr.de>; Wed, 18 Dec 2019 20:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfLRTsT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Dec 2019 14:48:19 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:48036 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfLRTsS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Dec 2019 14:48:18 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id fXoF2100N5USYZQ01XoFXN; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007xs-HK; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003KV-GB; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/6] pinctrl: sh-pfc: sh7269: Fix CAN function GPIOs
Date:   Wed, 18 Dec 2019 20:48:10 +0100
Message-Id: <20191218194812.12741-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218194812.12741-1-geert+renesas@glider.be>
References: <20191218194812.12741-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

pinmux_func_gpios[] contains a hole due to the missing function GPIO
definition for the "CTX0&CTX1" signal, which is the logical "AND" of the
first two CAN outputs.

A closer look reveals other issues:
  - Some functionality is available on alternative pins, but the
    PINMUX_DATA() entries is using the wrong marks,
  - Several configurations are missing.

Fix this by:
  - Renaming CTX0CTX1CTX2_MARK, CRX0CRX1_PJ22_MARK, and
    CRX0CRX1CRX2_PJ20_MARK to CTX0_CTX1_CTX2_MARK, CRX0_CRX1_PJ22_MARK,
    resp. CRX0_CRX1_CRX2_PJ20_MARK for consistency with the
    corresponding enum IDs,
  - Adding all missing enum IDs and marks,
  - Use the right (*_PJ2x) variants for alternative pins,
  - Adding all missing configurations to pinmux_data[],
  - Adding all missing function GPIO definitions to pinmux_func_gpios[].

See SH7268 Group, SH7269 Group User’s Manual: Hardware, Rev. 2.00:
  [1] Table 1.4 List of Pins
  [2] Figure 23.29 Connection Example when Using Channels 0 and 1 as One
      Channel (64 Mailboxes × 1 Channel) and Channel 2 as One Channel
      (32 Mailboxes × 1 Channel),
  [3] Figure 23.30 Connection Example when Using Channels 0, 1, and 2 as
      One Channel (96 Mailboxes × 1 Channel),
  [4] Table 48.3 Multiplexed Pins (Port B),
  [5] Table 48.4 Multiplexed Pins (Port C),
  [6] Table 48.10 Multiplexed Pins (Port J),
  [7] Section 48.2.4 Port B Control Registers 0 to 5 (PBCR0 to PBCR5).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The runtime-check under development reports:

    sh7269_pfc: empty function gpio 46
---
 arch/sh/include/cpu-sh2a/cpu/sh7269.h | 11 ++++++--
 drivers/pinctrl/sh-pfc/pfc-sh7269.c   | 39 ++++++++++++++++++---------
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/arch/sh/include/cpu-sh2a/cpu/sh7269.h b/arch/sh/include/cpu-sh2a/cpu/sh7269.h
index d516e5d488180db7..b887cc402b712557 100644
--- a/arch/sh/include/cpu-sh2a/cpu/sh7269.h
+++ b/arch/sh/include/cpu-sh2a/cpu/sh7269.h
@@ -78,8 +78,15 @@ enum {
 	GPIO_FN_WDTOVF,
 
 	/* CAN */
-	GPIO_FN_CTX1, GPIO_FN_CRX1, GPIO_FN_CTX0, GPIO_FN_CTX0_CTX1,
-	GPIO_FN_CRX0, GPIO_FN_CRX0_CRX1, GPIO_FN_CRX0_CRX1_CRX2,
+	GPIO_FN_CTX2, GPIO_FN_CRX2,
+	GPIO_FN_CTX1, GPIO_FN_CRX1,
+	GPIO_FN_CTX0, GPIO_FN_CRX0,
+	GPIO_FN_CTX0_CTX1, GPIO_FN_CRX0_CRX1,
+	GPIO_FN_CTX0_CTX1_CTX2, GPIO_FN_CRX0_CRX1_CRX2,
+	GPIO_FN_CTX2_PJ21, GPIO_FN_CRX2_PJ20,
+	GPIO_FN_CTX1_PJ23, GPIO_FN_CRX1_PJ22,
+	GPIO_FN_CTX0_CTX1_PJ23, GPIO_FN_CRX0_CRX1_PJ22,
+	GPIO_FN_CTX0_CTX1_CTX2_PJ21, GPIO_FN_CRX0_CRX1_CRX2_PJ20,
 
 	/* DMAC */
 	GPIO_FN_TEND0, GPIO_FN_DACK0, GPIO_FN_DREQ0,
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7269.c b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
index 6cbb18ef77dc04ae..d20974a55d93add1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7269.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
@@ -737,13 +737,12 @@ enum {
 	CRX0_MARK, CTX0_MARK,
 	CRX1_MARK, CTX1_MARK,
 	CRX2_MARK, CTX2_MARK,
-	CRX0_CRX1_MARK,
-	CRX0_CRX1_CRX2_MARK,
-	CTX0CTX1CTX2_MARK,
+	CRX0_CRX1_MARK, CTX0_CTX1_MARK,
+	CRX0_CRX1_CRX2_MARK, CTX0_CTX1_CTX2_MARK,
 	CRX1_PJ22_MARK, CTX1_PJ23_MARK,
 	CRX2_PJ20_MARK, CTX2_PJ21_MARK,
-	CRX0CRX1_PJ22_MARK,
-	CRX0CRX1CRX2_PJ20_MARK,
+	CRX0_CRX1_PJ22_MARK, CTX0_CTX1_PJ23_MARK,
+	CRX0_CRX1_CRX2_PJ20_MARK, CTX0_CTX1_CTX2_PJ21_MARK,
 
 	/* VDC */
 	DV_CLK_MARK,
@@ -821,6 +820,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_DATA(CS3_MARK, PC8MD_001),
 	PINMUX_DATA(TXD7_MARK, PC8MD_010),
 	PINMUX_DATA(CTX1_MARK, PC8MD_011),
+	PINMUX_DATA(CTX0_CTX1_MARK, PC8MD_100),
 
 	PINMUX_DATA(PC7_DATA, PC7MD_000),
 	PINMUX_DATA(CKE_MARK, PC7MD_001),
@@ -833,11 +833,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_DATA(CAS_MARK, PC6MD_001),
 	PINMUX_DATA(SCK7_MARK, PC6MD_010),
 	PINMUX_DATA(CTX0_MARK, PC6MD_011),
+	PINMUX_DATA(CTX0_CTX1_CTX2_MARK, PC6MD_100),
 
 	PINMUX_DATA(PC5_DATA, PC5MD_000),
 	PINMUX_DATA(RAS_MARK, PC5MD_001),
 	PINMUX_DATA(CRX0_MARK, PC5MD_011),
-	PINMUX_DATA(CTX0CTX1CTX2_MARK, PC5MD_100),
+	PINMUX_DATA(CTX0_CTX1_CTX2_MARK, PC5MD_100),
 	PINMUX_DATA(IRQ0_PC_MARK, PC5MD_101),
 
 	PINMUX_DATA(PC4_DATA, PC4MD_00),
@@ -1289,30 +1290,32 @@ static const u16 pinmux_data[] = {
 	PINMUX_DATA(LCD_DATA23_PJ23_MARK, PJ23MD_010),
 	PINMUX_DATA(LCD_TCON6_MARK, PJ23MD_011),
 	PINMUX_DATA(IRQ3_PJ_MARK, PJ23MD_100),
-	PINMUX_DATA(CTX1_MARK, PJ23MD_101),
+	PINMUX_DATA(CTX1_PJ23_MARK, PJ23MD_101),
+	PINMUX_DATA(CTX0_CTX1_PJ23_MARK, PJ23MD_110),
 
 	PINMUX_DATA(PJ22_DATA, PJ22MD_000),
 	PINMUX_DATA(DV_DATA22_MARK, PJ22MD_001),
 	PINMUX_DATA(LCD_DATA22_PJ22_MARK, PJ22MD_010),
 	PINMUX_DATA(LCD_TCON5_MARK, PJ22MD_011),
 	PINMUX_DATA(IRQ2_PJ_MARK, PJ22MD_100),
-	PINMUX_DATA(CRX1_MARK, PJ22MD_101),
-	PINMUX_DATA(CRX0_CRX1_MARK, PJ22MD_110),
+	PINMUX_DATA(CRX1_PJ22_MARK, PJ22MD_101),
+	PINMUX_DATA(CRX0_CRX1_PJ22_MARK, PJ22MD_110),
 
 	PINMUX_DATA(PJ21_DATA, PJ21MD_000),
 	PINMUX_DATA(DV_DATA21_MARK, PJ21MD_001),
 	PINMUX_DATA(LCD_DATA21_PJ21_MARK, PJ21MD_010),
 	PINMUX_DATA(LCD_TCON4_MARK, PJ21MD_011),
 	PINMUX_DATA(IRQ1_PJ_MARK, PJ21MD_100),
-	PINMUX_DATA(CTX2_MARK, PJ21MD_101),
+	PINMUX_DATA(CTX2_PJ21_MARK, PJ21MD_101),
+	PINMUX_DATA(CTX0_CTX1_CTX2_PJ21_MARK, PJ21MD_110),
 
 	PINMUX_DATA(PJ20_DATA, PJ20MD_000),
 	PINMUX_DATA(DV_DATA20_MARK, PJ20MD_001),
 	PINMUX_DATA(LCD_DATA20_PJ20_MARK, PJ20MD_010),
 	PINMUX_DATA(LCD_TCON3_MARK, PJ20MD_011),
 	PINMUX_DATA(IRQ0_PJ_MARK, PJ20MD_100),
-	PINMUX_DATA(CRX2_MARK, PJ20MD_101),
-	PINMUX_DATA(CRX0CRX1CRX2_PJ20_MARK, PJ20MD_110),
+	PINMUX_DATA(CRX2_PJ20_MARK, PJ20MD_101),
+	PINMUX_DATA(CRX0_CRX1_CRX2_PJ20_MARK, PJ20MD_110),
 
 	PINMUX_DATA(PJ19_DATA, PJ19MD_000),
 	PINMUX_DATA(DV_DATA19_MARK, PJ19MD_001),
@@ -1663,12 +1666,24 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 	GPIO_FN(WDTOVF),
 
 	/* CAN */
+	GPIO_FN(CTX2),
+	GPIO_FN(CRX2),
 	GPIO_FN(CTX1),
 	GPIO_FN(CRX1),
 	GPIO_FN(CTX0),
 	GPIO_FN(CRX0),
+	GPIO_FN(CTX0_CTX1),
 	GPIO_FN(CRX0_CRX1),
+	GPIO_FN(CTX0_CTX1_CTX2),
 	GPIO_FN(CRX0_CRX1_CRX2),
+	GPIO_FN(CTX2_PJ21),
+	GPIO_FN(CRX2_PJ20),
+	GPIO_FN(CTX1_PJ23),
+	GPIO_FN(CRX1_PJ22),
+	GPIO_FN(CTX0_CTX1_PJ23),
+	GPIO_FN(CRX0_CRX1_PJ22),
+	GPIO_FN(CTX0_CTX1_CTX2_PJ21),
+	GPIO_FN(CRX0_CRX1_CRX2_PJ20),
 
 	/* DMAC */
 	GPIO_FN(TEND0),
-- 
2.17.1

