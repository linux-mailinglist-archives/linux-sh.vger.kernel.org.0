Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13780284A82
	for <lists+linux-sh@lfdr.de>; Tue,  6 Oct 2020 12:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgJFKza (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 6 Oct 2020 06:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFKza (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 6 Oct 2020 06:55:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537D8C0613D1
        for <linux-sh@vger.kernel.org>; Tue,  6 Oct 2020 03:55:46 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i3so1433765pjz.4
        for <linux-sh@vger.kernel.org>; Tue, 06 Oct 2020 03:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=03FxLy90dLlLdrAAQm3bmUMCLJ3zRxRqIshsWPg0LL4=;
        b=TkT/yuufBBokd8h2BzoIWB93ui00fd28ni8qqg6tLLuXpmoaFi9R4xyj6rpUdgeGRV
         dBtD3dBy4PumVMk3j4KD8s2bFfmNop79iBaaK6+oYelWNQIxGrAHznZejGcj9IqsGM1S
         HXbsejAFBk9/1rC49P9LI+zscgI6jMlzSj3jPGL4zmBdoMz8Rcjp8zGVdEKs7gfC8VCb
         ifoqdavvu1c9Ome03GibZwh5g2VcjTHOYLWtNbacVeGUOEf+p7n/RTlG7y4WSYHgcufy
         tEhJwRIGLfnKjVcZG+bbOdLpYO76+pXCQsYLyZdg8YVE68UMACEBGaRiVD4FuhIH75iu
         6KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=03FxLy90dLlLdrAAQm3bmUMCLJ3zRxRqIshsWPg0LL4=;
        b=R5zCFxoQ+Ts5OXgpvoft+KD5rOOHgSGGNCyU9DdgsDOjoWI92RxJkz8KHxcmeXPBu9
         pX8beRqmpgDuJl8EKzlSDiMgrTte4mxcnGixOTtQo5KTntVV1Cz9hmaHTBJL6EboaROK
         CWiNojIw0e5iwV91Lb/yMGqocVlkj7erBL9Wp8sNwO7BGL3CSlOwtmRAHydjScfVaPi/
         ydenKdeJz4JEJFZdeWLjF6O8cvVoVhjJjPAnHVoAdNfwEPDdKPDadteQxaoP1/c97Mwk
         eoecuWqMXZu8wurTU7O9rlzOutPAzEI/NSbp286fGEubSnrqtyBOiR6sY3X5YDGvxvrw
         B6gg==
X-Gm-Message-State: AOAM530Ux6zj9lfIeGUTgcSARYrrUI8AFXrAKdwfkxr7VuG+YHpamuRG
        AjOjPuYtUO3r4n55hkv3wtOZf288jKGYqPFuvkc=
X-Google-Smtp-Source: ABdhPJxY9Nt4tCnCIUP3YRDSAD1ONohVGSw8CrlgZt3qj/rKA/K7LdprfSGkBDvpWsj3xUcfRuHzgNbwhgON8G8PThQ=
X-Received: by 2002:a17:90a:1149:: with SMTP id d9mr3889350pje.227.1601981745837;
 Tue, 06 Oct 2020 03:55:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f55b:0:0:0:0 with HTTP; Tue, 6 Oct 2020 03:55:45
 -0700 (PDT)
Reply-To: sgtkaylam28@gmail.com
From:   SgtKayla Manthey <baldemaimouna01@gmail.com>
Date:   Tue, 6 Oct 2020 03:55:45 -0700
Message-ID: <CAC5XXA6gZnw3Ag7yhurDQo1QR5Cx8ZMOC3qDqJvDSz=PtoWqng@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

2KrYrdmK2Kkg2LfZitio2KnYjA0K2KfYs9mF2Yog2YPYp9mK2YTYpyDZhdmGINmB2LbZhNmDINmH
2YQg2YjYtdmE2KrZgyDYp9mE2LHYs9in2YTYqSDYp9mE2LPYp9io2YLYqdifINin2YPYqtioINmE
2YoNCtin2YTYudmI2K/YqSDYtNmD2LHYpyDZhNmDLg0K
