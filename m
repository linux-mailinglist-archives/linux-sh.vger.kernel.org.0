Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4234172DFC9
	for <lists+linux-sh@lfdr.de>; Tue, 13 Jun 2023 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241717AbjFMKja (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 13 Jun 2023 06:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241712AbjFMKj2 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 13 Jun 2023 06:39:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3F31B8
        for <linux-sh@vger.kernel.org>; Tue, 13 Jun 2023 03:39:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso36705965e9.0
        for <linux-sh@vger.kernel.org>; Tue, 13 Jun 2023 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652757; x=1689244757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xaDlJQeO3hH2pBiVZb8UiGCEOJUjl7lCHpBv/xucTak=;
        b=cpvNcFVPA6aGsusVPFb6hFFXQz+6VU2R47CMwhknwlsvy7rIY6Rk+tMn02L9wADk4J
         dtcDrAclhTphN3RmE89KGiy/Z0axMKS5LBRKNXku1MLQ6GEU9yGjd+kU+if4mdozIid7
         52AGaYdCsHmOUPFAhE1ldVMtIhfVu3VgCnQO0zPgDEVuiNZam0DkOX5JJILPJdtaOQQd
         j6O33lazYUT02LUBC2KJRy1LUMNEol9eEIRGr2MH6aIBMLahrL3J0XAhnLlEajROAVRs
         VB2tNLcH6Wm68U77Q1nN6s95j5W4YLQKkXWY0s1kDZ4kiRiqlMbOhAFVrzm/9SIUz7l3
         JZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652757; x=1689244757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaDlJQeO3hH2pBiVZb8UiGCEOJUjl7lCHpBv/xucTak=;
        b=BM676P4/ANtKvX8w5jKKZV3KSbzStUcLM//SJaXFNbo5n6KKwMH6vhh1P201BaKqRP
         8N4X2UGbUjcbljnv5hRPz0JyX7NwYoOJwrZCDzfp6p04WL6HMEjZaKm+cfJKhEfs6OfQ
         Ymkr5N9X49xSJpv1tQxldQ6iGowltM2ngl0k9dpjrSlfe/Skwg5pQWFOOOKL6B99v3F/
         olaD4NR84VhzULoOxJ33Ir8pKgTHESthqmfufjILtglkPQmw4THX17haygGkflTu25mg
         z7IsIUjSyvMYRUz+MmPYfpKzVfoC/i/hvxegBObC6pu0arhyngWRM7OMaJOlIADMG+xP
         kOxA==
X-Gm-Message-State: AC+VfDzX60OqIFrB4rmcDi+jJ+i569e+Pf2ghVYF6b7N8ziugj/Qa1D2
        8E77yQSCsNb//slu58vMJNluDQ==
X-Google-Smtp-Source: ACHHUZ5HyOHzcbog/cShZpBLWaDR0+w362TXtcaS+8aBiQA9iPPqkCG+m8GPuzzU6GS2TikA9g34VA==
X-Received: by 2002:a05:600c:518d:b0:3f8:643:182d with SMTP id fa13-20020a05600c518d00b003f80643182dmr9843519wmb.16.1686652757444;
        Tue, 13 Jun 2023 03:39:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb51000000b00307bc4e39e5sm14976537wrs.117.2023.06.13.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:39:17 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:39:15 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        jingoohan1@gmail.com, dan.carpenter@linaro.org,
        michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 04/38] backlight/gpio_backlight: Rename field 'fbdev'
 to 'dev'
Message-ID: <20230613103915.GD169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-5-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Jun 12, 2023 at 04:07:42PM +0200, Thomas Zimmermann wrote:
> Rename the field 'fbdev' in struct gpio_backlight_platform_data and
> struct gpio_backlight to 'dev', as they store pointers to the Linux
> platform device; not the fbdev device. Makes the code easier to
> understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
