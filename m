Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3D8747EEB
	for <lists+linux-sh@lfdr.de>; Wed,  5 Jul 2023 10:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjGEIDa (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 5 Jul 2023 04:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjGEID2 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 5 Jul 2023 04:03:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82BC1994
        for <linux-sh@vger.kernel.org>; Wed,  5 Jul 2023 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688544151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
        b=HVNH53ZDOszA2ZQz3FXyXsIdeqgezqU0uNVYe9yOyAHL6wluM2dvAM16LhKgyJWDFGOQmn
        tb2JRp6RWWHzNzPXI9PkC+ELtVg840KchYLERyVasoxVVEy+OMxCArJ6ecJOa0Aa21JF+6
        cOz8UIM1odQz1gioutujRaqMF28O6Tc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Jp-QYIYJNyyYNgN7apLuPg-1; Wed, 05 Jul 2023 04:02:30 -0400
X-MC-Unique: Jp-QYIYJNyyYNgN7apLuPg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so37826935e9.3
        for <linux-sh@vger.kernel.org>; Wed, 05 Jul 2023 01:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688544150; x=1691136150;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
        b=Tb2KPnfHR4QcQ3O7NTR0s+y+LkjXswS6gUVzaO0ok1QOyuHtSgM3tDynURwp4W+ooQ
         dVkEg5X9mqSGp5gPhFiUQeAm1sJOj9KFc8/d4t3vdCRHtZLsV36WIJ6XA0uKq+DlXR3Y
         ka44j5MvfLL+yOhUdeXHMBrzNcUgiX1VK3j3dRhpHOWH/WQrpxbzS2GZw4iaP5a5S4JB
         vnLiFpDXiy/41/MsYDiur7yjOrFc7pcqw8smOH3bqc22c/Q3kpMUVO9AdfU40t1KJgmV
         d6K2vbba2Xscgid0Bjvrew0I2ofj2QpnFpfzD11D2MbZvJV12SJJ3AwuT5EcvrImeDJD
         fTZw==
X-Gm-Message-State: AC+VfDy/Zj8Z30kjtCAgMQYAsLwkD2Ksmhg18CF/S6Ms+QuVF995/hcE
        RkCaNIWMK8Bgu3cvA83+XhHjkWTq/jy8QVetWunca5ef9md3bgbuUkXqTYStQcbF2+zxO+owQft
        CCOGfYe8gIZufe88z/YE=
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id k20-20020a05600c0b5400b003f5ffe346a7mr12254789wmr.9.1688544149402;
        Wed, 05 Jul 2023 01:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vylDlXvfuU9EWjWb12pZMcRCpkOIK+1WjIMZRSIYzVmT0WCKJ1Gd1jMG8KQnYrrWHnxleng==
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id k20-20020a05600c0b5400b003f5ffe346a7mr12254706wmr.9.1688544148234;
        Wed, 05 Jul 2023 01:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d4908000000b0031432c2fb95sm8956824wrq.88.2023.07.05.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:02:27 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
        deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Cc:     linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-csky@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
        Maik Broemme <mbroemme@libmpq.org>, loongarch@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/12] fbdev/core: Use fb_is_primary_device() in
 fb_firmware_edid()
In-Reply-To: <20230629121952.10559-11-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-11-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:02:27 +0200
Message-ID: <878rbuss4s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect the primary VGA device with fb_is_primary_device() in the
> implementation of fb_firmware_edid(). Remove the existing code.
>

An explanation about why this is possible would be useful here.

> Adapt the function to receive an instance of struct fb_info and
> update all callers.
>

[...]

> -const unsigned char *fb_firmware_edid(struct device *device)
> +const unsigned char *fb_firmware_edid(struct fb_info *info)
>  {
> -	struct pci_dev *dev = NULL;
> -	struct resource *res = NULL;
>  	unsigned char *edid = NULL;
>  
> -	if (device)
> -		dev = to_pci_dev(device);
> -
> -	if (dev)
> -		res = &dev->resource[PCI_ROM_RESOURCE];
> -
> -	if (res && res->flags & IORESOURCE_ROM_SHADOW)

This open codes what used to be the fb_is_primary_device() logic before
commit 5ca1479cd35d ("fbdev: Simplify fb_is_primary_device for x86").
But now after that commit there is functional change since the ROM
shadowing check would be dropped.

I believe that's OK and Sima explains in their commit message that
vga_default_device() should be enough and the check is redundant.

Still, I think that this change should be documented in your commit
message. 

With that change,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

