Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F279D6F2F43
	for <lists+linux-sh@lfdr.de>; Mon,  1 May 2023 10:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjEAIG3 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 1 May 2023 04:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbjEAIG2 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 1 May 2023 04:06:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9857310DE
        for <linux-sh@vger.kernel.org>; Mon,  1 May 2023 01:06:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so2135360f8f.1
        for <linux-sh@vger.kernel.org>; Mon, 01 May 2023 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682928384; x=1685520384;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=QF2skOqgQX/jmKlGbCOSK1af6rsjN8WHj8lswS8WUTys9M/ptXz/xL2PnBGPAftHmI
         XiViqfYUto/hZNwwJWAtLmX5I/8rQbcSUZEUdVHddvVqp2xRj/6Vb6HtJ3MbzcjJAXI2
         r91S4qo/1fUNbEuwpbE+6fYsctUKXfF0ut6pEaR/N7p5lbGcWgXNf7/op1Xn75gV2+A6
         h1LsgA3ZeRq1hzXUeS3zrpr12im9U2Rxvi5Sz86ZrQkJvYzOCisFUDx6l3hc1RmJz10Z
         ncQzpQGk/3xzZlbLSKMimM6ea6bIW/5gwVEb0epLEyG/GpxBjoU97aKQwLBz3fwYSJcM
         Suzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682928384; x=1685520384;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=cMKOHy8mhDyu8ZLWyezYjYNPNzhj2AI/ZxTAH9rTnYSuZIxG4A3j0fNABo0jqqR7RV
         Ng1kXjFA/Ia3AL09TX2oj1dlHMTpMTY+mFcpe9qvi1f5/hLYLaOfxVJq0er5Mb0a3Ool
         eN59kotfOOPjVjEF6vGGxgDZ3boKHhEVty8cF4u1uwBAZXhg8NIjw9vQfERseplfpZpv
         zR0h46mmVja0IIdeJ1tv1su2oPc/ZR3IPSM67gujGHtTicBfc8fKvynxIqnsj8kCo9dn
         LtyahYYJzCiXnbj/LEmFt/Om/f2MUEwK+3kA0lLsX56ue1uA7on8uvEPQsiZLI5i6M9D
         ba3g==
X-Gm-Message-State: AC+VfDxOOK+pXoMdjOqNeMU9R5A7hfs6rbxFY8xbD9K2FIFCuLUIFP3o
        OYrYHt8vSr6vLI0Lb7Weg48jxxiRJo89/O5yXk7EHxoke95RvQ==
X-Google-Smtp-Source: ACHHUZ5WuldWKSwSzsUMTQQdRtLqbB7ZCnOZZnio9EpDgI/WEFLn3Boz4idzAH2yQ9jScSsWcfnYa4n0E4WB7kaHTo8=
X-Received: by 2002:a5d:6748:0:b0:2ce:a34b:2b0b with SMTP id
 l8-20020a5d6748000000b002cea34b2b0bmr9076775wrw.28.1682927912014; Mon, 01 May
 2023 00:58:32 -0700 (PDT)
MIME-Version: 1.0
Sender: mrs.mcompola333@gmail.com
Received: by 2002:adf:ea05:0:b0:306:31c8:dd4a with HTTP; Mon, 1 May 2023
 00:58:31 -0700 (PDT)
From:   Mrs Bill Chantal Lawrence <mrsbillchantallawrence58@gmail.com>
Date:   Mon, 1 May 2023 00:58:31 -0700
X-Google-Sender-Auth: iHW6VUZyFb4qhx6R0YR_PBAEFKg
Message-ID: <CAMw1Tj+YUGw5wFsL349RaSyWLLrofrb0BCBmY-CFhMcRXELj6A@mail.gmail.com>
Subject: Hello Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:442 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4981]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrs.mcompola333[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrs.mcompola333[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello Good Day, You have been compensated with the sum of 3.5 million
dollars in this united nation.

The payment will be issue into atm visa card and send to you from the
santander bank.

We need your address and your Whatsapp this my email.ID
(mrsbillchantallawrence58@gmail.com) contact  me

Thanks my

Mrs Bill Chantal Lawrence
