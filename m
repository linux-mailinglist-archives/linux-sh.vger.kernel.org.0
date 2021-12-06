Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0771746A4A0
	for <lists+linux-sh@lfdr.de>; Mon,  6 Dec 2021 19:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhLFSdw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 6 Dec 2021 13:33:52 -0500
Received: from mail-bn7nam10hn2212.outbound.protection.outlook.com ([52.100.155.212]:46816
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230448AbhLFSdv (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 6 Dec 2021 13:33:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6HdQD+xLsL6In+PLYnu9vHogGbWzKIzNW1iXmjbHKJyh4BA1oGE6pDN6F/HWk446Y9473sbmo436NN4oA2Ex7hI4FL+righMA/FjOqJAcH7mHQelk/hEYpmnmARCjDxF7SgSgK5zmaQnZ0Qn5DFfhr/lbCoxBGSr6Iwj0uV57ABYYMlrCDWxb02eagQHANEFb4r3q+Axs/Symc+DV7YJAHlOiZ05OlbYCcZen6EH5S1lr4ZX0YkFi3A5fRTY9PVRtmLg/SH9uAcBdYojvZBUfHw2gYtrUOPbuN6m9rZbLORKjK3beCOXx3Py4+w9n0vwjHOzzqKy/jJ0XXjeVaCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=RGOEWXO9ivx3ToncSS9Qr2Dy6c8uza/+vmy5P7wgHRNstt+ozReQ9hEkyixMO+g2/dBP6j/Tyj8ecWmyNELN01KO1ZOGQ26xLzh7oL+FwNZRrlyJNB1BV11eR3JADfoDkKV6VOWfq/B9Lp76aiztidRyWF4wsPM5BVFNTgxA+IeAhRYNyxZHPKxGHzAVw/hXc4QcrcTFGtc3hvBi+fQYAZHEAiuz90OTiYa8ohYx9FlslEiOhXO/Rh51/L6SZg05gn4UusosAhJ5gRT5lxx+jPZNQty0OR1imzaodiAyEdkxzDPru+KZixbyn8hJybxoUS5Et9ON1X3PVdp2+PMMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=seondindentdistanceintwo.com
 smtp.mailfrom=msn.com; dmarc=fail (p=none sp=quarantine pct=100) action=none
 header.from=msn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=pL46eYXE131Ozm/RrK10u4dVD2gelIGnwjolpD85xfnGN+HbBkcnCwPcIjhH5pYvoQB1TqAjVIZKEo8GPJw2RnUdfCCFVC5bhtLjcf/ERbarh+awiChrOfhVhHsq91f2gkPhidw7j6BHiZHQQHSIthNS+OnejUDlpWx7meQfFZ4=
Received: from MWHPR14CA0071.namprd14.prod.outlook.com (2603:10b6:300:81::33)
 by DM8P220MB0655.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:37::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 18:30:11 +0000
Received: from MW2NAM04FT066.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::a5) by MWHPR14CA0071.outlook.office365.com
 (2603:10b6:300:81::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 MW2NAM04FT066.mail.protection.outlook.com (10.13.30.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:30:11 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id B941C95192;
        Mon,  6 Dec 2021 13:29:32 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:28:50 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <df063431-6328-4042-8c46-f218176f2fc2@MW2NAM04FT066.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4811ab-ca23-4f25-2e11-08d9b8e6703f
X-MS-TrafficTypeDiagnostic: DM8P220MB0655:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB06550576681CBD9945389560EB6D9@DM8P220MB0655.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(508600001)(86362001)(82310400004)(3480700007)(356005)(2860700004)(7366002)(7416002)(6200100001)(7406005)(6666004)(47076005)(2906002)(8936002)(5660300002)(316002)(336012)(26005)(70206006)(35950700001)(6862004)(82202003)(40460700001)(31686004)(8676002)(7116003)(83380400001)(9686003)(31696002)(956004)(786003)(70586007)(7596003)(6266002)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUMxSE5idUlnTHQyLysrN01LMEtLUG1YemdHR3FodFl3Zk9wZ1JxTzVuWlpO?=
 =?utf-8?B?YzkxN2VCSVl6OFl2QmUwUE9XSzR3Rk02TUdVZUFWNk9NMHZmYVRtbHhUK1hk?=
 =?utf-8?B?dFgyR01FMXlNZEhpSmU2UHBzV2Y2ckkxeGRoaXRtOGdxcXdaekJxN1ZMWCtu?=
 =?utf-8?B?bEpOMGlNVlJlRVd6Y1liSVN5M0FBaWhhM2RuMEdoUXRLWVk2eW1Kb0kyWmxq?=
 =?utf-8?B?YWo4blBVeko2WTUrQnJyMEdkUXI3UGdzWmtIZXBlZGRxZ1VYbzJ3WHhHMFNa?=
 =?utf-8?B?MERoeWhqUFBVWFRSQnYrcFNmRWU1OEk2RXZZakVDUjlrY0NVeHNJQlJzemVK?=
 =?utf-8?B?RUhFZmVNT2dxTnIvVlMzWEJUNjlqK2ZhOU1yR0QrRGtvVVlvQjdiK2NxQkdv?=
 =?utf-8?B?VHBiTHpLWXNYbW9OMVRiUXU3anJRYUViUC84K1loMjJRMkRCZzBWSnZwNnUy?=
 =?utf-8?B?V3h1bWdYWUl2UER1ZnRDT25UNzNNS20wRHhESlkwdHlsQnlhd0JMV0ZXcWUr?=
 =?utf-8?B?aUpqUTZQRFhYMEs0blQyNDNvZm52QkNYN2YrTE14SjlMVFdpWnhRL1JZMHhJ?=
 =?utf-8?B?bzFhQm5kZzJRSmMzTzNGMU9DUCs4MFEzTjdpTm10Q3paekZuZWxwdGcyNXB6?=
 =?utf-8?B?eHFJak1PcHcwOURMeU1tY0daaHljVEdWU01VQWkyY1dqSGdKbjBCNDNHTURh?=
 =?utf-8?B?NlhpQnVQY01LMExaQUE2ZmFLNlF6V0VBVk0reXVpanA4MWg2bDRuaXRLd0hI?=
 =?utf-8?B?ZXBlb244Y3g5NHI4K3hKeFZFcXFITVZFYmhET1BXQndZL1BpeGtxUTFwV2Zj?=
 =?utf-8?B?blRaeTNIenBZTCs0bWtsNUJSNFJMNUIyRFkwSFM1L3p4ZjFuZlkrL1B1dlpx?=
 =?utf-8?B?OTNaeGVCeEZpRThaUVRxZnJ6VURlVVZySklmR1FhcXZPY0NjQUtpNVp3cGRI?=
 =?utf-8?B?SlV1ZjVxaWpXYjQ1alA1NWY4dkYwM1ViMkczQ082cEFXQ01oR2ptcXRKMFJI?=
 =?utf-8?B?NnN0c0FMbzBiRU16WkVSWXVQYnJpOGpBN0FTY0hJN2hJYnpkMWloVjVKbkRt?=
 =?utf-8?B?a0tnL3QxQitXNC9RRFZiWTBiTEZ3YTB0TWJweHNDbzFFYTlnWmRTczJyUUVQ?=
 =?utf-8?B?VkhoamlZdlJ1UFZ3YzViM0RyMjdneDRhTW4vOS9Cd250U2tOZ2dXeVNDaTU2?=
 =?utf-8?B?YlNmUW9yTDNDbWZJQzBkdVJtbTdwSUxxbGVoNlltS2N0TTVLSzI0Zk1sTW9z?=
 =?utf-8?B?OVpWSnMvang4RkJBMm9ITkFIR24vcEx2bmQ4NzVIUW9UZzErbFhaaXNJZ0Rs?=
 =?utf-8?B?L3RpOXZ0djhCMWttZW5aSXU1ZThmTk94WVUwM0Fvd2FZcWtFQ25OL3NMTHpw?=
 =?utf-8?B?aC9mRmoxWmtwZ3VkYzd2cG5qanQ4Q2plYWxKSTVFUnlZeHZvdUlPZ0ZzajVx?=
 =?utf-8?Q?3ESwSosz?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:30:11.2897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4811ab-ca23-4f25-2e11-08d9b8e6703f
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM04FT066.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0655
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
