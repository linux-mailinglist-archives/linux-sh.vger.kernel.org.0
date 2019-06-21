Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA6B4EAE4
	for <lists+linux-sh@lfdr.de>; Fri, 21 Jun 2019 16:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfFUOld (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 21 Jun 2019 10:41:33 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34422 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfFUOld (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 21 Jun 2019 10:41:33 -0400
Received: by mail-qt1-f193.google.com with SMTP id m29so7178853qtu.1
        for <linux-sh@vger.kernel.org>; Fri, 21 Jun 2019 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iAefoNx0q/97YiPDebPSTk9gILnOd0FXIWcUIRJLLtA=;
        b=JBhYcKNbnw5KS/Bw3jUGnXGizAYOGrGCynlCyAlg63WK1n8IqOySZ1+bye3/YiT63n
         v8/sbGh4AD1MHRynheN2Dlq8lFKIq7z1NImXxzvLdoGCc7lemxe5AEO2L8rqLF3E00oD
         oaCz+g/xDkcmsm0KQgBXxPRK1i/pBAcltUXftd0yNlKSLRQGkTTISqj5EmoKiqW1z/7C
         xGMPI7hpBo4aEfjJYbvL1QdYdl0bqL8gAEgqgeQ8mr+Rnu3ZBMhGaV4qz/zk8iv9SFhb
         jZCzIqRVkaT3gufXwch0VFa0geY+UKfMoNAoGmczoezyVySF3//gJOB7bFyrvTarIu6t
         jP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iAefoNx0q/97YiPDebPSTk9gILnOd0FXIWcUIRJLLtA=;
        b=ZlpD3jKT2N8CUiAjmtfMz77urFqKiF40vd0CXVbufL1u4FN7RySRhS2WNETo+cSHJO
         Ywya+nwWkdKUhQkYl3myx1rayJwtQHW8aTTBy4m1g148QZWdtOghh7mAqA1vOw+CICVh
         3kR7L+c7bxnHje9wBLZKDStG2uYej6B+YCkbXYiTBctREjssiAnJmAyOccVTrjM8vDsb
         d9FVq3Xij5+RC2P0YCPfCqzM6reOADKw58VSnbduS+47CHTJ4/TF+SZarFBCrOSJ0cU9
         SV6FUQ+I7z05bK6nTBIxjy8Hi1JBfHdEFrxC6vuS6YsE2OmFH4WK6tD8UVHRNDRqPsFj
         LHWQ==
X-Gm-Message-State: APjAAAUbWLmbACx1W7CFXZKnWdNoDjg/lkrma6I3YSMB7DhApEPodsrY
        M7yfE0erROvwekBgnRc0v6pLsQ==
X-Google-Smtp-Source: APXvYqwAiNjv+b7qPtfzYMe/a9zWSjQhOq9v3skvi7StNK2ILH/OsN4mGdlL0jsjEcF4n4D7/7paYA==
X-Received: by 2002:a0c:b12b:: with SMTP id q40mr15375817qvc.0.1561128092068;
        Fri, 21 Jun 2019 07:41:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id c55sm1767604qtk.53.2019.06.21.07.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 07:41:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heKjL-0000un-67; Fri, 21 Jun 2019 11:41:31 -0300
Date:   Fri, 21 Jun 2019 11:41:31 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages* implementations
Message-ID: <20190621144131.GQ19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-12-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:57PM +0200, Christoph Hellwig wrote:
> @@ -2168,7 +2221,7 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
>   */
>  static bool gup_fast_permitted(unsigned long start, unsigned long end)
>  {
> -	return true;
> +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;

The ?: is needed with IS_ENABLED?

>  }
>  #endif

Oh, you fixed the util.c this way instead of the headerfile
#ifdef..

I'd suggest to revise this block a tiny bit:

-#ifndef gup_fast_permitted
+#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
 /*
  * Check if it's allowed to use __get_user_pages_fast() for the range, or
  * we need to fall back to the slow version:
  */
-bool gup_fast_permitted(unsigned long start, int nr_pages)
+static bool gup_fast_permitted(unsigned long start, int nr_pages)
 {

Just in case some future arch code mismatches the header and kconfig..

Regards,
Jason
