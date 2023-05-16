Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED40A705904
	for <lists+linux-sh@lfdr.de>; Tue, 16 May 2023 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjEPUmt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 16 May 2023 16:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjEPUms (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 16 May 2023 16:42:48 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C284C0A
        for <linux-sh@vger.kernel.org>; Tue, 16 May 2023 13:42:46 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so22336921a12.2
        for <linux-sh@vger.kernel.org>; Tue, 16 May 2023 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684269765; x=1686861765;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ecYicVNlqCwpTD7keug9XpsIRW3LWPQcbFkS4Vo5hc=;
        b=XIClU4E1NQN1zrShL54htYb2q/NZEl/z6+bUm7qeZIRht65yH8MxJA4Ii8HcDxAaNj
         cDaVStkRVJRnJsTXcMcViR+N3TXrDd0AHbaGhtcC0etfEtXe07av3nCSZIcmxTa+ulZC
         nw9UWFDF7jWESe96v4dcPuGp5VuPAAvJXHfsbICU5oVySrd65u5kuSgSSNBj2cKSG3Jh
         hICxLMnSYC5QyAfWBvbfNPWsjbBchqnc1WsDmHRwfxNHuNpT3EZxW2dt5fl/Gd20Zqe3
         8gGHC2rdG4kAlUkot8ciJPNbtl/WTXQiXazGwlVIqUbGFOrmoKXR3B8hAzwOBRj31mvP
         BfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684269765; x=1686861765;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ecYicVNlqCwpTD7keug9XpsIRW3LWPQcbFkS4Vo5hc=;
        b=KVSKN+gu5DCmD7zSt6Cr6EvO7RwxyegcawLxUMtvxKyq/UATRIBmCaEzAh+Bo3EbDL
         t/ZaWY8r4IAvKBPLADsJeBk2Ivl4k+/Ksci8CiPV4nrZDaS7Fxc/hyD0bDSj7BQCWydV
         zpnGbpKqb8spehl0rsOl528HDRyVqbqXWy6ztY3J0fcDcKL2HOWG/C0N6B8eQ4z/oZbu
         S9RZO2gi+Y6YApeGXsusdU2hbCEWAmgx76sWlRLGKIL/GAIMp0/pdNRqalMsxCJZpkKI
         v32MJQ93bQCmRJ9STlyZTUQ0k+1SO5sh5jrlK2P7MWLB1mKHJWZKsLJoQ0+Guk3CNFx4
         kHKg==
X-Gm-Message-State: AC+VfDzm7mDze0M1ck54ZUGbnfoF+Y47tr7tCzu+WEXLSDdYxImVgV5f
        uFh7dmqCOoRnZg/AGoDK17lTxDj8F+OVXPkSlWU=
X-Google-Smtp-Source: ACHHUZ4Q1DfgDg3zEdFYP+t061/iCddkRIqKmLL3FPtAQnFzl6DU8PEp4U9KIYwRx2MMNKG1XUD2xiah6OXxzwJcxpU=
X-Received: by 2002:aa7:d659:0:b0:50b:d305:3788 with SMTP id
 v25-20020aa7d659000000b0050bd3053788mr354820edr.11.1684269764864; Tue, 16 May
 2023 13:42:44 -0700 (PDT)
MIME-Version: 1.0
Sender: munniralhassanmunniralhassan@gmail.com
Received: by 2002:a05:7208:4222:b0:69:8066:c3d9 with HTTP; Tue, 16 May 2023
 13:42:44 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Tue, 16 May 2023 14:42:44 -0600
X-Google-Sender-Auth: O8UR8YA9MsZ_wOjsk_-PWAWkMDY
Message-ID: <CALefQgMDR9X7RGQsP84smPzVDpHb=kXv4Hz1juZAKm-GRO-e4w@mail.gmail.com>
Subject: Humanitarian Project For Less Privileged.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

-- 
Hello Dear

  Am a dying woman here in the hospital, i was diagnose as a
Coronavirus patient over 2 months ago. I am A business woman who is
dealing with Gold Exportation, I Am 59 year old from USA California i
have a charitable and unfufilling  project that am about to handover
to you, if you are interested to know more about this project please reply me.

 Hope to hear from you
