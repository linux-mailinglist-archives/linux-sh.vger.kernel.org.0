Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFCEEDAD0
	for <lists+linux-sh@lfdr.de>; Mon,  4 Nov 2019 09:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfKDIts (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 4 Nov 2019 03:49:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40866 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbfKDIts (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 4 Nov 2019 03:49:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id f3so3975537wmc.5
        for <linux-sh@vger.kernel.org>; Mon, 04 Nov 2019 00:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AZd8DxR702MwoAlKE7sREzCDnCS7TFuUgJFAdqqjsLA=;
        b=h92Y4u9I19V2o1s+5lGhO17NSFYSHZk9QgvM5mDhCb3p4Vr39mQBIAAeC5nqfpsi7E
         4Bu32H/W8VKvnuNSVHaBWMXpaykRQBdpqblyb005vmpwKAd2pPajeArxEgBntM3nBLKj
         CddUtibvOMTxVJx2KNlPjR3XoBIJe+NH2U3j4K0JJelFf1HEtWdgk3iyAHOejVVD2gf+
         RJwDT9t3Hb7iL4cAFs4mdD4rEQqzd1PD/0A6AYCrvWEvFCYF3aqv09lC/5EFGKCN59wI
         T1KGPDXOWiB478W6LZxF6RvwiHkYgYy1j3yOyQ1KqccT28HwFd28G/rbXCZe5nN7BE4U
         VQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AZd8DxR702MwoAlKE7sREzCDnCS7TFuUgJFAdqqjsLA=;
        b=g8Wi8hQ5h/ptuoYklXv5d01YxI9ySrg9Bq9L1n2gqAK+xeBnEHagVZUVuXGer0b0dJ
         tcMvZdpWY+tx4w4ewcBirPBOTdXMqcjg6fhmrrvgNviAj3orHV9qs9cuxNz8SmKvViMD
         BGFCeig5X5qtRPVw0stFL2Q9CNwW543Ah7GcfEy07xYgA2+Bg2jdQoCeJiCaFqaZSFI7
         31/NBMLz1EIaDgWkweI1Dy9nKbi8/Ibz9DfEJ+xbITbTsknEeRooW9gfEAo6aWdKSUgw
         1k4NqxFen55KA7mk/uSFfhJbrNUY3nQ5bsB0iCzj3rq7/MztRyWLFvJ5DXnThS0cyVfE
         SHJA==
X-Gm-Message-State: APjAAAXlLeCsVgt4L1M+nmewjSS4PVTjbe7fQtUbmX5Qm1UeFQzOg6cU
        Awr0Q72WkY1x9uKGqPNYI6Ob8A==
X-Google-Smtp-Source: APXvYqzYY3HzDkh794xMS1oJwQdQFMlMRYGSpRhna8XwoC1msLOBd9EdnxKhwo914zrovZJbmWsmAw==
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr18810088wma.166.1572857385472;
        Mon, 04 Nov 2019 00:49:45 -0800 (PST)
Received: from [192.168.86.166] (83-86-89-107.cable.dynamic.v4.ziggo.nl. [83.86.89.107])
        by smtp.gmail.com with ESMTPSA id o187sm15137370wmo.20.2019.11.04.00.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2019 00:49:44 -0800 (PST)
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
From:   Greg Kroah-Hartman <gregkh@google.com>
To:     youling 257 <youling257@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc:     linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
        x86@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, hch@lst.de
References: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
 <s5himo0cbmm.wl-tiwai@suse.de>
 <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
 <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
Message-ID: <19c3f0ca-9b21-0c5e-894d-976594f38a86@google.com>
Date:   Mon, 4 Nov 2019 09:49:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 11/4/19 9:32 AM, Greg Kroah-Hartman wrote:
 > On 11/4/19 9:27 AM, youling 257 wrote:
 >  > This driver
 > 
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/usb/gadget/function/f_audio_source.c 

 >
 >  >
 >
 > The driver is broken and needs to be fixed.  Please feel free to submit
 > patches to AOSP to do so as you can trigger this easily.

Hm, maybe the driver isn't broken...

snd_pcm_lib_preallocate_pages_for_all() is called with
SNDRV_DMA_TYPE_DEV set, so that should be fine, and the only other
buffer I can see allocate here is with a call to
snd_pcm_lib_alloc_vmalloc_buffer() which _should_ be ok, right?

I don't see any buffers coming off the stack here, unless the gadget
controller is the one creating them?

thanks,

greg k-h
