Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8053D65BD99
	for <lists+linux-sh@lfdr.de>; Tue,  3 Jan 2023 11:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbjACKFv (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 3 Jan 2023 05:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjACKFu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 3 Jan 2023 05:05:50 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE2E11E;
        Tue,  3 Jan 2023 02:05:48 -0800 (PST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3037hcSP015068;
        Tue, 3 Jan 2023 10:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dMHVtFosqWThDyY5SftMoOPjqDlLusCntZAFShOz2mY=;
 b=KQ8gHflm592WlbRAgwdQmZyTRlHDWh9M3ZAPFV+EMcsIOXJ461PiMpCp5cUVt9BL1e6j
 zqllDR5Fb/gxAm41jRkoRbn7AyAsUGSUMf7knMuu/spo09IOUdLrV2GM4nc+OlkQbkE7
 IJzG4uvffHGaWIteJBPi+B7FHAqQUQN3AtsThHUAZCqJQIQDHXbgZuAeeqSo9WeDmPJj
 eEQnkInKW+xzSa/aKKaqEDcmxJK5+xsGNpjiHiXPohV0tqVjzNS2xI1QFRZv2I9KIldN
 wQ9mkHaOJ5pKdofCP9qAqPj5s8umAAK+tXrV9dZ+20maLxpkr4T38HkHLw9ablzK3SFk /w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvbt6xp9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Jan 2023 10:02:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3039LwDp027251;
        Tue, 3 Jan 2023 10:02:19 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvbt6xp8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Jan 2023 10:02:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 302CL8aj017444;
        Tue, 3 Jan 2023 10:02:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
        by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6tmts-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Jan 2023 10:02:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
        by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303A2EKB49938694
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Jan 2023 10:02:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B14420071;
        Tue,  3 Jan 2023 10:02:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F230A20069;
        Tue,  3 Jan 2023 10:02:12 +0000 (GMT)
Received: from osiris (unknown [9.171.83.23])
        by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Tue,  3 Jan 2023 10:02:12 +0000 (GMT)
Date:   Tue, 3 Jan 2023 11:02:09 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] arch: rename all internal names __xchg to __arch_xchg
Message-ID: <Y7P9IcR7/jgYWMcq@osiris>
References: <202212300642.6pdgegGO-lkp@intel.com>
 <20221230141552.128508-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230141552.128508-1-andrzej.hajda@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JUKgavQnlJumrUvi-CztUW8Qob9IZFEg
X-Proofpoint-GUID: 0ZquoQ4B0WHjt8os5pwnxRNooiQSYFH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_01,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=712 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030088
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Fri, Dec 30, 2022 at 03:15:52PM +0100, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> ---
...
>  arch/s390/include/asm/cmpxchg.h      | 4 ++--
> diff --git a/arch/s390/include/asm/cmpxchg.h b/arch/s390/include/asm/cmpxchg.h
> index 84c3f0d576c5b1..efc16f4aac8643 100644
> --- a/arch/s390/include/asm/cmpxchg.h
> +++ b/arch/s390/include/asm/cmpxchg.h
> @@ -14,7 +14,7 @@
>  
>  void __xchg_called_with_bad_pointer(void);
>  
> -static __always_inline unsigned long __xchg(unsigned long x,
> +static __always_inline unsigned long __arch_xchg(unsigned long x,
>  					    unsigned long address, int size)

Please adjust the alignment of the second line.

> @@ -77,7 +77,7 @@ static __always_inline unsigned long __xchg(unsigned long x,
>  	__typeof__(*(ptr)) __ret;					\
>  									\
>  	__ret = (__typeof__(*(ptr)))					\
> -		__xchg((unsigned long)(x), (unsigned long)(ptr),	\
> +		__arch_xchg((unsigned long)(x), (unsigned long)(ptr),	\
>  		       sizeof(*(ptr)));					\

Same here.

The same is true for a couple of other architectures - not sure if
they care however.
