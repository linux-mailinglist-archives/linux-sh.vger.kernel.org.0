Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A69E9B88
	for <lists+linux-sh@lfdr.de>; Wed, 30 Oct 2019 13:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfJ3M2h (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 30 Oct 2019 08:28:37 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33350 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfJ3M2g (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 30 Oct 2019 08:28:36 -0400
Received: by mail-qk1-f196.google.com with SMTP id 71so2522453qkl.0
        for <linux-sh@vger.kernel.org>; Wed, 30 Oct 2019 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=RWzCO2fHz2qafmXTHqGMfw05hQL7JfU2b99nb6qM24Q=;
        b=YpggYXtaQ4inUnm3g+hl6gwyTwkQanG/b7sCQFEMdYuTGvIMqBhUMY5gZMcFQHZy6y
         cF0LTgi2OwwLPaUTj9KImOSh0RdB/s2+eDRRFwc6dFQgHXUdn8VGNoe/v116d+Uf2avP
         8dpNHvP2tc1HuM1DWyROKsk4LmIy/FUIvO+FxNMftXJ8zmI7dp2oeqj6SALQVh6sczCU
         QLCoJjUbJqxutPI4YU62/TNiozHON3X0I6wT/vcSg5CGUUz1VTKzyktoFVt9Ba/39ywv
         Oda72R5tMy7ZDaofo/wx+pheOEBl3sltgQCcw4tCvJG2zID09Q6IETVjPUzevh+cU+cc
         mGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=RWzCO2fHz2qafmXTHqGMfw05hQL7JfU2b99nb6qM24Q=;
        b=NM4dvk2/X5d6PP1psJ5MXULfg4fbKFU653ktVOVKm1QnIKWtOBdQd51+Z5+4t9bEcq
         pk0u+W/7u2b72/Dsm6Lk0x0+1pKg6YtHTzWEW9CG1+tdpj2DGEqqeFMcuwZLX8HQ+pWZ
         cSxUsvo3UKbMsgFFXmHbjd6cZNZ4Cu6v/69xBehmv3Wm7xR6HGI65iDfOthuZMm0rhtD
         PpgPGhiE6uoWr7BxLuA6ZUbSwJg9Zkx8rLTXv6s0OCcCRInomAm3UhnKCM5tOIF0gEO6
         QQk0XUyr14HUBHqgIlhm7+b4Yu/XwaLTwMT8X8r+aFEWGbpAwE2ZEvyQ+TYIjNLdlhZD
         ctXw==
X-Gm-Message-State: APjAAAXak1acnSZgKl3J1bU6L/+VaF9KNZG7cfsUU7Bh9hHTKjtSg0yk
        y8cbsPLCp6BKhhquT5D0Rq6S9w==
X-Google-Smtp-Source: APXvYqxfSjuCvheOWaJ51K5TomgwXceiXxnFoN8qONSyZ8bZ1yz8oM1frmf6sjZVcs+WXO2ot94uyQ==
X-Received: by 2002:a37:4ed5:: with SMTP id c204mr26408804qkb.41.1572438514395;
        Wed, 30 Oct 2019 05:28:34 -0700 (PDT)
Received: from ?IPv6:2600:1000:b063:e143:e15a:1807:6e04:c401? ([2600:1000:b063:e143:e15a:1807:6e04:c401])
        by smtp.gmail.com with ESMTPSA id s42sm557qtk.60.2019.10.30.05.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 05:28:33 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date:   Wed, 30 Oct 2019 08:28:31 -0400
Message-Id: <1DA7B9E0-4BE2-4A9C-9B33-20EEFE3B5069@lca.pw>
References: <20191030102800.GX4097@hirez.programming.kicks-ass.net>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com,
        axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, rafael@kernel.org,
        gregkh@linuxfoundation.org, bhelgaas@google.com,
        linux-pci@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org,
        linux-acpi@vger.kernel.org
In-Reply-To: <20191030102800.GX4097@hirez.programming.kicks-ass.net>
To:     Peter Zijlstra <peterz@infradead.org>
X-Mailer: iPhone Mail (17A878)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



> On Oct 30, 2019, at 6:28 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>=20
> It only makes 'wild' guesses when the BIOS is shit and it complains
> about that.
>=20
> Or do you like you BIOS broken?

Agree. It is the garbage in and garbage out. No need to complicate the exist=
ing code further.=
