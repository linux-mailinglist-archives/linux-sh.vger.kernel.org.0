Return-Path: <linux-sh+bounces-1924-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06A9BB2DA
	for <lists+linux-sh@lfdr.de>; Mon,  4 Nov 2024 12:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A13283B00
	for <lists+linux-sh@lfdr.de>; Mon,  4 Nov 2024 11:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6BD1D096F;
	Mon,  4 Nov 2024 11:05:32 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B771D095E
	for <linux-sh@vger.kernel.org>; Mon,  4 Nov 2024 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718331; cv=none; b=aNz/AAZJa1cMAV3DsyaW4XjM8PyEtkSPCZZ8H+nCVq36QFiJ+96MvRcMMabnacteoq8cLqyolKxfcyUcoZnEwh97RdX5uVydQ0Jm+O51Ujh07KgA7+UzvnnyBGVC3wVXMUfiy/PMERV3R5aYSDIjFUrO1VFWgoQtDcV/kHA508E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718331; c=relaxed/simple;
	bh=hPLn67jJGh8npK+Nrh+oowlYDEbl4/LjLbYe7hgNHvE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XYXlvVOpggVDI7rgxvLfvKhnKODfvFo8xOKvhaKtkT8+Pzfjchuzk/ozg2g0jYJjYcezSh6HgsWfjMPznG7VMuHeaovyeagMcW7BMYLTE2qrkRoaTE73oePALjWDroBOnvozjwuxA+t2ATXPMEV8rgy64g6xgIhFFFCluaBaC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:cff2:a4e4:667a:351c])
	by albert.telenet-ops.be with cmsmtp
	id Yb5F2D0012b9NYg06b5FEf; Mon, 04 Nov 2024 12:05:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7utD-006FYY-3n;
	Mon, 04 Nov 2024 12:05:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7utW-00E1Vx-Pi;
	Mon, 04 Nov 2024 12:05:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver sections
Date: Mon,  4 Nov 2024 12:05:07 +0100
Message-Id: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removing full driver sections also removed mailing list entries, causing
submitters of future patches to forget CCing these mailing lists.

Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
SuperH Ethernet drivers.  Add people who volunteered to maintain these
drivers (thanks a lot!).

Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Simon Horman <horms@kernel.org>
Acked-by: Niklas Cassel <cassel@kernel.org>
---
To be applied to renesas-fixes for v6.12 after v6.12-rc7, unless a
better solution is found.

v2:
  - Add Acked-by, Reviewed-by,
  - Add M:-entries.
---
 MAINTAINERS | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13f4c23281f89332..b04d678240e80ec9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,16 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
 
+RENESAS ETHERNET AVB DRIVER
+M:	Paul Barker <paul.barker.ct@bp.renesas.com>
+M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/ravb*
+
 RENESAS ETHERNET SWITCH DRIVER
 R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	netdev@vger.kernel.org
@@ -19627,6 +19637,14 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
+RENESAS R-CAR SATA DRIVER
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-ide@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
+F:	drivers/ata/sata_rcar.c
+
 RENESAS R-CAR THERMAL DRIVERS
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
 L:	linux-renesas-soc@vger.kernel.org
@@ -19702,6 +19720,16 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 F:	drivers/i2c/busses/i2c-rzv2m.c
 
+RENESAS SUPERH ETHERNET DRIVER
+M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/sh_eth*
+F:	include/linux/sh_eth.h
+
 RENESAS USB PHY DRIVER
 M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.34.1


