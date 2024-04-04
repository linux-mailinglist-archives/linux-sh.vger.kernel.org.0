Return-Path: <linux-sh+bounces-772-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E901689806D
	for <lists+linux-sh@lfdr.de>; Thu,  4 Apr 2024 07:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C4B1F25F26
	for <lists+linux-sh@lfdr.de>; Thu,  4 Apr 2024 05:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E6712839F;
	Thu,  4 Apr 2024 05:15:39 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437E9128384;
	Thu,  4 Apr 2024 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.127.30.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712207739; cv=none; b=WhjR4sgjs94OnRvy90BZFGF1bzL9kBTKh6zMh7iBu0LG5Y7RbttdGPeD5/68EgnFkyhECXj4fMOSf61Wuh8TX1rAfO+AmwuJvbZIzgk5Qtq+vbpWMfNECpS1zM3q140t5aEidABzPCxqZObHvJw7HDWTpupd4vMNzQfMMvLuHSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712207739; c=relaxed/simple;
	bh=MvQpdX/sSYmof7Bxa6HlKAVNZXKWVUfpsjYKfuvmB9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u3/LC7lRD+fkUDXhVp52NRt3i1GwxpBjDaMAxbW/ysMrtNmF6eKqzUvrPJBr3jWgZXxw43FY8Lz3sa5kDvSVWHIyHipMkHhA8p2alP44K31I2rs8ODyodgCUKDsBqQrEboOME6ePIrFvDmlgq9x3g1V3etfCOT56l9dCjV8HMn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp; spf=fail smtp.mailfrom=users.sourceforge.jp; arc=none smtp.client-ip=153.127.30.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=users.sourceforge.jp
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
	by sakura.ysato.name (Postfix) with ESMTPSA id 7ACF71C1009;
	Thu,  4 Apr 2024 14:15:34 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lee Jones <lee@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Rientjes <rientjes@google.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baoquan He <bhe@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [RESEND v7 22/37] dt-bindings: display: smi,sm501: SMI SM501 binding json-schema
Date: Thu,  4 Apr 2024 14:14:33 +0900
Message-Id: <9858ef1c149bd27b27594b3bd388601681d83460.1712207606.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/display/smi,sm501.yaml           | 398 ++++++++++++++++++
 1 file changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml

