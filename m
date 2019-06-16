Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9E047401
	for <lists+linux-sh@lfdr.de>; Sun, 16 Jun 2019 11:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfFPJhm (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 16 Jun 2019 05:37:42 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41695 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfFPJhm (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 16 Jun 2019 05:37:42 -0400
Received: by mail-oi1-f196.google.com with SMTP id g7so5001619oia.8
        for <linux-sh@vger.kernel.org>; Sun, 16 Jun 2019 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=+M1LM9TZ9iE2Dbvp8u/hm974Z4o6n18HgDtpeJJ0AOo=;
        b=QrCqCDxW2It6rpfAHlg/R521VYX0apzbUPQOmAgojJRSPOHUXh3uZCFkXeQlXjBdoY
         puciHQoX+elBHiGzVK5i6cgXxn4uXXS3t8C1qpbjNzpET20vek46c4CWGoRadFtA8csB
         nOlqM1LQE8o+GQDR40r9e7cQXbrvfz0SupOEocTtv3+snlLc0Iq7ci5ntGio4sC+F5wO
         K7eIkQLUKbuPGqgKsR6nRBkkm8zYYxznPv5LKk+tzixcebBuvHxqen6RL9e8hserFSGo
         TkDLmmKCKIstncQ2ZK1CrwHhfnP+Gr2191zgTRpb0YmEq9LFIYgo46eVqKbaWHgfiqxl
         rVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=+M1LM9TZ9iE2Dbvp8u/hm974Z4o6n18HgDtpeJJ0AOo=;
        b=GBp5HCPW2THkLNFppTZP+7RUNbuvYXgkDv+2pW1ebS/A+oTlas3LZuwQ2ByWLIAos2
         6s4ezW5zTTQyGr0eBlelR5vkOXXDJFFP8DNNMQyBmQGtCG+DFMKt2fa82chS/DI9SBJj
         /aoybhvr4qVjAUSbgHn+2ztBuOEdQOg3v7zlZ+unXVZv/QNrVhCR4ixXrcNuWRdXiavl
         67MRMCm3shCBuNo1o5PeZH9IJG6DpYe0TlVzR+sHBdPzTxcld5bneDRtZ6byKxE8ftMN
         p/6cMUGA8XQokRh8BMw7FEdqFqMLwrakBJLyGU1hLl/dwUvMgdVEVPDvXEQSx8Nt7ehm
         G6Eg==
X-Gm-Message-State: APjAAAVHNxqCfapGyWN6CkUMAWg/cTL92cgXu+Vnss9kEFOVotamK5xr
        jdMsznyJa/ZBVfgr8rQ98VwiEvwkdhI=
X-Google-Smtp-Source: APXvYqw2dv2L6vXaY5gTWjnnzgIDhrEqBoy9Fefm17fTQmbBBO5SjJSvC5GT2YI7R0ra4QBqkg5hnA==
X-Received: by 2002:aca:6c1:: with SMTP id 184mr6917208oig.122.1560677858871;
        Sun, 16 Jun 2019 02:37:38 -0700 (PDT)
Received: from [192.168.1.5] (072-182-052-210.res.spectrum.com. [72.182.52.210])
        by smtp.googlemail.com with ESMTPSA id p9sm3488794oti.20.2019.06.16.02.37.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 02:37:38 -0700 (PDT)
Subject: Re: Linux SH kernel currently broken on qemu-system
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux-sh list <linux-sh@vger.kernel.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>
References: <e7855beb-fbf6-8f67-140f-21820a0fe4af@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <3152f4e3-123c-ee18-ddac-b4a14ddddfee@landley.net>
Date:   Sun, 16 Jun 2019 04:38:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e7855beb-fbf6-8f67-140f-21820a0fe4af@physik.fu-berlin.de>
Content-Type: multipart/mixed;
 boundary="------------A8EC5402C0569D24DB249099"
Content-Language: en-US
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This is a multi-part message in MIME format.
--------------A8EC5402C0569D24DB249099
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 6/10/19 8:36 AM, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> Booting the Linux SH kernel in qemu-system currently doesn't work, the screen
> just stays black. Previously, the kernel suffered another regression where it
> booted but crashed very early.

I booted 5.1 to a shell prompt when it came out and you're pointing at a commit
from 2017? Sigh, let's see...

Nope, I just built current git -master (commit e01e060fe00d) and it booted just
fine. (Well, the stupid ___slab_alloc.constprop stack dump it's been doing
forever but I've complained about that here before. I get the shell prompt anyway.)

Could you attach your .config? Here's the one I built, and how I'm launching it.

Hmmm... I checked my notes on the sh7760 hardware and the newest kernel I ran on
that (with dma working, memory to memory with dmaengine and the dmatest plumbing
passed) 4.14, which is just older than  your commit. (But I didn't stop moving
the version forward because of a DMA issue, I stopped because jffs2 on the NOR
flash went flaky in a way that took 10 minutes of hammering to reliably
reproduce and was thus a pain to bisect, and we had a ship deadline, so I stayed
with the last stable one which was less than a year old at the time...)

Rob

--------------A8EC5402C0569D24DB249099
Content-Type: application/x-shellscript;
 name="qemu-sh4.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="qemu-sh4.sh"

cWVtdS1zeXN0ZW0tc2g0IC1NIHIyZCAtc2VyaWFsIG51bGwgLXNlcmlhbCBtb246c3RkaW8g
LW5vZ3JhcGhpYyAtbm8tcmVib290IC1tIDI1NiAtYXBwZW5kICJwYW5pYz0xIEhPU1Q9c2g0
IGNvbnNvbGU9dHR5U0MxIG5vaW90cmFwIiAta2VybmVsIHpJbWFnZSAtaW5pdHJkIHNoNC1s
aW51eC1tdXNsLXJvb3QuY3Bpby5neiAiJEAiCg==
--------------A8EC5402C0569D24DB249099
Content-Type: text/plain; charset=UTF-8;
 name="sh4.miniconf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="sh4.miniconf"

IyBtYWtlIEFSQ0g9c2ggYWxsbm9jb25maWcgS0NPTkZJR19BTExDT05GSUc9c2g0Lm1pbmlj
b25mCiMgbWFrZSBBUkNIPXNoIC1qICQobnByb2MpCiMgYm9vdCBhcmNoL3NoL2Jvb3Qveklt
YWdlCgoKQ09ORklHX0NQVV9TVUJUWVBFX1NINzc1MVI9eQpDT05GSUdfTU1VPXkKQ09ORklH
X01FTU9SWV9TVEFSVD0weDBjMDAwMDAwCkNPTkZJR19WU1lTQ0FMTD15CkNPTkZJR19TSF9G
UFU9eQpDT05GSUdfU0hfUlRTNzc1MVIyRD15CkNPTkZJR19SVFM3NzUxUjJEX1BMVVM9eQpD
T05GSUdfU0VSSUFMX1NIX1NDST15CkNPTkZJR19TRVJJQUxfU0hfU0NJX0NPTlNPTEU9eQoK
Q09ORklHX1BDST15CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQpDT05GSUdfODEzOUNQ
PXkKCkNPTkZJR19QQ0k9eQpDT05GSUdfQkxLX0RFVl9TRD15CkNPTkZJR19BVEE9eQpDT05G
SUdfQVRBX1NGRj15CkNPTkZJR19BVEFfQk1ETUE9eQpDT05GSUdfUEFUQV9QTEFURk9STT15
CgojQ09ORklHX1NQST15CiNDT05GSUdfU1BJX1NIX1NDST15CiNDT05GSUdfTUZEX1NNNTAx
PXkKCiNDT05GSUdfUlRDX0NMQVNTPXkKI0NPTkZJR19SVENfRFJWX1I5NzAxPXkKI0NPTkZJ
R19SVENfRFJWX1NIPXkKI0NPTkZJR19SVENfSENUT1NZUz15CgoKIyBDT05GSUdfRU1CRURE
RUQgaXMgbm90IHNldApDT05GSUdfRUFSTFlfUFJJTlRLPXkKQ09ORklHX0JJTkZNVF9FTEY9
eQpDT05GSUdfQklORk1UX1NDUklQVD15CkNPTkZJR19OT19IWj15CkNPTkZJR19ISUdIX1JF
U19USU1FUlM9eQoKQ09ORklHX0JMS19ERVY9eQpDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQpD
T05GSUdfUkRfR1pJUD15CgpDT05GSUdfQkxLX0RFVl9MT09QPXkKQ09ORklHX0VYVDRfRlM9
eQpDT05GSUdfRVhUNF9VU0VfRk9SX0VYVDI9eQpDT05GSUdfVkZBVF9GUz15CkNPTkZJR19G
QVRfREVGQVVMVF9VVEY4PXkKQ09ORklHX01JU0NfRklMRVNZU1RFTVM9eQpDT05GSUdfU1FV
QVNIRlM9eQpDT05GSUdfU1FVQVNIRlNfWEFUVFI9eQpDT05GSUdfU1FVQVNIRlNfWkxJQj15
CkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBGU19NT1VOVD15CkNPTkZJR19UTVBG
Uz15CkNPTkZJR19UTVBGU19QT1NJWF9BQ0w9eQoKQ09ORklHX05FVD15CkNPTkZJR19QQUNL
RVQ9eQpDT05GSUdfVU5JWD15CkNPTkZJR19JTkVUPXkKQ09ORklHX0lQVjY9eQpDT05GSUdf
TkVUREVWSUNFUz15CiNDT05GSUdfTkVUX0NPUkU9eQojQ09ORklHX05FVENPTlNPTEU9eQpD
T05GSUdfRVRIRVJORVQ9eQoK
--------------A8EC5402C0569D24DB249099--
