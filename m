Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1DC174D708
	for <lists+linux-sh@lfdr.de>; Mon, 10 Jul 2023 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjGJNJE (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 10 Jul 2023 09:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbjGJNIJ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 10 Jul 2023 09:08:09 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A422114
        for <linux-sh@vger.kernel.org>; Mon, 10 Jul 2023 06:07:48 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-78701841ccbso1447501241.2
        for <linux-sh@vger.kernel.org>; Mon, 10 Jul 2023 06:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688994463; x=1691586463;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qByi5P9M7+yOnaVyMG6pvW4P+aOlzbN0OZfndybu/l0=;
        b=qoZL7tybLWbwI3R3w1uNcYrS/hV2TxCv2oMAXBUltuFL40M5tOrn134PgYnPADsO5w
         s52SZDTPCGGAlGJwa6kaivyVUZmUnLJ0TqYSZfvwYr4O4s7wjd0HZrPnQaza+6Sf2Rfh
         005j9jVq9/8OF1ByBfRiUtjsGUMLd0HuOeqo4M6ONYZ8dOwoO/KscW+JzwSsV7RGlAlt
         inLEqCtKtQwOslPb8nkyDhwqDbQJujPrSuPzDrWgI/KYYAcGCf5lwLzGyYmZ/xSoGXmq
         WQYZjXJFQ6hDrKh+AYW6G8mqhsklHTZFdBZpfgcaDCbrYpqhDzayilqN2fw/VriopHhP
         co+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994463; x=1691586463;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qByi5P9M7+yOnaVyMG6pvW4P+aOlzbN0OZfndybu/l0=;
        b=afqfieIAduINz9OFuMTILESgSd2RZMeytQ5/0thoCqJk8/YAvBm6WBBVbLvvbw6UB7
         yVdAvbJO0IkJhOF5puye6dy6RyFcDCLIzefmob0pxr06bFurRhUOy/MoVW0VcNp/eKBi
         ASyoZJqgr1XidAk5pKfy9bisAhj8rZkKopNTJ4XS83iabYPuG7gMtSQcuG5NQU8/bVqO
         frTFjFkVSAZoss40u5JtAqRt5mpykyswuM+EtLATZ2Q2e0l11ppSMO/2KQheXlHhAMyE
         1VzMCmcw4xOWtWqKbq0gQGxgQGNosv2oQ/nrhLHVIli4avCfp1pRQ9bBW+weNOdbo+os
         XcHA==
X-Gm-Message-State: ABy/qLbD88yiD5hndnTjOE/vbk54npshWSWe3b4S9RV5J2FPd6s/Ez2J
        QWcZtEszThznPy1yIxEuqnERUx3J8CX5PJ+Z1Os=
X-Google-Smtp-Source: APBJJlHw17jWBKyGshulmqUFWz3O/wSJq4JqlgIjr4sv01k/uqZbqCVP1A83rghCERQwjMCoh+07XFDSqFtnOBa8TmQ=
X-Received: by 2002:a67:f8c4:0:b0:443:8a7b:f769 with SMTP id
 c4-20020a67f8c4000000b004438a7bf769mr5871340vsp.30.1688994463241; Mon, 10 Jul
 2023 06:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:64cb:0:b0:781:caa:4818 with HTTP; Mon, 10 Jul 2023
 06:07:42 -0700 (PDT)
Reply-To: mr.richard101kone@gmail.com
From:   Richard Wilson <williamphilip0056@gmail.com>
Date:   Mon, 10 Jul 2023 06:07:42 -0700
Message-ID: <CADkLOGZ83AJgH+9PG-OcOTAKsh8Aue_RR5X6cM_ZyU_VS18siA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

-- 

Dear
I am contacting you to assist retrieve his huge deposit Mr. Alexander
left in the bank before its get confiscated by the bank. Get back to
me for more detail's
Barr's Richard Wilson
