Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473B81AEC63
	for <lists+linux-sh@lfdr.de>; Sat, 18 Apr 2020 14:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgDRM0k (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 18 Apr 2020 08:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725862AbgDRM0j (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 18 Apr 2020 08:26:39 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1C6C061A0C
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 05:26:38 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id x2so3619967ilp.13
        for <linux-sh@vger.kernel.org>; Sat, 18 Apr 2020 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=p3sU6zSwJ79jr5/8rkQFPSxzE+uN6TkyFs4yZFeQ03Q=;
        b=dyXza5dTTubkmo+PWuNv3+uEwm7CjKBfRiN+Us6M0kMto7XZuHyo26sFLpavcFfRNH
         Ss5J90+tcGMD1JHsyJ6+zlDu83Fsut9cWsBq4jl98byY1YsaQlEATSLJzMiceY6v4bnk
         sLLzY8sLvCjTMYE6MrmaU5Vg7+0QFDETHEsZWqO4OZs3/920PT89EBTT6rjJTrXiVTS/
         JBtMWmmsmt+mDFM9VLuZgfwWvRIcqTylLOM4yzsIb7VPps4FMEzjmI59BJM4AQkEFOeX
         +0q8ila9zHuGXVWPmA+Jv79DWCKr/7GmODZjQM9CIMAkvq6kBWtRbp+WbOpsBrf3YL/E
         DydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=p3sU6zSwJ79jr5/8rkQFPSxzE+uN6TkyFs4yZFeQ03Q=;
        b=MzRiyc4x49UJVS3rbdW5rup6Q15rCuzZkktJeVjSNUdeLhpqbjMjKng/gSYFevmqU9
         ULR+g0Eu9PtvqNzOvNm47GTdcuKBn6RiJAsL6VelLMJO0+fiYK9ZujjclYslcDBhGboG
         0us+4Qnr/vrmQc4+FhNfIZ2RisJdfGvQ7lEgCdQTHPTMpD9kkZn0f3SPXu3vkmK3r0u9
         y+FrdlPq1B0UVvgX3u3dTatN3pqTG4ESfeondvRqYF2Fxw7Bs+YqcV32pNpDj27uPfGH
         DZvr5BprZZZJm7Qh1RxFchr6Z1LrBLbWg/2FCy/4sFFB0UApNJa1gYS7fhjXnqVQfhnq
         kjqA==
X-Gm-Message-State: AGi0PuZSIB4earwjuXqgnKoAykPh6QfUzalYGuD5VflFnb+1AtEkdWNG
        VcTPNAN/of/3NLJ+juQhbN1pTCSI1Xm0cYrhzn0=
X-Google-Smtp-Source: APiQypKE+Svsz7ynRJUEBFJRzHDSnVd8ryBr5p8aCoAeN24Ng5OXBIb6XP+nF5QZ8T+UhfjBPpKAP6RXl6IzbtwnvOY=
X-Received: by 2002:a92:cbd1:: with SMTP id s17mr6897780ilq.154.1587212796486;
 Sat, 18 Apr 2020 05:26:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:ae4c:0:0:0:0:0 with HTTP; Sat, 18 Apr 2020 05:26:36
 -0700 (PDT)
Reply-To: advocategeorgeleviesq@gmail.com
From:   Levi Brown <barristerjamesmicheal@gmail.com>
Date:   Sat, 18 Apr 2020 13:26:36 +0100
Message-ID: <CAMQm6RAsCKRjFR1EBdX1ihhFjWaP+Noz7a2DPiqeD0OXA74VoA@mail.gmail.com>
Subject: Re:
To:     advocategeorgeleviesq@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

LS0gDQrjgYLjgarjgZ/jgajoqbHjgZfjgZ/jgYTjgafjgZnjgIIg56eB44Gu5Lul5YmN44Gu44Oh
44O844Or44KS5Y+X44GR5Y+W44KK44G+44GX44Gf44GL77yfDQo=
