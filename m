Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B90A2FA78F
	for <lists+linux-sh@lfdr.de>; Mon, 18 Jan 2021 18:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406542AbhARR3M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 18 Jan 2021 12:29:12 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57837 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393014AbhARR2h (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 18 Jan 2021 12:28:37 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l1YJm-00176A-DV; Mon, 18 Jan 2021 18:27:54 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l1YJl-001Ln0-PF; Mon, 18 Jan 2021 18:27:53 +0100
Subject: Re: [PATCH 2/2] sh: boot: avoid unneeded rebuilds under
 arch/sh/boot/compressed/
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Brendan Higgins <brendanhiggins@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
References: <20210117111632.2392635-1-masahiroy@kernel.org>
 <20210117111632.2392635-2-masahiroy@kernel.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <4cf5e50b-0623-8033-77a5-c6973725f9aa@physik.fu-berlin.de>
Date:   Mon, 18 Jan 2021 18:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117111632.2392635-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 1/17/21 12:16 PM, Masahiro Yamada wrote:
> Even if none of source code is updated, the following are every time
> rebuilt:
> 
>   CC      arch/sh/boot/compressed/cache.o
>   SHIPPED arch/sh/boot/compressed/ashiftrt.S
>   AS      arch/sh/boot/compressed/ashiftrt.o
>   SHIPPED arch/sh/boot/compressed/ashldi3.c
>   CC      arch/sh/boot/compressed/ashldi3.o
>   SHIPPED arch/sh/boot/compressed/ashrsi3.S
>   AS      arch/sh/boot/compressed/ashrsi3.o
>   SHIPPED arch/sh/boot/compressed/ashlsi3.S
>   AS      arch/sh/boot/compressed/ashlsi3.o
>   SHIPPED arch/sh/boot/compressed/lshrsi3.S
>   AS      arch/sh/boot/compressed/lshrsi3.o
>   LD      arch/sh/boot/compressed/vmlinux
>   OBJCOPY arch/sh/boot/zImage
> 
> Add build artifacts to 'targets' as needed.
> 
> I turned the library files to check-in files. It is simpler than
> copying from arch/sh/lib/ at build-time.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/sh/boot/compressed/.gitignore |  5 -----
>  arch/sh/boot/compressed/Makefile   | 32 ++++++++++++------------------
>  arch/sh/boot/compressed/ashiftrt.S |  2 ++
>  arch/sh/boot/compressed/ashldi3.c  |  2 ++
>  arch/sh/boot/compressed/ashlsi3.S  |  2 ++
>  arch/sh/boot/compressed/ashrsi3.S  |  2 ++
>  arch/sh/boot/compressed/lshrsi3.S  |  2 ++
>  7 files changed, 23 insertions(+), 24 deletions(-)
>  create mode 100644 arch/sh/boot/compressed/ashiftrt.S
>  create mode 100644 arch/sh/boot/compressed/ashldi3.c
>  create mode 100644 arch/sh/boot/compressed/ashlsi3.S
>  create mode 100644 arch/sh/boot/compressed/ashrsi3.S
>  create mode 100644 arch/sh/boot/compressed/lshrsi3.S
> 
> diff --git a/arch/sh/boot/compressed/.gitignore b/arch/sh/boot/compressed/.gitignore
> index 37aa53057369..cd16663bc7c8 100644
> --- a/arch/sh/boot/compressed/.gitignore
> +++ b/arch/sh/boot/compressed/.gitignore
> @@ -1,7 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -ashiftrt.S
> -ashldi3.c
> -ashlsi3.S
> -ashrsi3.S
> -lshrsi3.S
>  vmlinux.bin.*
> diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
> index 589d2d8a573d..cf3174df7859 100644
> --- a/arch/sh/boot/compressed/Makefile
> +++ b/arch/sh/boot/compressed/Makefile
> @@ -5,12 +5,18 @@
>  # create a compressed vmlinux image from the original vmlinux
>  #
>  
> -targets		:= vmlinux vmlinux.bin vmlinux.bin.gz \
> -		   vmlinux.bin.bz2 vmlinux.bin.lzma \
> -		   vmlinux.bin.xz vmlinux.bin.lzo \
> -		   head_32.o misc.o piggy.o
> +OBJECTS := head_32.o misc.o cache.o piggy.o \
> +           ashiftrt.o ashldi3.o ashrsi3.o ashlsi3.o lshrsi3.o
> +
> +# These were previously generated files. When you are building the kernel
> +# with O=, make sure to remove the stale files in the output tree. Otherwise,
> +# the build system wrongly compiles the stale ones.
> +ifdef building_out_of_srctree
> +$(shell rm -f $(addprefix $(obj)/, ashiftrt.S ashldi3.c ashrsi3.S ashlsi3.S lshrsi3.S))
> +endif
>  
> -OBJECTS = $(obj)/head_32.o $(obj)/misc.o $(obj)/cache.o
> +targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 \
> +           vmlinux.bin.lzma vmlinux.bin.xz vmlinux.bin.lzo $(OBJECTS)
>  
>  GCOV_PROFILE := n
>  
> @@ -33,21 +39,9 @@ ccflags-remove-$(CONFIG_MCOUNT) += -pg
>  LDFLAGS_vmlinux := --oformat $(ld-bfd) -Ttext $(IMAGE_OFFSET) -e startup \
>  		   -T $(obj)/../../kernel/vmlinux.lds
>  
> -#
> -# Pull in the necessary libgcc bits from the in-kernel implementation.
> -#
> -lib1funcs-y	:= ashiftrt.S ashldi3.c ashrsi3.S ashlsi3.S lshrsi3.S
> -lib1funcs-obj   := \
> -	$(addsuffix .o, $(basename $(addprefix $(obj)/, $(lib1funcs-y))))
> -
> -lib1funcs-dir		:= $(srctree)/arch/$(SRCARCH)/lib
> -
> -KBUILD_CFLAGS += -I$(lib1funcs-dir) -DDISABLE_BRANCH_PROFILING
> -
> -$(addprefix $(obj)/,$(lib1funcs-y)): $(obj)/%: $(lib1funcs-dir)/% FORCE
> -	$(call cmd,shipped)
> +KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
>  
> -$(obj)/vmlinux: $(OBJECTS) $(obj)/piggy.o $(lib1funcs-obj) FORCE
> +$(obj)/vmlinux: $(addprefix $(obj)/, $(OBJECTS)) FORCE
>  	$(call if_changed,ld)
>  
>  $(obj)/vmlinux.bin: vmlinux FORCE
> diff --git a/arch/sh/boot/compressed/ashiftrt.S b/arch/sh/boot/compressed/ashiftrt.S
> new file mode 100644
> index 000000000000..0f3b291a3f4b
> --- /dev/null
> +++ b/arch/sh/boot/compressed/ashiftrt.S
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include "../../lib/ashiftrt.S"
> diff --git a/arch/sh/boot/compressed/ashldi3.c b/arch/sh/boot/compressed/ashldi3.c
> new file mode 100644
> index 000000000000..7cebd646df83
> --- /dev/null
> +++ b/arch/sh/boot/compressed/ashldi3.c
> @@ -0,0 +1,2 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include "../../lib/ashldi3.c"
> diff --git a/arch/sh/boot/compressed/ashlsi3.S b/arch/sh/boot/compressed/ashlsi3.S
> new file mode 100644
> index 000000000000..e354262b275f
> --- /dev/null
> +++ b/arch/sh/boot/compressed/ashlsi3.S
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include "../../lib/ashlsi3.S"
> diff --git a/arch/sh/boot/compressed/ashrsi3.S b/arch/sh/boot/compressed/ashrsi3.S
> new file mode 100644
> index 000000000000..e564be9a4dcd
> --- /dev/null
> +++ b/arch/sh/boot/compressed/ashrsi3.S
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include "../../lib/ashrsi3.S"
> diff --git a/arch/sh/boot/compressed/lshrsi3.S b/arch/sh/boot/compressed/lshrsi3.S
> new file mode 100644
> index 000000000000..5a8281b7e516
> --- /dev/null
> +++ b/arch/sh/boot/compressed/lshrsi3.S
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include "../../lib/lshrsi3.S"


Successfully boot-tested on my SH-7785LCR. No regressions.



Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

