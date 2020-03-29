Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F4C196A91
	for <lists+linux-sh@lfdr.de>; Sun, 29 Mar 2020 04:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgC2CE6 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 28 Mar 2020 22:04:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38485 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgC2CE6 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 28 Mar 2020 22:04:58 -0400
Received: by mail-oi1-f194.google.com with SMTP id w2so12609352oic.5
        for <linux-sh@vger.kernel.org>; Sat, 28 Mar 2020 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=v+mgF6/cmuWeKSQhv278kbqBS2l6IulEf0lf87Ekm9o=;
        b=B/DzH+u7asGp3c/WrBVU4SZV+FIr08ceQpktCoG6bbMOghlX2xD5veUdEKAI81vsEH
         8A52bTIuMETQmAEl8+zEb7jkVL7beoJ8h1c+CX8TxhY0mx8uFlhcvzvBNTZ9YwrmHDj/
         ajO9nD0/sNhOfKondOyGUlbGiS/Z5SbjYu2FXebJiizz9pq9r/krR5q/WGQBLiDq6ySY
         ACRoxXAmWrUg39kNmgFMCDvLg8lZ9NuJ5104Plud8d0CwKBIuVr+HBt4kOu2I6nWfpXe
         gjaUoDPywTi8R/4eEk3eNAE/UIKPDZYprHt7IM8lBS7aXBFnvsDMb/KA6Cps4KVGs6TC
         ymAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=v+mgF6/cmuWeKSQhv278kbqBS2l6IulEf0lf87Ekm9o=;
        b=G3TMjKJsnh3mzx+CrlQgdGDnutTg3pPDXwcrz/oQvguCM+4baBzhxuRP3XggoURPxD
         2c3jEOj3u1lScUYsQszAcWDTk64bFWQmR+O5Tb2RU9cFObjhuf1MW/ND43O2yCP8sB/T
         3mQkc/pO18XUJ+Vl2t5diGpeo9joPGZInfa42MLblyOjT3X3iZUq4KLFEzu0z+Azvi3X
         hTNmWROF0LOX5vpcNotcWOd3UCfHijUP7W2ml6GNAAUot/xms/vimEayZS8yv0ZKaSnD
         XYZxOl176vE/L5/7Oc3GtLUMDtUARZq4xkDOakuADUDjEagGop4qSpXUsL1r/FqxRG1Y
         y0MQ==
X-Gm-Message-State: ANhLgQ22vaNYZXMOa01txwlPF4+y1XgmRE88ddG2IsiEj4uytHSkV0Z+
        9v6BLCvhSwcjEJSlkhttACtuqg==
X-Google-Smtp-Source: ADFU+vuC3DXRGj8AK6xwNJn72zE/0z59WdLNIKNX8zVbF7jgfriSDYlUMA/dKSQqTYbwBqDWQwjXPA==
X-Received: by 2002:aca:4e08:: with SMTP id c8mr3800967oib.143.1585447497187;
        Sat, 28 Mar 2020 19:04:57 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id 46sm3190939otl.12.2020.03.28.19.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2020 19:04:56 -0700 (PDT)
Subject: Re: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rich Felker <dalias@libc.org>,
        Romain Naour <romain.naour@gmail.com>,
        torvalds@linux-foundation.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Alan Modra <amodra@gmail.com>, Arnd Bergmann <arnd@arndb.de>
References: <20200315175108.9694-1-romain.naour@gmail.com>
 <20200315175108.9694-2-romain.naour@gmail.com>
 <20200326204240.GF11469@brightrain.aerifal.cx>
 <0f44cd31-a3e4-7b14-b9a8-28e4b0fd571e@landley.net>
 <CAMuHMdV2BPUua6T7Bgu2mRj5De7mwUKm=hqNAs3_jZK4fZnXtg@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <db57466b-8635-6c71-55bd-51c228490f3c@landley.net>
Date:   Sat, 28 Mar 2020 21:10:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV2BPUua6T7Bgu2mRj5De7mwUKm=hqNAs3_jZK4fZnXtg@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------479B1A57757F7B903A4373D9"
Content-Language: en-US
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This is a multi-part message in MIME format.
--------------479B1A57757F7B903A4373D9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Binutils 2.33.1 needs explicit alignment directives or sh kernel won't boot.

