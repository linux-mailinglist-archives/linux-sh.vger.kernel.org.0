Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C19311DF8
	for <lists+linux-sh@lfdr.de>; Sat,  6 Feb 2021 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhBFOw0 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 6 Feb 2021 09:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBFOw0 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 6 Feb 2021 09:52:26 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11EDC06178B
        for <linux-sh@vger.kernel.org>; Sat,  6 Feb 2021 06:52:08 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id t5so12850652eds.12
        for <linux-sh@vger.kernel.org>; Sat, 06 Feb 2021 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=rRzsU+8uBB1Vc4/aNNP99E3QPERhiAirJQx+0WBW4NvAUYZLLKux2zZQsTWHgJbJVt
         FR6WZmtOaQp3DM94np1xQJXL2mMJTElfK9qQITE9bpyi6qoYUyufbAcZbDGblhEZnnz/
         1V9PcHEykAaFb+QkYVps84c111Uq4koMbUDUa4Ex78oNanGijIVa9z8eMEm+jh25Uzhv
         A3cz7TjKPyUvk8mDCmjwrVv4NHea9QQKtDgORNoLM10hEmf2w26ibr2Sbh2zJF+wCJiE
         3Lquhd0St+i0jxSCdAsrVIJlQRqHg9NidpuJoGVBiK/V72NFDVkNqqshQZaGQWmHPHro
         NdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=TINT15VaCstbehyyL8Wlu3yBXV+0Wpt0lopzUnQa7QWvu74Rqhkb4FEIXNg7ZKYmQ2
         rUW7iLq3w4L6ELj/Wh5WwccJSDqL5E7LQG3OWNsnfiTAdTPltnnCOlmuNsl7z4DSVoaH
         GLdbCWL++/fTfKuC5rKoxZXyEFHVCRZgGPEOn1/LFs7rf2Lid/I1DL8iXFnMWgpgGm0o
         /mG3QnPo4MKJYTVGGEYMjQ4KQrqMyDo9GyPDuq7E+bIszsSVzFXuP5q11sW83H3UGTpZ
         Tm/figW5DMXhpKHGZeTHnpVc7cMI3dItADWDIntcZ3c7qagkpk555mObX08TQRtXTBak
         nrxg==
X-Gm-Message-State: AOAM532obGtQr0uy2hUBrBrB6vu+rsdeDh9iCwsRKSryQR5RNmsfNwPQ
        hl+TJ/0QihKxwHl/nGjz+RXearL+fqUKqT1mVQ0fd/f0Wc4=
X-Google-Smtp-Source: ABdhPJxufeVfCrY+EF5ePNGbusOdFAIl9jnX1nQHrTnno/VZe8//T+TrtkvmwXk2XA+sMpDLuzvhenY5PcwftMKWPyY=
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr8652016edu.247.1612623127712;
 Sat, 06 Feb 2021 06:52:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:52:07
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:52:07 +0100
Message-ID: <CAGSHw-CkR65F6rYyp5CXYmJ6nUdPAzCf0Br9meiFXLnFt=JCSA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