diff --git a/Documentation/devicetree/bindings/display/smi,sm501.yaml b/Documentation/devicetree/bindings/display/smi,sm501.yaml
new file mode 100644
index 000000000000..06c6af4fa4a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml
@@ -0,0 +1,398 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/smi,sm501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Motion SM501 Mobile Multimedia Companion Chip
+
+maintainers:
+  - Yoshinori Sato <ysato@user.sourceforge.jp>
+
+description: |
+  These DT bindings describe the SM501.
+
+properties:
+  compatible:
+    const:
+      smi,sm501
+
+  reg:
+    maxItems: 2
+    description: |
+     First entry: System Configuration register
+     Second entry: IO space (Display Controller register)
+
+  interrupts:
+    description: SM501 interrupt to the cpu should be described here.
+
+  mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: select a video mode
+
+  edid:
+    description: |
+      verbatim EDID data block describing attached display.
+      Data from the detailed timing descriptor will be used to
+      program the display controller.
+
+  little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on big endian systems, to set different foreign endian.
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: available on little endian systems, to set different foreign endian.
+
+  swap-fb-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: swap framebuffer byteorder.
+
+  route-crt-panel:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Panel output merge to CRT.
+
+  crt:
+    type: object
+    description: CRT output control
+    properties:
+      edid:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          verbatim EDID data block describing attached display.
+          Data from the detailed timing descriptor will be used to
+          program the display controller.
+
+      smi,flags:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: Display control flags.
+        items:
+          anyOf:
+            - const: use-init-done
+            - const: disable-at-exit
+            - const: use-hwcursor
+            - const: use-hwaccel
+            - const: panel-no-fpen
+            - const: panel-no-vbiasen
+            - const: panel-inv-fpen
+            - const: panel-inv-vbiasen
+        maxItems: 8
+
+      bpp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Color depth
+
+  panel:
+    type: object
+    description: Panel output control
+    properties:
+      edid:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          verbatim EDID data block describing attached display.
+          Data from the detailed timing descriptor will be used to
+          program the display controller.
+
+      smi,flags:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: Display control flags.
+        items:
+          anyOf:
+            - const: use-init-done
+            - const: disable-at-exit
+            - const: use-hwcursor
+            - const: use-hwaccel
+            - const: panel-no-fpen
+            - const: panel-no-vbiasen
+            - const: panel-inv-fpen
+            - const: panel-inv-vbiasen
+        maxItems: 8
+
+      bpp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Color depth
+
+  smi,devices:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Select SM501 device functions.
+    items:
+      anyOf:
+        - const: usb-host
+        - const: usb-slave
+        - const: ssp0
+        - const: ssp1
+        - const: uart0
+        - const: uart1
+        - const: fbaccel
+        - const: ac97
+        - const: i2s
+        - const: gpio
+    minItems: 1
+    maxItems: 10
+
+  smi,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: mclk frequency.
+
+  smi,m1xclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: m1xclk frequency.
+
+  misc-timing:
+    type: object
+    description: Miscellaneous Timing register values.
+    properties:
+      ex:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Extend bus holding time.
+
+      xc:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Xscale clock input select.
+
+      usb-over-current-detect-disable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB host current detection disable (Us=0).
+
+      usb-over-current-detect-enable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB host current detection disable (Us=1).
+
+      sdram-clock-mode1-288mhz:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SSM1 bit is clear.
+
+      sdram-clock-mode1-div:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SSM1 bit is set.
+
+      sm1:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SDRAM clock divider for PW mode 1.
+
+      sdram-clock-mode0-288mhz:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SSM0 bit is clear.
+
+      sdram-clock-mode0-div:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SSM0 bit is set.
+
+      sm0:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: SDRAM clock divider for PW mode 0.
+
+      pll-debug-input:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: 96MHz PLL debug input reference frequency (Deb=0).
+
+      pll-debug-output:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: 96MHz PLL debug output frequency (Deb=1).
+
+      no-acpi-control:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: No ACPI control (A=0).
+
+      acpi-control:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: No ACPI control (A=1).
+
+      divider:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Second PLL output frequency.
+
+      usb-host-normal:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB Host normal mode.
+
+      usb-host-simulation:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB Host simulation mode.
+
+      delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Delay time to latch read data. Set the value to 10x.
+
+  misc-control:
+    type: object
+    description: Miscellaneous Control register values.
+    properties:
+      pad:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: PCI Pad drive strength.
+
+      usbclk:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: USB Clcok Select.
+
+      uart1:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: UART1 (SSP=0)
+
+      ssp1:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SSP1 (SSP=1)
+
+      latch-address-disable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: 8051 Latch disable (Lat=0).
+
+      latch-address-enable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: 8051 Latch enable (Lat=1).
+
+      panel-data-18bit:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Flat Panel data 18bit (FP=0).
+
+      panel-data-24bit:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Flat Panel data 24bit (FP=1).
+
+      xtal-freq-24mhz:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Crystal frequency 24MHz (Freq=0).
+
+      xtal-freq-12mhz:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Crystal frequency 12MHz (Freq=1).
+
+      refresh:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Internal memory refresh timing.
+
+      hold:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: BUS Hold time.
+
+      sh-ready-low:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SuperH ready polarity active low (SH=0).
+
+      sh-ready-high:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: SuperH ready polarity active high (SH=1).
+
+      interrupt-normal:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Interrupt normal (II=0).
+
+      interrupt-inverted:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Interrupt Inverting (II=1).
+
+      pll-clock-count-disable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: PLL clock count disable.
+
+      pll-clock-count-enaable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: PLL clock count enable.
+
+      dac-power-enable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: DAC Power enable (DAC=0).
+
+      dac-power-disable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: DAC Power disable (DAC=1).
+
+      usb-slave-cpu:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB slave controller cpu (MC=0).
+
+      usb-slave-8051:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB slave controller 8051MCU (MC=1).
+
+      burst-length-8:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: CPU Master burst length 8 (BL=0).
+
+      burst-length-1:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: CPU Master burst length 1 (BL=1).
+
+      usb-port-master:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB port master.
+
+      usb-port-slave:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: USB port slave.
+
+      vr-mmio-30mb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: NEC VR Memory map MMIO locatedat 30MB (VR=0)
+
+      vr-mmio-62mb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: NEC VR Memory map MMIO locatedat 62MB (VR=1)
+
+  gpio-pin-control:
+    type: object
+    description: GPIO control configuration.
+    properties:
+      pin:
+        type: object
+        properties:
+          gpio:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: pin in/out use GPIO.
+          function:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: pin in/out use function.
+
+  gpio-i2c:
+    type: object
+    description: GPIO I2C definition.
+    properties:
+      i2c:
+        type: object
+        properties:
+          bus:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C bus number.
+
+          sda:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C SDA pin port number.
+
+          scl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: I2C SCL pin port number.
+
+          delay:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: bit transmission delay.
+
+          timeout:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: transmission timeout.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+
+examples:
+  # MPC5200
+  - |
+    display@1,0 {
+        compatible = "smi,sm501";
+        reg = <0x00000000 0x00800000
+               0x03e00000 0x00200000>;
+        interrupts = <1 1 3>;
+        mode = "640x480-32@60";
+        edid = [00 ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00
+                00 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 f0 0a 80 fb 20 e0 25 10 32 60
+                02 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd];
+    };
-- 
2.39.2


