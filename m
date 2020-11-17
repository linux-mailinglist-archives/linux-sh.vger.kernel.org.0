Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535962B7104
	for <lists+linux-sh@lfdr.de>; Tue, 17 Nov 2020 22:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgKQVjn (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Nov 2020 16:39:43 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:33873 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbgKQVjn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Nov 2020 16:39:43 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          for linux-sh@vger.kernel.org with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kf8hR-0034fg-Cj; Tue, 17 Nov 2020 22:39:41 +0100
Received: from p5b13ac4a.dip0.t-ipconnect.de ([91.19.172.74] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          for linux-sh@vger.kernel.org with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kf8hR-0035X1-3P; Tue, 17 Nov 2020 22:39:41 +0100
To:     Linux-sh list <linux-sh@vger.kernel.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Kernel crash when syncing to usb-storage
Message-ID: <d89a074e-c0ed-5d8b-a58e-ce3d420f579e@physik.fu-berlin.de>
Date:   Tue, 17 Nov 2020 22:39:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.172.74
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi!

Recently, I have started to see crashes when I try to sync a FAT filesystem
on a USB pen drive. The crash is reproducible and seems to have been introduced
in the 5.10 development cycle. I have not bisected the issue yet.

Here is the backtrace. It does not always print a backtrace.

[  109.868000] 
[  109.868000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc4-00091-g0fa8ee0d9ab9 #93
[  109.868000] PC is at write_32+0x8/0x18
[  109.868000] PR is at intc_mode_field+0x18/0x20
[  109.868000] PC  : 8037aea4 SP  : 80647e78 SR  : 400080f0 TEA : ffffffff
[  109.868000] R0  : 0000001f R1  : 8037ae9c R2  : fffffffb R3  : 00000020
[  109.868000] R4  : ffffffff R5  : 0001503f R6  : 80000000 R7  : 00000002
[  109.868000] R8  : 8037aeb4 R9  : 00000002 R10 : 80c1b810 R11 : 8064b398
[  109.868000] R12 : 800371e4 R13 : 00000000 R14 : 80647e7c
[  109.868000] MACH: 0000ae3d MACL: ed1b4bbe GBR : 2957d2b0 PR  : 8037aecc
[  109.868000] 
[  109.868000] Call trace:
[  109.868000]  [<8037b19c>] intc_disable+0x54/0x6c
[  109.868000]  [<8037b1e0>] intc_mask_ack+0x2c/0xbc
[  109.868000]  [<8004dfe8>] handle_level_irq+0x2c/0x140
[  109.868000]  [<8004a29e>] generic_handle_irq+0x1e/0x34
[  109.868000]  [<800371e4>] arch_cpu_idle_enter+0x0/0xc
[  109.868000]  [<804a5b7c>] do_IRQ+0x2c/0x58
[  109.868000]  [<800070f4>] ret_from_irq+0x0/0x10
[  109.868000]  [<800371f0>] arch_cpu_idle_exit+0x0/0x3c
[  109.868000]  [<804a5b50>] do_IRQ+0x0/0x58
[  109.868000]  [<80002c08>] arch_local_irq_restore+0x0/0x2c
[  109.868000]  [<800371f0>] arch_cpu_idle_exit+0x0/0x3c
[  109.868000]  [<800371e4>] arch_cpu_idle_enter+0x0/0xc
[  109.868000]  [<800029ce>] default_idle+0x1a/0x38
[  109.868000]  [<800029cc>] default_idle+0x18/0x38
[  109.868000]  [<80002a00>] arch_cpu_idle+0xc/0x18
[  109.868000]  [<804a5492>] default_idle_call+0x36/0x58
[  109.868000]  [<800373d6>] do_idle+0x1aa/0x240
[  109.868000]  [<804a1342>] schedule+0x4e/0xd8
[  109.868000]  [<80037616>] cpu_startup_entry+0x16/0x24
[  109.868000]  [<80013854>] kernel_thread+0x0/0x70
[  109.868000]  [<80052c38>] __rcu_read_lock+0x0/0x1c
[  109.868000]  [<8002b2e8>] find_task_by_pid_ns+0x0/0x30
[  109.868000]  [<80054e8c>] __rcu_read_unlock+0x0/0x3c
[  109.868000]  [<8003722c>] do_idle+0x0/0x240
[  109.868000]  [<8049e61a>] rest_init+0x6e/0xc4
[  109.868000]  [<806ba57c>] arch_call_rest_init+0xa/0x16
[  109.868000]  [<80002c08>] arch_local_irq_restore+0x0/0x2c
[  109.868000]  [<80498fdc>] printk+0x0/0x50
[  109.868000]  [<806bab0a>] start_kernel+0x550/0x5aa
[  109.868000]  [<806ba22c>] unknown_bootoption+0x0/0x178
[  109.868000]  [<80002132>] _stext+0x132/0x140
[  109.868000] 
[  109.868000] Process: swapper (pid: 0, stack limit = 6bcce4da)
[  109.868000] Stack: (0x80647e78 to 0x80648000)
[  109.868000] 7e60:                                                       80647e7c 8037b19c 
[  109.868000] 7e80: 8037b1e0 80647e90 80c10d80 1212183f 8004dfe8 80647ea4 80c1b860 80c1b810 
[  109.868000] 7ea0: 80c1b800 8004a29e 80647ec0 800371e4 8064b398 00000000 00000002 806994e4 
[  109.868000] 7ec0: 804a5b7c 80647ec8 800070f4 80647f38 800371f0 804a5b50 400080f1 00006854 
[  109.868000] 7ee0: 00000000 50008000 50008001 00000000 00000019 80647ec4 80690100 00000000 
[  109.868000] 7f00: 80002c08 800371f0 8064b398 800371e4 00000000 80647f38 80647f38 800029ce 
[  109.868000] 7f20: 800029cc 50008000 2957d2b0 000044bc 5e6adb2c ffffffff 80002a00 80647f40 
[  109.868000] 7f40: 804a5492 80647f48 800373d6 80647f50 6a1d684d 804a1342 80647f74 6a1d684d 
[  109.868000] 7f60: 80037616 80647f80 80013854 80052c38 806569e0 8002b2e8 80054e8c 8003722c 
[  109.868000] 7f80: 8049e61a 80647f8c 00000002 806ba57c 80647fac 806d9968 806e1008 8064b24c 
[  109.868000] 7fa0: 80002c08 8064da0c 80498fdc 806bab0a 80647fb4 ffffffff ffffffff 00000000 
[  109.868000] 7fc0: 806ba22c 0000002d 00000000 806e1020 806d9968 806d9968 6a1d684d 00000000 
[  109.868000] 7fe0: 80002132 8feffb00 8ff7ff80 00000400 ff000100 00000008 00000010 40000100 
[  110.216000] ---[ end trace 833264b72c03d2ce ]---
[  110.220000] Kernel panic - not syncing: Fatal exception in interrupt
[  110.220000] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
