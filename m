Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3C8627453
	for <lists+linux-sh@lfdr.de>; Mon, 14 Nov 2022 02:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbiKNBzV (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 13 Nov 2022 20:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiKNBzU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 13 Nov 2022 20:55:20 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95C421AD
        for <linux-sh@vger.kernel.org>; Sun, 13 Nov 2022 17:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668390919; x=1699926919;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nyOFTXz3d9X6eMOZsmuYqPSZyAOtJSgUq3fJ16zqsqM=;
  b=YAgtcDHyrE74pRquAee99zY83Qq5qoCaBc//5rLzh6VnnrxkLLBbOOBk
   VO7BzkcvNhMEx8H7uRHPO/NJLWVCOIqaDJ7j6lE6qEA1Q9/o6pLxMPSYT
   HIxZECuef2WiB5b3EUQ9OkpyUMRHkHgF+QFR0ZwmUw3PXuD198GyKH7iZ
   BbKFhg9Um9tsoFbA3izwXMfZpUsUq6xbZ5sUgJZUf0mm/hNaFRsbmm4sS
   PYctDL9NeQWC7kLfJD46LQVw8T3vDMzTcm3XQLUSuPCLz+W31Jewyr14a
   GfnjM2THOouqik6qcrpuFIJ7Vrk5ci6ImQI+MLtnb6jQH6SdT5Yys0gFA
   w==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665417600"; 
   d="scan'208";a="214449249"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2022 09:55:19 +0800
IronPort-SDR: VM04ttyLFfnLp1yxvcykMpVXSUbfeea4wqdqwbFvC2QiMHrWdVKbSe2F721JaftFzCGTsZ1MBv
 DHgTXnzp9PfuyB+X8olW+KEfTmRDyqmr8ztF+DzhmHJBNI75kU5w1JzK4hsG45206FCYdFRUOJ
 e8kkkPGToJJaZejojMwAx9DXctjjwFHfJDXC/p4EnDygi+CG1wm3Bod5xsEOrBceoARxmhXUMX
 hpcajbMEx6T+jQPgXdzWwXHQ/Q4MGtYKfEuafOmvQAnEgMF4fmTfGiPa8Bv/rofOOy71h27XgE
 ZkA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 17:08:33 -0800
IronPort-SDR: XIPcGt7la2UUnKX4CMG9Ec0GJtWyrMoaB0XEJnhgMszT8qgR50rI3+uuoXeDsZca/JAeqDiZPP
 pdel9buT57WIHm0tVjUDgPs18+Zhbtldc44J/nZlG8jSIuy+9Y1ELqrN264fgK+U0DFGxYi6fV
 gb4GOtO78uf0ctqv2Kv391COFmK6C6twNjLp/O7Vyp3hYOg+n+KgKTt2cXv+ilQ33qz5aWNW80
 aZLeZgWF6p6ncCJTtEh2bDpFT0OoMw8adnZ47rr1nti+1vSWJ3cwvHPv1awHgtFAFsc6ERAf/f
 KpY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 17:55:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N9XSk2hrLz1RwvT
        for <linux-sh@vger.kernel.org>; Sun, 13 Nov 2022 17:55:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1668390916; x=1670982917; bh=nyOFTXz3d9X6eMOZsmuYqPSZyAOtJSgUq3f
        J16zqsqM=; b=B7FIG24k/AkrbPRlxTTp+YAyPl2DtgOB49NBmCF1uJe1rzavO/J
        NnzQvOw5y6jZvpQDwbtMGe43anknJxLtaNq6ye3vNETqunaV7aPGbWlB5yTcJneZ
        dep7KJ5wOdey9UA9pJO55QieVSkTNlBVhNgkyYu31fgMtYTbglkkIlf7pD0mZS9U
        TV2BXR5pUYz63ZjDo3FL0DtWJD6Q7xWT2ajGfhM6MNxiQ4WATwU3nDj6s5pOHaUi
        EtT3fitwsRCuczjPghjRbOWkaSka9UnIqihDhmL1YAsBAgEnAIKojathaHJVhQgy
        vt64Jcr8YksY1GcywsWLEhEhXqIrpmbW4JA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id rckwoJuvML-8 for <linux-sh@vger.kernel.org>;
        Sun, 13 Nov 2022 17:55:16 -0800 (PST)
Received: from [10.225.163.46] (unknown [10.225.163.46])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N9XSY61WPz1RvLy;
        Sun, 13 Nov 2022 17:55:09 -0800 (PST)
Message-ID: <a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com>
Date:   Mon, 14 Nov 2022 10:55:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Deprecating and removing SLOB
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Cc:     Pasha Tatashin <pasha.tatashin@soleen.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Pekka Enberg <penberg@kernel.org>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rustam Kovhaev <rkovhaev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Alexander Shiyan <shc_work@mail.ru>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        openrisc@lists.librecores.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor.Dooley@microchip.com, Paul Cercueil <paul@crapouillou.net>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz> <Y260tkNHc2vFITJ3@spud>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y260tkNHc2vFITJ3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/12/22 05:46, Conor Dooley wrote:
> On Fri, Nov 11, 2022 at 11:33:30AM +0100, Vlastimil Babka wrote:
>> On 11/8/22 22:44, Pasha Tatashin wrote:
>>> On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>>>
>>>> Hi,
>>>>
>>>> as we all know, we currently have three slab allocators. As we discussed
>>>> at LPC [1], it is my hope that one of these allocators has a future, and
>>>> two of them do not.
>>>>
>>>> The unsurprising reasons include code maintenance burden, other features
>>>> compatible with only a subset of allocators (or more effort spent on the
>>>> features), blocking API improvements (more on that below), and my
>>>> inability to pronounce SLAB and SLUB in a properly distinguishable way,
>>>> without resorting to spelling out the letters.
>>>>
>>>> I think (but may be proven wrong) that SLOB is the easier target of the
>>>> two to be removed, so I'd like to focus on it first.
>>>>
>>>> I believe SLOB can be removed because:
>>>>
>>>> - AFAIK nobody really uses it? It strives for minimal memory footprint
>>>> by putting all objects together, which has its CPU performance costs
>>>> (locking, lack of percpu caching, searching for free space...). I'm not
>>>> aware of any "tiny linux" deployment that opts for this. For example,
>>>> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
>>>> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
>>>> SLOB impact is too much for those who tried. Googling for
>>>> "CONFIG_SLOB=y" yielded nothing useful.
>>>
>>> I am all for removing SLOB.
>>>
>>> There are some devices with configs where SLOB is enabled by default.
>>> Perhaps, the owners/maintainers of those devices/configs should be
>>> included into this thread:
>>>
>>> tatashin@soleen:~/x/linux$ git grep SLOB=y
> 
>>> arch/riscv/configs/nommu_k210_defconfig:CONFIG_SLOB=y
>>> arch/riscv/configs/nommu_k210_sdcard_defconfig:CONFIG_SLOB=y
>>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_SLOB=y
> 
>>
>> Turns out that since SLOB depends on EXPERT, many of those lack it so
>> running make defconfig ends up with SLUB anyway, unless I miss something.
>> Only a subset has both SLOB and EXPERT:
>>
>>> git grep CONFIG_EXPERT `git grep -l "CONFIG_SLOB=y"`
> 
>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_EXPERT=y
> 
> I suppose there's not really a concern with the virt defconfig, but I
> did check the output of `make nommu_k210_defconfig" and despite not
> having expert it seems to end up CONFIG_SLOB=y in the generated .config.
> 
> I do have a board with a k210 so I checked with s/SLOB/SLUB and it still
> boots etc, but I have no workloads or w/e to run on it.

I sent a patch to change the k210 defconfig to using SLUB. However...

The current default config using SLOB gives about 630 free memory pages
after boot (cat /proc/vmstat). Switching to SLUB, this is down to about
400 free memory pages (CONFIG_SLUB_CPU_PARTIAL is off).

This is with a buildroot kernel 5.19 build including a shell and sd-card
boot. With SLUB, I get clean boots and a shell prompt as expected. But I
definitely see more errors with shell commands failing due to allocation
failures for the shell process fork. So as far as the K210 is concerned,
switching to SLUB is not ideal.

I would not want to hold on kernel mm improvements because of this toy
k210 though, so I am not going to prevent SLOB deprecation. I just wish
SLUB itself used less memory :)


-- 
Damien Le Moal
Western Digital Research

