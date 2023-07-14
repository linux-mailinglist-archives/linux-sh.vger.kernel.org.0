Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45ED7537CC
	for <lists+linux-sh@lfdr.de>; Fri, 14 Jul 2023 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbjGNKSS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 14 Jul 2023 06:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbjGNKSR (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 14 Jul 2023 06:18:17 -0400
Received: from out-30.mta0.migadu.com (out-30.mta0.migadu.com [IPv6:2001:41d0:1004:224b::1e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350CC2701
        for <linux-sh@vger.kernel.org>; Fri, 14 Jul 2023 03:18:16 -0700 (PDT)
Message-ID: <809f8391-c9e2-4432-12ec-9921360e3c8e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689329891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDi5jHcc6JX2dM3REdw3Ft0fz55Drq20U6og3UsNXvQ=;
        b=xALtXC8/ROHasKXZMaOLj0zsiUq3d6orGjz1eoTZ1jYoIfLxy+er+4aCKpcbd9XxK/72Fv
        KRVRN8cp4ei0ETtfaMci8s/7BCxay4Kgtrw1eY/mHz/QrTn8JRVj36+RIQUzGxVU6fdQ+Q
        u1T/iNhdJHA2X2uvCVp0eGoYlglhYfM=
Date:   Fri, 14 Jul 2023 18:17:59 +0800
MIME-Version: 1.0
Subject: Re: [v3,18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        javierm@redhat.com
Cc:     linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20230714075155.5686-19-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Sui JIngfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20230714075155.5686-19-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org


On 2023/7/14 15:49, Thomas Zimmermann wrote:
> Most fbdev drivers depend on framebuffer_alloc() to initialize the
> allocated memory to 0. Document this guarantee.
>
> v3:
> 	* slightly reword the sentence (Miguel)
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> Cc: Helge Deller <deller@gmx.de>
> ---
>   drivers/video/fbdev/core/fb_info.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
> index 8bdbefdd4b70..4847ebe50d7d 100644
> --- a/drivers/video/fbdev/core/fb_info.c
> +++ b/drivers/video/fbdev/core/fb_info.c
> @@ -13,7 +13,8 @@
>    *
>    * Creates a new frame buffer info structure. Also reserves @size bytes
>    * for driver private data (info->par). info->par (if any) will be
> - * aligned to sizeof(long).
> + * aligned to sizeof(long). The new instances of struct fb_info and
> + * the driver private data are both cleared to zero.
>    *
>    * Returns the new structure, or NULL if an error occurred.
>    *
