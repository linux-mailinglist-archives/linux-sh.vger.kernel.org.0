Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFB9431ABF
	for <lists+linux-sh@lfdr.de>; Mon, 18 Oct 2021 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhJRN3G (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 18 Oct 2021 09:29:06 -0400
Received: from foss.arm.com ([217.140.110.172]:37362 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJRN20 (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Mon, 18 Oct 2021 09:28:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58926101E;
        Mon, 18 Oct 2021 06:26:15 -0700 (PDT)
Received: from bogus (unknown [10.57.25.56])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13AC93F73D;
        Mon, 18 Oct 2021 06:26:07 -0700 (PDT)
Date:   Mon, 18 Oct 2021 14:26:05 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, x86@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/12] of: Add of_get_cpu_hwid() to read hardware ID from
 CPU nodes
Message-ID: <20211018132605.jh2huoxmywjcr5xa@bogus>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-2-robh@kernel.org>
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Oct 06, 2021 at 11:43:21AM -0500, Rob Herring wrote:
> There are various open coded implementions parsing the CPU node 'reg'
> property which contains the CPU's hardware ID. Introduce a new function,
> of_get_cpu_hwid(), to read the hardware ID.
>
> All the callers should be DT only code, so no need for an empty
> function.
>

Thanks for doing this. I postponed and forgot about this though I had
planned for this when I touched code around this.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
