Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B34A7C9C69
	for <lists+linux-sh@lfdr.de>; Mon, 16 Oct 2023 00:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjJOWZb (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 15 Oct 2023 18:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJOWZ3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 15 Oct 2023 18:25:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A0AAD;
        Sun, 15 Oct 2023 15:25:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54600C433C8;
        Sun, 15 Oct 2023 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697408724;
        bh=7ukMZpn3B3PMt4B8/VVTfosLTYUdvhiBI+QB+7XKRY0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KWZ5gy8b6Cjo6C5VAZaLpO+CcCeY3Q+OTRtQqYf/8Bbb/yGehRR9k9yL9JXI/kSKB
         /SuwwJ5ux1/78o/ve71KiA4BYBF6sPB3wRX4fpGjl+Nk3ZSjO4Iibop4jxg4yxrefS
         rjI62WjQJOKr7kMfBZl45gADOTk1TVCQdaoRqfwJ2XexFfHdlGiS+WeeBMK2d0+mlm
         y1Hx4f/Z+YZ4u/llEFkIKJfoW9SiTiO1eqmaE7HXVm/Z9d4zd2xILNzJDYAeRJUu6n
         poKHhNv8nLnhiYZNgAhViOoU3VgSfgBUwnC/XxSoEXpnUACGPeZTtTVY55VSPPJOLT
         hHhFMxh5RInRw==
Message-ID: <fc7c1593-4bd2-45b0-9ed8-177ca3b9f17d@kernel.org>
Date:   Mon, 16 Oct 2023 07:25:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 28/35] Documentation/devicetree/bindings/ata:
 ata-generic.yaml add usl-5p and rts7751r2d.
Content-Language: en-US
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org
Cc:     glaubitz@physik.fu-berlin.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-ide@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1697199949.git.ysato@users.sourceforge.jp>
 <0af21a9c4bf257c09254077c349bbb67530cb35c.1697199949.git.ysato@users.sourceforge.jp>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <0af21a9c4bf257c09254077c349bbb67530cb35c.1697199949.git.ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The patch title should be something like:

dt-bindings: ata: ata-generic: add usl-5p and rts7751r2d

without a period at the end.

On 10/14/23 23:54, Yoshinori Sato wrote:
> usl-5p and rts7751r2d using ata-generic driver.

Please use a full sentence. There is no verb here.

> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  Documentation/devicetree/bindings/ata/ata-generic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ata/ata-generic.yaml b/Documentation/devicetree/bindings/ata/ata-generic.yaml
> index 0697927f3d7e..1025b3b351d0 100644
> --- a/Documentation/devicetree/bindings/ata/ata-generic.yaml
> +++ b/Documentation/devicetree/bindings/ata/ata-generic.yaml
> @@ -18,6 +18,8 @@ properties:
>        - enum:
>            - arm,vexpress-cf
>            - fsl,mpc8349emitx-pata
> +          - iodata,usl-5p-ata
> +          - renesas,rts7751r2d-ata
>        - const: ata-generic
>  
>    reg:

-- 
Damien Le Moal
Western Digital Research

