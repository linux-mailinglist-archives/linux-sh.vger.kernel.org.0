Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E946C61B2
	for <lists+linux-sh@lfdr.de>; Thu, 23 Mar 2023 09:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjCWIaU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Thu, 23 Mar 2023 04:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjCWIaO (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 23 Mar 2023 04:30:14 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDDA22797;
        Thu, 23 Mar 2023 01:30:12 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pfGJ0-002TGv-My; Thu, 23 Mar 2023 09:28:18 +0100
Received: from p57bd9952.dip0.t-ipconnect.de ([87.189.153.82] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pfGJ0-004B39-FY; Thu, 23 Mar 2023 09:28:18 +0100
Message-ID: <4cd6f0c8d7603254df9e2eb1e7b80973e75c4e45.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] mm/slab: Fix undefined init_cache_node_node() for NUMA
 and !SMP
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Dave Hansen <dave.hansen@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Date:   Thu, 23 Mar 2023 09:28:17 +0100
In-Reply-To: <CAMuHMdW1ed0ns=Xb-ug=wfUuBTU1Pr0V6Deds1GkSb_f-Ac3Xw@mail.gmail.com>
References: <67261c513706241d479b8b4cf46eb4e6fb0417ba.1679387262.git.geert+renesas@glider.be>
         <ZBneELQuakjva1xa@casper.infradead.org>
         <6320abf6-0898-361b-d5f6-bcc58306f55c@intel.com>
         <ZBsw9lRbJU4c2wLD@casper.infradead.org>
         <CAMuHMdW1ed0ns=Xb-ug=wfUuBTU1Pr0V6Deds1GkSb_f-Ac3Xw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.153.82
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Geert!

On Thu, 2023-03-23 at 09:25 +0100, Geert Uytterhoeven wrote:
> It's supported. Dave just forgot to update the #ifdef around the
> definition of init_cache_node_node() when updating an #ifdef around
> a code block that contains one of the callers.
> 
> P.S. To me, this discussion reminds me of the old discussion about
>      discontigmem without NUMA. Yes, not all systems are PCs with
>      contiguous memory on a single fast bus ;-)

I'm wondering: Could the NUMA code be used to work with the different
memory types found on the Amiga, i.e. chip RAM, fast RAM etc?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
