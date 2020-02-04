Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155C5151C01
	for <lists+linux-sh@lfdr.de>; Tue,  4 Feb 2020 15:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgBDOTG (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Feb 2020 09:19:06 -0500
Received: from malenstwo.juszkiewicz.com.pl ([37.187.99.30]:59116 "EHLO
        malenstwo.juszkiewicz.com.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727218AbgBDOTG (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Feb 2020 09:19:06 -0500
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Feb 2020 09:19:05 EST
Received: from localhost (localhost [127.0.0.1])
        by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTP id 99740C0246;
        Tue,  4 Feb 2020 15:13:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from malenstwo.juszkiewicz.com.pl ([127.0.0.1])
        by localhost (mail.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j2HGJxffg3yA; Tue,  4 Feb 2020 15:13:25 +0100 (CET)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
        by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3C80CC0139;
        Tue,  4 Feb 2020 15:13:24 +0100 (CET)
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
From:   Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Subject: No newer system calls for SuperH64?
Message-ID: <939c9260-213f-cfd7-f81a-e9b635a6aa10@juszkiewicz.com.pl>
Date:   Tue, 4 Feb 2020 15:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

I am maintaining system calls table [1] which shows which system call
has which number on all architectures supported by Linux kernel
(including those removed in last years).

1. https://fedora.juszkiewicz.com.pl/syscalls.html

Today I have noticed that SH64 supports system calls up to 393 which is
pwritev2() one. None of later calls is supported in mainline 5.6-rc tree.

Is it an error in kernel headers or it is true? Or maybe it is an error
in my script but it works fine for other architectures.

Note: I do not own nor plan to own SuperH64 hardware. I do not even
remember where it was used. Just noticed weird state of it.

Affected system calls are:

fsconfig
fsmount
fsopen
fspick
io_uring_enter
io_uring_register
io_uring_setup
move_mount
openat2
open_tree
pidfd_getfd
pidfd_open
pidfd_send_signal
pkey_alloc
pkey_free
pkey_mprotect
rseq
statx
