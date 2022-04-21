Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8211F509413
	for <lists+linux-sh@lfdr.de>; Thu, 21 Apr 2022 02:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383378AbiDUAJd (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 20 Apr 2022 20:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383374AbiDUAJa (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 20 Apr 2022 20:09:30 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CD114015
        for <linux-sh@vger.kernel.org>; Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id e62-20020a17090a6fc400b001d2cd8e9b0aso3555089pjk.5
        for <linux-sh@vger.kernel.org>; Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtZMfNzGeYhMURXLY1XiggmvzmJ7zBGBwSixzSCqueo=;
        b=eBgz4Jdj3KpVL+L3DcDIANI9sXH884X7GMcuZDA3daEecFWtjgBYouZek6J44gsx+L
         JmUKgRpTPAV6vqC+BoeegczlKhnGF7v6OxI0Cy6QNJk0m4GuTizslzCIWzTcoZ/FMPqd
         QgpxrMCY8OCJxCNXDrbMqD2dSJMnxvYGTiUyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtZMfNzGeYhMURXLY1XiggmvzmJ7zBGBwSixzSCqueo=;
        b=XqIIHcZ+IDzW1CxsKjLOiFvN20lr+Yc5zynSqgZqSlZHLICORIRLr6trP58GxAAxmK
         1f3kFtVc3RjRH9JzcOuks5H4+rW0taFwJ/hgWE5hYO91/xWkFmUfKqrm8JvddqpGNCS+
         ua//9R2YhfzCyj1FBqlgv7AYMeFM+G+Crj6b36E3RzyTVjrd5hSAcYW+1S3UpXkgkQ5s
         8IPq2+BQpd3XDaRgNJfFT35oq9Zb3x7FD+9lekLvrCOU+XMQvY5jZQvMKWeU9I9zaHx9
         gRhDGDBCkPCGuWgXJapuZBgGL65kH21Ovg5vN0HfYqxwD142mvNzA8eBjEzqWlYu1I6J
         zz4Q==
X-Gm-Message-State: AOAM532aLvKwjjKszX/rmvffVKp/1EptFPDBUXdxRpiLjPwDk/6X9VXw
        dKh7yKNG5ssEPJjn/QHwiFzkiQ==
X-Google-Smtp-Source: ABdhPJwUZ02o3o5MBT8n6MGMrt+xN1PWAFYVkoIs5DF8SnTYZwrpdZebjT8ZyRj80drR/SDxakHSUA==
X-Received: by 2002:a17:902:ba8e:b0:151:ed65:fda4 with SMTP id k14-20020a170902ba8e00b00151ed65fda4mr23129589pls.127.1650499602483;
        Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f19-20020a17090a639300b001cd4989febasm320094pjj.6.2022.04.20.17.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     ebiederm@xmission.com
Cc:     Kees Cook <keescook@chromium.org>,
        linux-arm-kernel@lists.infradead.org, dalias@libc.org,
        aou@eecs.berkeley.edu, gerg@linux-m68k.org, geert@linux-m68k.org,
        vapier@gentoo.org, palmer@dabbelt.com,
        damien.lemoal@opensource.wdc.com, linux-m68k@lists.linux-m68k.org,
        linux-riscv@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
        stable@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        paul.walmsley@sifive.com, ysato@users.sourceforge.jp,
        Niklas.Cassel@wdc.com, linux-sh@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org
Subject: Re: (subset) [PATCH] binfmt_flat: Remove shared library support
Date:   Wed, 20 Apr 2022 17:05:47 -0700
Message-Id: <165049954506.2420506.9909431091128831748.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com> <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com> <Yli8voX7hw3EZ7E/@x1-carbon> <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org> <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 20 Apr 2022 09:58:03 -0500, Eric W. Biederman wrote:
> In a recent discussion[1] it was reported that the binfmt_flat library
> support was only ever used on m68k and even on m68k has not been used
> in a very long time.
> 
> The structure of binfmt_flat is different from all of the other binfmt
> implementations becasue of this shared library support and it made
> life and code review more effort when I refactored the code in fs/exec.c.
> 
> [...]

It seems like there is agreement that the shared library support is
unused, so let's test that assumption. :)

With typos fixed up, applied to for-next/execve, thanks!

[1/1] binfmt_flat: Remove shared library support
      https://git.kernel.org/kees/c/c85b5d88951b

-- 
Kees Cook

