Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0241158AE
	for <lists+linux-sh@lfdr.de>; Fri,  6 Dec 2019 22:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfLFVi0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Fri, 6 Dec 2019 16:38:26 -0500
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:39490 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfLFViZ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 6 Dec 2019 16:38:25 -0500
X-Greylist: delayed 1552 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Dec 2019 16:38:24 EST
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id xB6LCUiM023645; Sat, 7 Dec 2019 06:12:31 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id xB6LC8eq022396; Sat, 7 Dec 2019 06:12:08 +0900
X-Iguazu-Qid: 2wHHpomOd0Z85F1eN6
X-Iguazu-QSIG: v=2; s=0; t=1575666728; q=2wHHpomOd0Z85F1eN6; m=8lRysxcYaW1+37TD+lI8LN7k4M/K8Ohb80mh6Bwqa+A=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1110) id xB6LC62e015144;
        Sat, 7 Dec 2019 06:12:07 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id xB6LC69A029887;
        Sat, 7 Dec 2019 06:12:06 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id xB6LC6Ie015871;
        Sat, 7 Dec 2019 06:12:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irqfGKoQPVn+xWz59YYriJylXIdzS+dab8Pv3N1sfOSGp/eI5xHaSGDN+lsCV9dR6M55OOD8Cm1VVCb37J9dCzWU3I9Pa2LLK7XN80cDW/ZZpUPnjeVSCEUcF6C05I//j8vh6HG/8NnD4JKSqyMm/og4+pGE604ARJxRAeLejTVqrko+fhpMPX6ChkoTUfukYSr9vd1c3o5+l7y3ukgPJ3T9ep2Q4zMcVmaVxXNExepTP9F+kwvp+2Ue3+Rp+fyzO7JDZAPH8ejp46LXmPrH19RNZYX9hAz96ZgtEWB4PPROYjExOMWXUqOGzsp9vfIY30ZkT1UibZMqs6f2bAd+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3md35lIJRHIa6Mnwn4bZxUctNuh+oqRLYqkm7wOiaHU=;
 b=jdPDmtcuMGu+NkoL+yVx3hpeEe9R/CF9eOUvytQ/ouKI9wF/94D+jFBXkCxj/SCuFt2xygh/IwLkOysMr2+vB2HvopxuZfRSJRsOi2on8fMtQhUxj+eChd4e7UR4dRFGAmbhFuEAVPbkDjp1/BEeIRYlGtEqP7AGJm7jcakKW02w5LQDvc7GhNA+J71l9hDktADHVA1uFApXzJzXvniH4attcfk7Sn3V+Ucn2p//SEbTZOEZOwxLC7j7bXkjR9XJJTwTkmnYAXYU9dWxVob9yDcV1HZWH7PdmWYqTQ/4xJupudWtmWJrsJ9vKqlR9AkRxBSyTqyZgjcIs00N0G5jaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     <geert+renesas@glider.be>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] usb: host: ehci-sh: Remove unused platform data support
Thread-Topic: [PATCH] usb: host: ehci-sh: Remove unused platform data support
Thread-Index: AQHVrDkmjWEan0Skl06AGq/UA66gi6etmcqw
Date:   Fri, 6 Dec 2019 21:11:00 +0000
X-TSB-HOP: ON
Message-ID: <TY2PR01MB32430C9489120D90A250A6D5925F0@TY2PR01MB3243.jpnprd01.prod.outlook.com>
References: <20191206132849.29406-1-geert+renesas@glider.be>
In-Reply-To: <20191206132849.29406-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp; 
x-originating-ip: [209.137.146.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2e955cc-1b86-40f6-664b-08d77a90cbaf
x-ms-traffictypediagnostic: TY2PR01MB2697:
x-microsoft-antispam-prvs: <TY2PR01MB2697BB165FCB2EB7ABBE3003925F0@TY2PR01MB2697.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:132;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(13464003)(74316002)(4744005)(186003)(66556008)(316002)(81156014)(81166006)(66946007)(26005)(305945005)(86362001)(478600001)(64756008)(8936002)(229853002)(4326008)(6506007)(8676002)(102836004)(9686003)(66446008)(71190400001)(33656002)(52536014)(5660300002)(66476007)(110136005)(7696005)(55016002)(76176011)(54906003)(71200400001)(99286004)(2906002)(76116006)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:TY2PR01MB2697;H:TY2PR01MB3243.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: toshiba.co.jp does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75DMn3KxagcbkvsACpM6j1bE1Mz67AHn3su4KKWTkCeOJDibzBN20362ZPk+3Lw4q10SVjJjK6+E1NL/V98dQHeilXJW26VYU0SIbWQ98wkJi7s5GuhXrKoITu89qsDKpw9Q4mwPoELOGm+ShyhxK+vQt5B/i57MgCDWV9WSaGhzlJMEeHrrUbgjSdp9E3Ap2LzfcaDU+qh1ro6AA1YjEt5bA5u9ZGyL4FIxVbX1hJzveoLvBnyxszvHLmilHY/zpWxtEMkNouwTly6/SyQ8R2V/nBjLsM7Uy+dIwFusETlrcBWkIzMKxYKFauxyU9gEvZ8IoSu2IWsuFlHOvVOSxHX1d4UyjodCStD2Y3ypCQBws1NKKlzWRpXiAGq1GYFkS+d5jW6TpVLaLxYkhk9+aXyHtK8EP6iHCJH7fh35NMg+8R2stGlVsHcxzLXJWxj4DTcwds7jE9J7wPcbJTPpb0TrnPznoWAmb5h0BwUh54CayIXp5birPhtRc9AReXD2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e955cc-1b86-40f6-664b-08d77a90cbaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 21:11:00.6903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5beyrhFij82jmoP0Zr/4C044bT2VWecka5AexYnmdBLfZc4b2STor+9l0IuS8PN59DDub5oUCJnO3ICiEnIA2RD/+FO/oE4hxxZmtRDpAlEfWhDGFYqP8DZYgbG9F92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2697
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi,

> -----Original Message-----
> From: Geert Uytterhoeven [mailto:geert+renesas@glider.be]
> Sent: Friday, December 6, 2019 10:29 PM
> To: Alan Stern <stern@rowland.harvard.edu>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>
> Cc: iwamatsu nobuhiro(岩松 信洋 ○ＳＷＣ□ＯＳＴ)
> <nobuhiro1.iwamatsu@toshiba.co.jp>; linux-usb@vger.kernel.org;
> linux-sh@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] usb: host: ehci-sh: Remove unused platform data support
> 
> ehci_sh_platdata was never used, remove it. It can be resurrected from
> git history when needed.
> 
> This basically reverts commit 3e0c70d050c7ed6d ("usb: ehci-sh: Add PHY
> init function with platform data").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Best regards,
  Nobuhiro
