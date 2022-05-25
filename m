Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8DA53451C
	for <lists+linux-sh@lfdr.de>; Wed, 25 May 2022 22:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344964AbiEYUkp (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 25 May 2022 16:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbiEYUkn (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 25 May 2022 16:40:43 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F32AB0D0A
        for <linux-sh@vger.kernel.org>; Wed, 25 May 2022 13:40:42 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id v26so9950535ybd.2
        for <linux-sh@vger.kernel.org>; Wed, 25 May 2022 13:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=LDBqQh/PztHeiDiV9Pr0v62BTTaDnPQyU98FGi1REkw=;
        b=bnw+bpAeGJgTMC9sGeBXwX6bAEcKbfsKIkAeZKSYpNE55sGquq/RNoAbgZ86ZUgzKy
         vzwfHN+NHm8ZBL4flQyh33g04fzxfDtykcGxTi+bVW97u2D5h/2mwwLqYdp62qZhKLME
         d/rBiB6L6WWAgzyfBeUgTZOwXzACB06J0FXHmI4tPCXIB+hugpaVPKihd9GSBW7VdY2/
         Xj1For/SATTen2tfEsGG8F2SzyvwkOd2HZprMqwjK4/2v6J8pYCDeVAzlbPTLF4hyZlM
         toQPLjm9n42iJggMSVXMx03k+Du9H14h6Yoh3EtBA0Lg3PHM/edDghzi0MLYHMk6TRu/
         RKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=LDBqQh/PztHeiDiV9Pr0v62BTTaDnPQyU98FGi1REkw=;
        b=gsMFRCg66auhnL06ey9d87hTT4RqEsbBd22gTa5e4lSbkVTJ8k2Hh+pNwsd3z5pDLS
         5C5vckgbpw/z6KdHiD9BKp5xg5MGtyb1i8/YWqxBa2R3yH2Bfv4bdOtzUZJm4hv99PV2
         7dZ/yoMVHrePGOyXM/jLPn0FmwPA3LOIfsbR0pRsblJhoaiRPr972/Hwgs21/563rfBd
         w+5+4EykRQYxc5GFKChYNbU4cVWd16Zk3jhP208H8j+fD0p/r982cAonw9ogedLMNgOE
         PAbDiEfzJ+XvWu9bM1pzaUryGS++FprXOVApYnXgUTsqzK2M7Zp9/zY9jtrKV14XXovM
         MSyQ==
X-Gm-Message-State: AOAM532tDqUegTjwD4yNWDYKwL6cW/R72ItKnXTLTeLLny5G00MVGQgn
        /FodpektlRz7VEuqronYTlS19NwLBhNDNboSvas=
X-Google-Smtp-Source: ABdhPJw2b8SqDQM1jKtNIGJ71RNOLsX48Ub006RLAolgTDKgPV5ZPuOlMUWoTCzRkqjJoBARJ7ylBwMhjaodTyjAy9w=
X-Received: by 2002:a05:6902:52f:b0:655:371e:b088 with SMTP id
 y15-20020a056902052f00b00655371eb088mr8201895ybs.60.1653511241651; Wed, 25
 May 2022 13:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5b:506:0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:40:41 -0700 (PDT)
From:   Deterin Falcao <falcaodeterin@gmail.com>
Date:   Wed, 25 May 2022 22:40:41 +0200
Message-ID: <CABCO4Z1FA_Bn-B9nBuxa6E3RCFQRimjieim9MHX5ysGtsfXVHw@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Falcao Deterin

falcaodeterin@gmail.com








----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Falcao Deterin

falcaodeterin@gmail.com
