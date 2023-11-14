Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358157EAB40
	for <lists+linux-sh@lfdr.de>; Tue, 14 Nov 2023 09:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbjKNIBT (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 14 Nov 2023 03:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjKNIBS (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 14 Nov 2023 03:01:18 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2883619E
        for <linux-sh@vger.kernel.org>; Tue, 14 Nov 2023 00:01:15 -0800 (PST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by sakura.ysato.name (Postfix) with ESMTPSA id 866781C050D;
        Tue, 14 Nov 2023 17:01:14 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 29/37] sh: SH7751R SoC Internal peripheral definition dtsi.
Date:   Tue, 14 Nov 2023 17:00:20 +0900
Message-Id: <abc6ac4c393236f73ef2c0b22ea3d053befc245e.1699856600.git.ysato@users.sourceforge.jp>
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

SH7751R internal peripherals device tree.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/boot/dts/sh7751r.dtsi | 151 ++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 arch/sh/boot/dts/sh7751r.dtsi

diff --git a/arch/sh/boot/dts/sh7751r.dtsi b/arch/sh/boot/dts/sh7751r.dtsi
new file mode 100644
index 000000000000..81455b1592fc
--- /dev/null
+++ b/arch/sh/boot/dts/sh7751r.dtsi
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the SH7751R SoC
+ */
+
+#include <dt-bindings/interrupt-controller/sh_intc.h>
+#include <dt-bindings/clock/sh7750-cpg.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "renesas,sh4", "renesas,sh2";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&cpg SH7750_CPG_ICK>;
+			clock-names = "ick";
+			icache-size = <16384>;
+			icache-line-size = <32>;
+			dcache-size = <32768>;
+			dcache-line-size = <32>;
+		};
+	};
+
+	xtal: oscillator {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "xtal";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&shintc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		cpg: clock-controller@ffc00000 {
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+			compatible = "renesas,sh7751r-cpg";
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			reg = <0xffc00000 20>, <0xfe0a0000 16>;
+			reg-names = "FRQCR", "CLKSTP00";
+			renesas,mode = <0>;
+		};
+
+		shintc: interrupt-controller@ffd00000 {
+			compatible = "renesas,sh7751-intc";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xffd00000 20>, <0xfe080000 128>;
+			reg-names = "ICR", "INTPRI00";
+			renesas,ipr-map = <0x240 IPRD IPR_B12>,	/* IRL0 */
+					  <0x2a0 IPRD IPR_B8>,	/* IRL1 */
+					  <0x300 IPRD IPR_B4>,	/* IRL2 */
+					  <0x360 IPRD IPR_B0>,	/* IRL3 */
+					  <0x400 IPRA IPR_B12>,	/* TMU0 */
+					  <0x420 IPRA IPR_B8>,	/* TMU1 */
+					  <0x440 IPRA IPR_B4>,	/* TMU2 TNUI */
+					  <0x460 IPRA IPR_B4>,	/* TMU2 TICPI */
+					  <0x480 IPRA IPR_B0>,	/* RTC ATI */
+					  <0x4a0 IPRA IPR_B0>,	/* RTC PRI */
+					  <0x4c0 IPRA IPR_B0>,	/* RTC CUI */
+					  <0x4e0 IPRB IPR_B4>,	/* SCI ERI */
+					  <0x500 IPRB IPR_B4>,	/* SCI RXI */
+					  <0x520 IPRB IPR_B4>,	/* SCI TXI */
+					  <0x540 IPRB IPR_B4>,	/* SCI TEI */
+					  <0x560 IPRB IPR_B12>,	/* WDT */
+					  <0x580 IPRB IPR_B8>,	/* REF RCMI */
+					  <0x5a0 IPRB IPR_B4>,	/* REF ROVI */
+					  <0x600 IPRC IPR_B0>,	/* H-UDI */
+					  <0x620 IPRC IPR_B12>,	/* GPIO */
+					  <0x640 IPRC IPR_B8>,	/* DMAC DMTE0 */
+					  <0x660 IPRC IPR_B8>,	/* DMAC DMTE1 */
+					  <0x680 IPRC IPR_B8>,	/* DMAC DMTE2 */
+					  <0x6a0 IPRC IPR_B8>,	/* DMAC DMTE3 */
+					  <0x6c0 IPRC IPR_B8>,	/* DMAC DMAE */
+					  <0x700 IPRC IPR_B4>,	/* SCIF ERI */
+					  <0x720 IPRC IPR_B4>,	/* SCIF RXI */
+					  <0x740 IPRC IPR_B4>,	/* SCIF BRI */
+					  <0x760 IPRC IPR_B4>,	/* SCIF TXI */
+					  <0x780 IPRC IPR_B8>,	/* DMAC DMTE4 */
+					  <0x7a0 IPRC IPR_B8>,	/* DMAC DMTE5 */
+					  <0x7c0 IPRC IPR_B8>,	/* DMAC DMTE6 */
+					  <0x7e0 IPRC IPR_B8>,	/* DMAC DMTE7 */
+					  <0xa00 INTPRI00 IPR_B0>,	/* PCIC PCISERR */
+					  <0xa20 INTPRI00 IPR_B4>,	/* PCIC PCIDMA3 */
+					  <0xa40 INTPRI00 IPR_B4>,	/* PCIC PCIDMA2 */
+					  <0xa60 INTPRI00 IPR_B4>,	/* PCIC PCIDMA1 */
+					  <0xa80 INTPRI00 IPR_B4>,	/* PCIC PCIDMA0 */
+					  <0xaa0 INTPRI00 IPR_B4>,	/* PCIC PCIPWON */
+					  <0xac0 INTPRI00 IPR_B4>,	/* PCIC PCIPWDWN */
+					  <0xae0 INTPRI00 IPR_B4>,	/* PCIC PCIERR */
+					  <0xb00 INTPRI00 IPR_B8>,	/* TMU3 */
+					  <0xb80 INTPRI00 IPR_B12>;	/* TMU4 */
+		};
+
+		/* sci0 is rarely used, so it is not defined here. */
+		scif1: serial@ffe80000 {
+			compatible = "renesas,scif-sh7751", "renesas,scif";
+			reg = <0xffe80000 0x100>;
+			interrupts = <evt2irq(0x700)>,
+				     <evt2irq(0x720)>,
+				     <evt2irq(0x760)>,
+				     <evt2irq(0x740)>;
+			interrupt-names = "eri", "rxi", "txi", "bri";
+			clocks = <&cpg SH7750_MSTP_SCIF>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		/* Normally ch0 and ch1 are used, so we will define ch0 to ch2 here. */
+		tmu0: timer@ffd80000 {
+			compatible = "renesas,tmu-sh7750", "renesas,tmu";
+			reg = <0xffd80000 12>;
+			interrupts = <evt2irq(0x400)>,
+				     <evt2irq(0x420)>,
+				     <evt2irq(0x440)>,
+				     <evt2irq(0x460)>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg SH7750_MSTP_TMU012>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#renesas,channels = <3>;
+		};
+
+		pcic: pci@fe200000 {
+			compatible = "renesas,sh7751-pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			bus-range = <0 0>;
+			ranges = <0x02000000 0 0xfd000000 0xfd000000 0 0x01000000>,
+				 <0x01000000 0 0x00000000 0xfe240000 0 0x00040000>;
+			reg = <0xfe200000 0x0400>,
+			      <0x0c000000 0x04000000>,
+			      <0xff800000 0x0030>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.39.2