https://www.spinics.net/lists/linux-sh/msg56835.html
https://www.spinics.net/lists/linux-sh/msg56836.html

Patches attached, acked by arch maintainer and tested by me.

On 3/28/20 5:29 AM, Geert Uytterhoeven wrote:
> CC arnd
> 
> On Fri, Mar 27, 2020 at 11:00 PM Rob Landley <rob@landley.net> wrote:
>> On 3/26/20 3:42 PM, Rich Felker wrote:
>>> On Sun, Mar 15, 2020 at 06:51:08PM +0100, Romain Naour wrote:
>>>> Since the patch [1], building the kernel using a toolchain built with
>>>> Binutils 2.33.1 prevent booting a sh4 system under Qemu.
>>>> Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
>>>>
>>>> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
>>>> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
>>>>
>>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>>> Cc: Alan Modra <amodra@gmail.com>
>>>
>>> Acked-by: Rich Felker <dalias@libc.org>
>>
>> Is there any way to get this into sunday's release?
> 
> Not if the maintainer isn't in CC.
> 
>> Acked-by: Rob Landley <rob@landley.net>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

[Puppy eyes intensify.]

Rob

--------------479B1A57757F7B903A4373D9
Content-Type: text/x-patch; charset=UTF-8;
 name="patch1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch1.patch"

From:   Romain Naour <romain.naour@gmail.com>
To:     linux-sh@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>,
        Alan Modra <amodra@gmail.com>
Subject: [PATCH 1/2] arch/sh: vmlinux.scr
Date:   Sun, 15 Mar 2020 18:51:07 +0100
Message-Id: <20200315175108.9694-1-romain.naour@gmail.com>

Since the patch [1], building the kernel using a toolchain built with
Binutils 2.33.1 prevent booting a sh4 system under Qemu.
Apply the patch provided by Alan Modra [2] that fix alignment of rodata.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alan Modra <amodra@gmail.com>
Acked-by: Rich Felker <dalias@libc.org>
Tested-by: Rob Landley <rob@landley.net>
---
 arch/sh/boot/compressed/vmlinux.scr | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
index 862d74808236..dd292b4b9082 100644
--- a/arch/sh/boot/compressed/vmlinux.scr
+++ b/arch/sh/boot/compressed/vmlinux.scr
@@ -1,6 +1,6 @@
 SECTIONS
 {
-  .rodata..compressed : {
+  .rodata..compressed : ALIGN(8) {
 	input_len = .;
 	LONG(input_data_end - input_data) input_data = .;
 	*(.data)
-- 
2.24.1


--------------479B1A57757F7B903A4373D9
Content-Type: text/x-patch; charset=UTF-8;
 name="patch2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch2.patch"

From:   Romain Naour <romain.naour@gmail.com>
To:     linux-sh@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>,
        Alan Modra <amodra@gmail.com>
Subject: [PATCH 2/2] include/asm-generic: vmlinux.lds.h
Date:   Sun, 15 Mar 2020 18:51:08 +0100
Message-Id: <20200315175108.9694-2-romain.naour@gmail.com>

Since the patch [1], building the kernel using a toolchain built with
Binutils 2.33.1 prevent booting a sh4 system under Qemu.
Apply the patch provided by Alan Modra [2] that fix alignment of rodata.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alan Modra <amodra@gmail.com>
Acked-by: Rich Felker <dalias@libc.org>
Tested-by: Rob Landley <rob@landley.net>
---
 include/asm-generic/vmlinux.lds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e00f41aa8ec4..d46d34b58c96 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -374,6 +374,7 @@
  */
 #ifndef RO_AFTER_INIT_DATA
 #define RO_AFTER_INIT_DATA						\
+	. = ALIGN(8);							\
 	__start_ro_after_init = .;					\
 	*(.data..ro_after_init)						\
 	JUMP_TABLE_DATA							\
-- 
2.24.1


--------------479B1A57757F7B903A4373D9--
