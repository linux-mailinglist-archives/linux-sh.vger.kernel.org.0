Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D9A730FE0
	for <lists+linux-sh@lfdr.de>; Thu, 15 Jun 2023 08:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244497AbjFOGxD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 15 Jun 2023 02:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244493AbjFOGwq (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 15 Jun 2023 02:52:46 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6B63C26
        for <linux-sh@vger.kernel.org>; Wed, 14 Jun 2023 23:50:59 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62dfcd18f6bso2257756d6.1
        for <linux-sh@vger.kernel.org>; Wed, 14 Jun 2023 23:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686811858; x=1689403858;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMRhudSiSpL3e5txT8vbhqr+QDaWfHyk7j2Um62mDT8=;
        b=T7Ozw9a4Rpk5FBpeOOFI2cHvQ75Pv8YaeyqaNBPPlG3HM0mdWF2AU8YGv139C7Qotc
         kXs8SCDEo8JmHkjCs8yoLBP0z9Q8D82r/8HsGPufy/a/vG/zj/fgWdKy48NYSydzmXwV
         UPSXoTyaFgkq5/yFg5MreZyga8zGkho7JFd3Aklj46+XVr4c0dsWui2rFe59ll2Tct3/
         5rvFBpWerGx/lZ13EYjM9UsMJFhydpak58ql4a4GEGno1YUeFGTl5G5FhGzJXl6DUx2D
         BxKxJsAAsIFvrqEMeHIWDvnXsRKzQI8cy2g8K0ugPHBUDciytrmlx3XhZxycjkoZkb++
         PI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686811858; x=1689403858;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMRhudSiSpL3e5txT8vbhqr+QDaWfHyk7j2Um62mDT8=;
        b=e110wH5J/7KkjJYes73UmwuAEoLx1XWxxKn3r45tBiocTvw/tvLF6pei2UqZufB8cE
         KIJ9mi+K6YDKJ0MOz7SN63kAFv0y3tF07uN1VhC87L9/Oq3CYyxJxe2bj4i6cQGqIHuR
         2/0eI7TOIs0i4YT11kyoo1tiEVEeIu9jqQ9BcLWtw0NPuWpIYnm6zgm5Twl/HP4AwUsg
         e5WxHR7HVC568WuV7Ss1pYJbF7Z1jureAJjRoDcNymA9dGgx6ZkySIYt4jAudMJ4WAmx
         p6K/Xo+kfg8pBegPk83EiCT1hWmZaUTS84X6zmelPenLyjy3wn7XLf338b1zmJNuMPRj
         skMw==
X-Gm-Message-State: AC+VfDwBJPzLJh/S1/zLaUv1FRN5nmBt5limnvyW1LCi2DsQWA4b0GKu
        5kpiH0vj+9dnOPI/Nb2ugr9UUSzROtxA+4/0h9I=
X-Google-Smtp-Source: ACHHUZ6mT645E4io1T2ze4XYoY7HucpUABf9faETWdMPSaYYTJDi8qGa/TIQ4TmEcXACc7VUwOYQSX2XnL93fG/rYXU=
X-Received: by 2002:a05:6214:1c0d:b0:5dd:b986:b44 with SMTP id
 u13-20020a0562141c0d00b005ddb9860b44mr4642951qvc.6.1686811858377; Wed, 14 Jun
 2023 23:50:58 -0700 (PDT)
MIME-Version: 1.0
Sender: mrmusaibrahimibrahim4446@gmail.com
Received: by 2002:ac8:58c5:0:b0:3f4:fdaa:8e20 with HTTP; Wed, 14 Jun 2023
 23:50:58 -0700 (PDT)
From:   Mrs Bill Chantal Lawrence <mrsbillchantallawrence58@gmail.com>
Date:   Wed, 14 Jun 2023 23:50:58 -0700
X-Google-Sender-Auth: i5eK-rAvtvPlGhCQm4Y4Q9kzwFQ
Message-ID: <CANgEpsKgEa9qfweAkkmuUJptSTq=hNuv9cJ3cnKgOd2d-dDqiw@mail.gmail.com>
Subject: Hello Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello Good Day, You have been compensated with the sum of 5.5 million
dollars in this united nation.

The payment will be issue into atm visa card and send to you from the
santander bank.

We need your address and your Whatsapp this my email.ID
(mrsbillchantallawrence58@gmail.com ) contact  me

Thanks my

mrsbillchantalhanter
