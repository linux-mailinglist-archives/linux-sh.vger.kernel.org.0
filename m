Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809523EBF9D
	for <lists+linux-sh@lfdr.de>; Sat, 14 Aug 2021 04:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhHNCGq (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 13 Aug 2021 22:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbhHNCGp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 13 Aug 2021 22:06:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA0DC061756
        for <linux-sh@vger.kernel.org>; Fri, 13 Aug 2021 19:06:17 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c12so5306474ljr.5
        for <linux-sh@vger.kernel.org>; Fri, 13 Aug 2021 19:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7Xq9jb2sUMv3xaNw7Q5Cgt7yCkc3M0xn16Wn4AtIDKI=;
        b=bMjFQnnAZpaPHPewg53a/655rlJcZF3F6tOCYZw1vRKDz/xIJdx97rNr27JLkW56nx
         /iUhkVkrv2vt56YQtzEazhRgIPy/DINH4WyHeEexrKrG7liGbayL7Temc7NGvW0bB8Ad
         jYLKY+nfNSoS1rYKoflW5LtIinkjSZBTTSJCtk74RyRz5/H1kPwLgMirqvm1jZ9Q2lvS
         mysy6xLOxs0wYu9KWpVs3ZVzmyzuM6cY3iz+yVlGPkz3Lkb+v57sIQRRUb+ypy4gjifF
         STYdF7upxk4m3MFQNQv0T7Zw+Yt5F/OYhuRsX60kpa6PLdNBh1LpNqMT51M2pasOSTPy
         0wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7Xq9jb2sUMv3xaNw7Q5Cgt7yCkc3M0xn16Wn4AtIDKI=;
        b=aPy5bRTkpYQ2EbAOYYVRw1vOUiQ063D5BU3pNuOuswNCLwpQwuIOdjpN3kaWYRsIJK
         62UxhtboHCUKU0Vau2r+83m+UaJkgy30Ks3Qq3KRikCWd9XkLRxsfm2OuqF0EUlqrAJW
         XBIwfGeT2xKXOB0H9bVschOD8T3t2EWBZwVo8UmhhhAHsaJ1HPemsAW3NIs4Nukp06xK
         +HVFeOLTTeozevc50FKO/tNTG1ggpz4mT+MIZAGdoASkOwkMRXbLMqgnXUxNk2sS0ZHH
         qBFFW+kPudoVAc477eByzoNSXIvC87fYfD8gDu+SwgXPMcGqZhFe1MKEETB+GPMDBAmf
         XAQQ==
X-Gm-Message-State: AOAM533Ju/Nf/OEyYbi3My7qDtqpjQvz+p/rhcjMCiiGbj4ggZnmfUEB
        wyZ6kiIgm8mf5Kg1UUSXWyv9jUcaY7GHm6ECwmc=
X-Google-Smtp-Source: ABdhPJynvegPmhEjUi/stm1v/NRwCcvEqe4+RCpcxOCwnF//w8aRyIcHmBxFidm29bl0vBPsC1zhmU0XtHDcktPhkc0=
X-Received: by 2002:a2e:b1d3:: with SMTP id e19mr3920584lja.6.1628906774714;
 Fri, 13 Aug 2021 19:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:380d:b029:132:4f79:3ded with HTTP; Fri, 13 Aug 2021
 19:06:14 -0700 (PDT)
Reply-To: deedeepaul@yandex.com
From:   Deedee Paul <deedeepaul212@gmail.com>
Date:   Sat, 14 Aug 2021 02:06:14 +0000
Message-ID: <CADS-zP8AceijWYuKjjfFaC4WB2nM3FQqvpU1ob6Xb=P4w5FpkA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Attention: Beneficiary,

This is to officially inform you that we have been having meetings for
the past weeks now which ended Two days ago with Mr. John W. Ashe,
President of the 68th session of the UN General Assembly, Mr. David
R.Malpass. the World Bank President and Hon. Mrs. Christine Laggard
(IMF) Director General, in the meeting we talked about how to
compensate Scam victim's people and all the people that were affected
the most by this Coronavirus pandemic.

Your email address was successfully selected for this donation with others.

The United Nations have agreed to compensate you with the sum of
($150,000.00) One hundred and fifty thousand United States Dollars. We
have arranged your payment through WORLD ATM MASTERCARD which is the
latest instruction from the World Bank Group.

For the collection of your WORLD ATM MASTERCARD contact our
representative Rev. David Wood, send to him your contact address where
you want your MASTERCARD to be sent to you, like

1. Your Full Name: .........
2. Your Country and Your Delivery Home Address: ........
3. Your Telephone: ..............

His e-mail address: (ddavidwood1@yandex.com) He is a Canadian (UN)
representative Agent.

Thanks.
Tel: 1 513 452 4352.
Mr. Michael M=C3=B8ller Director-General of the United Nations Office
