Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC21021961A
	for <lists+linux-sh@lfdr.de>; Thu,  9 Jul 2020 04:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgGICRG (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 8 Jul 2020 22:17:06 -0400
Received: from mail-eopbgr10079.outbound.protection.outlook.com ([40.107.1.79]:24544
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726220AbgGICRB (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Wed, 8 Jul 2020 22:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3z0o5HN+IIoAk0djy3VxHoenZ0FrHYaT54DEDj/7E=;
 b=i2rFVd9QZs4wigb053W3exLcET2W2RuTXeTUqewBkPQWfBQ9B/8RSDgL82uJGdeof7cR2wrU2NhvwjrbHrYcTr2b1WkUwrzXTAXZoibJnE0bDRkzR1+VnWuR4/CXw3spHU8TotR7Fy/A4CZvkmFBYr+d7M/KfgkvoL8Bfuie91s=
Received: from DB3PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:8::28) by
 VI1PR08MB5485.eurprd08.prod.outlook.com (2603:10a6:803:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 02:16:55 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::4d) by DB3PR08CA0015.outlook.office365.com
 (2603:10a6:8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 02:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 02:16:54 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Thu, 09 Jul 2020 02:16:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from c9eae8d35e1d.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id ECD44EE0-ECBD-4C4F-AF1F-E12BE8BC6F0D.1;
        Thu, 09 Jul 2020 02:16:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9eae8d35e1d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jul 2020 02:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtKJ8Kp084qrFjGFu821/8j71EwVES/MHxKsvb26LbeOtdyJXN0n4sHe/1k2UC+r6je1xcC01b0EKOqsAFsBbfKaCsMy1tIS3Xwe4Dua4rW7s6o62CAoiiERhjYT1D1r9DFuL6zFYsbk5pP2apCUjU+tIbVAZUxYrpQD6g811CO36r0tPnwdFx3bgCLALwBVn2LNNXCNNIBQoYh348N0Lb57SBlj+P/a0g21csy7G6Ho6d0MjY4DeKEG4elPVYzOhpssNUKoNNgvP/AfZlW20OQkMFAlUU7hooTqMayY/9VeLNVRnIM+mZfGG97V/zYkU8y2NPwncHLe00VMjCousg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3z0o5HN+IIoAk0djy3VxHoenZ0FrHYaT54DEDj/7E=;
 b=XJYsolBcg7G6cH3VeK3HZFIqTAioRgpPoV+rOAMj67fzxP5YkB15hMYcEknGo+RUJFB98e250mO0aRa/CDBO1EeRU9UDNURtW+7joojIMDizp6zojZg+zI6a0TBtCZp2y0fhnQezi0tAM7grPS1jtT/V/CG/1Hn1j/a1P5fFpvAlhWEcPWa54lSzHmSLUEYaCGMuLII4SOdtjWYFqHvUHuzFrxR8cDtrgy3ajiseKkxfVzycIKmO/en4ZHVfKy/M2R/tvAUJ0aspjZdRSXt9lvsTpgNaMF1huUbHxh9po9SFqFqmERJg9PdkrRN4PLMUaG9eQrLIFYk5FZr8fZ3RAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3z0o5HN+IIoAk0djy3VxHoenZ0FrHYaT54DEDj/7E=;
 b=i2rFVd9QZs4wigb053W3exLcET2W2RuTXeTUqewBkPQWfBQ9B/8RSDgL82uJGdeof7cR2wrU2NhvwjrbHrYcTr2b1WkUwrzXTAXZoibJnE0bDRkzR1+VnWuR4/CXw3spHU8TotR7Fy/A4CZvkmFBYr+d7M/KfgkvoL8Bfuie91s=
Received: from AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 by AM6PR08MB4597.eurprd08.prod.outlook.com (2603:10a6:20b:90::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Thu, 9 Jul
 2020 02:16:47 +0000
Received: from AM6PR08MB4069.eurprd08.prod.outlook.com
 ([fe80::8c97:9695:2f8d:3ae0]) by AM6PR08MB4069.eurprd08.prod.outlook.com
 ([fe80::8c97:9695:2f8d:3ae0%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 02:16:47 +0000
From:   Justin He <Justin.He@arm.com>
To:     Matthew Wilcox <willy@infradead.org>
CC:     Catalin Marinas <Catalin.Marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        David Hildenbrand <david@redhat.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kaly Xin <Kaly.Xin@arm.com>
Subject: RE: [PATCH v3 4/6] mm: don't export memory_add_physaddr_to_nid in
 arch specific directory
Thread-Topic: [PATCH v3 4/6] mm: don't export memory_add_physaddr_to_nid in
 arch specific directory
Thread-Index: AQHWVZW4cB9QLv1x3USSUrS3ZjVOOaj+gToAgAABV0A=
Date:   Thu, 9 Jul 2020 02:16:47 +0000
Message-ID: <AM6PR08MB4069381981B2FFB9ADCD0BECF7640@AM6PR08MB4069.eurprd08.prod.outlook.com>
References: <20200709020629.91671-1-justin.he@arm.com>
 <20200709020629.91671-5-justin.he@arm.com>
 <20200709021104.GZ25523@casper.infradead.org>
In-Reply-To: <20200709021104.GZ25523@casper.infradead.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: d0108a5e-62be-403f-ab00-489751fdfa3d.1
x-checkrecipientchecked: true
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebc3caf4-1ce9-4961-87ab-08d823ae267f
x-ms-traffictypediagnostic: AM6PR08MB4597:|VI1PR08MB5485:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB54856FDEE81652A37F1765B5F7640@VI1PR08MB5485.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:217;OLM:217;
x-forefront-prvs: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EWkZh3PjjAoyNxWh9+Q4F/9Zg+3zXiK8c1S6Di11hZqsCx57LEMKZe55DwfBaHzc4V7rXzS8BQmYxZ75djQLHpdvMcYJybxrHFV+xGNmMCr6gWfUy1fNtWmU+yVjV9clU7Rv8nXsT3wdG06w1JzePTiSemZy841py51UCOETIbHsSQ3O3MCoedBkaJPG0XOi9Sa6u8EXU8M23SR4Tz0qsVcVcpDaEdwBOliCC+i2CmwWNAqxJsnl09pMlkWvXgXVSFjtCMNBZbR9BfAViYgT4a5xKCbzVUVnqgEMtuhFMJM1UTjpPKY5NxBlxSfmhm/Iwu5+1bcjQEPsOfUpMyE7bQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4069.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(8936002)(83380400001)(86362001)(478600001)(7696005)(54906003)(8676002)(6506007)(186003)(53546011)(316002)(26005)(7406005)(7416002)(66946007)(66476007)(76116006)(71200400001)(66446008)(66556008)(64756008)(6916009)(5660300002)(52536014)(2906002)(33656002)(9686003)(4326008)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZouAEKll6ZdcMSkoSxhSf4wFMNgrnSmu7rzk7Fmxq3Bm5Vx0HE6Srx3HFzN9sdbM2tpaaF3uJlII38h/bqqFHce3ZsmhBPWhtE9g2YF+F8GBgDkgx9o5CJjxHY/dS/Fra/J9oXQunoO5a2iu/qGCCttnh4bvdyuuI2J3utTM5sPMJybmTt5URhJAFllsva21w0QGcnnVdw6B5BG56xwv6OE0/xZyOSDZi2Xt4RPdoHbfSWUv1K+W9WBSseVUCp3joLSC5CcP12NyjVOm07yHqi81mdTmH0YtOaW0AUIir2zfHDBn4i3O37UrcEPn+e6TsUh9SJfxBq9tevr9QyGJHTffkxlthUoX0zAS85eConLyE0C1MI7dZ/1f/39xRSlo79PUn03IhrdYr0Iyr21ukZtj6Hkjf1oN7zuuvrDvO4S9sCC0a/TmNLPrlCuy3krapgqGzJUjIP2Q4n3t6kCQQo7dYPiNowDNVxTW6zIr1XQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4597
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(52536014)(4326008)(8936002)(26005)(53546011)(6506007)(8676002)(33656002)(83380400001)(7696005)(478600001)(86362001)(6862004)(5660300002)(70206006)(47076004)(450100002)(82310400002)(316002)(336012)(54906003)(55016002)(70586007)(2906002)(186003)(81166007)(82740400003)(9686003)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4b954acb-116e-4401-f972-08d823ae222e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HGo5qiNzq2thTwHJa5ugeJIlafy+AnPFTn6bVheNJL1kMIjNyCa1cbj2FArPPfWGXs7moCa16Zf8ZGdNSCDx/caNQLwMrJhckYLhuVtu4rv4HVBkkmOPm3FEEQqFTBaxeQBXeAYFJmlR5YCwUnBToznspVZ0bxvcTz12xtF9LlrEyBgQyRCBoJBrGpQCQzHaS+awb/HNMIJfc0CMdQcBRRuw9IGmykwbzpY2RH50IjlXT9Q891x9hTG/XT47UAejc5/rPRao776uSd/ah3AY7ZthsLScanW62a5Son5A4JJY2Xktg+I2KYmSjrAjXalsIkVOBMkxk+PbaGc+JLo5inM2jJD7fwWL5lhtMY1410dOj0ghdJHOMupgTJFxCHeCoIW64ZfGPG+IQqSwBP/uw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 02:16:54.9979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc3caf4-1ce9-4961-87ab-08d823ae267f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5485
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Matthew

> -----Original Message-----
> From: Matthew Wilcox <willy@infradead.org>
> Sent: Thursday, July 9, 2020 10:11 AM
> To: Justin He <Justin.He@arm.com>
> Cc: Catalin Marinas <Catalin.Marinas@arm.com>; Will Deacon
> <will@kernel.org>; Tony Luck <tony.luck@intel.com>; Fenghua Yu
> <fenghua.yu@intel.com>; Yoshinori Sato <ysato@users.sourceforge.jp>; Rich
> Felker <dalias@libc.org>; Dave Hansen <dave.hansen@linux.intel.com>; Andy
> Lutomirski <luto@kernel.org>; Peter Zijlstra <peterz@infradead.org>;
> Thomas Gleixner <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>;
> Borislav Petkov <bp@alien8.de>; David Hildenbrand <david@redhat.com>;
> x86@kernel.org; H. Peter Anvin <hpa@zytor.com>; Dan Williams
> <dan.j.williams@intel.com>; Vishal Verma <vishal.l.verma@intel.com>; Dave
> Jiang <dave.jiang@intel.com>; Andrew Morton <akpm@linux-foundation.org>;
> Baoquan He <bhe@redhat.com>; Chuhong Yuan <hslester96@gmail.com>; Mike
> Rapoport <rppt@linux.ibm.com>; Logan Gunthorpe <logang@deltatee.com>;
> Masahiro Yamada <masahiroy@kernel.org>; Michal Hocko <mhocko@suse.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux=
-
> ia64@vger.kernel.org; linux-sh@vger.kernel.org; linux-nvdimm@lists.01.org=
;
> linux-mm@kvack.org; Jonathan Cameron <Jonathan.Cameron@huawei.com>; Kaly
> Xin <Kaly.Xin@arm.com>
> Subject: Re: [PATCH v3 4/6] mm: don't export memory_add_physaddr_to_nid i=
n
> arch specific directory
>=20
> On Thu, Jul 09, 2020 at 10:06:27AM +0800, Jia He wrote:
> > After a general version of __weak memory_add_physaddr_to_nid implemente=
d
> > and exported , it is no use exporting twice in arch directory even if
> > e,g, ia64/x86 have their specific version.
> >
> > This is to suppress the modpost warning:
> > WARNING: modpost: vmlinux: 'memory_add_physaddr_to_nid' exported twice.
> > Previous export was in vmlinux
>=20
> It's bad form to introduce a warning and then send a follow-up patch to
> fix the warning.  Just fold this patch into patch 1/6.
Thanks, will do

Cheers,
Justin He
