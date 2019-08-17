Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E65B91302
	for <lists+linux-sh@lfdr.de>; Sat, 17 Aug 2019 23:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfHQVNd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 17 Aug 2019 17:13:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40167 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHQVNc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 17 Aug 2019 17:13:32 -0400
Received: by mail-io1-f66.google.com with SMTP id t6so13240161ios.7
        for <linux-sh@vger.kernel.org>; Sat, 17 Aug 2019 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=AL7Xo7O/pQKUNo42UZGV/pFyRrG+zXus+zNwtHz5W9I=;
        b=deCansAVyhf6TTfeW7XM1FrkPiKpOaNXepy8EGROiXSzE+3idZaMvhF5loMAvVUBWX
         8qQ/Du7og2kbtPPvNhwLzZWiLrJ6qrhbn+d5EChT/4JvkGHH56R9YNddG7eJVGTYNEBI
         QoW6LnQrYgb2yLLTPECkaOYkSk37tjvRRkXYTyrjo+mx8C8Hjp4wFkBmcQM76Qw2K1Eg
         ffQxDHpTJlgpIZyGleaux3hEVOCiLhnzK0XmbrN4f55/9P1fEgrVr+DnimObxh+7zRlK
         4Yo+DuQEB/pAtSat0tnGiWfIUMs/ueCHA8h7mqK5WJbFPHuU46Zze5HXtHZ3DWU/vE+t
         EMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=AL7Xo7O/pQKUNo42UZGV/pFyRrG+zXus+zNwtHz5W9I=;
        b=m5iHR1rNZvLpZUW/gwQoodm7+3iEjORtkb0/VPujtHABXNJsBGHTz9+G/XeWuy2o6r
         UwlzdArVeNbsRv4c1cRjRAVLREa90YBqj9wuyqBH009ytucx6fqF4DlQMh6NOY5CmBQ5
         4iseSlcrn/q+z3qcIr8vZm61LxUqLwn1tbYKjREKTNVVdt/S38Og57vrV//U46CRcvWf
         ASgOCVucplGve9rMerkc+5/iqSGo8fQVDzKWEu4eMXUy1cVa3p5LECz+XqGhek7DzEaI
         sal3FtwxAHk11hywWnvQ+FXMZ7FGP0+OOP7ZxcfJP9HaSyJ9g4wpT3ENwlUdbju+lwna
         QcLA==
X-Gm-Message-State: APjAAAWkOPnOOpOqGkGJAGEwIpz2l6kmzeqzgFIJ4HU0PqbcmSeeNQqc
        hUI2IJ0Gem5HokKNzmbSAzzI6g==
X-Google-Smtp-Source: APXvYqxnIBRMl9c73z9hygAzKDBeii4Mh/dKY7KAWMtxtYJjPF4p6Ki6tTxIg+HAQN4yYW8gNJPyfw==
X-Received: by 2002:a02:a492:: with SMTP id d18mr19165200jam.27.1566076411809;
        Sat, 17 Aug 2019 14:13:31 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id i9sm6980372ioe.35.2019.08.17.14.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:13:31 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:13:30 -0700 (PDT)
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
Subject: Re: [PATCH 17/26] arch: rely on asm-generic/io.h for default ioremap_*
 definitions
In-Reply-To: <20190817073253.27819-18-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171412560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-18-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Various architectures that use asm-generic/io.h still defined their
> own default versions of ioremap_nocache, ioremap_wt and ioremap_wc
> that point back to plain ioremap directly or indirectly.  Remove these
> definitions and rely on asm-generic/io.h instead.  For this to work
> the backup ioremap_* defintions needs to be changed to purely cpp
> macros instea of inlines to cover for architectures like openrisc
> that only define ioremap after including <asm-generic/io.h>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul
