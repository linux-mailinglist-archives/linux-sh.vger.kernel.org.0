Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C7E55D750
	for <lists+linux-sh@lfdr.de>; Tue, 28 Jun 2022 15:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbiF0Fui (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 27 Jun 2022 01:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiF0Fu3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 27 Jun 2022 01:50:29 -0400
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120078.outbound.protection.outlook.com [40.107.12.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D857526FA;
        Sun, 26 Jun 2022 22:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKp6xDeKeJvKIjjI7/YdbTQabi9ROKvaFJr6AJoV9xs/SFbFBHEuBEz9T4GJ5Dovw7h2LH/soWYqeT1aP50n8HWwwfSIF5tyVL4eV01Bx8c4X/XJEIpEqa8JegntYll9n4zr3G1owqgUt+62V+1TpGND0jp+Y8a38bZN6aYms6tdhmXxSPiDEOXLhZFMiBSwnuVFElm3BtVfgM3wDggFov/AJwtVtOCG2OzllaXBccUeAw7e6RvLyHKMmdObp4Nojf7W8LVAl2lUowQ1ChRLZfS2INoCPAtRQo9SAVprB/L5M+7+6dtCB3xvqCNIHmt6MQAgKzhUQPz/qNYDvLBF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTTS/UApiUKkaYKz7O9cWsnEiYIgomhlz8XYaTrQwKY=;
 b=odf2gLYRvyTZ0cM3EhcoMBdRmyeYdl/sHz9UhAhaoRa9ChYjMhiF/hHfq8aNQj/n7lK2naSjCOODpxUnFnq6Kz/NHCeJR3SXGuhhpViQ3J/Koc+bLy0HeHOFTVtBQ94DKwLUMOvKg8Sb1SgNk4gtufWueiRYMJBNwl9LklE/y5B9nGsEenx48JP+ZS42XDX1B0CQd25Wp8tlKdCAX3KEztQqaaR78KIa4/CzG67wHoiqR1ouSEOSk5rQmoODlmis3MiOYCsrYXdAkRW7XBIJOyUmdZ6Jl5TSmx5jgH93t2Ik062UJ9krh7clrKuuxb9Q6LRtdj7AqjlwptzFliGCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTTS/UApiUKkaYKz7O9cWsnEiYIgomhlz8XYaTrQwKY=;
 b=aTvnoEPZM6U7gmsvvwdkM0a/bpw30JBsUQzvY7ssPHGVwO2L5ZpCCJ1brKxIOhkuNKtjUPSNf2Nnyb9cFlfNyUpXGu6n92yx0L4dbcSm8fUC1AduPIY1/erHhu/gkHvJafNoXmJTDrOGSDSKR4u8HnsWr3l0Az9bcDZszLI8p1ZxzpxT7vnnEip8ddwSL9D8CKgQPKmHz4Zbk2g1J3yIt0MBJPA5Q9vKNKbCEQoumRf/vVRM3leVASLArr0hCL9WU9WgGzGt+4xTZCe6Thux1lL9RQ1L9uEfu1HXlJeo6j/LcbPFwYH24YQF5y5nvuTebiZBxoqvv2KkiD9+ywOPPw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:50:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:50:10 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
CC:     "hch@infradead.org" <hch@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V5 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V5 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYieMYTPRWmwKicUOH/bvn5TGYBK1iv78A
Date:   Mon, 27 Jun 2022 05:50:10 +0000
Message-ID: <a88b8109-9b9a-fb97-c2df-25980c2e4d7a@csgroup.eu>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-27-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-27-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81a85608-4339-43fb-5f5b-08da5800e5f3
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NDh+jR21OOBaExARtzP0ycydsMpqL7KBCA8cCgzQOLd8HHbVP3SBJd49N9Wo4szHg2auF47awq8Z+1efBQoiFzTmt+2WrTm1xrNYEYRBTTsL4godeVVwIof4HP7v6+4Nou5RsYR25Wv9uSLift/VXqi6dhpD2+8XDS99IjMsIyYQ2sGvOLwSE3qmhobxnBPPSsTFsnQdoZTikNgfezCfYSA1JxU1DX4ofDbRPTsaCYCXEBfSqzFbcifOPVkNPPKt0bboH7LEf4jmFTQkk80Uk/c/SKhSMl8KFB8jMm4OnHVkQaxiGfPSvdABX/Nfaj1MCc5tazVuotcwzSb87n1TMStXzKUNT34p2E3mtVxdbVbPxaqf5fyiFPNEBynaJjFAidUm1LWfI5fLjlb/v2ajN0pDvjNu0Ki+z347scz7ov3zCcMBvI01AOq8Bnm8+692MuaJ9C4nj/N8VFVU3PZt0cLXDEb2zDfE+IsxipHisa2rE9QqnellKZPx+U+0vBMmbvuy2gBB8/qlFab4H9mtBqEOkI3qjzMQwwyLpSQ8fOeuGR0IjyYwUX2Ivb9sZPS26aJA/LSpVagjeh9iajHBNMzX0cOyjRAe2drXWhuNf6OrQD73hBH6rRA9u1kVK7dsL64h6akiW81itgcK6P+HwLCqA+cQOfS33Z7UiQX4QauavdQ83Pc5kWy1WS9qpiCmgofgQ9sBKSy5PQ669ZzxhkbqGFYcqRGIXVozCspzdvuA1oN0OjT4+CoOUOOlXX0vakBzt98lx+Ddn8A+nqjp2wai3UX/+FvrIRPaPQHPpxL2fWav05ziywmSmrKHhigDNZg+/wj9rk3SJMkIay7hl8VeGY/ReXPCXVxFlWdc7sY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(8676002)(44832011)(4326008)(91956017)(83380400001)(6512007)(2616005)(5660300002)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(6486002)(8936002)(478600001)(26005)(71200400001)(30864003)(66574015)(7416002)(36756003)(122000001)(186003)(2906002)(110136005)(6506007)(54906003)(38100700002)(41300700001)(86362001)(316002)(38070700005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzAyK1poa24wVmtNS3A1TisvNm9xeE1odjdzSlErM3l4d21WcFI4Nk40cnow?=
 =?utf-8?B?N1J5OTRoTTFhN2dKNHljazFBKzlTeDdPR3FTWXZxR1VpcGxtK29PWXZaS1hO?=
 =?utf-8?B?b2dkWHlqV1AzVS93dHluQlJSaTV4SHVudnI3ajk3N3U3cVF5Ly93NTJ3UjVa?=
 =?utf-8?B?c1pGdklldldsVDZvNU9RYzY5cWNjS01UeWVnQjQ3TmV0Q1VtaUVXdTh3OEk2?=
 =?utf-8?B?VngyTXM0UmtMVVRrVk5YaUhhUGhySVJNa0F0akE4K21ESEpzZGl6T2ZMS0N5?=
 =?utf-8?B?bTFZNnF6MGFWU3BwMzVyUnI0QmVCOUQzc2xNZWIvRjVmbzljeE9XalFNdnBk?=
 =?utf-8?B?OW1za0Z4cmVUVDBIbUtlSEM0OTFlTDBqMDR6Y0ZSNS9pcUR1WVZOUTlIQlRD?=
 =?utf-8?B?R0VtMGtpZjhSbXYrSVVRWWdOOGhBYnZqei8xbmFsalE5WDZaZFRsV1BsZnln?=
 =?utf-8?B?d04wbkZLQU4xYmcwVWF0Wm5Remg5aUxmaEJEOWVqZjRYRkRJVzJ0QWhIc2kz?=
 =?utf-8?B?VHczS09sbmh5Y2NYWXNoSUVkYUZzdmxuektReDdHTUNMazFvMGM5bE1vbG03?=
 =?utf-8?B?TG5xNUtMRnI2M0ljYWh4bkgrakQ3Vk9pREMzcnFHSlM0eVFlYm1yLzdWdEcy?=
 =?utf-8?B?WVZtUksybzAydmFhMGRKbWx6YTNPRlhZaXF5RE9ZL1cvSWxyUEtWUW5PSXhH?=
 =?utf-8?B?S0tscTE5eTFPVUpQMTlIMnpNd0RRZUdweGdNMU9UTWFKZlpGT3hWYWU0Q3Fr?=
 =?utf-8?B?c2RxeWtkbDViOC9UOGdFRVcxdUdPU3djaWNLWTlMZ3VOTGJUUnhKaW1jV0Jt?=
 =?utf-8?B?WWtLSmdxenB4SGVHOEJRQWZiQ25CN0hmRUsyK1duc3UxNFVHdWc2VkxKekFu?=
 =?utf-8?B?R1BFVzgrWXRRNjRpTXhJNlkxSjF4VU4rV1VEV3IzYUVqZzh3ZjEvV3dPWFRD?=
 =?utf-8?B?Q005aVdrZ2hOZ3FlRTlMY04wUXVZSDFtUkFPR1hmNjJOTi9ZeXdCd1VEZlJO?=
 =?utf-8?B?ZThLbWQyeWhraW5xbEROcWZ0Y0pGQUI4Z01iT2EwOXNNU3JQRndrNlFZS2xw?=
 =?utf-8?B?RVJHcm0vSE5TaDVZT3pUTHVzR2VJbWJ1cld6WnY4TDhYTFFMSGUxU244MFVW?=
 =?utf-8?B?N1pIT3JCRFJnZ0kyZ0ZNNFBMMVZ3RjIvVzlMUDYrSU9UUU0wZDk3dWpLVXdl?=
 =?utf-8?B?WUk4V3lkWmVqOWFUZFQ5a01jUmJCcGlRMnc0U3Rwc1NwZmJFNG90QzdJM1Bq?=
 =?utf-8?B?ZHFybElDbENtZFFCQjJrRkUzWXcxZEdtbzVqcUt1Z1MyekJZZUl2TW8rVlVu?=
 =?utf-8?B?M3NOejVBSkRHNnJZSnBaajZGQ2FFUzl2VXJDQUx1cFk0c21jcHZDelE5VjV3?=
 =?utf-8?B?Mk5CR0VKZkFXSnNxTjFTcjJaeVlOZ1RiUGlWMm1XMFRLNG8zUXNXdnU2dTBT?=
 =?utf-8?B?MnRaWXhqRkpqREFPUGNhQVBPU1MzeUl2ODBmKzJxK2NRemRIV3ZOOUZ1cU1N?=
 =?utf-8?B?YkJyaHlJSkdDMGJDZHJYVG1Bb0syNmFEVnRUVkNQcXM2THNzSjdhekhnMDh6?=
 =?utf-8?B?STZ6SHB5M2JJVC9JN3B2eGxoRTMyYTZQcXBlTjZacVFqY1JmMGhkUTVhdDF0?=
 =?utf-8?B?aVFTcTNFYjJmVzBMZHVNa0RWcTFFdFROQjhUUi9YODRGVUwzazNSMkNzK0pE?=
 =?utf-8?B?c0pIUmg4bWRsdGFiRFpOWGpwOHBuNEFWTFhMcG1WZ2dDTlpFNy9rOThuV0lx?=
 =?utf-8?B?YVZpQTFmY2pHeEVVWjZTUHVJbEsweFMxdVY0QktTcUxNNWRrYzRkaytqdHZm?=
 =?utf-8?B?N0NEQTVpdmNCVXFzbi9zcWdURE81Qmw3c2MrT2RFb25PQ2oybkhRSVVPVy9o?=
 =?utf-8?B?Mkl1YTYxT1FRYXRGTlJyTllQc2l0OWg0a3FROHNnazh0b3lsYk40REVWM0Fs?=
 =?utf-8?B?dyt6T2p1ZTBKT0RrcWM1VGo4N3R3S3hYRzZoMUV1RVFyUjZDUTZpYm1nTVQz?=
 =?utf-8?B?VWozNkRXY2ZGcjJINm9uWkpyM21PVE55N1VqRTFLRzlveG5PN0VVU2ZtUnpP?=
 =?utf-8?B?anhPMjYyemMzekdQRzBQL244Ky9FWlJ5Z2hvNlZwOUtjNDRYTFd2WnMweHFC?=
 =?utf-8?B?S3hIbzhzUDBkOFhmNmhNejBVQmhBT1ZQc1VIbXh0WUJOYkpuVzdTRkVveFkx?=
 =?utf-8?Q?rLM/dw5rCQ2heiaqqpPyTuw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <193CE5E0ADEA1341AFFF23D261BD18B9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a85608-4339-43fb-5f5b-08da5800e5f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:50:10.7053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3lYlI1yjoBV+QgQgkJwNKne8ma/BWkXv2jDSSe9/TGteOallgGyjK3GPUvViYWI6vB2nWGoJD+YrGn4MvYl6hvcxpj8jPPyUy0BptzfpKmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

DQoNCkxlIDI3LzA2LzIwMjIgw6AgMDY6NTgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IE5vdyBhbGwgdGhlIHBsYXRmb3JtcyBlbmFibGUgQVJDSF9IQVNfR0VUX1BBR0VfUFJPVC4g
VGhleSBkZWZpbmUgYW5kIGV4cG9ydA0KPiBvd24gdm1fZ2V0X3BhZ2VfcHJvdCgpIHdoZXRoZXIg
Y3VzdG9tIG9yIHN0YW5kYXJkIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVC4NCj4gSGVuY2UgdGhl
cmUgaXMgbm8gbmVlZCBmb3IgZGVmYXVsdCBnZW5lcmljIGZhbGxiYWNrIGZvciB2bV9nZXRfcGFn
ZV9wcm90KCkuDQo+IEp1c3QgZHJvcCB0aGlzIGZhbGxiYWNrIGFuZCBhbHNvIEFSQ0hfSEFTX0dF
VF9QQUdFX1BST1QgbWVjaGFuaXNtLg0KPiANCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcNCj4gQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVt
YW4ua2hhbmR1YWxAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL2FscGhhL0tjb25m
aWcgICAgICB8ICAxIC0NCj4gICBhcmNoL2FyYy9LY29uZmlnICAgICAgICB8ICAxIC0NCj4gICBh
cmNoL2FybS9LY29uZmlnICAgICAgICB8ICAxIC0NCj4gICBhcmNoL2FybTY0L0tjb25maWcgICAg
ICB8ICAxIC0NCj4gICBhcmNoL2Nza3kvS2NvbmZpZyAgICAgICB8ICAxIC0NCj4gICBhcmNoL2hl
eGFnb24vS2NvbmZpZyAgICB8ICAxIC0NCj4gICBhcmNoL2lhNjQvS2NvbmZpZyAgICAgICB8ICAx
IC0NCj4gICBhcmNoL2xvb25nYXJjaC9LY29uZmlnICB8ICAxIC0NCj4gICBhcmNoL202OGsvS2Nv
bmZpZyAgICAgICB8ICAxIC0NCj4gICBhcmNoL21pY3JvYmxhemUvS2NvbmZpZyB8ICAxIC0NCj4g
ICBhcmNoL21pcHMvS2NvbmZpZyAgICAgICB8ICAxIC0NCj4gICBhcmNoL25pb3MyL0tjb25maWcg
ICAgICB8ICAxIC0NCj4gICBhcmNoL29wZW5yaXNjL0tjb25maWcgICB8ICAxIC0NCj4gICBhcmNo
L3BhcmlzYy9LY29uZmlnICAgICB8ICAxIC0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICB8
ICAxIC0NCj4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICB8ICAxIC0NCj4gICBhcmNoL3MzOTAv
S2NvbmZpZyAgICAgICB8ICAxIC0NCj4gICBhcmNoL3NoL0tjb25maWcgICAgICAgICB8ICAxIC0N
Cj4gICBhcmNoL3NwYXJjL0tjb25maWcgICAgICB8ICAxIC0NCj4gICBhcmNoL3VtL0tjb25maWcg
ICAgICAgICB8ICAxIC0NCj4gICBhcmNoL3g4Ni9LY29uZmlnICAgICAgICB8ICAxIC0NCj4gICBh
cmNoL3h0ZW5zYS9LY29uZmlnICAgICB8ICAxIC0NCj4gICBpbmNsdWRlL2xpbnV4L21tLmggICAg
ICB8ICAzIC0tLQ0KPiAgIG1tL0tjb25maWcgICAgICAgICAgICAgIHwgIDMgLS0tDQo+ICAgbW0v
bW1hcC5jICAgICAgICAgICAgICAgfCAyMiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMjUg
ZmlsZXMgY2hhbmdlZCwgNTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
bHBoYS9LY29uZmlnIGIvYXJjaC9hbHBoYS9LY29uZmlnDQo+IGluZGV4IGRiMWM4YjMyOTQ2MS4u
N2QwZDI2YjViM2Y1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FscGhhL0tjb25maWcNCj4gKysrIGIv
YXJjaC9hbHBoYS9LY29uZmlnDQo+IEBAIC0yLDcgKzIsNiBAQA0KPiAgIGNvbmZpZyBBTFBIQQ0K
PiAgIAlib29sDQo+ICAgCWRlZmF1bHQgeQ0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFH
RV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNIXzMyQklUX1VTVEFUX0ZfVElOT0RFDQo+ICAgCXNlbGVj
dCBBUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVA0KPiAgIAlzZWxlY3QgQVJDSF9NSUdIVF9IQVZF
X1BDX1NFUklPDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FyYy9LY29uZmlnIGIvYXJjaC9hcmMvS2Nv
bmZpZw0KPiBpbmRleCA4YmU1NmE1ZDhhOWIuLjllMzY1MzI1M2VmMiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcmMvS2NvbmZpZw0KPiArKysgYi9hcmNoL2FyYy9LY29uZmlnDQo+IEBAIC0xMyw3ICsx
Myw2IEBAIGNvbmZpZyBBUkMNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NFVFVQX0RNQV9PUFMNCj4g
ICAJc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUNCj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1NZTkNfRE1BX0ZPUl9ERVZJQ0UNCj4gLQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJP
VA0KPiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XIGlmIEFSQ19IQVNfTExTQw0K
PiAgIAlzZWxlY3QgQVJDSF8zMkJJVF9PRkZfVA0KPiAgIAlzZWxlY3QgQlVJTERUSU1FX1RBQkxF
X1NPUlQNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL0tjb25maWcgYi9hcmNoL2FybS9LY29uZmln
DQo+IGluZGV4IGUxNTNiNmQ0ZmM1Yi4uNzYzMGJhOWNiNmNjIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybS9LY29uZmlnDQo+ICsrKyBiL2FyY2gvYXJtL0tjb25maWcNCj4gQEAgLTI0LDcgKzI0LDYg
QEAgY29uZmlnIEFSTQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVSBpZiBT
V0lPVExCIHx8ICFNTVUNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1RFQVJET1dOX0RNQV9PUFMgaWYg
TU1VDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19USUNLX0JST0FEQ0FTVCBpZiBHRU5FUklDX0NMT0NL
RVZFTlRTX0JST0FEQ0FTVA0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+
ICAgCXNlbGVjdCBBUkNIX0hBVkVfQ1VTVE9NX0dQSU9fSA0KPiAgIAlzZWxlY3QgQVJDSF9IQVZF
X05NSV9TQUZFX0NNUFhDSEcgaWYgQ1BVX1Y3IHx8IENQVV9WN00gfHwgQ1BVX1Y2Sw0KPiAgIAlz
ZWxlY3QgQVJDSF9IQVNfR0NPVl9QUk9GSUxFX0FMTA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IGluZGV4IDE2NTJhOTgwMGViZS4uNzAz
MGJmM2Y4ZDZmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L0tjb25maWcNCj4gKysrIGIvYXJj
aC9hcm02NC9LY29uZmlnDQo+IEBAIC00NSw3ICs0NSw2IEBAIGNvbmZpZyBBUk02NA0KPiAgIAlz
ZWxlY3QgQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19URUFS
RE9XTl9ETUFfT1BTIGlmIElPTU1VX1NVUFBPUlQNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1RJQ0tf
QlJPQURDQVNUIGlmIEdFTkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURDQVNUDQo+IC0Jc2VsZWN0IEFS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1pPTkVfRE1BX1NF
VCBpZiBFWFBFUlQNCj4gICAJc2VsZWN0IEFSQ0hfSEFWRV9FTEZfUFJPVA0KPiAgIAlzZWxlY3Qg
QVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEcNCj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9LY29u
ZmlnIGIvYXJjaC9jc2t5L0tjb25maWcNCj4gaW5kZXggNTg4YjhhOWM2OGVkLi4yMWQ3MmIwNzhl
ZWYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvY3NreS9LY29uZmlnDQo+ICsrKyBiL2FyY2gvY3NreS9L
Y29uZmlnDQo+IEBAIC02LDcgKzYsNiBAQCBjb25maWcgQ1NLWQ0KPiAgIAlzZWxlY3QgQVJDSF9I
QVNfR0NPVl9QUk9GSUxFX0FMTA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQ
VQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRQ0KPiAtCXNlbGVjdCBB
UkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNIX1VTRV9CVUlMVElOX0JT
V0FQDQo+ICAgCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUw0KPiAgIAlzZWxlY3QgQVJD
SF9XQU5UX0ZSQU1FX1BPSU5URVJTIGlmICFDUFVfQ0s2MTAgJiYgJChjYy1vcHRpb24sLW1iYWNr
dHJhY2UpDQo+IGRpZmYgLS1naXQgYS9hcmNoL2hleGFnb24vS2NvbmZpZyBiL2FyY2gvaGV4YWdv
bi9LY29uZmlnDQo+IGluZGV4IGJjNGNlZWNkMDU4OC4uNTRlYWRmMjY1MTc4IDEwMDY0NA0KPiAt
LS0gYS9hcmNoL2hleGFnb24vS2NvbmZpZw0KPiArKysgYi9hcmNoL2hleGFnb24vS2NvbmZpZw0K
PiBAQCAtNiw3ICs2LDYgQEAgY29uZmlnIEhFWEFHT04NCj4gICAJZGVmX2Jvb2wgeQ0KPiAgIAlz
ZWxlY3QgQVJDSF8zMkJJVF9PRkZfVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9S
X0RFVklDRQ0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVj
dCBBUkNIX05PX1BSRUVNUFQNCj4gICAJc2VsZWN0IERNQV9HTE9CQUxfUE9PTA0KPiAgIAkjIE90
aGVyIHBlbmRpbmcgcHJvamVjdHMvdG8tZG8gaXRlbXMuDQo+IGRpZmYgLS1naXQgYS9hcmNoL2lh
NjQvS2NvbmZpZyBiL2FyY2gvaWE2NC9LY29uZmlnDQo+IGluZGV4IDA1MTBhNTczNzcxMS4uY2I5
Mzc2OWE5ZjJhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2lhNjQvS2NvbmZpZw0KPiArKysgYi9hcmNo
L2lhNjQvS2NvbmZpZw0KPiBAQCAtMTIsNyArMTIsNiBAQCBjb25maWcgSUE2NA0KPiAgIAlzZWxl
Y3QgQVJDSF9IQVNfRE1BX01BUktfQ0xFQU4NCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NUUk5DUFlf
RlJPTV9VU0VSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19TVFJOTEVOX1VTRVINCj4gLQlzZWxlY3Qg
QVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJDSF9NSUdIVF9IQVZFX1BD
X1BBUlBPUlQNCj4gICAJc2VsZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19TRVJJTw0KPiAgIAlzZWxl
Y3QgQUNQSQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyBiL2FyY2gvbG9v
bmdhcmNoL0tjb25maWcNCj4gaW5kZXggZmQwN2I4ZTc2MGVlLi4xOTIwZDUyNjUzYjQgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcNCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gv
S2NvbmZpZw0KPiBAQCAtOSw3ICs5LDYgQEAgY29uZmlnIExPT05HQVJDSA0KPiAgIAlzZWxlY3Qg
QVJDSF9IQVNfQUNQSV9UQUJMRV9VUEdSQURFCWlmIEFDUEkNCj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1BIWVNfVE9fRE1BDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTA0KPiAtCXNlbGVj
dCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19USUNLX0JS
T0FEQ0FTVCBpZiBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVA0KPiAgIAlzZWxlY3QgQVJD
SF9JTkxJTkVfUkVBRF9MT0NLIGlmICFQUkVFTVBUSU9ODQo+ICAgCXNlbGVjdCBBUkNIX0lOTElO
RV9SRUFEX0xPQ0tfQkggaWYgIVBSRUVNUFRJT04NCj4gZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9L
Y29uZmlnIGIvYXJjaC9tNjhrL0tjb25maWcNCj4gaW5kZXggNDlhYTBjZjEzZTk2Li45MzZjY2U0
MmFlOWEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbTY4ay9LY29uZmlnDQo+ICsrKyBiL2FyY2gvbTY4
ay9LY29uZmlnDQo+IEBAIC03LDcgKzcsNiBAQCBjb25maWcgTTY4Sw0KPiAgIAlzZWxlY3QgQVJD
SF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19ETUFfUFJF
UF9DT0hFUkVOVCBpZiBIQVNfRE1BICYmIE1NVSAmJiAhQ09MREZJUkUNCj4gICAJc2VsZWN0IEFS
Q0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UgaWYgSEFTX0RNQQ0KPiAtCXNlbGVjdCBBUkNIX0hB
U19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENI
RyBpZiBSTVdfSU5TTlMNCj4gICAJc2VsZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUIGlm
IElTQQ0KPiAgIAlzZWxlY3QgQVJDSF9OT19QUkVFTVBUIGlmICFDT0xERklSRQ0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9taWNyb2JsYXplL0tjb25maWcgYi9hcmNoL21pY3JvYmxhemUvS2NvbmZpZw0K
PiBpbmRleCAxNWY5MWJhOGEwYzQuLjhjZjQyOWFkMWM4NCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9t
aWNyb2JsYXplL0tjb25maWcNCj4gKysrIGIvYXJjaC9taWNyb2JsYXplL0tjb25maWcNCj4gQEAg
LTcsNyArNyw2IEBAIGNvbmZpZyBNSUNST0JMQVpFDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19HQ09W
X1BST0ZJTEVfQUxMDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVDQo+ICAg
CXNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFDQo+IC0Jc2VsZWN0IEFSQ0hfSEFT
X1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2VsZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JU
DQo+ICAgCXNlbGVjdCBBUkNIX1dBTlRfSVBDX1BBUlNFX1ZFUlNJT04NCj4gICAJc2VsZWN0IEJV
SUxEVElNRV9UQUJMRV9TT1JUDQo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvS2NvbmZpZyBiL2Fy
Y2gvbWlwcy9LY29uZmlnDQo+IGluZGV4IGQwYjdlYjExZWM4MS4uZGIwOWQ0NWQ1OWVjIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL21pcHMvS2NvbmZpZw0KPiArKysgYi9hcmNoL21pcHMvS2NvbmZpZw0K
PiBAQCAtMTQsNyArMTQsNiBAQCBjb25maWcgTUlQUw0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1RS
TkxFTl9VU0VSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19USUNLX0JST0FEQ0FTVCBpZiBHRU5FUklD
X0NMT0NLRVZFTlRTX0JST0FEQ0FTVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVUJTQU5fU0FOSVRJ
WkVfQUxMDQo+IC0Jc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2VsZWN0
IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwNCj4gICAJc2VsZWN0IEFSQ0hfS0VFUF9NRU1CTE9D
Sw0KPiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19VUFJPQkVTDQo+IGRpZmYgLS1naXQgYS9hcmNo
L25pb3MyL0tjb25maWcgYi9hcmNoL25pb3MyL0tjb25maWcNCj4gaW5kZXggZTA0NTlkZmZkMjE4
Li40MTY3ZjFlYjRjZDggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbmlvczIvS2NvbmZpZw0KPiArKysg
Yi9hcmNoL25pb3MyL0tjb25maWcNCj4gQEAgLTYsNyArNiw2IEBAIGNvbmZpZyBOSU9TMg0KPiAg
IAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNf
U1lOQ19ETUFfRk9SX0RFVklDRQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfRE1BX1NFVF9VTkNBQ0hF
RA0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNI
X05PX1NXQVANCj4gICAJc2VsZWN0IENPTU1PTl9DTEsNCj4gICAJc2VsZWN0IFRJTUVSX09GDQo+
IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL0tjb25maWcgYi9hcmNoL29wZW5yaXNjL0tjb25m
aWcNCj4gaW5kZXggZmUwZGZiNTBlYjg2Li5lODE0ZGY0YzQ4M2MgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvb3BlbnJpc2MvS2NvbmZpZw0KPiArKysgYi9hcmNoL29wZW5yaXNjL0tjb25maWcNCj4gQEAg
LTEwLDcgKzEwLDYgQEAgY29uZmlnIE9QRU5SSVNDDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19ETUFf
U0VUX1VOQ0FDSEVEDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19ETUFfQ0xFQVJfVU5DQUNIRUQNCj4g
ICAJc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UNCj4gLQlzZWxlY3QgQVJDSF9I
QVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQ09NTU9OX0NMSw0KPiAgIAlzZWxlY3Qg
T0YNCj4gICAJc2VsZWN0IE9GX0VBUkxZX0ZMQVRUUkVFDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bh
cmlzYy9LY29uZmlnIGIvYXJjaC9wYXJpc2MvS2NvbmZpZw0KPiBpbmRleCA5MGVhYmM4NDZmODEu
LjVmMjQ0OGRjNWEyYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wYXJpc2MvS2NvbmZpZw0KPiArKysg
Yi9hcmNoL3BhcmlzYy9LY29uZmlnDQo+IEBAIC0xMSw3ICsxMSw2IEBAIGNvbmZpZyBQQVJJU0MN
Cj4gICAJc2VsZWN0IEFSQ0hfSEFTX0VMRl9SQU5ET01JWkUNCj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1NUUklDVF9LRVJORUxfUldYDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9B
TEwNCj4gLQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJD
SF9IQVNfUFRFX1NQRUNJQUwNCj4gICAJc2VsZWN0IEFSQ0hfTk9fU0dfQ0hBSU4NCj4gICAJc2Vs
ZWN0IEFSQ0hfU1VQUE9SVFNfSFVHRVRMQkZTIGlmIFBBMjANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gaW5kZXggMTAzNWQxNzJj
N2RkLi4yNTBiODY1OGIyZDQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IEBAIC0xNDAsNyArMTQwLDYgQEAgY29uZmln
IFBQQw0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVElDS19CUk9BRENBU1QJCWlmIEdFTkVSSUNfQ0xP
Q0tFVkVOVFNfQlJPQURDQVNUDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19VQUNDRVNTX0ZMVVNIQ0FD
SEUNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1VCU0FOX1NBTklUSVpFX0FMTA0KPiAtCXNlbGVjdCBB
UkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBBUkNIX0hBVkVfTk1JX1NBRkVf
Q01QWENIRw0KPiAgIAlzZWxlY3QgQVJDSF9LRUVQX01FTUJMT0NLDQo+ICAgCXNlbGVjdCBBUkNI
X01JR0hUX0hBVkVfUENfUEFSUE9SVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmln
IGIvYXJjaC9yaXNjdi9LY29uZmlnDQo+IGluZGV4IDU4MzM4OWQ0ZTQzYS4uMzJmZmVmOWY2ZTVi
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcNCj4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnDQo+IEBAIC0zMiw3ICszMiw2IEBAIGNvbmZpZyBSSVNDVg0KPiAgIAlzZWxlY3QgQVJD
SF9IQVNfU1RSSUNUX01PRFVMRV9SV1ggaWYgTU1VICYmICFYSVBfS0VSTkVMDQo+ICAgCXNlbGVj
dCBBUkNIX0hBU19USUNLX0JST0FEQ0FTVCBpZiBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FT
VA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVUJTQU5fU0FOSVRJWkVfQUxMDQo+IC0Jc2VsZWN0IEFS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2VsZWN0IEFSQ0hfT1BUSU9OQUxfS0VSTkVM
X1JXWCBpZiBBUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWA0KPiAgIAlzZWxlY3QgQVJDSF9PUFRJ
T05BTF9LRVJORUxfUldYX0RFRkFVTFQNCj4gICAJc2VsZWN0IEFSQ0hfU1RBQ0tXQUxLDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnDQo+IGluZGV4
IGM0NDgxMzc3Y2E4My4uOTFjMGI4MGE4YmYwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3MzOTAvS2Nv
bmZpZw0KPiArKysgYi9hcmNoL3MzOTAvS2NvbmZpZw0KPiBAQCAtODEsNyArODEsNiBAQCBjb25m
aWcgUzM5MA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSDQo+ICAgCXNlbGVj
dCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1ZEU09f
REFUQQ0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVjdCBB
UkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRw0KPiAgIAlzZWxlY3QgQVJDSF9JTkxJTkVfUkVBRF9M
T0NLDQo+ICAgCXNlbGVjdCBBUkNIX0lOTElORV9SRUFEX0xPQ0tfQkgNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvc2gvS2NvbmZpZyBiL2FyY2gvc2gvS2NvbmZpZw0KPiBpbmRleCA5MWYzZWEzMjUzODgu
LjVmMjIwZTkwM2U1YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zaC9LY29uZmlnDQo+ICsrKyBiL2Fy
Y2gvc2gvS2NvbmZpZw0KPiBAQCAtMTIsNyArMTIsNiBAQCBjb25maWcgU1VQRVJIDQo+ICAgCXNl
bGVjdCBBUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19QVEVf
U1BFQ0lBTA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVElDS19CUk9BRENBU1QgaWYgR0VORVJJQ19D
TE9DS0VWRU5UU19CUk9BRENBU1QNCj4gLQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJP
VA0KPiAgIAlzZWxlY3QgQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRSBpZiBNTVUNCj4gICAJc2Vs
ZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUDQo+ICAgCXNlbGVjdCBBUkNIX1dBTlRfSVBD
X1BBUlNFX1ZFUlNJT04NCj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvS2NvbmZpZyBiL2FyY2gv
c3BhcmMvS2NvbmZpZw0KPiBpbmRleCAwOWY4Njg2MTNhNGQuLjljMWNjZTc0OTUzYSAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9zcGFyYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvc3BhcmMvS2NvbmZpZw0K
PiBAQCAtMTMsNyArMTMsNiBAQCBjb25maWcgNjRCSVQNCj4gICBjb25maWcgU1BBUkMNCj4gICAJ
Ym9vbA0KPiAgIAlkZWZhdWx0IHkNCj4gLQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJP
VA0KPiAgIAlzZWxlY3QgQVJDSF9NSUdIVF9IQVZFX1BDX1BBUlBPUlQgaWYgU1BBUkM2NCAmJiBQ
Q0kNCj4gICAJc2VsZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19TRVJJTw0KPiAgIAlzZWxlY3QgRE1B
X09QUw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC91bS9LY29uZmlnIGIvYXJjaC91bS9LY29uZmlnDQo+
IGluZGV4IDdmYjQzNjU0ZTViNS4uNGVjMjJlMTU2YTJlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Vt
L0tjb25maWcNCj4gKysrIGIvYXJjaC91bS9LY29uZmlnDQo+IEBAIC0xMCw3ICsxMCw2IEBAIGNv
bmZpZyBVTUwNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX0tDT1YNCj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1NUUk5DUFlfRlJPTV9VU0VSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19TVFJOTEVOX1VTRVINCj4g
LQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJDSF9OT19Q
UkVFTVBUDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfQVVESVRTWVNDQUxMDQo+ICAgCXNlbGVjdCBI
QVZFX0FSQ0hfU0VDQ09NUF9GSUxURVINCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25maWcg
Yi9hcmNoL3g4Ni9LY29uZmlnDQo+IGluZGV4IGJlMGI5NWU1MWRmNi4uODQxZTQ4NDNkMGM0IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+ICsrKyBiL2FyY2gveDg2L0tjb25maWcN
Cj4gQEAgLTk0LDcgKzk0LDYgQEAgY29uZmlnIFg4Ng0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lO
Q19DT1JFX0JFRk9SRV9VU0VSTU9ERQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1lTQ0FMTF9XUkFQ
UEVSDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwNCj4gLQlzZWxlY3Qg
QVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfV1gN
Cj4gICAJc2VsZWN0IEFSQ0hfSEFTX1pPTkVfRE1BX1NFVCBpZiBFWFBFUlQNCj4gICAJc2VsZWN0
IEFSQ0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHDQo+IGRpZmYgLS1naXQgYS9hcmNoL3h0ZW5zYS9L
Y29uZmlnIGIvYXJjaC94dGVuc2EvS2NvbmZpZw0KPiBpbmRleCA0YzBkODM1MjBmZjEuLjBiMGYw
MTcyY2NlZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC94dGVuc2EvS2NvbmZpZw0KPiArKysgYi9hcmNo
L3h0ZW5zYS9LY29uZmlnDQo+IEBAIC0xMSw3ICsxMSw2IEBAIGNvbmZpZyBYVEVOU0ENCj4gICAJ
c2VsZWN0IEFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQgaWYgTU1VDQo+ICAgCXNlbGVjdCBBUkNI
X0hBU19TVFJOQ1BZX0ZST01fVVNFUiBpZiAhS0FTQU4NCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NU
Uk5MRU5fVVNFUg0KPiAtCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNl
bGVjdCBBUkNIX1VTRV9NRU1URVNUDQo+ICAgCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NL
Uw0KPiAgIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUw0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oDQo+IGluZGV4IDY1YjdmM2Q5
ZmY4Ny4uZmUyOGYxOWUzMzg4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgNCj4g
KysrIGIvaW5jbHVkZS9saW51eC9tbS5oDQo+IEBAIC00MjQsOSArNDI0LDYgQEAgZXh0ZXJuIHVu
c2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lkICpvYmpwKTsNCj4gICAgKiBtYXBwaW5nIGZy
b20gdGhlIGN1cnJlbnRseSBhY3RpdmUgdm1fZmxhZ3MgcHJvdGVjdGlvbiBiaXRzICh0aGUNCj4g
ICAgKiBsb3cgZm91ciBiaXRzKSB0byBhIHBhZ2UgcHJvdGVjdGlvbiBtYXNrLi4NCj4gICAgKi8N
Cj4gLSNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gLWV4dGVybiBw
Z3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl07DQo+IC0jZW5kaWYNCj4gICANCj4gICAvKg0KPiAg
ICAqIFRoZSBkZWZhdWx0IGZhdWx0IGZsYWdzIHRoYXQgc2hvdWxkIGJlIHVzZWQgYnkgbW9zdCBv
ZiB0aGUNCj4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnDQo+IGluZGV4IDE2
OWU2NDE5MmU0OC4uZjQ3ZDI1N2EwNTNiIDEwMDY0NA0KPiAtLS0gYS9tbS9LY29uZmlnDQo+ICsr
KyBiL21tL0tjb25maWcNCj4gQEAgLTk1MSw5ICs5NTEsNiBAQCBjb25maWcgQVJDSF9IQVNfQ1VS
UkVOVF9TVEFDS19QT0lOVEVSDQo+ICAgCSAgcmVnaXN0ZXIgYWxpYXMgbmFtZWQgImN1cnJlbnRf
c3RhY2tfcG9pbnRlciIsIHRoaXMgY29uZmlnIGNhbiBiZQ0KPiAgIAkgIHNlbGVjdGVkLg0KPiAg
IA0KPiAtY29uZmlnIEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gLQlib29sDQo+IC0NCj4g
ICBjb25maWcgQVJDSF9IQVNfUFRFX0RFVk1BUA0KPiAgIAlib29sDQo+ICAgDQo+IGRpZmYgLS1n
aXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggMmNjNzIyZTE2MmZhLi4wMmQ2ODg5
ZjBlZjYgMTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFwLmMNCj4gQEAg
LTgxLDI4ICs4MSw2IEBAIHN0YXRpYyB2b2lkIHVubWFwX3JlZ2lvbihzdHJ1Y3QgbW1fc3RydWN0
ICptbSwNCj4gICAJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnByZXYsDQo+ICAgCQl1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCk7DQo+ICAgDQo+IC0jaWZuZGVmIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+
IC1wZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0gew0KPiAtCVtW
TV9OT05FXQkJCQkJPSBfX1AwMDAsDQo+IC0JW1ZNX1JFQURdCQkJCQk9IF9fUDAwMSwNCj4gLQlb
Vk1fV1JJVEVdCQkJCQk9IF9fUDAxMCwNCj4gLQlbVk1fV1JJVEUgfCBWTV9SRUFEXQkJCQk9IF9f
UDAxMSwNCj4gLQlbVk1fRVhFQ10JCQkJCT0gX19QMTAwLA0KPiAtCVtWTV9FWEVDIHwgVk1fUkVB
RF0JCQkJPSBfX1AxMDEsDQo+IC0JW1ZNX0VYRUMgfCBWTV9XUklURV0JCQkJPSBfX1AxMTAsDQo+
IC0JW1ZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQURdCQkJPSBfX1AxMTEsDQo+IC0JW1ZNX1NI
QVJFRF0JCQkJCT0gX19TMDAwLA0KPiAtCVtWTV9TSEFSRUQgfCBWTV9SRUFEXQkJCQk9IF9fUzAw
MSwNCj4gLQlbVk1fU0hBUkVEIHwgVk1fV1JJVEVdCQkJCT0gX19TMDEwLA0KPiAtCVtWTV9TSEFS
RUQgfCBWTV9XUklURSB8IFZNX1JFQURdCQk9IF9fUzAxMSwNCj4gLQlbVk1fU0hBUkVEIHwgVk1f
RVhFQ10JCQkJPSBfX1MxMDAsDQo+IC0JW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9SRUFEXQkJ
CT0gX19TMTAxLA0KPiAtCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJVEVdCQk9IF9fUzEx
MCwNCj4gLQlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JPSBfX1Mx
MTENCj4gLX07DQo+IC1ERUNMQVJFX1ZNX0dFVF9QQUdFX1BST1QNCj4gLSNlbmRpZgkvKiBDT05G
SUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVCAqLw0KPiAtDQo+ICAgc3RhdGljIHBncHJvdF90
IHZtX3BncHJvdF9tb2RpZnkocGdwcm90X3Qgb2xkcHJvdCwgdW5zaWduZWQgbG9uZyB2bV9mbGFn
cykNCj4gICB7DQo+ICAgCXJldHVybiBwZ3Byb3RfbW9kaWZ5KG9sZHByb3QsIHZtX2dldF9wYWdl
X3Byb3Qodm1fZmxhZ3MpKTs=
