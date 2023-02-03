Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0536896B4
	for <lists+linux-sh@lfdr.de>; Fri,  3 Feb 2023 11:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233759AbjBCKbe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sh@lfdr.de>); Fri, 3 Feb 2023 05:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbjBCKa3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 3 Feb 2023 05:30:29 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBF6A07D7;
        Fri,  3 Feb 2023 02:29:38 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pNtJx-0002fq-Hz; Fri, 03 Feb 2023 11:29:29 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pNtJx-000PVD-9p; Fri, 03 Feb 2023 11:29:29 +0100
Message-ID: <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-sh@vger.kernel.org
Date:   Fri, 03 Feb 2023 11:29:27 +0100
In-Reply-To: <20230203083037.GA30738@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
         <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
         <20230116071306.GA15848@lst.de>
         <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
         <20230203071423.GA24833@lst.de>
         <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
         <20230203083037.GA30738@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hi Christoph!

On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
> On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> > Since this is my very first time stepping up as a kernel maintainer, I was hoping
> > to get some pointers on what to do to make this happen.
> > 
> > So far, we have set up a new kernel tree and I have set up a local development and
> > test environment for SH kernels using my SH7785LCR board as the target platform.
> > 
> > Do I just need to send a patch asking to change the corresponding entry in the
> > MAINTAINERS file?
> 
> I'm not sure a there is a document, but:
> 
>  - add the MAINTAINERS change to your tree
>  - ask Stephen to get your tree included in linux-next
> 
> then eventually send a pull request to Linus with all of that.  Make
> sure it's been in linux-next for a while.

OK, thanks for the pointers! Will try to get this done by next week.

We're still discussing among SuperH developer community whether there will be a second
maintainer, so please bear with us a few more days. I will collect patches in the
meantime.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
