Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045EA1B8798
	for <lists+linux-sh@lfdr.de>; Sat, 25 Apr 2020 18:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgDYQAm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 25 Apr 2020 12:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgDYQAm (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 25 Apr 2020 12:00:42 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE7BC09B04E
        for <linux-sh@vger.kernel.org>; Sat, 25 Apr 2020 09:00:41 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 72so18161095otu.1
        for <linux-sh@vger.kernel.org>; Sat, 25 Apr 2020 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aJowGujbLx9YHoHGEkmT5nMHlO6tS2Ov2OkuY7Bp1BA=;
        b=l3Bv7Oj5K54EczsINK6LMtMkBrM8JRDuQVy6qvWE0aLQG+12c06xYGyLwrdCDAeG+E
         U9Qy9NYrstNZtSmyifXYYIpz8xAHeYkfQ4zi0O4HWatXLreenCK0FEV7PtkRCMnr/IDh
         fxZFHa427ONVTI49NJqhU+YImD272y/laUDW+BoWFME1R2jIa7rwctETIj1Cm8Us0vWF
         cPc7igzFkbi5PoBiwFL9toQ7XeBWW5BIUMe2+zsITtqG5dAOhnazX9nkF8H1UP5h/Q34
         O9m7hpPF8Pncm/1bFwi9lHEFdxeBnhhHc5JcNCojfk7X5jsxAkbZOYYcvMb+h3xPhqz8
         /kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aJowGujbLx9YHoHGEkmT5nMHlO6tS2Ov2OkuY7Bp1BA=;
        b=Q8EwCAD3D4XYKfPOZv7ssrSliP2yQM9U60q99uOllyKHTvbtAej+xBfMeM14QsEZgc
         s62BpxW4g7QJj7bv8JEP4E57uw1GFv+p57Kj7fouKdLOdqhIT1y0Zrspfn0zbjlvDCqr
         weYltjmOtvathlfRVxEIHpJ2z6iZBQyjbYBo9ci4GO8upmF1f8Xp8rDp+Jq2h7HTdl1P
         /Rtu0I+htBD1uSFWBqIbS6JKWwyMwQOKx4AMuLoMTeutspF3Gm5KJaBQQ+shFGPaEwoN
         VpObmVMN4WozOqQJSOl3OMI7RjTgzarsAclkQhVGa58Vl5c3uL3hklByJ/N8iLw2PXQ3
         hKQg==
X-Gm-Message-State: AGi0PuZ4LhP+N2gKHTf386/8hVdSnd9sc8p0GjdPmJSxelktv8dBMvRJ
        +t6YRIDS8l34c3zWho4oc/x0cHFx+wQ=
X-Google-Smtp-Source: APiQypIwBOSv8g6UXUE+etBF+ux/xNwS0QmCD3XxU/Hx2+E6+6uBzYCaWzUexCqyaeUOTvlPOhElkQ==
X-Received: by 2002:aca:b2d6:: with SMTP id b205mr10968150oif.137.1587830441059;
        Sat, 25 Apr 2020 09:00:41 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id k205sm2545514oih.15.2020.04.25.09.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 09:00:40 -0700 (PDT)
Subject: Re: [PATCHv3 31/50] sh: Add loglvl to printk_address()
To:     Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Safonov <dima@arista.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
References: <20200418201944.482088-1-dima@arista.com>
 <20200418201944.482088-32-dima@arista.com>
 <20200420155237.1b6532c0d0c6940fccd1b762@linux-foundation.org>
From:   Rob Landley <rob@landley.net>
Message-ID: <92cf0382-bdb4-6966-5a77-2ade50fdc451@landley.net>
Date:   Sat, 25 Apr 2020 11:06:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420155237.1b6532c0d0c6940fccd1b762@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 4/20/20 5:52 PM, Andrew Morton wrote:
> I guess it doesn't matter much, as sh seems to be rather dead.

The j-core guys are using it.

Rob
