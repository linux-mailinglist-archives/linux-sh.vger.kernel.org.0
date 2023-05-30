Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA354716A3B
	for <lists+linux-sh@lfdr.de>; Tue, 30 May 2023 18:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjE3Q7Z (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 30 May 2023 12:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbjE3Q7V (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 30 May 2023 12:59:21 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADF7100
        for <linux-sh@vger.kernel.org>; Tue, 30 May 2023 09:58:57 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565a3cdba71so66158137b3.0
        for <linux-sh@vger.kernel.org>; Tue, 30 May 2023 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685465936; x=1688057936;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNArju2Q8+Sr5dwcNQgGMkuM+vdAY/tBFjavnfU7aAs=;
        b=qdG9+S/QBuGkCrI4SG4FCHvRnfyDE6Ae5IPaT+ckeWD0VmDLcIRRDBgjEtX6B37bql
         d85weCGIh6Y3bS9I+5JMAomZAKmyYwr314olGhdSZKrbLfUTPGrZngK9WL8hDI+x6QO9
         N+fDjYqIP0WXYuN5v+Gowry4xZa1hQAorfpx7Mq9COesvhOWLj2FPqaoRlIcBffOm9um
         A8JVopYtcPAtpTtx2koC8sot50p8vca2r7wUHoV6tiVb7njwFh2p0ArSvnC5ueoYtfZ1
         9VFcLaL+vkR9rbxdrciJZoYHpsQRC3ho0ooMW9KKpFt8+WsTshTbtZJ79KoHqiSp8Zc1
         He0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465936; x=1688057936;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNArju2Q8+Sr5dwcNQgGMkuM+vdAY/tBFjavnfU7aAs=;
        b=B221Y/gHHD2CZJRRlJQ0mErYET2JBzWypQE/f9OXHP3ppeQRzfSw79hHBbYnQGW8iS
         uNNWcrivdPvFUWMLD+Jt8jUKDLJ5ORkriS2EERLet38ZB83ID7CNeT1fF9uGwTdGSN5U
         TrcDwGjabxWFk4GOqosqy2mtABjYa+tkAw3eK2L49pDFhWc6T/o1T49KHE+9h5wMTtMi
         5ZVhFki4aYk2wk30spt2AANgHPLKMrjvrnrCh3PL87xQEh5iCvBXNl6NgcVKTYBT/AXl
         2qF9OieFCi45xc1PDjuRVrTM3f8Saav2okziMNy1/cuxV3KGbU4vRZNtz/eHhSBe/QyG
         DJtA==
X-Gm-Message-State: AC+VfDzbG/UHhVWHhGuJlTYUK76FJ7S4GpseokwqLW8PO6gZf+e3LnXt
        OHtUTCq9q3ikaloM8s5Dk6PQDZzxOY7tjWKfLoQ=
X-Google-Smtp-Source: ACHHUZ4+dMEJzSIWMalEMPrg35II1A6tu8yIcDEhktWVvanbngt7BWHKI/4SaWeSJPVpr46Kv+r2wIxCfWRn4/jnfQU=
X-Received: by 2002:a81:8607:0:b0:568:98b8:9c2f with SMTP id
 w7-20020a818607000000b0056898b89c2fmr2728745ywf.46.1685465936384; Tue, 30 May
 2023 09:58:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:33c6:b0:35e:241b:1d9e with HTTP; Tue, 30 May 2023
 09:58:55 -0700 (PDT)
Reply-To: jkirinec101@gmail.com
From:   marine medic <bwllcs103@gmail.com>
Date:   Tue, 30 May 2023 17:58:55 +0100
Message-ID: <CAFekM9Wr_vwg6EeAvaX+qYtE2WWoX+ufieoUxgji-bzc8EfhLA@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hallo, es tut mir so leid, Ihre Privatsph=C3=A4re zu verletzen. Es hei=C3=
=9Ft:
=E2=80=9EEin Bild sagt mehr als tausend Worte, aber als ich Ihres sah, war =
es
mehr, als Worte erkl=C3=A4ren k=C3=B6nnten.=E2=80=9C Das charmante Profil i=
st
unwiderstehlich, obwohl es eine kleine pers=C3=B6nliche Nachricht ist, aber
Ihr Aussehen verr=C3=A4t viel =C3=BCber eine nette Person ... Also musste i=
ch
der charmanten Person mit diesem tollen Profil eine Nachricht
hinterlassen. Ich glaube, es ist die Neugier, die mich in einer
solchen Zeit zu Ihnen f=C3=BChrt. Ich muss noch einmal sagen, dass es mir
leid tut, wenn das Schreiben an Sie Ihrer moralischen Ethik
widerspricht. Ich m=C3=B6chte dich einfach besser kennenlernen und ein
Freund sein oder mehr. Ich hoffe, irgendwann von Ihnen zu h=C3=B6ren.
