Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3EB14EB5D0
	for <lists+linux-sh@lfdr.de>; Wed, 30 Mar 2022 00:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236743AbiC2WV4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 29 Mar 2022 18:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbiC2WVJ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 29 Mar 2022 18:21:09 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E8E20F4B;
        Tue, 29 Mar 2022 15:19:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b19so26729986wrh.11;
        Tue, 29 Mar 2022 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=Hc35y9Cvd0aSTc9Oqu3zY4BkC/Vxw1HMT84clzNfI+BkelEQDCbpsVtbXtbc//BSPB
         CVtn/kdboVuX3Rm4bgejnTHJ9c/O2SuVBe4XQuP4WMTjDOWNTXLqg9KeihPygF9qopyb
         x+k89YKOUTg6n7sGdx9LkUjDWwMQmDMwrmT9n4LW+siZB4IBsfXeY/LV26P4HzDY+tKr
         TV1LV3iTlDKgi9dyJhHBLooGfPcgPI2NmuN163lGwGY1R5xnGs73Z4OqFVIBgG8/RKGa
         qU/JioeCdF89Fr4D4fRcKdh6OYg3C42ovIhN8z/Gmx/BMsIVTAC4wFV5NpZfp7MqNUow
         dmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=M8EzH24/XkXiTyEN61AiijExFB7lSAfM0pJzbEXiOA3FZaamsPi1/3UmV3WXinBsW0
         tOHtdZBreztGdtxTRAYAWu1LLlUm1l+CyOIcwNwOkxP9mhamOuWSQNHp394SPli0hxEg
         SMogtAGX+OdhrAce72waqkhDGsr/zh3uZ9eOtYGkdeHKYjU7uiX3q/jbgokGz60hcmzi
         zVIarFPxTo8G0mQLaXV684DzPr6GWANakVFwSFyT45U41sE+0qN7pDQx41Pxmd5WsYnP
         BZL/oMFoUVJ8JBpZGMyNFte2zTGsPs4EtT18dIiBorUBU4jPBoK6vGaI/vn3sgM7aj/E
         nbXA==
X-Gm-Message-State: AOAM531Z155pk6NSaIv5MspEHhy/dDGNsVc2blRozxPAmYCfKhvXLCEB
        eVbS0gDqIO0IQUedIXp/2cqKjL9gKfnW59ESQUU=
X-Google-Smtp-Source: ABdhPJyGfnZ/zZVNpmTNSAr1XVmM7ehcNlI4RFKGcCTyBuUM7E6wV92XRZV2dMMTtZiWJq5B7OGwQA==
X-Received: by 2002:adf:ebc7:0:b0:1ee:945a:ffb4 with SMTP id v7-20020adfebc7000000b001ee945affb4mr34297161wrn.641.1648592364345;
        Tue, 29 Mar 2022 15:19:24 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.5.18])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b0038cc9aac1a3sm3344347wmq.23.2022.03.29.15.19.16
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:19:20 -0700 (PDT)
Message-ID: <624385e8.1c69fb81.4c767.e46d@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:19:09 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
