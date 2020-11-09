Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2C42AB59F
	for <lists+linux-sh@lfdr.de>; Mon,  9 Nov 2020 11:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKIK7M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 9 Nov 2020 05:59:12 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:38981 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727183AbgKIK7M (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 9 Nov 2020 05:59:12 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kc4tC-001d7b-DU; Mon, 09 Nov 2020 11:59:10 +0100
Received: from 87-77-186-169.mna.fu-berlin.de ([87.77.186.169])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kc4tC-002FXn-6K; Mon, 09 Nov 2020 11:59:10 +0100
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-sh@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
 <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
Message-ID: <47f79645-53b7-b11c-167a-f5721b53df02@physik.fu-berlin.de>
Date:   Mon, 9 Nov 2020 11:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.77.186.169
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Jens!

On 11/5/20 6:15 PM, Jens Axboe wrote:
> On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
>> Hi Jens!
>>
>> On 11/5/20 5:17 PM, Jens Axboe wrote:
>>> Gentle nudge on this one.
>>
>> I can build- and boot-test on SH and IA64.
> 
> That'd be great, thanks!

Sorry for the delay. I'm busy at the moment and my SH board is currently
building the Perl 5.32 package for Debian. Will try to test your patches
by tomorrow, also ia64.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

