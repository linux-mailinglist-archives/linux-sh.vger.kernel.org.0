Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C786B786FAE
	for <lists+linux-sh@lfdr.de>; Thu, 24 Aug 2023 14:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237119AbjHXMxw (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 24 Aug 2023 08:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241006AbjHXMxX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 24 Aug 2023 08:53:23 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60B32101
        for <linux-sh@vger.kernel.org>; Thu, 24 Aug 2023 05:53:00 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-26f3e26e55aso3072332a91.3
        for <linux-sh@vger.kernel.org>; Thu, 24 Aug 2023 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692881579; x=1693486379;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwzfGUfBJkZg+1spHFgou/ItOtMPmoEYrKE/SB+Zg6E=;
        b=gBE6O2jY6izLRS8bV8djEflUn6kkMz7kPrr7R0MJZ9Psp2nuPmlQnrsAZF/g1/+oT+
         VT/Gd76pwda7P1gsi2S65QnhbSkfos19c2zATOUMmQpe4rh37XSQV5yb59ttW9d2dOd+
         g2T/hY1JAh7KAGzeNhxrD3LQpd1y6p63bEz1sOrnFxzBIeuaEqzbQFn3+nH2t+5CDxD5
         4/10mmh2dBILlx7hJk4tpfFx2TKXS1KfK6rvHo64ofEW0Y6EOc4jLvb24B9wlGLktRdS
         PY431h5wlq1NYb1/t63wRel0W8lXDYYhfV2A37RshrEgj6ibO3uWAYSW6k7KqJxz37Ht
         arjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692881579; x=1693486379;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwzfGUfBJkZg+1spHFgou/ItOtMPmoEYrKE/SB+Zg6E=;
        b=S+Iou6T+HD8LJtAvZUuajyaRXuTwNR9ipTqaW1w0kjDY5ee3W28bOAIYJRDj8y2AiP
         mh1GWOlqZIpaQnp9IF6Ib17UdR5tcZioEKc5Kv7y1N2MYr+xVclDPrWux0bQxa+xoLIV
         TJuQC0BtoBuLr47lh9v1Te7Q3lgOzNZmw3ehXIC/oSniXyye9kHDshJz9EZjsKz4bf62
         sqohMUpyahStU3Wr0+ZhvVyRwj3kndBG4c0ErkmnbE0k3mmYgAl6KnvQYNlpOtppz/G5
         5XZCmgxezbDpZAa7xUia6bXJ0PjEOqhI1cbXJ1WmOA2w6aNCQViagZqDBsI7Ut1OFbSG
         su6Q==
X-Gm-Message-State: AOJu0YzdJaaE/uw2jMkqlQCWy3/kMrG7k+/9fH+QIdvzXMbE/9/PTyED
        Z1JXXoAgdECR3kkBI98iRisAl+vLB2IKFwN8m1M=
X-Google-Smtp-Source: AGHT+IFqouLL3KaFAs4fC0vwAGOGwrJNK1ibdITwMAL6UHDkMI0uQOpLW5DjpBbtM2HMFQsJgI9Lc4dOgbwO9db0AOc=
X-Received: by 2002:a17:90a:f3cf:b0:268:d716:4b62 with SMTP id
 ha15-20020a17090af3cf00b00268d7164b62mr11970032pjb.0.1692881579674; Thu, 24
 Aug 2023 05:52:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:619c:b0:64:f9b:b744 with HTTP; Thu, 24 Aug 2023
 05:52:59 -0700 (PDT)
Reply-To: jamesnono21@hotmail.com
From:   jamesnono Nono <jamesnononono323@gmail.com>
Date:   Thu, 24 Aug 2023 13:52:59 +0100
Message-ID: <CAOqFYnQePULLwCx3h2YNp-q3vXEqbSHh8LukgF2HQ6aYhhbhoA@mail.gmail.com>
Subject: Hello, I'm still waiting for your response to my previous message to you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello, I'm still waiting for your response to my previous message to you

James Nono
