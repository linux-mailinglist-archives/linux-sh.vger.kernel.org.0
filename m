Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B0B71681C
	for <lists+linux-sh@lfdr.de>; Tue, 30 May 2023 17:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbjE3PyC (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 30 May 2023 11:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjE3Px7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 30 May 2023 11:53:59 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C41E109
        for <linux-sh@vger.kernel.org>; Tue, 30 May 2023 08:53:43 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so3015913a12.0
        for <linux-sh@vger.kernel.org>; Tue, 30 May 2023 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685462022; x=1688054022;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNArju2Q8+Sr5dwcNQgGMkuM+vdAY/tBFjavnfU7aAs=;
        b=m6P4SpRmIhLWilK2bwoWEMQsEWk/K6yhndm14R57q2fmXCIxmQD0hmLtubyT0ltNsD
         5mzb/C0TgKgAvGKJRMLkGevN9ywiUjPUBVA17GMkjuXksQd7uKuMPAsayxRi957MlXgz
         VF+5Lk9yteg1zp99/PHovVO1luQYBqZR1begl5GE6xnlUaOH7P8fp/y6TJyqCQrhfJOz
         GmSLlBKjWMEbPAFAhBZaduYCAy/a7mb7dItIGo7O38cxcSSHJ3fi4GVHm5aPyFiNx0y7
         0Ylcwe2+d6CvCscSCSmWp1hLDgSsGszHIHhs0OZ+Ti2EwuimZiT8yf6j1niWNwR5h9Dm
         4p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462022; x=1688054022;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNArju2Q8+Sr5dwcNQgGMkuM+vdAY/tBFjavnfU7aAs=;
        b=CJCW9z7vszXCXe6Mz/eOcd7NubNFqyRPExKGErqj8Ibnrt1TG1xbsTjuaB6WnCG9ls
         6sVbjVxoMgdYXaqkVY2AvugXaatViywPsrXdjT6Qp/5U/ZiAjxWNKpkgMupyhrmEXgag
         qFVhFYqRWAuAxmdbO4z/e7pgk51i5LcaCi1fGK2K0/V2e/Y318WV7DstOFNITru0/wcC
         8q5BpcpTJGf/ArD1zDM7PuwZPq6/UF5VV2QFuj/FLw8kkS3kndTkuE0QsWJWSr/HKUQZ
         OSA+LHRpKRjMVFLgDlWCyoa4e6TqG1oA0m1opOjGVr9qtpKRjy316hCF1Fn5qq9xYlCz
         EU7g==
X-Gm-Message-State: AC+VfDw7Wt8X+7j0XayZBYOkaFK3GNrdpRT/QbuxWXi+dIqu/NyAf33b
        qzYoG6RAAyYgHLcbwlWAo86p9459Z6S8OYluVGY=
X-Google-Smtp-Source: ACHHUZ7sn3ztVKnJjhBggbCbONyO+AsW8XNE2yHvSV08ahzB8uFM1wykgNjVYghRFNCNNXUNIoLTKjLnsrfc/pmUUYs=
X-Received: by 2002:a17:90a:bf8c:b0:253:25c3:7a95 with SMTP id
 d12-20020a17090abf8c00b0025325c37a95mr11888507pjs.14.1685462021937; Tue, 30
 May 2023 08:53:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:ba3:b0:65:5d1b:9a16 with HTTP; Tue, 30 May 2023
 08:53:41 -0700 (PDT)
Reply-To: jkirinec101@gmail.com
From:   marine <jessicakirinec1@gmail.com>
Date:   Tue, 30 May 2023 16:53:41 +0100
Message-ID: <CACrLz9RUfqd1XDcU1qQ-MXYbKcZCtOrXa35uzso1LTdRbsO_FQ@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:52d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jkirinec101[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jessicakirinec1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jessicakirinec1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
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
