Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122ED9133A
	for <lists+linux-sh@lfdr.de>; Sat, 17 Aug 2019 23:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfHQV1E (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 17 Aug 2019 17:27:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45636 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfHQV1E (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 17 Aug 2019 17:27:04 -0400
Received: by mail-io1-f67.google.com with SMTP id t3so13241863ioj.12
        for <linux-sh@vger.kernel.org>; Sat, 17 Aug 2019 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
        b=hov3AcxQ6M0mcpBwyir6wMfwuFoM/2pj4MlCmv+T09knj2Mmqt8UJz4bLEelDU0dEY
         q35RSput0GqdXzjDl39iW6e96fi6ZvYG7hVSedcruoQ/r2si3vSEQf+S3NbKo/JWKMFz
         l1Pncvs1WA7x9utXPIZU7hNH8C4hBPXAZA2OymhT4WgZagRVCnEht474gNpFzrJa6Xjg
         FvMhl4KIMbZ3FFtCmeGSVrAzUl96LhDRs8lD2zGj/KFGyr4hodIlFUOwRQsA6Da7S+zZ
         ouRU8O2CZBVhaSm1B4pGrx6QOwfw1b8VOQgHVh5JaC0Jm1cxHTFnZdggwnO1D5Ig+YJ1
         Lkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
        b=OdKItB/sMQmVTwiSpzzThWfG+rVtcKny6wdNmM+RFzN7xefTF5CdXbjrjAhKH7oDPS
         0Jddl5CM+3eXiF6gjlzvg0VHm+xOuOqxboRTsrVduezyZMLtQ93ZzXD5NQJ4B3oWFq1m
         +IG8Am4xz4Nab1A/awgEnrth/85GXUz0iQkrMMRJsTF/rJf7Ni37hNpvFEM6QAuGT/td
         gzWl8IpyyICULeuEFYArVa8nWvE2y6P+Bs7m6gxG3luQdmCoz2oTbHUU11bhhEUO1gaX
         KNO8MU6/hKvsZR9HhFRcsrQkCvTtBuic0zR5JzSnb6SZDFcGBcIrx0nRzVNwZHUjPI7e
         y6VA==
X-Gm-Message-State: APjAAAVYVnCTRZ0fzoAoaXNTYsp2eDPWm8MALZ0hFYGKB4LYmfQU23Wu
        6ptekv0ul6s0c9psdUlxe+8RHw==
X-Google-Smtp-Source: APXvYqwKE/3SM/rVpl4teujkfN9+UilDZaKhxrZT/14FwdMPovoCNf3aYcPot40i7G8y5JQK54ukCg==
X-Received: by 2002:a6b:b9c2:: with SMTP id j185mr15509819iof.148.1566077223658;
        Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id v23sm11488293ioh.58.2019.08.17.14.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:27:02 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Christoph Hellwig <hch@lst.de>
cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/26] asm-generic: don't provide __ioremap
In-Reply-To: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908171426390.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-15-hch@lst.de> <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, 17 Aug 2019, Paul Walmsley wrote:

> Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv

This ack is superfluous since the patch doesn't touch arch/riscv; feel 
free to drop it


- Paul
