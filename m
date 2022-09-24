Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD845E8E2A
	for <lists+linux-sh@lfdr.de>; Sat, 24 Sep 2022 17:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiIXPuf (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 24 Sep 2022 11:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiIXPue (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 24 Sep 2022 11:50:34 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9D84F1B9
        for <linux-sh@vger.kernel.org>; Sat, 24 Sep 2022 08:50:33 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3454b0b1b6dso28181757b3.4
        for <linux-sh@vger.kernel.org>; Sat, 24 Sep 2022 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=DODeztPcXvaVM6HBIWcXfWcmvTGoemNE3p5teIqLoS8i0qYDd7wIgBzenPswFPgPmA
         4Rrti4A11BXE5wQIPDeGHX02pQlWnGktJjzMR2eFNpVb6CG2DxPD3wHoHi48EQB38COZ
         kcc6JqIdy2xUEP+dBvmLtif44EXI0/Y/OR2kN4qM5kEPjEQW28hp2Ywjjn8GOSuIbL6A
         yArd/lYLxttX23S2V9xgNo8e68qVGuXvwu/0Ph+CGFLrtmedj8VEK2mw7R+peA0Sehjy
         Fy4VCgdHn+p5UKHmafrL/326+LLZ+468HFPuxQpqKLE9TfODrgUDLuaJkRf1VQqEhCAc
         gjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=mBBNBet4qJmexo7fRIFKhhAgCbZ4yhGlCTfojHzyTYqnii4nUtJPxLfkK+mVCicCm8
         4Q57CTiTkDAD0FJKOqqVW4fM8SjPkpP9ydhvJfYULXAQABw1OndOgGEscLTjW0jj+fCe
         6CGvo5SnKzS3V7DO3zcUw5VZxhrTsz43jXxibY/rRcYWTKiQqQ3c1VlnMX//uhYPYQTG
         h5emo08pVjd/6SFiFrU4h/4kDzOKqaEg6YLs8hFE43pRPzmXCE2YwX6e4nGvYdyFyF+Y
         QE9etP8Zdw/SG3ifNfo3venakn7FRdsDr2PDdpOeDCiAYNi6JPetn1EhIhfyHV8jnYpt
         EPbQ==
X-Gm-Message-State: ACrzQf2ycCFmOGDzDJndlr7XiLPVEVvwZsgoCquhcE5ZEbOmSeeflFBN
        Mxi0eIOGiFd94OY8qbJ0FsAIKEVzy602YnMJch4=
X-Google-Smtp-Source: AMsMyM7irjXUXHCR+YwOHMpb57o7x6Pyhj2PyyZ9+Qqjr7FwoCjmVcjja3myKlYk3yhppUIz9oxqbu1QDnk9Th4rsb4=
X-Received: by 2002:a81:1dcc:0:b0:343:a76e:b3f8 with SMTP id
 d195-20020a811dcc000000b00343a76eb3f8mr13350890ywd.477.1664034632432; Sat, 24
 Sep 2022 08:50:32 -0700 (PDT)
MIME-Version: 1.0
Sender: paulbryan24921@gmail.com
Received: by 2002:a05:7010:4e8e:b0:305:f589:3ad7 with HTTP; Sat, 24 Sep 2022
 08:50:31 -0700 (PDT)
From:   Ahil Lia <mrsliaahil070@gmail.com>
Date:   Sat, 24 Sep 2022 15:50:31 +0000
X-Google-Sender-Auth: XVk9fQk3XINxFSztsGwPJxIRH0w
Message-ID: <CACVhYX7dtV3YoRJuntT3gbkGjhhLPLBYaNpt6TOes=WhmuPXtw@mail.gmail.com>
Subject: Hello, I need your assistance in this very matter
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org


