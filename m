Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D8EC9C42
	for <lists+linux-sh@lfdr.de>; Thu,  3 Oct 2019 12:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbfJCK2N (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 3 Oct 2019 06:28:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34206 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfJCK2N (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 3 Oct 2019 06:28:13 -0400
Received: by mail-wr1-f66.google.com with SMTP id a11so2382812wrx.1
        for <linux-sh@vger.kernel.org>; Thu, 03 Oct 2019 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8A0SaEYYe0J2Jik12kIYDJK29NXY+H6u1d3B57ETVtU=;
        b=b2BT52Hp4jqhRvrAAbkSJwgl3k/crr/1cyvLfQmF8o178ZBQZD0srr8mKn6LyCuQwo
         F6I7lNHhkeYyp3Z/e7UXU0qSmsD2FoOe0zZ8QrRe8MNEqRnZgARvAq6pzTFj8nIOMHS7
         pW3ylXfbZsTieEyJzX6780I6YGT+38ccKJypTtKlnT7UsZR5SJQu9oVvhDQYA7dSlU4D
         3ww5GhcNMkEosTczmqkNNwWw6/DqKLG+afojn1q0gETScKVbBABjNODWLryU6yjTVcKE
         Frdr3QT+TrMdmDW0V1bki1i/VqP2++yXCiTqtxFkL6TQBQAmSXbrwtloO4oxlOGRRLF/
         jW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8A0SaEYYe0J2Jik12kIYDJK29NXY+H6u1d3B57ETVtU=;
        b=DTteH+qJq6U0OxFvZHLUOlKStX/CNDTJo0mm6ulcOq9vNRteyp7B/GneEw/pMsJ/YI
         JghQum/HqBzUjqQ7DaKvI1qeRY3dbPBcsj946LtGTwdeqmS6u6RHyhjeeiFyfMMo8NOu
         WWZKeXXlTGWaPnANyBS7jXoeIEI7t/ApL/45QrS7lyUfHO8YuWqKiO3CjQiPEkVtWjCv
         jDUIZOEozd6+kOOOS2EH7Z91Ha3YhAfIkZlkjjOxgK3Uoxmm0Q+9qVU5B4zKjEPapphU
         s4NFj6u0yYpKZcjZr2TD6Xia/TmPqdPWcVQV6m7CeBhdJB0wNSo33bPZABwEs3gJ6TzT
         ZbVQ==
X-Gm-Message-State: APjAAAXXoHtDFZcX6wVbrEgx6Qx2KIkplsKM9tNyDjvbNhH0kh3j+xn1
        DCKoEPNj6KqFXFHQZqXg/1P8Cw==
X-Google-Smtp-Source: APXvYqxbnqYYFrgiX8wxlXj6DtHm6R9O9KqBlknamHm+7r9SOjdm3CHXdDjccGSLPMvVjP428rGflA==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr6031099wrw.294.1570098491906;
        Thu, 03 Oct 2019 03:28:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x16sm1962479wrl.32.2019.10.03.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 03:28:11 -0700 (PDT)
Date:   Thu, 3 Oct 2019 11:28:09 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] sh: kgdb: fix an implicit fallthrough warning
Message-ID: <20191003102809.ymtwu33ouzipyecz@holly.lan>
References: <20191002154756.18924-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002154756.18924-1-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, Oct 02, 2019 at 05:47:56PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The switch case in arch/sh/kernel/kgdb.c can fallthrough. Add an
> appropriate comment.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  arch/sh/kernel/kgdb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/kernel/kgdb.c b/arch/sh/kernel/kgdb.c
> index 6d61f8cf4c13..0d5f3c9d52f3 100644
> --- a/arch/sh/kernel/kgdb.c
> +++ b/arch/sh/kernel/kgdb.c
> @@ -266,6 +266,7 @@ int kgdb_arch_handle_exception(int e_vector, int signo, int err_code,
>  		ptr = &remcomInBuffer[1];
>  		if (kgdb_hex2long(&ptr, &addr))
>  			linux_regs->pc = addr;
> +		/* fallthrough */
>  	case 'D':
>  	case 'k':
>  		atomic_set(&kgdb_cpu_doing_single_step, -1);
> -- 
> 2.23.0
> 
