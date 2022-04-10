Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E144FAC85
	for <lists+linux-sh@lfdr.de>; Sun, 10 Apr 2022 09:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbiDJHYw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 10 Apr 2022 03:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbiDJHYv (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 10 Apr 2022 03:24:51 -0400
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com [IPv6:2001:4860:4864:20::44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2DF11175
        for <linux-sh@vger.kernel.org>; Sun, 10 Apr 2022 00:22:41 -0700 (PDT)
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-d39f741ba0so14039856fac.13
        for <linux-sh@vger.kernel.org>; Sun, 10 Apr 2022 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HLcHxok0TrE1xQrUdzzB3gUD4+EGnlP7Z3j2dVkEC1E=;
        b=CDOKrgbEU+Q9Ta7bNjY7kM0CEtCjXc4Mdx5lNRcE1AlbQ4sEiQA1TcL/jymJDPD2T6
         IkK56d0xkBbM6FgVF0CUCOLNn6PrZJALVEuLH+d4jUkn/4f5gayUjqa1Tr8s7d3qUK5j
         tR+OiveAwIczYKdp6hgPUkHydMNPOoEXQvBo+D77BKSGZJTEMfb9+MpPyZ4jTbQla9j6
         H3J9AfzlLd6ni3B331Wa0jUfqM40xPxLiSKyHYlJAs7AAE6gIvChiS1BczYifu6VDnIP
         aTbfbosD9dfF4kveqfYYbaUIdlOg084qs/0/9yfVqjDrmoELIaFPLRP3ksk6yqJv6EG/
         RmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HLcHxok0TrE1xQrUdzzB3gUD4+EGnlP7Z3j2dVkEC1E=;
        b=6ilwv2H5bBBI2vJ1jZCnB8Ag99Eg4bSWa0wZKgre55IOGZLDQxJtH0nMKBVXVIzxQr
         73LwRnraG4J0QSrz7IqrKDBEeMkW93MLDmKFbfEmHWNplQShQatM55U29SqOG3k784HC
         BxlSiLDWf1fFuvHfB9+dzNs6nCo555hkiBaQEr4HDsitm1gsO6pT0eLv1ldhCRQyxj89
         7A6TEALMkWKw1jN4n/j1Ba5srNYMU2IGpCLOfEoWtxs4OjrPUCqLYGNle8ghrwgHO+/b
         /fozsYjRxhGRsdlf2dkK195bYm3RCDhh2Wk21ywE+Vbs9cjrhvjaPF2G7wzDwo5IJJda
         va1Q==
X-Gm-Message-State: AOAM533N4p1VR0vPlfnXk4HC7by0pjcuRcMl+sXcIMRy46zINvYBLXO7
        Xwo2VTJvxT/GYEQWNxPwVaIFXw==
X-Google-Smtp-Source: ABdhPJzgSAIgurvIZBg0mjDm5TRgjmByFBGeU2r6N5ZSwlpKBXt97DTKHaVc1p5t/OeQuek6SKXj9g==
X-Received: by 2002:a05:6870:639e:b0:e2:ab7c:d868 with SMTP id t30-20020a056870639e00b000e2ab7cd868mr1856692oap.108.1649575360859;
        Sun, 10 Apr 2022 00:22:40 -0700 (PDT)
Received: from [192.168.224.179] ([172.58.198.202])
        by smtp.gmail.com with ESMTPSA id q203-20020acad9d4000000b002f8ee3f69e2sm10328337oig.52.2022.04.10.00.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 00:22:40 -0700 (PDT)
Message-ID: <ae4125f5-e725-43ed-d05b-b1f88c0cd50c@landley.net>
Date:   Sun, 10 Apr 2022 02:26:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To:     Greg Ungerer <gerg@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Daniel Palmer <daniel@0x0f.com>, Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
 <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
 <3d5cf48c-94f1-2948-1683-4a2a87f4c697@linux-m68k.org>
 <147dc6cc-1fbb-558f-8e6d-29d4327d54b4@linux-m68k.org>
From:   Rob Landley <rob@landley.net>
In-Reply-To: <147dc6cc-1fbb-558f-8e6d-29d4327d54b4@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



On 4/8/22 23:18, Greg Ungerer wrote:
> 
> On 9/4/22 11:59, Finn Thain wrote:
>> On Fri, 8 Apr 2022, Rob Landley wrote:
>> 
>>> On 4/5/22 08:07, Greg Ungerer wrote:
>>>> On 5/4/22 13:23, Daniel Palmer wrote:
>>>>> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>>>>> But we could consider the Dragonball support for removal. I keep it
>>>>>> compiling, but I don't use it and can't test that it actually works.
>>>>>> Not sure that it has been used for a very long time now. And I
>>>>>> didn't even realize but its serial driver (68328serial.c) was
>>>>>> removed in 2015. No one seems too have noticed and complained.
>>>>>
>>>>> I noticed this and I am working on fixing it up for a new Dragonball
>>>>> homebrew machine. I'm trying to add a 68000 machine to QEMU to make
>>>>> the development easier because I'm currently waiting an hour or more
>>>>> for a kernel to load over serial. It might be a few months.
>>>
>>> I've been booting Linux on qemu-system-m68k -M q800 for a couple years
>>> now? (The CROSS=m68k target of mkroot in toybox?)
>>>
>>> # cat /proc/cpuinfo
>>> CPU:		68040
>>> MMU:		68040
>>> FPU:		68040
>>> Clocking:	1261.9MHz
>>> BogoMips:	841.31
>>> Calibration:	4206592 loops
>>>
>>> It certainly THINKS it's got m68000...
>>>
>> 
>> Most 68040 processor variants have a built-in MMU and the m68k "nommu"
>> Linux port doesn't support them. The nommu port covers processors like
>> 68000, Dragonball etc. whereas the m68k "mmu" port covers 680x0 where x is
>> one of 2,3,4,6 with MMU.

In theory you can switch the MMU off. (Or at least give it a NOP page table that
maps all the physical memory into one big contiguous block 1:1 with the physical
address and leave it there.)

Doesn't mean anybody's bothered to implement and add a config option to stub
that out in the kernel yet. But presumably you could have a bootloader shim do it...

>>> (I'd love to get an m68k nommu system working but never sat down and
>>> worked out a kernel .config qemu agreed to run, plus compiler and libc.
>>> Musl added m68k support but I dunno if that includes coldfire?)
>>>
>> 
>> I could never figure out how to boot a coldfire machine in qemu either.
>> There was no documentation about that back when I attempted it but maybe
>> things have improved since.
> 
> FWIW this will do it:
> 
>      qemu-system-m68k -nographic -machine mcf5208evb -kernel vmlinux
> 
> That will boot an m5208evb_defconfig generated vmlinux.
> But you will need a user space to get a full boot to login/shell.

No FDPIC support. :(

I had a binflt toolchain working with uClibc in 2015 or so, but I end of lifed
https://landley.net/aboriginal in 2017 (five years ago now). Multiple reasons,
but one was the old "last GPLv2 release" toolchain was getting painful to force
the kernel to build with.

These days there's articles on lwn.net about yanking a.out support, which fdpic
is a buggy variant of that didn't actually have a maintained elf2flt repository
when I was assembling my toolchain. (I vaguely recall I poked enough people that
somebody picked it up and stuck a repository on github, but Jeff Dionne
explained some fundamental design flaw that had been introduced having to do
with register offsets being calculated in the wrong framework or something?

I don't remember, I lost interest because it's _conceptually_ obsolete. FDPIC is
ELF with a little extra header info, it's clean and potentially even useful on
with-MMU systems as extra ASLR. BINFLT is a.out run through a postprocessing
tool that nominally converts ELF files into the new format but actually needs .o
files from earlier in the process and is kind of an alternate linker except it
doesn't replace the linker... It's layers of ugly.

> Regards
> Greg

Rob
